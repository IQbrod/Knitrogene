use knitrogene;
create table Material (
  id long NOT NULL auto_increment,
  name varchar(50),
  constraint material_pk primary key (id)
);

create table Yarn (
  id long NOT NULL auto_increment,
  name varchar(50),
  constraint yarn_pk primary key (id)
);

create table IsComposedOfMaterial (
  yarn_id long NOT NULL,
  material_id long NOT NULL,
  percentage long,
  constraint iscomposedofmaterial_pk primary key (yarn_id, material_id),
  constraint yarn_fk foreign key (yarn_id) references Yarn(id),
  constraint material_fk foreign key (material_id) references Material(id)
);

create table YarnSize (
  id long NOT NULL auto_increment,
  name varchar(50),
  stitches_per_10_min int,
  stitches_per_10_max int,
  constraint yarnsize_pk primary key (id)
);

create table Color (
  id long NOT NULL auto_increment,
  name varchar(50),
  base_color varchar(20),
  constraint color_pk primary key (id)
);

create table Wool (
  id long NOT NULL auto_increment,
  yarn_id long NOT NULL,
  yarnsize_id long NOT NULL,
  color_id long NOT NULL,
  constraint wool_pk primary key (id),
  constraint wool_un unique (yarn_id, yarnsize_id, color_id),
  constraint yarn_fk foreign key (yarn_id) references Yarn(id),
  constraint yarnsize_fk foreign key (yarnsize_id) references YarnSize(id),
  constraint color_fk foreign key (color_id) references Color(id)
);

create table Stitch (
  id long NOT NULL auto_increment,
  name varchar(50),
  constraint stitch_pk primary key (id)
);

create table Lace (
  id long NOT NULL auto_increment,
  name varchar(50),
  constraint lace_pk primary key (id)
);

create table Scheme (
  id long NOT NULL auto_increment,
  name varchar(50),
  wool_map varchar(10000), # Up to 100x100
  stitch_map varchar(10000), # Up to 100x100
  lace_map varchar(10000),
  constraint scheme_pk primary key (id)
);

create table IsDesignedWithWool (
  scheme_id long NOT NULL,
  wool_id long NOT NULL,
  constraint isdesignedwithwool_pk primary key (scheme_id, wool_id),
  constraint scheme_fk foreign key (scheme_id) references Scheme(id),
  constraint wool_fk foreign key (wool_id) references Wool(id)
);

create table IsDesignedWithStitch (
  scheme_id long NOT NULL,
  stitch_id long NOT NULL,
  constraint isdesignedwithstitch_pk primary key (scheme_id, stitch_id),
  constraint scheme_fk foreign key (scheme_id) references Scheme(id),
  constraint stitch_fk foreign key (stitch_id) references Stitch(id)
);

create table IsDesignedWithLace (
  scheme_id long NOT NULL,
  lace_id long NOT NULL,
  constraint isdesignedwithlace_pk primary key (scheme_id, lace_id),
  constraint scheme_fk foreign key (scheme_id) references Scheme(id),
  constraint lace_fk foreign key (lace_id) references Lace(id)
);