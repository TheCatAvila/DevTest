-- Categories
INSERT INTO categories (name) VALUES 
('Programming Language'),
('Methodology'),
('Framework'),
('Tool'),
('Database');

-- Types/Subtypes
INSERT INTO types (name) VALUES 
('Backend'),
('Agile'),
('Frontend'),
('Virtualization'),
('Relational');

-- Paradigms/Approaches
INSERT INTO paradigms (name) VALUES 
('Multiparadigm'),
('Agile'),
('Declarative'),
('Containerization'),
('Relational');

-- Companies/Communities
INSERT INTO companies (name) VALUES 
('Python Software Foundation'),
('Ken Schwaber & Jeff Sutherland'),
('Meta (Facebook)'),
('Docker Inc.'),
('Oracle Corporation');

-- Main Uses
INSERT INTO uses (name) VALUES 
('General Development'),
('Project Management'),
('Web Development'),
('DevOps'),
('Data Storage');


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

INSERT INTO technologies (name, category_id, type_id, release_year, paradigm_id, company_id, use_id) VALUES
('C#', 1, 1, 2000, 1, 5, 1),                          -- Lenguaje multiparadigma, backend, Microsoft, desarrollo general
('Java', 1, 1, 1995, 1, 5, 1),                        -- Lenguaje multiparadigma, backend, Oracle, desarrollo general
('Angular', 3, 3, 2010, 3, 3, 3),                     -- Framework frontend, declarativo, Google, desarrollo web
('Spring', 3, 1, 2002, 1, 5, 1),                      -- Framework backend, multiparadigma, Oracle, desarrollo general
('MongoDB', 5, 5, 2009, 5, 5, 5),                     -- Base de datos NoSQL, almacenamiento de datos
('Vue.js', 3, 3, 2014, 3, 3, 3),                      -- Framework frontend, declarativo, comunidad, desarrollo web
('Ruby', 1, 1, 1995, 1, 5, 1),                        -- Lenguaje multiparadigma, backend, comunidad, desarrollo general
('Rails', 3, 1, 2004, 1, 5, 1),                       -- Framework backend, multiparadigma, comunidad Ruby, desarrollo web
('Jira', 4, 2, 2002, 2, 5, 2),                        -- Herramienta, metodología ágil, Atlassian, gestión de proyectos
('Git', 4, 4, 2005, 4, 5, 4),                         -- Herramienta DevOps, containerization, Linus Torvalds, control de versiones
('PHP', 1, 1, 1995, 1, 5, 1),                         -- Lenguaje multiparadigma, backend, comunidad, desarrollo web
('ASP.NET Core', 3, 1, 2016, 1, 5, 1),                -- Framework backend, multiparadigma, Microsoft, desarrollo general
('Terraform', 4, 4, 2014, 4, 5, 4),                   -- Herramienta IaC, containerization, HashiCorp, DevOps
('SQLite', 5, 5, 2000, 5, 5, 5),                      -- Base de datos relacional ligera
('Go', 1, 1, 2009, 1, 3, 1);                          -- Lenguaje multiparadigma, Google, backend

