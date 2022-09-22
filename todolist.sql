CREATE TABLE "todos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar,
  "is_complete" bool DEFAULT true
);

insert into todos 
(
 	id,
 	title,
	description,
	is_complete
)
values 

 (
   'f4648514-707c-4857-bf40-043334e7a790',
'Tarea1',
'Descripcion tarea1',
false), (
   '4623916c-baf5-49ed-a535-1cc80997d81a',
'Tarea2',
'Descripcion tarea2',
false),
(
   '48bba66c-69f4-48d9-9825-bc21453e29b5',
'Tarea3',
'Descripcion tarea3',
false),
(
   '2bb761d8-d66a-4bdd-8cde-d43399785d9d',
'Tarea4',
'Descripcion tarea4',
true),
(
   '8b9f5b9f-2746-4558-820d-cbe504fb14ce',
'Tarea5',
'Descripcion tarea5',
true);

select * from todos;

select * from todos where is_complete = true;

