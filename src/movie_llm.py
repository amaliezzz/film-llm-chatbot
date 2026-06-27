import os
from neo4j import GraphDatabase
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

PROMPTS_DIR = os.path.join(os.path.dirname(__file__), "prompts")


def load_prompt(filename):
    with open(os.path.join(PROMPTS_DIR, filename), "r", encoding="utf-8") as f:
        return f.read()


class MovieChatbot:

    def __init__(self):
        self.driver = GraphDatabase.driver(
            os.getenv("NEO4J_URI", "bolt://localhost:7687"),
            auth=(
                os.getenv("NEO4J_USER", "neo4j"),
                os.getenv("NEO4J_PASSWORD", "test1234")
            )
        )
        self.client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        self.cypher_prompt = load_prompt("cypher_generator.txt")
        self.formatter_prompt = load_prompt("response_formatter.txt")

    def close(self):
        self.driver.close()


    # LLM
    def call_llm(self, prompt):
        response = self.client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[{"role": "user", "content": prompt}],
            temperature=0
        )
        return response.choices[0].message.content.strip()


    # Cypher
    def generate_cypher(self, question):
        prompt = self.cypher_prompt.replace("{question}", question)
        raw = self.call_llm(prompt)
        # eliminar bloques de codigo si el LLM los incluye
        cypher = raw.replace("```cypher", "").replace("```", "").strip()
        return cypher

    def fix_cypher(self, question, failed_cypher, error):
        prompt = (
            f"La siguiente consulta Cypher generó un error.\n\n"
            f"Consulta: {failed_cypher}\n"
            f"Error: {error}\n"
            f"Pregunta original: {question}\n\n"
            f"Corrige la consulta. Responde solo con el Cypher corregido, sin explicaciones."
        )
        raw = self.call_llm(prompt)
        return raw.replace("```cypher", "").replace("```", "").strip()

    def run_cypher(self, cypher):
        with self.driver.session() as session:
            result = session.run(cypher)
            return [record.data() for record in result]


    # Respuesta
    def format_answer(self, question, results):
        prompt = (
            self.formatter_prompt
            .replace("{question}", question)
            .replace("{results}", str(results))
        )
        return self.call_llm(prompt)


    # Metodo principal

    def ask(self, question, max_retries=2):
        cypher = self.generate_cypher(question)
        print(f"Cypher: {cypher}")

        results = None
        error = None

        for attempt in range(max_retries):
            try:
                results = self.run_cypher(cypher)
                error = None
                break
            except Exception as e:
                error = str(e)
                print(f"Intento {attempt + 1} fallido: {error}")
                if attempt < max_retries - 1:
                    cypher = self.fix_cypher(question, cypher, error)
                    print(f"Cypher corregido: {cypher}")

        if error:
            answer = "No pude procesar tu pregunta. Intenta reformularla."
        elif not results:
            answer = "No encontré información sobre eso en la base de datos."
        else:
            answer = self.format_answer(question, results)

        return {
            "question": question,
            "cypher": cypher,
            "results": results,
            "answer": answer
        }


def ask_movie_graph(question):
    bot = MovieChatbot()
    try:
        return bot.ask(question)
    finally:
        bot.close()

