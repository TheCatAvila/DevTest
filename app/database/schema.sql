CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(256) NOT NULL,
    register_date DATETIME NOT NULL
);

ALTER TABLE users
ADD COLUMN username VARCHAR(50) UNIQUE NOT NULL;

ALTER TABLE users
DROP COLUMN name,
DROP COLUMN lastname;

-- Reference tables (normalized)
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE paradigms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE uses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Main technologies table
CREATE TABLE technologies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    logo_url TEXT,
    description TEXT,
    documentation_url TEXT,
    category_id INT NOT NULL,
    type_id INT NOT NULL,
    release_year INT NOT NULL,
    paradigm_id INT NOT NULL,
    company_id INT NOT NULL,
    use_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (type_id) REFERENCES types(id),
    FOREIGN KEY (paradigm_id) REFERENCES paradigms(id),
    FOREIGN KEY (company_id) REFERENCES companies(id),
    FOREIGN KEY (use_id) REFERENCES uses(id)
);

CREATE TABLE daily_tech (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    tech_id INT NOT NULL,
    FOREIGN KEY (tech_id) REFERENCES technologies(id)
);

CREATE TABLE guesses_techs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    daily_tech_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (daily_tech_id) REFERENCES daily_tech(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
)