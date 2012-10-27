/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/8/2010 3:40:21 PM                         */
/*==============================================================*/


drop table if exists address;

drop table if exists model_transaction;

drop table if exists org_bank;

drop table if exists org_company;

drop table if exists org_company_address;

drop table if exists org_company_model;

drop table if exists org_department;

drop table if exists org_employee;

drop table if exists org_employee_department;

drop table if exists org_employee_occupation;

drop table if exists org_employee_position;

drop table if exists org_occupation;

drop table if exists org_person;

drop table if exists org_position;

drop table if exists sys_registration;


/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   id                   varchar(36) not null,
   address_line         varchar(200),
   postal_code          varchar(8),
   sys_city_id          varchar(36),
   sys_city_code        varchar(8),
   sys_city_name        varchar(32),
   sys_province_id      varchar(36),
   sys_province_code    varchar(8),
   sys_province_name    varchar(32),
   sys_country_id       varchar(36),
   sys_country_code     varchar(8),
   sys_country_name     varchar(32),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: model_transaction                                     */
/*==============================================================*/
create table model_transaction
(
   id                   varchar(36) not null,
   app_model_id         varchar(36),
   company_id           varchar(36),
   bought_date          varchar(20),
   qty                  int,
   unit_price           decimal(18,4),
   sub_total            decimal(18.4),
   discount             decimal(18,4),
   actually_paid        decimal(18,4),
   comments             varchar(200),
   trans_status         varchar(1),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_bank                                              */
/*==============================================================*/
create table org_bank
(
   id                   varchar(36) not null,
   org_company_id       varchar(36),
   org_company_code     varchar(100),
   org_company_name     varchar(100),
   principal            varchar(100),
   bank_name            varchar(100),
   bank_code            varchar(50),
   bank_account         varchar(100),
   bank_date            timestamp,
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_company                                           */
/*==============================================================*/
create table org_company
(
   id                   varchar(36) not null,
   code                 varchar(12),
   short_name           varchar(50) not null,
   full_name            varchar(100),
   fax                  varchar(21),
   email                varchar(21),
   phone                varchar(21),
   website              varchar(100),
   principal            varchar(16),
   head_count           int(11),
   sale_item            text,
   comment              text,
   sys_registration_id  varchar(36),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_company_address                                   */
/*==============================================================*/
create table org_company_address
(
   id                   varchar(36) not null,
   org_company_id       varchar(36),
   org_company_name     varchar(50),
   address_id           varchar(36),
   address_type         tinyint,
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_company_model                                     */
/*==============================================================*/
create table org_company_model
(
   id                   varchar(36) not null,
   model_id             varchar(36),
   company_id           varchar(36),
   type                 varchar(1),
   start_date           varchar(24),
   end_date             varchar(24),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_department                                        */
/*==============================================================*/
create table org_department
(
   id                   varchar(36) not null,
   code                 varchar(50),
   name                 varchar(100),
   org_company_id       varchar(36),
   org_company_name     varchar(50),
   function_type        varchar(50),
   start_date           varchar(24),
   end_date             varchar(24),
   comments             text,
   parent_id            varchar(36),
   parent_code          varchar(20),
   parent_name          varchar(100),
   location             varchar(20),
   leader_name          varchar(60),
   is_leaf              tinyint(4),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_employee                                          */
/*==============================================================*/
create table org_employee
(
   id                   varchar(36) not null,
   code                 varchar(50),
   person_id            varchar(36),
   full_name            varchar(50),
   email                varchar(100),
   job_title            varchar(100),
   grade                char(10),
   hire_date            varchar(20),
   resignation_date     varchar(20),
   org_company_id       varchar(36),
   org_company_name     varchar(100),
   status               char(10),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_employee_department                               */
/*==============================================================*/
create table org_employee_department
(
   id                   varchar(36) not null,
   org_employee_id      varchar(36),
   org_employee_code    varchar(20),
   org_employee_full_name varchar(50),
   org_department_id    varchar(36),
   org_department_code  varchar(20),
   org_department_name  varchar(100),
   org_department_property varchar(50),
   org_position_id      varchar(36),
   org_position_code    varchar(20),
   org_position_name    varchar(100),
   start_date           varchar(24),
   end_date             varchar(24),
   is_default           tinyint(4),
   is_default_name      varchar(10),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_employee_occupation                               */
/*==============================================================*/
create table org_employee_occupation
(
   id                   varchar(36) not null,
   org_employee_id      varchar(36),
   org_employee_name    varchar(50),
   org_occupation_id    varchar(36),
   org_occupation_name  varchar(50),
   start_date           varchar(24),
   end_date             varchar(24),
   status               char(10),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_employee_position                                 */
/*==============================================================*/
create table org_employee_position
(
   id                   varchar(36) not null,
   org_employee_id      varchar(36),
   org_employee_name    varchar(50),
   org_position_id      varchar(36),
   org_position_name    varchar(50),
   start_date           varchar(24),
   end_date             varchar(24),
   status               char(10),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_occupation                                        */
/*==============================================================*/
create table org_occupation
(
   id                   varchar(36) not null,
   code                 varchar(50),
   name                 varchar(50),
   org_company_id       varchar(36),
   org_company_name     varchar(50),
   status               char(10),
   start_date           varchar(24),
   end_date             varchar(24),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_person                                            */
/*==============================================================*/
create table org_person
(
   id                   varchar(36) not null,
   identity_number      varchar(50),
   first_name           varchar(50),
   last_name            varchar(50),
   gender               varchar(50),
   born_date            varchar(20),
   edu_level            tinyint(4),
   email                varchar(100),
   skype                varchar(20),
   msn                  varchar(100),
   qq                   varchar(50),
   mobile_phone         varchar(20),
   address_id           varchar(36),
   address_line         varchar(100),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: org_position                                          */
/*==============================================================*/
create table org_position
(
   id                   varchar(36) not null,
   code                 varchar(50),
   name                 varchar(100),
   org_company_id       varchar(36),
   org_company_name     varchar(100),
   position_level_id    char(10),
   position_level_name  varchar(20),
   comments             varchar(100),
   start_date           varchar(24),
   end_date             varchar(24),
   status               char(10),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: sys_registration                                      */
/*==============================================================*/
create table sys_registration
(
   id                   varchar(36) not null,
   email		varchar(128),
   first_name           varchar(32),
   last_name            varchar(32),
   title                varchar(20),
   company              varchar(100),
   industry             varchar(30),
   ip                   varchar(36),
   status		tinyint(4) default 0,
   applying_date        varchar(24),
   created_date         varchar(24),
   created_by           varchar(50),
   last_viewed_date     varchar(24),
   last_viewed_by       varchar(50),
   last_updated_date    varchar(24),
   last_updated_by      varchar(50),
   deleted_date         varchar(24),
   deleted_by           varchar(50),
   curr_viewed_date     varchar(24),
   curr_viewed_by       varchar(50),
   deleted_flag         tinyint(4) default 0,
   primary key (id)
);
