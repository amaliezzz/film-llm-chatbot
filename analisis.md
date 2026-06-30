## Análisis crítico

### 1. ¿Qué tipo de preguntas son difíciles para este enfoque?

El sistema depende de que el LLM interprete correctamente la pregunta y genere Cypher válido. Hay casos donde esto falla de forma predecible.

**Preguntas con referencias temporales relativas**
Una pregunta como "¿qué películas salieron en la última década?" requiere que el LLM conozca la fecha actual y la use en la consulta. El modelo puede asumir un año incorrecto o directamente ignorar la referencia, devolviendo resultados equivocados sin advertir al usuario.

**Preguntas que requieren múltiples saltos en el grafo**
Una pregunta como "¿qué actores trabajaron con directores que también actuaron en alguna película?" implica cruzar varias relaciones en una sola consulta. Este tipo de Cypher es más complejo y el LLM tiende a simplificarlo o a generar una consulta que no responde exactamente lo que se preguntó.

---

### 2. ¿Cómo integrarías un memory layer?

El problema es que cada llamada al LLM es independiente — no recuerda lo que se preguntó antes. Para resolverlo, se mantendría un historial de la conversación y se incluiría en cada nuevo prompt.

En la práctica, el método `ask` recibiría un parámetro `history` con las preguntas y respuestas anteriores, y ese contexto se agregaría al prompt antes de la pregunta actual. Así el LLM puede resolver referencias como "¿y ese director qué otras películas hizo?" sabiendo a quién se refiere "ese director".

El historial crecería con cada turno, por lo que habría que limitar cuántas interacciones anteriores se incluyen para no exceder el límite de tokens del modelo.

---

### 3. ¿Cómo evitarías Cypher ineficiente con 10M nodos?

Con un grafo grande, una consulta mal escrita puede escanear millones de nodos innecesariamente. Hay tres medidas concretas:

**Índices obligatorios** — ya existen en el proyecto para `Movie.title`, `Person.name` y `Genre.name`. Con 10M nodos son indispensables; sin ellos, cualquier `MATCH` por nombre haría un full scan.

**Límites en el prompt** — agregar una regla explícita en `cypher_generator.txt` que obligue al LLM a incluir `LIMIT` en consultas que no filtren por un nodo específico. Esto evita que una pregunta abierta devuelva millones de resultados.

**Validación antes de ejecutar** — antes de enviar la consulta a Neo4j, se puede usar `EXPLAIN` para obtener el plan de ejecución y rechazar consultas que no usen índices o que tengan un costo estimado demasiado alto.
