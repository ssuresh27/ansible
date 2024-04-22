import os
from psycopg2
from flask import Flask
app = Flask(__name__)

conn = psycopg2.connect(
        host="localhost",
        database="flask_db",
        user=os.environ['suresh'],
        password=os.environ['welcome123'])

cursor = conn.cursor()

@app.route("/")
def main():
    return "Welcome!"
@app.route('/how are you')
def hello():
    return 'I am good, how about you?'

@app.route('/read from database')
def read():
    cursor.execute("SELECT * FROM employees")
    row = cursor.fetchone()
    result = []
    while row is not None:
      result.append(row[0])
      row = cursor.fetchone()

    return ",".join(result)

if __name__ == "__main__":
    app.run()