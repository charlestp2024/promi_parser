from kafka import KafkaProducer
import json

class KafkaProducerService:
    def __init__(self, bootstrap_servers):
        self.producer = KafkaProducer(
            bootstrap_servers=bootstrap_servers,
            value_serializer=lambda v: json.dumps(v).encode('utf-8')
        )

    def send_message(self, topic, message):
        self.producer.send(topic, message)
        self.producer.flush()

    def configure_producer(self, config):
        for key, value in config.items():
            self.producer.config[key] = value