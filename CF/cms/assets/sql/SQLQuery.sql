CREATE TABLE userTableCMS (
	userName varchar(255) NOT NULL PRIMARY KEY,
	password varchar(255),
	role varchar(10) FOREIGN KEY REFERENCES userRoles(roles)
);

CREATE TABLE userRoles (
	roles VARCHAR(10) PRIMARY KEY
);

CREATE TABLE pageTableCMS (
    pageid INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	pageName varchar(255),
	pageDesc varchar(255)
);

INSERT INTO userRoles VALUES('admin');
INSERT INTO userRoles VALUES('editor');
INSERT INTO userRoles VALUES('user');