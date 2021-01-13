﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "AspNetRoles" (
    id text NOT NULL,
    name character varying(256) NULL,
    normalizedname character varying(256) NULL,
    concurrencystamp text NULL,
    clientid text NULL,
    description text NULL,
    isadmin boolean NOT NULL,
    issuperadmin boolean NOT NULL,
    createdby text NULL,
    createdat timestamp without time zone NOT NULL,
    lastupdatedby text NULL,
    lastupdatedat timestamp without time zone NOT NULL,
    "IsDeleted" boolean NOT NULL,
    CONSTRAINT pk_roles PRIMARY KEY (id)
);

CREATE TABLE "AspNetUsers" (
    id text NOT NULL,
    username character varying(256) NULL,
    normalizedusername character varying(256) NULL,
    email character varying(256) NULL,
    normalizedemail character varying(256) NULL,
    emailconfirmed boolean NOT NULL,
    passwordhash text NULL,
    securitystamp text NULL,
    concurrencystamp text NULL,
    phonenumber text NULL,
    phonenumberconfirmed boolean NOT NULL,
    twofactorenabled boolean NOT NULL,
    lockoutend timestamp with time zone NULL,
    lockoutenabled boolean NOT NULL,
    accessfailedcount integer NOT NULL,
    jobno text NULL,
    firstname text NULL,
    lastname text NULL,
    gender integer NOT NULL,
    position text NULL,
    idcard text NULL,
    idcardfaceimg text NULL,
    idcardbackimg text NULL,
    homeaddress text NULL,
    lastip text NULL,
    lastloginat timestamp without time zone NOT NULL,
    isactive boolean NOT NULL,
    createdby text NULL,
    createdat timestamp without time zone NOT NULL,
    lastupdatedby text NULL,
    lastupdatedat timestamp without time zone NOT NULL,
    "IsDeleted" boolean NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE organizations (
    id text NOT NULL,
    name text NULL,
    "desc" text NULL,
    enabled boolean NOT NULL,
    mobile text NULL,
    address text NULL,
    parentid text NULL,
    createdby text NULL,
    createdat timestamp without time zone NOT NULL,
    lastupdatedby text NULL,
    lastupdatedat timestamp without time zone NOT NULL,
    "IsDeleted" boolean NOT NULL,
    CONSTRAINT pk_organizations PRIMARY KEY (id),
    CONSTRAINT fk_organizations_organizations_parentid FOREIGN KEY (parentid) REFERENCES organizations (id) ON DELETE RESTRICT
);

CREATE TABLE permissions (
    id text NOT NULL,
    key text NULL,
    name text NULL,
    description text NULL,
    enabled boolean NOT NULL,
    clientid text NULL,
    type integer NOT NULL,
    parentid text NULL,
    url text NULL,
    icon text NULL,
    "order" integer NOT NULL,
    level integer NOT NULL,
    createdby text NULL,
    createdat timestamp without time zone NOT NULL,
    lastupdatedby text NULL,
    lastupdatedat timestamp without time zone NOT NULL,
    "IsDeleted" boolean NOT NULL,
    CONSTRAINT pk_permissions PRIMARY KEY (id),
    CONSTRAINT fk_permissions_permissions_parentid FOREIGN KEY (parentid) REFERENCES permissions (id) ON DELETE RESTRICT
);

CREATE TABLE sysinfo (
    id text NOT NULL,
    isjobnounique boolean NOT NULL,
    isuserphoneunique boolean NOT NULL,
    isphonepwdloginenabled boolean NOT NULL,
    isjobnopwdloginenabled boolean NOT NULL,
    isregisteruserenabled boolean NOT NULL,
    createdby text NULL,
    createdat timestamp without time zone NOT NULL,
    lastupdatedby text NULL,
    lastupdatedat timestamp without time zone NOT NULL,
    CONSTRAINT pk_sysinfo PRIMARY KEY (id)
);

CREATE TABLE "AspNetRoleClaims" (
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    roleid text NOT NULL,
    claimtype text NULL,
    claimvalue text NULL,
    CONSTRAINT pk_roleclaims PRIMARY KEY (id),
    CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_roleid" FOREIGN KEY (roleid) REFERENCES "AspNetRoles" (id) ON DELETE CASCADE
);

CREATE TABLE "AspNetUserClaims" (
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    userid text NOT NULL,
    claimtype text NULL,
    claimvalue text NULL,
    CONSTRAINT pk_userclaims PRIMARY KEY (id),
    CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_userid" FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE TABLE "AspNetUserLogins" (
    loginprovider text NOT NULL,
    providerkey text NOT NULL,
    providerdisplayname text NULL,
    userid text NOT NULL,
    CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY (loginprovider, providerkey),
    CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_userid" FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE TABLE "AspNetUserRoles" (
    userid text NOT NULL,
    roleid text NOT NULL,
    CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY (userid, roleid),
    CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_roleid" FOREIGN KEY (roleid) REFERENCES "AspNetRoles" (id) ON DELETE CASCADE,
    CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_userid" FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE TABLE "AspNetUserTokens" (
    userid text NOT NULL,
    loginprovider text NOT NULL,
    name text NOT NULL,
    value text NULL,
    CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY (userid, loginprovider, name),
    CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_userid" FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE TABLE organizationrole (
    roleid text NOT NULL,
    organizationid text NOT NULL,
    CONSTRAINT "PK_organizationrole" PRIMARY KEY (roleid, organizationid),
    CONSTRAINT fk_organizationrole_organizations_organizationid FOREIGN KEY (organizationid) REFERENCES organizations (id) ON DELETE CASCADE,
    CONSTRAINT fk_organizationrole_roles_roleid FOREIGN KEY (roleid) REFERENCES "AspNetRoles" (id) ON DELETE CASCADE
);

CREATE TABLE userorganization (
    userid text NOT NULL,
    organizationid text NOT NULL,
    ischarger boolean NOT NULL,
    CONSTRAINT "PK_userorganization" PRIMARY KEY (userid, organizationid),
    CONSTRAINT fk_userorganization_organizations_organizationid FOREIGN KEY (organizationid) REFERENCES organizations (id) ON DELETE CASCADE,
    CONSTRAINT fk_userorganization_users_userid FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE TABLE rolepermission (
    roleid text NOT NULL,
    permissionid text NOT NULL,
    CONSTRAINT "PK_rolepermission" PRIMARY KEY (roleid, permissionid),
    CONSTRAINT fk_rolepermission_permissions_permissionid FOREIGN KEY (permissionid) REFERENCES permissions (id) ON DELETE CASCADE,
    CONSTRAINT fk_rolepermission_roles_roleid FOREIGN KEY (roleid) REFERENCES "AspNetRoles" (id) ON DELETE CASCADE
);

CREATE TABLE userpermission (
    userid text NOT NULL,
    permissionid text NOT NULL,
    permissionroleids text[] NULL,
    action integer NOT NULL,
    CONSTRAINT "PK_userpermission" PRIMARY KEY (userid, permissionid),
    CONSTRAINT fk_userpermission_permissions_permissionid FOREIGN KEY (permissionid) REFERENCES permissions (id) ON DELETE CASCADE,
    CONSTRAINT fk_userpermission_users_userid FOREIGN KEY (userid) REFERENCES "AspNetUsers" (id) ON DELETE CASCADE
);

CREATE INDEX "IX_AspNetRoleClaims_roleid" ON "AspNetRoleClaims" (roleid);

CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" (normalizedname);

CREATE INDEX "IX_AspNetUserClaims_userid" ON "AspNetUserClaims" (userid);

CREATE INDEX "IX_AspNetUserLogins_userid" ON "AspNetUserLogins" (userid);

CREATE INDEX "IX_AspNetUserRoles_roleid" ON "AspNetUserRoles" (roleid);

CREATE INDEX "IX_AspNetUsers_jobno" ON "AspNetUsers" (jobno);

CREATE INDEX "EmailIndex" ON "AspNetUsers" (normalizedemail);

CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" (normalizedusername);

CREATE INDEX ix_organizationrole_organizationid ON organizationrole (organizationid);

CREATE INDEX "IX_organizations_parentid" ON organizations (parentid);

CREATE INDEX "IX_permissions_parentid" ON permissions (parentid);

CREATE INDEX ix_rolepermission_permissionid ON rolepermission (permissionid);

CREATE INDEX ix_userorganization_organizationid ON userorganization (organizationid);

CREATE INDEX ix_userpermission_permissionid ON userpermission (permissionid);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20210113074739_Init', '3.1.10');

-- 

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "ApiResources" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Enabled" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "DisplayName" character varying(200) NULL,
    "Description" character varying(1000) NULL,
    "AllowedAccessTokenSigningAlgorithms" character varying(100) NULL,
    "ShowInDiscoveryDocument" boolean NOT NULL,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone NULL,
    "LastAccessed" timestamp without time zone NULL,
    "NonEditable" boolean NOT NULL,
    CONSTRAINT "PK_ApiResources" PRIMARY KEY ("Id")
);

CREATE TABLE "ApiScopes" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Enabled" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "DisplayName" character varying(200) NULL,
    "Description" character varying(1000) NULL,
    "Required" boolean NOT NULL,
    "Emphasize" boolean NOT NULL,
    "ShowInDiscoveryDocument" boolean NOT NULL,
    CONSTRAINT "PK_ApiScopes" PRIMARY KEY ("Id")
);

CREATE TABLE "Clients" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Enabled" boolean NOT NULL,
    "ClientId" character varying(200) NOT NULL,
    "ProtocolType" character varying(200) NOT NULL,
    "RequireClientSecret" boolean NOT NULL,
    "ClientName" character varying(200) NULL,
    "Description" character varying(1000) NULL,
    "ClientUri" character varying(2000) NULL,
    "LogoUri" character varying(2000) NULL,
    "RequireConsent" boolean NOT NULL,
    "AllowRememberConsent" boolean NOT NULL,
    "AlwaysIncludeUserClaimsInIdToken" boolean NOT NULL,
    "RequirePkce" boolean NOT NULL,
    "AllowPlainTextPkce" boolean NOT NULL,
    "RequireRequestObject" boolean NOT NULL,
    "AllowAccessTokensViaBrowser" boolean NOT NULL,
    "FrontChannelLogoutUri" character varying(2000) NULL,
    "FrontChannelLogoutSessionRequired" boolean NOT NULL,
    "BackChannelLogoutUri" character varying(2000) NULL,
    "BackChannelLogoutSessionRequired" boolean NOT NULL,
    "AllowOfflineAccess" boolean NOT NULL,
    "IdentityTokenLifetime" integer NOT NULL,
    "AllowedIdentityTokenSigningAlgorithms" character varying(100) NULL,
    "AccessTokenLifetime" integer NOT NULL,
    "AuthorizationCodeLifetime" integer NOT NULL,
    "ConsentLifetime" integer NULL,
    "AbsoluteRefreshTokenLifetime" integer NOT NULL,
    "SlidingRefreshTokenLifetime" integer NOT NULL,
    "RefreshTokenUsage" integer NOT NULL,
    "UpdateAccessTokenClaimsOnRefresh" boolean NOT NULL,
    "RefreshTokenExpiration" integer NOT NULL,
    "AccessTokenType" integer NOT NULL,
    "EnableLocalLogin" boolean NOT NULL,
    "IncludeJwtId" boolean NOT NULL,
    "AlwaysSendClientClaims" boolean NOT NULL,
    "ClientClaimsPrefix" character varying(200) NULL,
    "PairWiseSubjectSalt" character varying(200) NULL,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone NULL,
    "LastAccessed" timestamp without time zone NULL,
    "UserSsoLifetime" integer NULL,
    "UserCodeType" character varying(100) NULL,
    "DeviceCodeLifetime" integer NOT NULL,
    "NonEditable" boolean NOT NULL,
    CONSTRAINT "PK_Clients" PRIMARY KEY ("Id")
);

CREATE TABLE "IdentityResources" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Enabled" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "DisplayName" character varying(200) NULL,
    "Description" character varying(1000) NULL,
    "Required" boolean NOT NULL,
    "Emphasize" boolean NOT NULL,
    "ShowInDiscoveryDocument" boolean NOT NULL,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone NULL,
    "NonEditable" boolean NOT NULL,
    CONSTRAINT "PK_IdentityResources" PRIMARY KEY ("Id")
);

CREATE TABLE "ApiResourceClaims" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Type" character varying(200) NOT NULL,
    "ApiResourceId" integer NOT NULL,
    CONSTRAINT "PK_ApiResourceClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiResourceClaims_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ApiResourceProperties" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "ApiResourceId" integer NOT NULL,
    CONSTRAINT "PK_ApiResourceProperties" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiResourceProperties_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ApiResourceScopes" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Scope" character varying(200) NOT NULL,
    "ApiResourceId" integer NOT NULL,
    CONSTRAINT "PK_ApiResourceScopes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiResourceScopes_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ApiResourceSecrets" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Description" character varying(1000) NULL,
    "Value" character varying(4000) NOT NULL,
    "Expiration" timestamp without time zone NULL,
    "Type" character varying(250) NOT NULL,
    "Created" timestamp without time zone NOT NULL,
    "ApiResourceId" integer NOT NULL,
    CONSTRAINT "PK_ApiResourceSecrets" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiResourceSecrets_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ApiScopeClaims" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Type" character varying(200) NOT NULL,
    "ScopeId" integer NOT NULL,
    CONSTRAINT "PK_ApiScopeClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiScopeClaims_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "ApiScopes" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ApiScopeProperties" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "ScopeId" integer NOT NULL,
    CONSTRAINT "PK_ApiScopeProperties" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiScopeProperties_ApiScopes_ScopeId" FOREIGN KEY ("ScopeId") REFERENCES "ApiScopes" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientClaims" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Type" character varying(250) NOT NULL,
    "Value" character varying(250) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientClaims_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientCorsOrigins" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Origin" character varying(150) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientCorsOrigins" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientCorsOrigins_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientGrantTypes" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "GrantType" character varying(250) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientGrantTypes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientGrantTypes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientIdPRestrictions" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Provider" character varying(200) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientIdPRestrictions" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientIdPRestrictions_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientPostLogoutRedirectUris" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "PostLogoutRedirectUri" character varying(2000) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientPostLogoutRedirectUris" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientPostLogoutRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientProperties" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientProperties" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientProperties_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientRedirectUris" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "RedirectUri" character varying(2000) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientRedirectUris" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientScopes" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Scope" character varying(200) NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientScopes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientScopes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "ClientSecrets" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Description" character varying(2000) NULL,
    "Value" character varying(4000) NOT NULL,
    "Expiration" timestamp without time zone NULL,
    "Type" character varying(250) NOT NULL,
    "Created" timestamp without time zone NOT NULL,
    "ClientId" integer NOT NULL,
    CONSTRAINT "PK_ClientSecrets" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientSecrets_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "IdentityResourceClaims" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Type" character varying(200) NOT NULL,
    "IdentityResourceId" integer NOT NULL,
    CONSTRAINT "PK_IdentityResourceClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_IdentityResourceClaims_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES "IdentityResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "IdentityResourceProperties" (
    "Id" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "IdentityResourceId" integer NOT NULL,
    CONSTRAINT "PK_IdentityResourceProperties" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_IdentityResourceProperties_IdentityResources_IdentityResour~" FOREIGN KEY ("IdentityResourceId") REFERENCES "IdentityResources" ("Id") ON DELETE CASCADE
);

CREATE INDEX "IX_ApiResourceClaims_ApiResourceId" ON "ApiResourceClaims" ("ApiResourceId");

CREATE INDEX "IX_ApiResourceProperties_ApiResourceId" ON "ApiResourceProperties" ("ApiResourceId");

CREATE UNIQUE INDEX "IX_ApiResources_Name" ON "ApiResources" ("Name");

CREATE INDEX "IX_ApiResourceScopes_ApiResourceId" ON "ApiResourceScopes" ("ApiResourceId");

CREATE INDEX "IX_ApiResourceSecrets_ApiResourceId" ON "ApiResourceSecrets" ("ApiResourceId");

CREATE INDEX "IX_ApiScopeClaims_ScopeId" ON "ApiScopeClaims" ("ScopeId");

CREATE INDEX "IX_ApiScopeProperties_ScopeId" ON "ApiScopeProperties" ("ScopeId");

CREATE UNIQUE INDEX "IX_ApiScopes_Name" ON "ApiScopes" ("Name");

CREATE INDEX "IX_ClientClaims_ClientId" ON "ClientClaims" ("ClientId");

CREATE INDEX "IX_ClientCorsOrigins_ClientId" ON "ClientCorsOrigins" ("ClientId");

CREATE INDEX "IX_ClientGrantTypes_ClientId" ON "ClientGrantTypes" ("ClientId");

CREATE INDEX "IX_ClientIdPRestrictions_ClientId" ON "ClientIdPRestrictions" ("ClientId");

CREATE INDEX "IX_ClientPostLogoutRedirectUris_ClientId" ON "ClientPostLogoutRedirectUris" ("ClientId");

CREATE INDEX "IX_ClientProperties_ClientId" ON "ClientProperties" ("ClientId");

CREATE INDEX "IX_ClientRedirectUris_ClientId" ON "ClientRedirectUris" ("ClientId");

CREATE UNIQUE INDEX "IX_Clients_ClientId" ON "Clients" ("ClientId");

CREATE INDEX "IX_ClientScopes_ClientId" ON "ClientScopes" ("ClientId");

CREATE INDEX "IX_ClientSecrets_ClientId" ON "ClientSecrets" ("ClientId");

CREATE INDEX "IX_IdentityResourceClaims_IdentityResourceId" ON "IdentityResourceClaims" ("IdentityResourceId");

CREATE INDEX "IX_IdentityResourceProperties_IdentityResourceId" ON "IdentityResourceProperties" ("IdentityResourceId");

CREATE UNIQUE INDEX "IX_IdentityResources_Name" ON "IdentityResources" ("Name");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20210113074825_Init', '3.1.10');

-- 

CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "DeviceCodes" (
    "UserCode" character varying(200) NOT NULL,
    "DeviceCode" character varying(200) NOT NULL,
    "SubjectId" character varying(200) NULL,
    "SessionId" character varying(100) NULL,
    "ClientId" character varying(200) NOT NULL,
    "Description" character varying(200) NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "Expiration" timestamp without time zone NOT NULL,
    "Data" character varying(50000) NOT NULL,
    CONSTRAINT "PK_DeviceCodes" PRIMARY KEY ("UserCode")
);

CREATE TABLE "PersistedGrants" (
    "Key" character varying(200) NOT NULL,
    "Type" character varying(50) NOT NULL,
    "SubjectId" character varying(200) NULL,
    "SessionId" character varying(100) NULL,
    "ClientId" character varying(200) NOT NULL,
    "Description" character varying(200) NULL,
    "CreationTime" timestamp without time zone NOT NULL,
    "Expiration" timestamp without time zone NULL,
    "ConsumedTime" timestamp without time zone NULL,
    "Data" character varying(50000) NOT NULL,
    CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key")
);

CREATE UNIQUE INDEX "IX_DeviceCodes_DeviceCode" ON "DeviceCodes" ("DeviceCode");

CREATE INDEX "IX_DeviceCodes_Expiration" ON "DeviceCodes" ("Expiration");

CREATE INDEX "IX_PersistedGrants_Expiration" ON "PersistedGrants" ("Expiration");

CREATE INDEX "IX_PersistedGrants_SubjectId_ClientId_Type" ON "PersistedGrants" ("SubjectId", "ClientId", "Type");

CREATE INDEX "IX_PersistedGrants_SubjectId_SessionId_Type" ON "PersistedGrants" ("SubjectId", "SessionId", "Type");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20210113074849_Init', '3.1.10');
