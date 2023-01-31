from flask import Flask, make_response, render_template

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
def not_found(error):
    resp = make_response(render_template("error.html"), 404)
    resp.headers["X-Something"] = "A value"
    return resp


def main():
    app.run()


if __name__ == "__main__":
    main()
