from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify(TEST_ENV=os.getenv("TEST_ENV"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
