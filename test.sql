
-- 7. В подключенномMySQLрепозиториисоздатьбазуданных“Друзья человека”
CREATE DATABASE peopleFriends;

-- 8. Создать таблицы с иерархией из диаграммыв БД
CREATE TABLE animals
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE homeAnimal
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(20) NOT NULL
  animal_id Int,
  PRIMARY KEY (`id`)
);

CREATE TABLE cats
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  command Varchar(20),
  PRIMARY KEY (`id`)
);

CREATE TABLE dogs
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  command Varchar(200),
  PRIMARY KEY (`id`)
);

CREATE TABLE hamsters
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  command Varchar(200),
  PRIMARY KEY (`id`)
);

CREATE TABLE packAnimal
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE camels
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  command Varchar(200),
  PRIMARY KEY (`id`)
);

CREATE TABLE horses
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  commands Varchar(200),
  PRIMARY KEY (`id`)
)
;

CREATE TABLE donkeys
(
  id Int NOT NULL AUTO_INCREMENT,
  name Varchar(30) NOT NULL,
  dateBirth Date NOT NULL,
  command Varchar(200),
  PRIMARY KEY (`id`)
)

-- Заполнить низкоуровневые таблицы именами(животных), командами которые онивыполняютидатамирождения

INSERT INTO animals (class) VALUES 
('вьючные'),
('домашние');  

INSERT INTO homeAnimal (id, name) VALUES 
(1, 'Кошки'),
(2, 'Собаки'),
(3, 'Хомяки');

INSERT INTO packAnimal (id, name) VALUES 
(1, 'Верблюды'),
(2, 'Лошади'),
(3, 'Ослы');

INSERT INTO cats (id, name, dateBirth, command) VALUES 
(1, 'Степа', '2024-01-01', 'кс'),
(2, 'Яша', '2024-02-01', 'кс'),  
(3, 'Мурка', '2024-03-01', 'кс'); 

INSERT INTO dogs (id, name, dateBirth, command) VALUES 
(1, 'Акс', '2024-01-01', 'сидеть'),
(2, 'Тузик', '2024-02-01', 'лежать'),  
(3, 'Юнга', '2024-03-01', 'голос'); 

INSERT INTO hamsters (id, name, dateBirth, command) VALUES 
(1, 'Эдик', '2024-01-01', ''),
(2, 'Лева', '2024-02-01', ''),  
(3, 'Матрос', '2024-03-01', ''); 

INSERT INTO camels (id, name, dateBirth, command) VALUES 
(1, 'Шама', '2024-01-01', 'стой'),
(2, 'Рева', '2024-02-01', 'пошли'),  
(3, 'Клава', '2024-03-01', 'отдых'); 

INSERT INTO horses (id, name, dateBirth, command) VALUES 
(1, 'Радан', '2024-01-01', 'но'),
(2, 'Скакун', '2024-02-01', 'фрр'),  
(3, 'Плотва', '2024-03-01', 'галоп'); 

INSERT INTO donkeys (id, name, dateBirth, command) VALUES 
(1, 'Лев', '2024-01-01', 'стой'),
(2, 'Песня', '2024-02-01', 'пошли'),  
(3, 'Жамал', '2024-03-01', 'отдых'); 

-- Удаливизтаблицыверблюдов,т.к. верблюдов решилиперевезти вдругой питомник назимовку. Объединить таблицы лошади,иослыводнутаблицу.
DELETE FROM camels;
SELECT name, dateBirth, command FROM horses
UNION SELECT  name, dateBirth, command FROM donkeys;

-- Создать новую таблицу “молодые животные” вкоторуюпопадутвсе животныестарше1года,номладше3летивотдельномстолбцесточностью до месяцаподсчитать возраст животных вновойтаблице
CREATE young TABLE animals AS 
SELECT *, 'Лошади' as type FROM horses
UNION SELECT *, 'Ослы' AS type FROM donkeys
UNION SELECT *, 'Собаки' AS type FROM dogs
UNION SELECT *, 'Кошки' AS type FROM cats
UNION SELECT *, 'Хомяки' AS type FROM hamsters;

CREATE TABLE youngAnimals AS
SELECT name, dateBirth, command, type, TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS age
FROM animals WHERE dateBirth BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
SELECT * FROM youngAnimals;

-- Объединить все таблицы водну, приэтомсохраняяполя, указывающиена прошлуюпринадлежностькстарымтаблицам.

SELECT c.name, c.dateBirth, c.command, p.name, y.age 
FROM cats c
LEFT JOIN youngAnimals y ON y.name = c.name
LEFT JOIN packAnimal p ON p.Id = c.id
UNION 
SELECT d.name, d.dateBirth, d.command, p.name, y.age 
FROM dogs d
LEFT JOIN youngAnimals y ON y.name = d.name
LEFT JOIN packAnimal p ON p.Id = d.id
UNION 
SELECT h.name, h.dateBirth, h.command, p.name, y.age 
FROM hamsters h
LEFT JOIN youngAnimals y ON y.name = h.name
LEFT JOIN packAnimal p ON p.Id = h.id
UNION 
SELECT h.name, h.dateBirth, h.command, p.name, y.age 
FROM horses h
LEFT JOIN youngAnimals y ON y.name = h.name
LEFT JOIN packAnimal p ON p.Id = h.id
UNION 
SELECT d.name, d.dateBirth, d.command, p.name, y.age 
FROM donkeys d
LEFT JOIN youngAnimals y ON y.name = d.name
LEFT JOIN packAnimal p ON p.Id = d.id;