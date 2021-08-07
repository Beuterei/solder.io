CREATE TABLE modpacks (
    id int(64) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128),
    display_name VARCHAR(128),
    url VARCHAR(512),
    icon VARCHAR(512),
    icon_md5 VARCHAR(512),
    logo VARCHAR(512),
    logo_md5 VARCHAR(512),
    background VARCHAR(512),
    background_md5 VARCHAR(512),
    latest VARCHAR(512),
    recommended VARCHAR(512),
    public BOOLEAN,
    clients LONGTEXT,
    UNIQUE (name)
);

CREATE TABLE users (
    id int(8) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128),
    display_name VARCHAR(128),
    pass VARCHAR(128),
    perms VARCHAR(512),
    icon LONGTEXT,
    UNIQUE (name)
);

CREATE TABLE clients (
    id int(8) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128),
    UUID VARCHAR(128),
    UNIQUE (UUID)
);

CREATE TABLE builds (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    modpack INT(6) NOT NULL,
    name VARCHAR(128) NOT NULL,
    minecraft VARCHAR(128),
    java VARCHAR(512),
    memory VARCHAR(512),
    mods VARCHAR(1024),
    public BOOLEAN,
    clients LONGTEXT
);

CREATE TABLE mods (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    pretty_name VARCHAR(128) NOT NULL,
    url VARCHAR(512),
    link VARCHAR(512),
    author VARCHAR(512),
    donlink VARCHAR(512),
    description VARCHAR(1024),
    version VARCHAR(512),
    md5 VARCHAR(512),
    mcversion VARCHAR(128),
    filename VARCHAR(128),
    type VARCHAR(128)
);