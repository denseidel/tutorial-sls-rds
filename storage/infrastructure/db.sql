create database if not exists tenant_management;
create table tenant_management.tenants (
  tenantId varchar(36) primary key,
  tenantName varchar(255),
  plan varchar(255),
  userId varchar(255),
  userRole varchar(255),
  createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) create table tenant_management.users (userId nicht_notwendig_da_users_im_iam)