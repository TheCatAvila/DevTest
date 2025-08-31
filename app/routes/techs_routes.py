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
    # Obtener los datos del formulario
    tech = request.form.get("tech")
    daily_tech = Technology.get_daily_tech()
    # Instanciar el objeto ingresado y la tecnología del día
    tech_obj = Technology(name=tech)
    tech_id = tech_obj.get_id_by_name()
    # Obtener datos de la tecnología ingresada y la del día
    input_tech_data = Technology(id=tech_id).get_tech_data()
    day_tech_data = Technology(id=daily_tech['tech_id']).get_tech_data()

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

    # Inicializa la lista de adivinadas si no existe
    if 'guessed_techs' not in session:
        session['guessed_techs'] = []
    
    if 'attempts' not in session:
        session['attempts'] = 0
    
    if 'user_winner' not in session:
        session['user_winner'] = False

    # Agrega solo si no está ya
    already_guessed = any(entry["name"] == tech for entry in session['guessed_techs'])
    if not already_guessed:
        session['guessed_techs'].append({
            "name": tech,
            "comparison": comparison_result
        })
        session.modified = True
    
    session['attempts'] += 1
    print(f"Intentos: {session['attempts']}")
    
    # Verifica si la tecnología ingresada es la del día
    if Technology(id=tech_id).verify_daily_tech():
        session['user_winner'] = True
    else:
        print(f"La tecnología '{tech}' NO es la del día.")
        
    return redirect('/daily_tech')

@techs_routes.route('/reset_game')
def reset_game():
    session.pop('guessed_techs', None)
    session.pop('attempts', None)
    session.pop('user_winner', None)

    daily_tech_data = Technology.get_random_tech()
    if daily_tech_data:
        tech = Technology(id=daily_tech_data['id'])
        Technology.reset_daily_tech()
        tech.define_daily_tech()
        print(f"La tecnología del día ha sido definida como: {tech.name}")

    return redirect('/daily_tech')



"""         # Validar los datos del formulario
        # ---
        # Verificar si la tecnología ya existe
        id = Technology(name=tech).get_id_by_name()
        # Obtener los datos de la tecnología
        tech_data = Technology(id=id).get_tech_data()
        print(tech_data)
 """