import sys, os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
from src.movie_llm import ask_movie_graph

OUTPUT_FILE = os.path.join(os.path.dirname(__file__), "..", "outputs", "respuestas.txt")

questions = [
    "¿En qué año se estrenó The Matrix?",
    "Lista todos los actores que trabajaron con Leonardo DiCaprio",
    "¿Qué películas de acción tienen más de un género?",
    "Nombra los directores que también actuaron en alguna película",
    "¿Cuál es la película más reciente dirigida por James Cameron?"
]


def run_tests():
    results = []

    for i, question in enumerate(questions, 1):
        print(f"\nPregunta {i}/5: {question}")
        response = ask_movie_graph(question)
        print(f"Respuesta: {response['answer']}")
        results.append(response)

    save_results(results)


def save_results(results):
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        for i, r in enumerate(results, 1):
            f.write(f"Pregunta {i}: {r['question']}\n")
            f.write(f"Cypher: {r['cypher']}\n")
            f.write(f"Respuesta: {r['answer']}\n")
            f.write("-" * 50 + "\n")

    print(f"\nResultados guardados en {OUTPUT_FILE}")


if __name__ == "__main__":
    run_tests()
