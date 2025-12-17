from flask import request, session, redirect, render_template
from flask import Blueprint, render_template
from flask import jsonify
from app.models.user import User
from app.services.user_service import UserService

# Blueprint llamado 'main'
auth_routes = Blueprint('auth_routes', __name__)

@auth_routes.route('/auth')
def login():
    return render_template('auth/auth.html')

@auth_routes.route("/login_user", methods=["POST"])
def login_user():
    if request.method == "POST":
        print("Login request received-----------")
        # Obtener los datos del formulario
        email = request.form["email_login"]
        password = request.form["password_login"]
        print("Email and Password received:------")
        print("email:", email)
        print("password:", password)

        # Validar los datos del formulario
        #user_service = UserService(email=email)
        #user_service.validate_email()

        # Logear al usuario
        if User(email=email, password=password).login():
            # Si el login es exitoso
            return jsonify({"success": True, "message": "Inicio de sesión exitoso."})
        else:
            # Si el login falla
            return jsonify({"success": False, "message": "Contraseña o email incorrectos."})

@auth_routes.route("/register_user", methods=["POST"])
def register_user():
    if request.method == "POST":
        # Obtener los datos del formulario
        name = request.form["name"]
        lastname = request.form["lastname"]
        email = request.form["email"]
        password = request.form["password"]
        password_confirm = request.form["password_confirm"]

        # Validar los datos del formulario
        user_service = UserService(name=name, 
                                   lastname=lastname, 
                                   email=email, 
                                   password=password, 
                                   password_confirm=password_confirm)
        user_service.validate_all()

        # Registrar al usuario
        User(name=name, lastname=lastname, email=email, password=password).register()
        
        return redirect("/ingresar")  # Redirige al login después de registrar
    
    return render_template("register.html")  # Muestra el formulario si es GET

@auth_routes.route("/logout", methods=["POST"])
def logout():
    """Cierra la sesión del usuario."""
    session.pop("user_id", None)
    return redirect("/ingresar")