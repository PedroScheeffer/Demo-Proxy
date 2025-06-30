from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()


@app.get("/")
async def root():
    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Demo API</title>
    </head>
    <body>
        <h1>Demo reverse Proxy</h1>
        <p>🔄 A <strong>reverse proxy</strong> sits between clients 🧑‍💻 and servers 🖥️. It receives requests from clients, forwards them to the appropriate server, and then sends the server's response back to the client. This helps with security 🔒, load balancing ⚖️, and caching 🚀.</p>
    </body>
    </html>
    """
    return html_content




