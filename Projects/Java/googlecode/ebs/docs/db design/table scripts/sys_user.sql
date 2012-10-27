/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/8/2010 3:41:32 PM                         */
/*==============================================================*/


drop table if exists app_param;

drop table if exists app_user_param;

drop table if exists sys_group;

drop table if exists sys_group_menu;

drop table if exists sys_group_user;

drop table if exists sys_user;

drop table if exists sys_view_detail;


/*==============================================================*/
/* Table: app_param                                             */
/*==============================================================*/
create table app_param
(
   id                   varchar(36) not null,
   param_category       varchar(100),
   param_name           varchar(100),
   param_value          varchar(100),
   sequence             smallint(6),
   status               tinyint(4),
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
/* Table: app_user_param                                        */
/*==============================================================*/
create table app_user_param
(
   id                   varchar(36) not null,
   sys_user_id          varchar(36),
   sys_user_name        varchar(50),
   param_category       varchar(100),
   param_name           varchar(50),
   param_value          varchar(50),
   sequence             smallint(6),
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
/* Table: sys_group                                             */
/*==============================================================*/
create table sys_group
(
   id                   varchar(36) not null,
   name                 varchar(50),
   status               char(10),
   start_date           varchar(22),
   end_date             varchar(22),
   is_admin             tinyint,
   company_model_id     varchar(36),
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
/* Table: sys_group_menu                                        */
/*==============================================================*/
create table sys_group_menu
(
   id                   varchar(36) not null,
   sys_menu_id          varchar(36),
   sys_menu_code        varchar(50),
   sys_menu_label       varchar(100),
   sys_group_id         varchar(36),
   sys_group_name       varchar(100),
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
/* Table: sys_group_user                                        */
/*==============================================================*/
create table sys_group_user
(
   id                   varchar(36) not null,
   sys_group_id         varchar(36),
   sys_group_name       varchar(50),
   org_employee_id      varchar(36),
   org_employee_name    varchar(50),
   start_date           varchar(10),
   end_date             varchar(10),
   status               char(10),
   is_default           tinyint(4),
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
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   id                   varchar(36) not null,
   login_name           varchar(50),
   password             varchar(50),
   user_name            varchar(50),
   employee_id          varchar(36),
   employee_code        varchar(50),
   employee_full_name   varchar(50),
   status               varchar(50),
   login_times          int(11),
   org_company_id       varchar(36),
   org_company_code     varchar(50),
   org_company_name     varchar(100),
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
/* Table: sys_view_detail                                       */
/*==============================================================*/
create table sys_view_detail
(
   id                   varchar(36) not null,
   sys_view_id          varchar(36) not null,
   sys_view_code        varchar(50),
   sys_view_name        varchar(100),
   sys_object_property_code varchar(50),
   sys_object_property_name varchar(50),
   sys_operator_code    varchar(50),
   sys_operator_name    varchar(50),
   input_type           varchar(100),
   data_type            varchar(50),
   value_range          varchar(50),
   sys_view_value_list  varchar(50),
   sys_view_value_name  varchar(200),
   sys_view_value_1     varchar(200),
   sys_view_value_2     varchar(200),
   parent_object_id     varchar(50),
   parent_object_name   varchar(50),
   parent_object_property varchar(50),
   sequence             smallint(6),
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
