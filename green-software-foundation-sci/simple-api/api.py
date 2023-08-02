from fastapi import FastAPI
from fastapi import Response

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get('/json')
async def get_machines():
    print("GMT_SCI_R=1")
    return {"Topic": "You wanna know about my SCI? You have come to the right place!"}
