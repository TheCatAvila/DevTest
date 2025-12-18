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
        # Obtener los datos del formulario
        email = request.form["email_login"]
        password = request.form["password_login"]

        # Validar los datos del formulario
        #user_service = UserService(email=email)
        #user_service.validate_email()

        # Logear al usuario
        if User(email=email, password=password).login():
            # Si el login es exitoso
            return redirect("/")
        else:
            # Si el login falla
            return redirect("/auth")

@auth_routes.route("/register_user", methods=["POST"])
def register_user():
    if request.method == "POST":
        # Obtener los datos del formulario
        username = request.form["username_register"]
        email = request.form["email_register"]
        password = request.form["password_register"]
        password_confirm = request.form["password_repit_register"]

        # Validar los datos del formulario
        user_service = UserService(username=username, 
                                   email=email, 
                                   password=password, 
                                   password_confirm=password_confirm)
        user_service.validate_all()

        # Registrar al usuario
        User(username=username, email=email, password=password).register()
        
        return redirect("/auth")  # Redirige al login después de registrar
    
    return render_template("auth.html")  # Muestra el formulario si es GET

@auth_routes.route("/logout", methods=["POST"])
def logout():
    """Cierra la sesión del usuario."""
    session.pop("user_id", None)
    return redirect("/")