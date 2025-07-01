from flask import Flask

app = Flask(__name__)

print(f"Starting Flask app in package {__name__}")

@app.route('/')
def home():
    return "Hello, Dockerized Flask API!"

if __name__ == '__main__':
    app.run(host="0.0.0.0",debug=True)
