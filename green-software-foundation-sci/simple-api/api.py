from fastapi import FastAPI
from fastapi import Response
import time
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/json')
async def get_machines():
    print(f"{time.time_ns()} GMT_SCI_R=1")
    return {"Topic": "You wanna know about my SCI? You have come to the right place!"}
