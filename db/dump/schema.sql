-- 1.Création de la table user
-- La table user contient les informations essentielles concernant les utilisateurs, telles que l'email, le mot de passe et les rôles associés.
CREATE TABLE IF NOT EXISTS "user" (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Création de la table role
-- La table role permet de stocker les rôles que peuvent avoir les utilisateurs (par exemple, ADMIN, USER, etc.).
CREATE TABLE IF NOT EXISTS "role" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- 3. Table user_roles pour la relation utilisateur-rôle (Many-to-Many)
-- Un utilisateur peut avoir plusieurs rôles, et un rôle peut être attribué à plusieurs utilisateurs. Pour représenter cette relation, une table de jointure user_roles est nécessaire.
CREATE TABLE IF NOT EXISTS "user_roles" (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES "role" (id) ON DELETE CASCADE
);

-- 4. Ajout de quelques rôles par défaut
-- Il est souvent utile de pré-remplir la table role avec quelques rôles de base.
INSERT INTO "role" (name) VALUES ('ROLE_USER'), ('ROLE_ADMIN')
ON CONFLICT (name) DO NOTHING;  -- Cette instruction évite les doublons si les rôles existent déjà.
