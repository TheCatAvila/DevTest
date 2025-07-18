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
    
    # Verifica si la tecnología ingresada es la del día
    if Technology(name=tech).verify_daily_tech():
        print(f"La tecnología '{tech}' es la del día.")
    else:
        # Obtener datos de la tecnología ingresada
        tech_obj = Technology(name=tech)
        tech_id = tech_obj.get_id_by_name()
        input_tech_data = Technology(id=tech_id).get_tech_data()

        # Obtener datos de la tecnología del día (ej. Python)
        daily_tech_obj = Technology(name="Python")
        daily_tech_id = daily_tech_obj.get_id_by_name()
        day_tech_data = Technology(id=daily_tech_id).get_tech_data()

        # Diccionario para almacenar si hay coincidencia o no en cada campo
        comparison_result = {}

        # Comparar clave por clave
        for key in input_tech_data:
            input_value = input_tech_data[key]
            day_value = day_tech_data.get(key)

            comparison_result[key] = {
                "input": input_value,
                "daily": day_value,
                "match": input_value == day_value
            }

            print(comparison_result[key])

    # Inicializa la lista de adivinadas si no existe
    if 'guessed_techs' not in session:
        session['guessed_techs'] = []

    # Agrega solo si no está ya
    #already_guessed = any(entry["name"] == tech for entry in session['guessed_techs'])
    #if not already_guessed:
    session['guessed_techs'].append({
        "name": tech,
        "comparison": comparison_result
    })
    session.modified = True

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