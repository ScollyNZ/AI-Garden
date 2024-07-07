from typing import Union
from fastapi import FastAPI
from google.cloud import pubsub_v1

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

@app.get("/event/{sensor_id}")
def receive_event(sensor_id: str, temp: float = None, moisture: float = None, humidity: float = None):
    # Initialize a Publisher client
    publisher = pubsub_v1.PublisherClient()

    # Define the topic to which to publish
    topic_path = publisher.topic_path("ai-garden-427303", "ai-garden-events")

    # Data to publish
    data = b"Hello, World!"

    # Publish the message
    future = publisher.publish(topic_path, data)
    print(f"Published message {future.result()}")
    return {"sensor_id": sensor_id, "temperature":temp, "moist":moisture, "humidity":humidity}