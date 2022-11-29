DROP TABLE if exists projects.step;
DROP TABLE if exists projects.material;
DROP TABLE if exists projects.project_category;
DROP TABLE if exists projects.project;
DROP TABLE if exists projects.category;

CREATE TABLE projects.category (
  category_id INT NOT NULL,
  category_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (category_id)
  );


CREATE TABLE projects.project (
  project_id INT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7,2) NULL,
  actual_hours DECIMAL(7,2) NULL,
  difficulty INT NULL,
  notes TEXT NULL,
  PRIMARY KEY (project_id)
  );


CREATE TABLE projects.project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  primary key(project_id, category_id),
  foreign key(project_id) references project(project_id),
  foreign key(category_id) references category(category_id)
  );


CREATE TABLE projects.material (
  material_id INT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT NULL,
  cost DECIMAL(7,2) NULL,
  PRIMARY KEY (material_id),
  foreign key(project_id) references project(project_id)
  );


CREATE TABLE projects.step (
  step_id INT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  foreign key(project_id) references project(project_id)
  );