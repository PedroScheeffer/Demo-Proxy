from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()


@app.get("/", response_class=HTMLResponse)
async def root():
    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Demo API</title>
    </head>
    <body>
        <h1>Demo reverse Proxy</h1>
        <p>🔄 Un <strong>proxy inverso</strong> 🛡️ se 🧑‍💻 coloca 🏗️ entre 🧑‍💻 clientes 🤝 y 🖥️ servidores. Recibe 📥 las 📨 solicitudes 🧑‍💻, las 🔀 reenvía 🚚 al 🖥️ servidor adecuado, y luego 🔁 envía 📤 la respuesta 📨 del servidor 🖥️ de vuelta ⬅️ al cliente 🧑‍💻. Esto 🧰 ayuda 🆘 con 🔒 seguridad, ⚖️ balanceo de carga y 🚀 almacenamiento en caché.</p>
    </body>
    </html>
    """
    return HTMLResponse(content=html_content)




