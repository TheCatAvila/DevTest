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

-- Nuevas tecnologías
INSERT INTO technologies (name, category_id, type_id, release_year, paradigm_id, company_id, use_id) VALUES
('TypeScript', 1, 3, 2012, 1, 3, 3),           -- Lenguaje multiparadigma, frontend, Meta/Google, desarrollo web
('Swift', 1, 1, 2014, 1, 1, 1),               -- Lenguaje multiparadigma, backend/IOS, Apple, desarrollo general
('Rust', 1, 1, 2010, 1, 5, 1),                -- Lenguaje multiparadigma, backend, Mozilla, desarrollo general
('Django', 3, 1, 2005, 1, 1, 1),              -- Framework backend, multiparadigma, Python community, desarrollo web
('Spring Boot', 3, 1, 2014, 1, 5, 1),         -- Framework backend, multiparadigma, Oracle, desarrollo general
('Vuex', 3, 3, 2015, 3, 3, 3),                -- Framework frontend state management, declarativo, Vue community, desarrollo web
('Ansible', 4, 4, 2012, 4, 5, 4),             -- Herramienta DevOps, automatización, RedHat, DevOps
('Redis', 5, 5, 2009, 5, 5, 5),               -- Base de datos en memoria, almacenamiento de datos
('ElasticSearch', 5, 5, 2010, 5, 5, 5),       -- Base de datos NoSQL, búsqueda y analítica
('Figma', 4, 2, 2016, 2, 3, 3);               -- Herramienta de diseño, UI/UX, Meta/Comunidad, desarrollo web

-- New Categories
INSERT INTO categories (name) VALUES
('Markup Language'),
('Style Language'),
('Mobile Framework'),
('Testing Tool'),
('CI/CD Tool');

-- New Types
INSERT INTO types (name) VALUES
('Markup'),
('Styling'),
('Mobile'),
('Testing');

-- New Paradigms
INSERT INTO paradigms (name) VALUES
('Imperative'),
('Event-driven');

-- New Companies/Communities
INSERT INTO companies (name) VALUES
('W3C'),
('JUnit Team'),
('GitHub');

-- New Uses
INSERT INTO uses (name) VALUES
('Web Structure'),
('Web Styling'),
('Mobile Development'),
('Testing'),
('Automation');

INSERT INTO technologies 
(name, category_id, type_id, release_year, paradigm_id, company_id, use_id)
VALUES
('HTML', 6, 6, 1993, 6, 6, 6),           -- Lenguaje de marcado, estructura web
('CSS', 7, 7, 1996, 3, 6, 7),            -- Lenguaje de estilos, diseño web
('Sass', 7, 7, 2006, 3, 6, 7),           -- Preprocesador CSS
('Bootstrap', 3, 3, 2011, 3, 3, 3),      -- Framework CSS, desarrollo web
('Node.js', 4, 1, 2009, 7, 5, 1),        -- Runtime JS, event-driven, backend
('Express.js', 3, 1, 2010, 6, 5, 3),     -- Framework backend Node
('React Native', 8, 8, 2015, 3, 3, 8),   -- Framework mobile
('JUnit', 9, 9, 1997, 6, 7, 9),          -- Testing Java
('Jest', 9, 9, 2014, 6, 3, 9),           -- Testing JavaScript
('GitHub Actions', 10, 4, 2019, 4, 8, 10); -- CI/CD, automatización
