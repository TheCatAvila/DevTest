-- Categorías
INSERT INTO categories (name) VALUES 
('Lenguaje de programación'),
('Metodología'),
('Framework'),
('Herramienta'),
('Base de datos');

-- Tipos/Subtipos
INSERT INTO types (name) VALUES 
('Backend'),
('Ágil'),
('Frontend'),
('Virtualización'),
('Relacional');

-- Paradigmas/Enfoques
INSERT INTO paradigms (name) VALUES 
('Multiparadigma'),
('Ágil'),
('Declarativo'),
('Contenerización'),
('Relacional');

-- Empresas/Comunidades
INSERT INTO companies (name) VALUES 
('Python Software Foundation'),
('Ken Schwaber & Jeff Sutherland'),
('Meta (Facebook)'),
('Docker Inc.'),
('Oracle Corporation');

-- Usos principales
INSERT INTO uses (name) VALUES 
('Desarrollo general'),
('Gestión de proyectos'),
('Desarrollo web'),
('DevOps'),
('Almacenamiento de datos');

INSERT INTO technologies (name, category_id, type_id, release_year, paradigm_id, company_id, use_id) VALUES
('Python', 1, 1, 1991, 1, 1, 1),
('SCRUM', 2, 2, 1995, 2, 2, 2),
('React', 3, 3, 2013, 3, 3, 3),
('Docker', 4, 4, 2013, 4, 4, 4),
('MySQL', 5, 5, 1995, 5, 5, 5);

INSERT INTO technologies (name, category_id, type_id, release_year, paradigm_id, company_id, use_id) VALUES
('JavaScript', 1, 3, 1995, 1, 3, 3),               -- Lenguaje multiparadigma, usado en frontend, Meta (React), desarrollo web
('Kanban', 2, 2, 2004, 2, 2, 2),                   -- Metodología ágil, gestión de proyectos
('PostgreSQL', 5, 5, 1996, 5, 5, 5),               -- Base de datos relacional, almacenamiento de datos
('Flask', 3, 1, 2010, 1, 1, 1),                    -- Framework backend, multiparadigma, uso general
('Kubernetes', 4, 4, 2014, 4, 4, 4);               -- Herramienta DevOps, contenerización
