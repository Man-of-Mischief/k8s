from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World..V8!\n"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)