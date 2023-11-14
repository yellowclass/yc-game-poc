from flask import Flask, jsonify
import json

app = Flask(__name__)

json_file_path = 'example.json'

@app.route('/')
def default_route():
    return "Running"

@app.route('/game1', methods=['GET'])
def game_1():
    with open(json_file_path, 'r') as file:
        return jsonify(json.load(file))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=50000, debug=False)