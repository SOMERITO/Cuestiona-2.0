# Cuestiona 2.0

**Repositorio oficial:** https://github.com/SOMERITO/Cuestiona-2.0

Genera cuestionarios de opción múltiple desde documentos PDF directamente en tu navegador, sin API de pago, sin clave y sin servidor Python.

## Funciones

- Carga de varios PDF y arrastrar archivos a cualquier parte de la pantalla.
- Extracción local del texto y referencias de página mediante PDF.js.
- Generación local de preguntas a partir de definiciones explícitas del material.
- Cuatro alternativas por pregunta, una respuesta correcta y explicación basada en el texto.
- Corrección inmediata y revisión de respuestas.
- Solicitud de hasta 1.000 preguntas por generación, limitada por la cantidad de conceptos distintos que realmente puedan extraerse.

## Cómo usar

1. Abre la página publicada o sirve los archivos estáticos desde cualquier servidor web.
2. Carga uno o varios PDF con texto seleccionable.
3. Indica cuántas preguntas deseas (1–1.000).
4. Pulsa **Generar examen** y responde las alternativas.

No necesitas crear una cuenta, introducir una clave API ni ejecutar Python.

## Cómo se generan las preguntas

La generación se realiza en el navegador mediante reglas de extracción de texto. La versión actual identifica construcciones explícitas como «X es…», «X consiste en…», «X se define como…» y «X se refiere a…». Usa la descripción original como base de la pregunta y otros conceptos encontrados en los documentos como distractores.

**Límite importante:** esto no es un modelo de IA. La calidad y cantidad dependen de cómo esté redactado el PDF. No inventa preguntas para completar el número solicitado; si solo encuentra 23 preguntas distintas y solicitas 100, entrega las 23 y lo informa. Los PDF escaneados sin texto seleccionable necesitan OCR previo. Algunas preguntas pueden requerir revisión humana, especialmente si el documento contiene frases complejas o definiciones muy parecidas.

## Privacidad y coste

- Los archivos se leen en el navegador y su texto no se envía a OpenAI ni a otro servicio de generación.
- No hay costes por uso de API.
- PDF.js se carga desde una CDN pública, por lo que la primera carga de la biblioteca requiere conexión a internet.
- No cargues documentos confidenciales en equipos o navegadores compartidos.

## Estructura

- `index.html`: aplicación web y generación local.
- `.gitignore`: exclusión de archivos locales y secretos.
