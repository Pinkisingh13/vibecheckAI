from fastapi import FastAPI
from textblob import TextBlob
from pydantic import BaseModel

app = FastAPI()
print("app: Fastapi")

class TextInput(BaseModel):
    text: str

@app.post("/vibecheck")
def read_root(request: TextInput):
    print("text: ", request.text)
    blob = TextBlob(request.text)
    print(blob)
    print(blob.sentiment)
    if blob.sentiment.polarity > 0:
        return {"sentiment": blob.sentiment, "message": "Positive Vibe"}
    elif blob.sentiment.polarity < 0:
        return {"sentiment": blob.sentiment, "message": "Negative Vibe"}
    else:
        return {"sentiment": blob.sentiment, "message": "Neutral Vibe"}

