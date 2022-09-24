CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" integer,
  "rol_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar(400) NOT NULL,
  "level" varchar DEFAULT 'principiantes',
  "teacher_id" uuid NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "course_id" uuid NOT null,
  "percent_complete" integer,
  "course_review" varchar 
);

CREATE TABLE "users_courses_videos" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "course_video_id" uuid NOT null,
  "percent_complete" integer,
  "course_review" varchar 
);

CREATE TABLE "courses_categories" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid NOT NULL,
  "categorie_id" uuid NOT NULL
);

CREATE TABLE "courses_videos_categories" (
  "id" uuid PRIMARY KEY,
  "course_video_id" uuid NOT NULL,
  "categorie_id" uuid NOT NULL
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "users_courses_videos" ADD FOREIGN KEY ("course_video_id") REFERENCES "courses_videos" ("id");

ALTER TABLE "users_courses_videos" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_videos_categories" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_videos_categories" ADD FOREIGN KEY ("course_video_id") REFERENCES "courses_videos" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");


/* llenado de las tablas independientes*/
insert into teachers 
(id,name) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b22',
 'jesus'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b23',
 'benjamin'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b24',
 'said'
);

insert into categories 
(id,name) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b32',
 'programacion'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b33',
 'base de datos'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b34',
 'redes y telecomunicaciones'
);

insert into roles 
(id,name) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b42',
 'estudiante'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b43',
 'profesor'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b44',
 'admin'
);

insert into courses_videos 
(id,title,url) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b52',
 'diseño de base de datos',
 'url1'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b53',
 'queries a una BD',
 'url2'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b54',
 'python',
 'url3'
);
/* llenado de las tablas dependientes*/
insert into users 
(id,name,email,password,age,rol_id) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b12',
 'berselis',
 'berse@academlo.com',
 'berselis123',
 25,
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b42'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b13',
 'angeles',
 'angeles@academlo.com',
 'angeles123',
 21,
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b42'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b14',
 'gilmar',
 'gilmar@academlo.com',
 'gilmar123',
 29,
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b42'
);


update users set rol_id='0e7283bb-b34d-48dc-9b0c-f9d75db35b42'  where id='0e7283bb-b34d-48dc-9b0c-f9d75db35b14';
insert into courses 
(id,title,description,level,teacher_id) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b62',
 'react  js',
 'aprenderas temas como routes, hooks, componentes',
 'medios',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b23'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b63',
 'fundamentos del desarrollo web',
 'aprenderas lo conceptos basico de HTML, CSS JS',
 'principiantes',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b22'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b64',
 'node js',
 'aprenderas lo que es base de datos, diagramas de BD, relacionar BD y realizaras APIs',
 'avanzados',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b24'
);

/* llenado de las tablas pivot*/
insert into courses_categories
(id,course_id,categorie_id) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b72',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b62',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b32'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b73',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b63',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b32'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b74',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b64',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b32'
);

insert into courses_videos_categories
(id,course_video_id,categorie_id) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b82',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b52',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b33'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b83',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b53',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b33'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b84',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b52',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b32'
);

insert into users_courses
(id,user_id,course_id,percent_complete,course_review) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b92',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b12',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b64',
 10,
 'los temas son interesantes'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b93',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b13',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b64',
  30,
  'es nuevo para mi y me esta chocando'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b94',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b14',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b64',
  50,
  'excelente curso'
);

insert into users_courses_videos
(id,user_id,course_video_id,percent_complete,course_review) 
values
('0e7283bb-b34d-48dc-9b0c-f9d75db35b92',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b12',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b52',
  40,
  'curso full practica'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b93',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b12',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b53',
  80,
 'me esta gustando el curso'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b94',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b13',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b53',
  90,
 'estoy con dificultades pero ahi vamos'
),
('0e7283bb-b34d-48dc-9b0c-f9d75db35b95',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b14',
 '0e7283bb-b34d-48dc-9b0c-f9d75db35b52',
  40,
 'el curso esta interesante'
);


/* consutla join*/
select * from courses inner join teachers on courses.teacher_id = teachers.id;

select * from users_courses inner join courses 
on users_courses.course_id=courses.id 
inner join users on users_courses.user_id = users.id;

select users.name,roles.name as rol,courses.title as curso ,courses.level,categories.name as categoria_del_curso,
teachers.name as profesor ,users_courses.percent_complete,
users_courses.course_review from users inner join roles on users.rol_id = roles.id 
inner join users_courses on users.id = users_courses.user_id
inner join courses on users_courses.course_id = courses.id 
inner join teachers on courses.teacher_id = teachers.id 
inner join courses_categories on courses.id = courses_categories.course_id 
inner join categories on courses_categories.categorie_id = categories.id;
