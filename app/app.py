from flask import Flask, render_template

# from markupsafe import escape

# from typing import List

app = Flask(__name__)


@app.route("/")
@app.route("/index")
@app.route("/index.html")
def index():
    return render_template("pages/index.html")


@app.route("/")
@app.route("/about")
@app.route("/about.html")
def about():
    return render_template("pages/about.html")


def main():
    app.run()


if __name__ == "__main__":
    main()
