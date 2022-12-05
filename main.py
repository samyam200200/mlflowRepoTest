from fastapi import FastAPI, HTTPException
import psycopg2

def database_connection():
    try:
        con = psycopg2.connect(database="imageDB",
                                 user="postgres",
                                    password="postgres",
                                    host="localhost",
                                    port="5432")
        con.autocommit = True
        return con
    except Exception as e:
        print("Error while connecting to PostgreSQL", e)
        raise HTTPException(status_code=500, detail="Error while connecting to PostgreSQL")

app=FastAPI()

@app.post("/upload/")
async def upload_image(id: int):
    con=database_connection()
    with con.cursor() as cur:
        cur.execute("INSERT INTO image (id) VALUES (%s)", (id))
    return {"id": id}
    
    