CREATE SCHEMA IF NOT EXISTS securecapita;

--SET NAMES UTF-8;

--SET TIME_ZONE = 'America/Bogota';

--USE securecapita;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) DEFAULT NULL,
    title VARCHAR(255) DEFAULT NULL,
    bio VARCHAR(255) DEFAULT NULL,
    enabled BOOLEAN DEFAULT FALSE,
    non_locked BOOLEAN DEFAULT FALSE,
    using_mfa BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image_url VARCHAR(255) DEFAULT 'https://media.istockphoto.com/id/587805156/es/vector/ilustraci%C3%B3n-vectorial-de-imagen-de-perfil.jpg?s=1024x1024&w=is&k=20&c=7q22pMnBZQRJGLmHIsbSqD2yeW_7VJUuu0Nvm9OK97k=',
    CONSTRAINT un_users_email UNIQUE (email)
);

DROP TABLE IF EXISTS roles;

CREATE TABLE roles(
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    permission VARCHAR(255) NOT NULL,
    CONSTRAINT un_roles_name UNIQUE (name)
);

DROP TABLE IF EXISTS userroles;

CREATE TABLE userroles(
    id serial PRIMARY KEY,
    user_id  INTEGER NOT NULL,
    rol_id INTEGER NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT un_userroles UNIQUE (user_id, rol_id)
);


DROP TABLE IF EXISTS events;

CREATE TABLE events(
    id serial PRIMARY KEY,
    type VARCHAR(50) NOT NULL CHECK ( type in ('LOGIN_ATTEMPT', 'LOGIN_ATTEMPT_FAILURE','LOGIN_ATTEMPT_SUCCESS', 'PROFILE_UPDATE', 'PROFILE_PICTURE_UPDATE', 'ROLE_UPDATE', 'ACCOUNT_SETTING_UPDATE', 'PASSWORD_UPDATE', 'MFA_UPDATE')),
    description VARCHAR(255) NOT NULL,
    CONSTRAINT un_events_type UNIQUE (type)
);

DROP TABLE IF EXISTS userevents;

CREATE TABLE userevents(
    id serial PRIMARY KEY,
    user_id  INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    device VARCHAR(50) DEFAULT NULL,
    ip VARCHAR(20) DEFAULT NULL,
    browser VARCHAR(50) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) references events (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) references users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS accountverifications;

CREATE TABLE accountverifications(
    id serial PRIMARY KEY,
    user_id  INTEGER NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (user_id) references users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT un_accountvarification_user_id UNIQUE (user_id),
    CONSTRAINT un_accountvarification_url UNIQUE (url)
);