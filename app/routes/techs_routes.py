from flask import request, session, redirect, render_template
from flask import Blueprint, render_template
from flask import jsonify
from app.models.user import User
from app.models.technologies import Technology
from app.services.user_service import UserService

# Blueprint llamado 'main'
techs_routes = Blueprint('techs_routes', __name__)

@techs_routes.route('/techs', methods=['POST'])
def techs():
    if request.method == "POST":
        # Obtener los datos del formulario
        tech = request.form.get("tech")
    
    # Inicializa la lista si es la primera vez
    if 'guessed_techs' not in session:
        session['guessed_techs'] = []
    
    # Agrega el valor solo si no está ya en la lista
    if tech and tech not in session['guessed_techs']:
        session['guessed_techs'].append(tech)
        session.modified = True  # Necesario para decirle a Flask que la sesión cambió

    return redirect('/daily_tech')

@techs_routes.route('/reset_game')
def reset_game():
    session.pop('guessed_techs', None)
    return redirect('/daily_tech')



"""         # Validar los datos del formulario
        # ---
        # Verificar si la tecnología ya existe
        id = Technology(name=tech).get_id_by_name()
        # Obtener los datos de la tecnología
        tech_data = Technology(id=id).get_tech_data()
        print(tech_data)
 """