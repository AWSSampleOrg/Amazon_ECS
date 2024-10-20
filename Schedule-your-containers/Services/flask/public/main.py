# -*- encoding:utf-8 -*-
import json
import os
from logging import getLogger, StreamHandler, DEBUG
import sys
from flask import Flask, request, Response

app = Flask(__name__)

# logger setting
logger = getLogger(__name__)
handler = StreamHandler()
handler.setLevel(DEBUG)
logger.setLevel(os.getenv("LOG_LEVEL", DEBUG))
logger.addHandler(handler)
logger.propagate = False

# Enable CORS
@app.after_request
def after_request(response: Response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    return response

@app.route("/healthcheck")
def healthcheck():
    return json.dumps({"message": "OK"})

@app.route('/',methods=["GET"])
def root_get():
    logger.info(request.headers)

    return json.dumps({"message": "OK"})

@app.route('/',methods=["POST"])
def root_post():
    logger.info(request.headers)
    logger.info(request.json)

    return json.dumps({"message": "OK"})

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=3000)
