from flask import Flask, render_template

# from markupsafe import escape

# from typing import List

app = Flask(__name__)


@app.route("/")
@app.route("/index")
@app.route("/index.html")
def index():
    return render_template("pages/index.html")


def main():
    app.run()


if __name__ == "__main__":
    main()
