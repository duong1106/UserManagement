CREATE TABLE Registrations (
	username nvarchar(50) NOT NULL PRIMARY KEY,
	passwords varchar(64) NOT NULL,
	roles nvarchar(10),
)

CREATE TABLE Users (
	users_id int IDENTITY(1,1) PRIMARY KEY,
	users_fname nvarchar(50),
	users_lname nvarchar(50),
	users_email nvarchar(100),
	users_phone nvarchar(15),
	users_photo nvarchar(50),
	users_status bit,
	username nvarchar(50) UNIQUE FOREIGN KEY REFERENCES Registrations(username),
)

CREATE TABLE PromotionList (
	promote_code int IDENTITY(1,1) PRIMARY KEY,
	promote_rank decimal(5, 2),
	promote_date date,
	users_id int UNIQUE FOREIGN KEY REFERENCES Users(users_id),
)


INSERT INTO Users(username, users_fname, users_lname, users_email, users_phone, users_photo, users_status)
VALUES ('mario', 'Mario', 'Pipejumper', 'magicshroom@gmail.com', '1234567890', 'assets/avatar/super-mario-run.jpg', 'true')

SELECT users_id, Users.username, Registrations.roles, users_fname, users_lname, users_email, users_phone, users_photo, users_status
FROM Users INNER JOIN Registrations
ON Registrations.username = Users.username
WHERE users_status = 'true'

SELECT users_id, username, users_fname, users_lname, users_email, users_phone, users_photo, users_status
FROM Users WHERE users_fname LIKE '%m%' AND users_status = 'true'

SELECT users_id, users_fname, users_lname, users_email, users_phone, users_photo 
FROM Users WHERE username = 'minh'

UPDATE Users 
SET users_fname = '', users_lname = '', users_email = '', users_phone = '', users_photo = '', users_status = ''
WHERE users_fname = ''