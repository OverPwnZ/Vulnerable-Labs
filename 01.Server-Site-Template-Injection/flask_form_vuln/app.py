from flask import Flask, render_template, request, render_template_string

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    nombre = None
    edad = None
    renderizado = None

    if request.method == "POST":
        nombre = request.form.get("nombre", "")
        edad = request.form.get("edad", "")

        renderizado = render_template_string(nombre)

    return render_template("index.html", nombre=nombre, edad=edad, renderizado=renderizado)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=7777, debug=True)

