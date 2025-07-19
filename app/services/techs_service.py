from app.models.technologies import Technology

def verify_and_compare_tech(tech_name: str) -> tuple[dict, bool]:
    """
    Retorna un diccionario con la comparación entre la tecnología ingresada
    y la del día, además de un booleano indicando si fue adivinada correctamente.
    """
    tech_obj = Technology(name=tech_name)
    tech_id = tech_obj.get_id_by_name()

    if tech_obj.verify_daily_tech():
        return {}, True

    input_data = Technology(id=tech_id).get_tech_data()

    daily_tech_obj = Technology(name="Python")
    daily_tech_id = daily_tech_obj.get_id_by_name()
    daily_data = Technology(id=daily_tech_id).get_tech_data()

    comparison_result = {}
    for key in input_data:
        input_value = input_data[key]
        daily_value = daily_data.get(key)

        comparison_result[key] = {
            "input": input_value,
            "daily": daily_value,
            "match": input_value == daily_value
        }

    return comparison_result, False


def is_already_guessed(session, tech_name: str) -> bool:
    return any(entry["name"] == tech_name for entry in session.get("guessed_techs", []))


def add_tech_to_session(session, tech_name: str, comparison_result: dict):
    if 'guessed_techs' not in session:
        session['guessed_techs'] = []

    session['guessed_techs'].append({
        "name": tech_name,
        "comparison": comparison_result
    })
    session.modified = True
