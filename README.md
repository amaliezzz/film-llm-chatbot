## film-llm-chatbot

Chatbot analítico para una base de conocimiento de películas. El sistema recibe preguntas en lenguaje natural, las convierte a consultas Cypher usando un LLM, las ejecuta en Neo4j y devuelve una respuesta en español.

---

### Tecnologías

- Python 3.8+
- Neo4j 5.13 (via Docker)
- Groq API (LLM gratuito, modelo `llama-3.3-70b-versatile`)
- `neo4j`, `groq`, `python-dotenv`

---

### Instalación

**1. Clonar el repositorio**

```bash
git clone https://github.com/amaliezzz/film-llm-chatbot
cd film-llm-chatbot
```

**2. Instalar dependencias**

```bash
pip install -r requirements.txt
```

**3. Configurar variables de entorno**

```bash
copy .env.example .env
```
Edita `.env` con tu API key de Groq. Puedes obtener una gratis en https://console.groq.com

```
GROQ_API_KEY=gsk_...
NEO4J_URI=bolt://localhost:7687
NEO4J_USER=neo4j
NEO4J_PASSWORD=test1234
```

---

### Ejecución

**1. Levantar Neo4j con Docker**

Primera vez:
```bash
docker run --name neo4j-movies -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/test1234 neo4j:5.13-community
```

Siguientes veces:
```bash
docker start neo4j-movies
```

**2. Cargar los datos**

```bash
python setup/setup_database.py
```

Deberías ver:
```
Connection OK

Database summary:
  Movies       24
  People       33
  Genres       9
  ACTED_IN     38
  DIRECTED     24
  IN_GENRE     44

Setup complete.
```

**3. Ejecutar las 5 preguntas requeridas**

```bash
python tests/test_questions.py
```

Los resultados se guardan en `outputs/respuestas.txt`.

**4. Ejecutar casos ambiguos**

```bash
python tests/test_ambiguous.py
```

Los resultados se guardan en `outputs/respuestas_ambiguas.txt`.

---

### Uso desde código

```python
from src.movie_llm import ask_movie_graph

response = ask_movie_graph("¿Qué películas dirigió Christopher Nolan?")
print(response["answer"])
```

El diccionario retornado incluye:

```python
{
    "question": "...",   # pregunta original
    "cypher": "...",     # consulta Cypher generada
    "results": [...],    # resultados raw de Neo4j
    "answer": "..."      # respuesta formateada en español
}
```

---

### Diseño del sistema

El flujo de cada pregunta tiene tres pasos:

**1. Generación de Cypher**
El prompt `cypher_generator.txt` incluye el esquema del grafo, reglas de seguridad (sin DELETE, sin CREATE) y ejemplos few-shot. El LLM recibe la pregunta y devuelve solo la consulta Cypher.

**2. Ejecución en Neo4j**
La consulta se ejecuta con el driver oficial de Neo4j. Si hay un error de sintaxis, el sistema hace un segundo intento enviando el error al LLM para que lo corrija.

**3. Formateo de la respuesta**
Los resultados raw de Neo4j se envían al LLM con el prompt `response_formatter.txt`, que los convierte a una respuesta en español natural.

---

### Manejo de errores

El sistema cubre tres casos:

**Preguntas ambiguas** — cuando la pregunta no especifica si el rol es actor o director, el prompt usa `OPTIONAL MATCH` para buscar ambas relaciones.

**Consultas sin resultado** — si Neo4j devuelve una lista vacía, se responde "No encontré información sobre eso en la base de datos."

**Cypher inválido** — si la consulta genera un error, el sistema reintenta hasta 2 veces enviando el error al LLM para que corrija la sintaxis.

---

### Limitaciones

- El sistema requiere nombres completos. "Tarantino" no encuentra resultados; "Quentin Tarantino" sí.
- Preguntas con fechas relativas como "películas recientes" o "hace 10 años" no se manejan correctamente porque el grafo no tiene fecha actual como referencia.
- Preguntas que requieren razonamiento sobre múltiples saltos en el grafo (ej. "actores que trabajaron con directores que también actuaron") pueden generar Cypher incorrecto.


### Solución de problemas

**Neo4j no conecta después de `docker start`**
Espera 30 segundos antes de correr el setup. Si el error persiste, elimina el contenedor y créalo de nuevo:

```bash
docker rm neo4j-movies
docker run --name neo4j-movies -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/test1234 neo4j:5.13-community
```

Los datos se perderán, por lo que tendrás que correr `setup_database.py` de nuevo.