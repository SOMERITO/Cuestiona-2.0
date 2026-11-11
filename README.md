# Cuestiona 2.0

**Repositorio oficial:** https://github.com/SOMERITO/Cuestiona-2.0

Aplicación web para resolver evaluaciones a partir de bancos de preguntas JSON. Los bancos pueden elaborarse con ChatGPT usando los documentos de estudio como fuente; Cuestiona 2.0 los importa y presenta sin conectarse a una API de inteligencia artificial.

## Funciones

- Importación de bancos en formato JSON, tanto como lista de preguntas como mediante una propiedad `questions`.
- Carga de un banco a la vez mediante selector de archivos o arrastrar y soltar en cualquier parte de la ventana.
- Validación de estructura, identificadores únicos, cuatro alternativas, respuesta correcta y explicación obligatoria.
- Compatibilidad con `answer` (índice 0–3) y `correct_option_id` (A–D); si ambos existen, deben coincidir.
- Selección de la cantidad de preguntas que se desea resolver, hasta el total disponible en el banco.
- Orden aleatorio de las preguntas para cada intento, sin alterar el orden de las alternativas ni la clave de respuesta.
- Respuesta enviada al instante: al hacer clic en A, B, C o D, la elección queda registrada como definitiva para esa pregunta.
- Corrección automática al seleccionar: muestra si acertaste o te equivocaste, marca la alternativa correcta y presenta la explicación asociada al material.
- No existe un botón intermedio de «Comprobar respuesta»; después de revisar la corrección, aparece «Siguiente» para continuar.
- Conserva tema, habilidad, documento de origen, página y etiqueta de página cuando esos campos están disponibles.
- Resultados con aciertos, errores, preguntas sin responder y revisión de las incorrectas.

## Cómo usar

1. Abre la página publicada o sirve los archivos estáticos desde cualquier servidor web.
2. En otro chat de ChatGPT, adjunta tus PDF y solicita un banco de preguntas compatible con Cuestiona 2.0.
3. Descarga el archivo `.json` generado.
4. En Cuestiona 2.0, selecciona el banco o arrástralo a cualquier parte de la ventana.
5. Comprueba la cantidad de preguntas y los temas detectados.
6. Elige cuántas preguntas deseas resolver y pulsa **Comenzar evaluación**.
7. Al hacer clic en una alternativa, la respuesta se registra automáticamente y se muestra la corrección.
8. Revisa cuál era la respuesta correcta y lee la explicación; después pulsa «Siguiente».

No necesitas crear una cuenta, introducir una clave API ni ejecutar Python.

## Formato JSON compatible

El formato principal es una lista JSON de preguntas. También se admite un objeto que contenga una propiedad `questions` con esa lista.

Cada pregunta debe incluir:
- `id`: identificador único.
- `question`: enunciado.
- `options`: exactamente cuatro alternativas de texto.
- `answer`: índice de la alternativa correcta, empezando desde cero (A = 0, B = 1, C = 2, D = 3), o `correct_option_id`: letra A, B, C o D.
- `explanation`: explicación obligatoria de la respuesta correcta.

También se conservan, cuando existen, `correct_option_id`, `page`, `page_label`, `document`, `topic`, `skill` y `option_explanations`.

Cuando el archivo incluye `answer` y `correct_option_id`, ambos campos deben señalar la misma alternativa. El importador rechaza el banco completo si encuentra preguntas incompletas, alternativas vacías, identificadores repetidos, respuestas fuera de rango o explicaciones faltantes; así evita cargar un examen parcialmente defectuoso.

## Corrección para el aprendizaje

Al comprobar una respuesta:
- Si es correcta, la alternativa se marca en verde y se muestra la explicación.
- Si es incorrecta, la alternativa seleccionada se marca en rojo y la correcta en verde.
- Se muestra el texto completo de la respuesta correcta y la explicación del banco.
- La persona debe revisar esa corrección antes de avanzar a la siguiente pregunta.

Si el banco incluye explicaciones específicas por alternativa en `option_explanations`, también se muestra la explicación de la alternativa seleccionada.

## Privacidad y coste

- La importación, validación, evaluación y corrección se realizan en el navegador.
- El contenido del JSON no se envía a OpenAI ni a otros servicios de generación.
- No hay costes por uso de API.
- La elaboración del banco en ChatGPT es una etapa separada de la aplicación.
- No cargues documentos confidenciales en equipos o navegadores compartidos.

## Estructura

- `index.html`: aplicación web, importador JSON y sistema de evaluación.
- `.gitignore`: exclusión de archivos locales y secretos.
