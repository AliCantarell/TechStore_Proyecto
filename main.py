from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import mysql.connector
from pydantic import BaseModel
import requests
import os
from dotenv import load_dotenv

load_dotenv()

DB_PASSWORD = os.getenv("DB_PASSWORD")
SOLACE_USER = os.getenv("SOLACE_USER")
SOLACE_PASSWORD = os.getenv("SOLACE_PASSWORD")

app = FastAPI(title="API TechStore - Sistema de Gestión")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password=DB_PASSWORD,
        database="techstore_db"
    )

class Pedido(BaseModel):
    id_equipamiento: int
    cantidad: int
    cliente: str


@app.get("/categorias")
def obtener_categorias():
   
    cursor.execute("SELECT id_categoria, nombre FROM categorias")
    return cursor.fetchall()

@app.get("/") 
def obtener_productos(categoria_id: int = None):
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        
        query = "SELECT id_producto, nombre, marca, modelo, precio_venta, id_categoria, url_imagen FROM productos"
        
        
        if categoria_id and categoria_id != 0:
            query += f" WHERE id_categoria = {categoria_id}"

        cursor.execute(query)
        productos = cursor.fetchall()
        cursor.close()
        conn.close()

        productos_normalizados = [
            {k.lower(): v for k, v in p.items()} for p in productos
        ]

        return {"productos": productos_normalizados}
    except Exception as e:
        return {"error": str(e)}

@app.post("/enviar_pedido")
def enviar_pedido_a_cola(pedido: Pedido):
    url_solace = "https://mr-connection-t8jwqife9hr.messaging.solace.cloud:9443/ventas/pedidos"
    usuario = SOLACE_USER
    password = SOLACE_PASSWORD
    
    try:
        respuesta = requests.post(
            url_solace,
            auth=(usuario, password),
            data=pedido.model_dump_json(),
            headers={"Content-Type": "application/json"}
        )
        if respuesta.status_code == 200:
            return {"status": "Éxito"}
        return {"status": "Error", "mensaje": respuesta.text}
    except Exception as e:
        return {"status": "Error", "detalle": str(e)}