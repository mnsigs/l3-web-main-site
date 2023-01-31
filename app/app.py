from flask import Flask, render_template

# from markupsafe import escape

# from typing import List

app = Flask(__name__)


@app.route("/")
@app.route("/index")
@app.route("/index.html")
def index():
    return render_template("pages/index.html")


@app.route("/about/")
@app.route("/about")
@app.route("/about.html")
def about():
    return render_template("pages/about.html")


@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"), 404


@app.errorhandler(500)
def internal_server_error(e):
    return render_template("500.html"), 500


def main():
    app.run()


if __name__ == "__main__":
    main()
