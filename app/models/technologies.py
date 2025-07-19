from flask import session
from app.database.db_connection import Database

class Technology:
    def __init__(self, id: int = None, name: str = None):
        self.id = id
        self.name = name

    def get_all(self):
        """Obtiene todos los datos de la tecnología."""
        query = "SELECT * FROM technologies"
        
        with Database() as db:
            db.execute(query)
            tech_data = db.fetchall()
            return tech_data
    
    def get_id_by_name(self):
        """Obtiene el ID de la tecnología por su nombre."""
        query = "SELECT id FROM technologies WHERE name = %s"
        values = (self.name,)
        
        with Database() as db:
            db.execute(query, values)
            tech_id = db.fetchone()
            return tech_id['id'] if tech_id else None
        
    def get_tech_data(self):
        """Obtiene los datos de la tecnología por su ID."""
        query = """SELECT 
                    technologies.name AS name, 
                    categories.name AS category, 
                    types.name AS type, 
                    technologies.release_year, 
                    paradigms.name AS paradigm, 
                    companies.name AS company, 
                    uses.name AS uses
                FROM technologies
                JOIN categories ON categories.id = technologies.category_id
                JOIN types ON types.id = technologies.type_id
                JOIN paradigms ON paradigms.id = technologies.paradigm_id
                JOIN companies ON companies.id = technologies.company_id
                JOIN uses ON uses.id = technologies.use_id
                WHERE technologies.id = %s;"""
        values = (self.id,)
        
        with Database() as db:
            db.execute(query, values)
            tech_data = db.fetchone()
            return tech_data if tech_data else None
    
    def verify_daily_tech(self):
        """Verifica si la tecnología ingresada es la del día."""
        if self.id == 1:  
            return True
        else:
            return False