import os
from neo4j import GraphDatabase
from dotenv import load_dotenv

load_dotenv()

URI = os.getenv("NEO4J_URI", "bolt://localhost:7687")
USER = os.getenv("NEO4J_USER", "neo4j")
PASSWORD = os.getenv("NEO4J_PASSWORD", "test1234")

seed_file = os.path.join(os.path.dirname(__file__), "..", "data", "seed.cypher")


def load_seed_file():
    with open(seed_file, "r", encoding="utf-8") as f:
        content = f.read()

    # Split into individual statements, skip comments and empty lines
    statements = []
    for statement in content.split(";"):
        lines = [line for line in statement.splitlines() if not line.strip().startswith("//")]
        clean = "\n".join(lines).strip()
        if clean:
            statements.append(clean)

    return statements

def run_setup(driver):
    statements = load_seed_file()

    with driver.session() as session:
        for statement in statements:
            session.run(statement)

def verify_data(driver):
    checks = [
        ("Movies", "MATCH (m:Movie)  RETURN count(m) AS total"),
        ("People", "MATCH (p:Person) RETURN count(p) AS total"),
        ("Genres",  "MATCH (g:Genre)  RETURN count(g) AS total"),
        ("ACTED_IN", "MATCH ()-[:ACTED_IN]->()  RETURN count(*) AS total"),
        ("DIRECTED", "MATCH ()-[:DIRECTED]->()  RETURN count(*) AS total"),
        ("IN_GENRE", "MATCH ()-[:IN_GENRE]->()  RETURN count(*) AS total"),
    ]

    print("\nDatabase summary:")
    with driver.session() as session:
        for label, query in checks:
            result = session.run(query).single()
            print(f"  {label:<12} {result['total']}")


def main():
    driver = GraphDatabase.driver(URI, auth=(USER, PASSWORD))

    try:
        driver.verify_connectivity()
        print("Connection OK\n")

        run_setup(driver)
        verify_data(driver)

        print("\nSetup complete.")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        driver.close()


if __name__ == "__main__":
    main()
