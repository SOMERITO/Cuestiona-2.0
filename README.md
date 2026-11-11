# Preguntator

Genera evaluaciones de opción múltiple a partir de uno o varios documentos PDF. Incluye cuatro alternativas por pregunta, retroalimentación por alternativa y referencia al documento y página.

## Características

- Carga múltiple de PDF con zona de arrastrar y soltar.
- Extracción local del texto y sus páginas mediante PDF.js.
- Configuración de cantidad (1–100) y dificultad.
- Generación de preguntas mediante OpenAI Responses API.
- Preguntas centradas en comprensión, interpretación, comparación y aplicación según el contenido.
- Cuatro alternativas plausibles y una única respuesta correcta.
- Explicación de la respuesta correcta y de cada distractor.
- Tooltips oscuros en las acciones principales.
- Clave API protegida en un servidor local; nunca se incluye en el HTML.

## Inicio en Windows

1. Instala Python 3.9 o posterior.
2. Descarga o clona este repositorio.
3. Haz doble clic en \`Iniciar_Preguntator.bat\`.
4. Introduce tu clave API de OpenAI cuando la terminal la solicite. La escritura está oculta.
5. Abre **http://127.0.0.1:8000** en Chrome o Edge.

Para iniciar sin IA, pulsa Enter sin introducir una clave. La interfaz se abrirá, pero la generación de exámenes requiere configurar la API.

## Inicio desde terminal

\`\`\`bash
python servidor_preguntator.py
\`\`\`

En Windows también puedes usar:

\`\`\`powershell
py servidor_preguntator.py
\`\`\`

## Configuración de OpenAI

Crea una clave API en https://platform.openai.com/api-keys. La API se factura por separado de la suscripción de ChatGPT. Configura límites de gasto en tu cuenta antes de utilizarla.

El modelo predeterminado es \`gpt-6-luna\`. Puedes cambiarlo mediante la variable de entorno \`OPENAI_MODEL\`.

## Privacidad y límites

- El servidor escucha únicamente en \`127.0.0.1\`, es decir, en tu propio equipo.
- La clave se solicita de forma oculta y permanece en memoria mientras el servidor está activo.
- Los PDF se extraen en el navegador. Al generar el examen, el texto extraído se envía a OpenAI.
- La solicitud usa \`store: false\`.
- No cargues documentos confidenciales o cuya divulgación no esté autorizada.
- Se procesan hasta 100.000 caracteres por generación. El resto se omite y se informa a la IA del recorte.
- Los PDF escaneados sin texto seleccionable requieren OCR antes de cargarse.

## Publicación web

GitHub Pages puede servir la interfaz estática, pero **no ejecuta el servidor Python**. Para generar exámenes con IA, ejecuta el servidor local o despliega el backend en un servicio compatible con Python y configura HTTPS, autenticación, control de uso y gestión segura de secretos antes de exponerlo a Internet.

## Estructura

- \`index.html\`: interfaz de Preguntator.
- \`servidor_preguntator.py\`: servidor local y conexión con OpenAI.
- \`Iniciar_Preguntator.bat\`: iniciador para Windows.
- \`.gitignore\`: exclusión de archivos locales y secretos.
