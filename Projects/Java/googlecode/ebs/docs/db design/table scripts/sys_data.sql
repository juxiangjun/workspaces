/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/8/2010 3:42:45 PM                         */
/*==============================================================*/


drop table if exists sys_city;

drop table if exists sys_country;

drop table if exists sys_currency;

drop table if exists sys_currency_exchange;

drop table if exists sys_help;

drop table if exists sys_menu;

drop table if exists sys_model;

drop table if exists sys_object;

drop table if exists sys_object_property;

drop table if exists sys_object_related;

drop table if exists sys_province;

drop table if exists sys_view;


/*==============================================================*/
/* Table: sys_city                                              */
/*==============================================================*/
create table sys_city
(
   id                   varchar(36) not null,
   code                 varchar(8),
   short_name           varchar(32),
   postal_code          char(10),
   province_id          varchar(36),
   province_code        varchar(8),
   province_name        varchar(32),
   country_id           varchar(36),
   country_code         varchar(50),
   country_name         varchar(50),
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
/* Table: sys_country                                           */
/*==============================================================*/
create table sys_country
(
   id                   varchar(36) not null,
   code                 varchar(50) not null,
   short_name           varchar(32),
   full_name            varchar(100),
   iso_code             varchar(8),
   label_code           varchar(8),
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
/* Table: sys_currency                                          */
/*==============================================================*/
create table sys_currency
(
   id                   varchar(36) not null,
   code                 varchar(10),
   name                 varchar(100),
   country_id           varchar(36) not null,
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
/* Table: sys_currency_exchange                                 */
/*==============================================================*/
create table sys_currency_exchange
(
   id                   varchar(36) not null,
   publish_date         varchar(20),
   main_currency_id     varchar(36),
   target_currency_id   varchar(36),
   exchange_rate        decimal(18,4),
   buying_rate          decimal(18,4),
   cash_buying_rate     decimal(18,4),
   selling_rate         decimal(18,4),
   middle_rate          decimal(18,4),
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
/* Table: sys_help                                              */
/*==============================================================*/
create table sys_help
(
   id                   varchar(36) not null,
   action_id            varchar(36),
   action_code          varchar(50),
   action_name          varchar(50),
   namespace            varchar(50),
   field_name           varchar(50),
   help_info            text,
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
/* Table: sys_menu                                              */
/*==============================================================*/
create table sys_menu
(
   id                   varchar(36) not null,
   code                 varchar(50) not null,
   name                 varchar(100),
   parent_id            varchar(36),
   parent_code          varchar(36),
   parent_name          varchar(50),
   model_id             varchar(36),
   model_name           varchar(20),
   img_file             varchar(50),
   panel                varchar(100),
   leaf                 tinyint(4) not null,
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
/* Table: sys_model                                             */
/*==============================================================*/
create table sys_model
(
   id                   varchar(36) not null,
   code                 char(10) not null,
   model_name           varchar(100),
   list_price           decimal(18,4),
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
/* Table: sys_object                                            */
/*==============================================================*/
create table sys_object
(
   id                   varchar(36) not null,
   code                 varchar(30),
   short_name           varchar(100),
   form_name            varchar(50),
   action_namespace     varchar(50),
   action_name          varchar(50),
   form_theme           varchar(50),
   form_method          varchar(50) not null,
   form_validation      varchar(50) not null,
   form_targets         varchar(50),
   form_js              text,
   obj_name_property    varchar(50),
   is_system_object     tinyint(4),
   app_model_id         varchar(36),
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
/* Table: sys_object_property                                   */
/*==============================================================*/
create table sys_object_property
(
   id                   varchar(36) not null,
   group_id             smallint(6),
   group_name           varchar(20),
   sequence             smallint(6),
   form_field_id        varchar(50),
   form_field_code      varchar(50),
   field_hint           varchar(200),
   field_input_type     varchar(20),
   form_css_style       varchar(100),
   on_focus             varchar(50),
   on_change            varchar(50),
   list_name            varchar(50),
   list_key             varchar(50),
   list_value           varchar(50),
   required             tinyint(4) not null,
   readonly             tinyint(4) not null,
   field_name           varchar(50),
   data_type            varchar(20),
   min_value            smallint(6),
   max_value            smallint(6),
   rows                 smallint(6) not null,
   cols                 smallint(6) not null,
   line                 tinyint(4) not null,
   visible              tinyint(4) not null,
   super_obj_name       varchar(50),
   property_name        varchar(50),
   is_view_link         tinyint(4),
   is_view_item         tinyint(4),
   is_lookup_field      tinyint(4),
   is_home_item         tinyint(4),
   redirect_link        varchar(100),
   param_name           varchar(50),
   param_value_property_name varchar(50),
   lookup_script        text,
   sys_object_id        varchar(36),
   sys_object_name      varchar(100),
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
/* Table: sys_object_related                                    */
/*==============================================================*/
create table sys_object_related
(
   id                   varchar(36) not null,
   sys_object_id        varchar(36),
   sys_object_code      varchar(50),
   sys_object_name      varchar(50),
   sequence             smallint(6),
   related_object_id    varchar(36),
   related_object_code  varchar(50),
   related_object_name  varchar(50),
   related_namespace    varchar(50),
   related_property_name varchar(100),
   order_by             varchar(50),
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
/* Table: sys_province                                          */
/*==============================================================*/
create table sys_province
(
   id                   varchar(36) not null,
   code                 varchar(8) not null,
   short_name           varchar(8) not null,
   full_name            varchar(50),
   country_id           varchar(36),
   country_code         varchar(8),
   country_short_name   varchar(8),
   label_code           varchar(8),
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
/* Table: sys_view                                              */
/*==============================================================*/
create table sys_view
(
   id                   varchar(36) not null,
   view_code            varchar(50),
   view_name            varchar(100),
   view_comment         text,
   view_script          text,
   sys_object_id        varchar(36),
   sys_object_code      varchar(50),
   sys_object_short_name varchar(50),
   is_default           tinyint(4),
   owner_id             varchar(50),
   owner_code           varchar(50),
   owner_full_name      varchar(100),
   combine_type         varchar(100),
   limited              tinyint(4),
   shared               tinyint(4),
   hql                  text,
   position             tinyint(4),
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
