from flask import Blueprint, session, redirect, render_template, request
from app.models.user import User
from app.models.technologies import Technology

# Blueprint llamado 'main'
main = Blueprint('main', __name__)

@main.route('/')
def index():

    # Verificar si el usuario está logueado y obtener sus datos de sesión
    user_id = session.get("user_id")
    user_login_data = User(id=user_id).get_login_data()
    if not user_login_data:
        return render_template("index.html")
    
    return render_template('index.html', user_login_data=user_login_data)

@main.route('/daily_tech')
def daily_tech():

    guessed_techs = session.get('guessed_techs', [])
    guessed_techs_data = []
    print(guessed_techs)
    for tech in guessed_techs:
        tech_id = Technology(name=tech).get_id_by_name()
        tech_data = Technology(id=tech_id).get_tech_data()
        guessed_techs_data.append(tech_data)
        print(f"Datos de la tecnología '{tech}': {tech_data}")

    return render_template('daily_tech.html', guessed_techs_data=guessed_techs_data)
