﻿// <auto-generated />
using System;
using Charlie.OpenIam.Infra;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

namespace Charlie.OpenIam.Infra.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn)
                .HasAnnotation("ProductVersion", "3.1.10")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.ApplicationRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnName("id")
                        .HasColumnType("text");

                    b.Property<string>("ClientId")
                        .HasColumnName("clientid")
                        .HasColumnType("text");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnName("concurrencystamp")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnName("createdat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("CreatedBy")
                        .HasColumnName("createdby")
                        .HasColumnType("text");

                    b.Property<string>("Description")
                        .HasColumnName("description")
                        .HasColumnType("text");

                    b.Property<bool>("IsAdmin")
                        .HasColumnName("isadmin")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsSuperAdmin")
                        .HasColumnName("issuperadmin")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("LastUpdatedAt")
                        .HasColumnName("lastupdatedat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnName("lastupdatedby")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnName("name")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.Property<string>("NormalizedName")
                        .HasColumnName("normalizedname")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.HasKey("Id")
                        .HasName("pk_roles");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasName("RoleNameIndex");

                    b.ToTable("AspNetRoles");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.ApplicationUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnName("id")
                        .HasColumnType("text");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnName("accessfailedcount")
                        .HasColumnType("integer");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnName("concurrencystamp")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnName("createdat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("CreatedBy")
                        .HasColumnName("createdby")
                        .HasColumnType("text");

                    b.Property<string>("Email")
                        .HasColumnName("email")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnName("emailconfirmed")
                        .HasColumnType("boolean");

                    b.Property<string>("FirstName")
                        .HasColumnName("firstname")
                        .HasColumnType("text");

                    b.Property<int>("Gender")
                        .HasColumnName("gender")
                        .HasColumnType("integer");

                    b.Property<string>("HomeAddress")
                        .HasColumnName("homeaddress")
                        .HasColumnType("text");

                    b.Property<string>("IdCard")
                        .HasColumnName("idcard")
                        .HasColumnType("text");

                    b.Property<string>("IdCardBackImg")
                        .HasColumnName("idcardbackimg")
                        .HasColumnType("text");

                    b.Property<string>("IdCardFaceImg")
                        .HasColumnName("idcardfaceimg")
                        .HasColumnType("text");

                    b.Property<bool>("IsActive")
                        .HasColumnName("isactive")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("boolean");

                    b.Property<string>("JobNo")
                        .HasColumnName("jobno")
                        .HasColumnType("text");

                    b.Property<string>("LastIp")
                        .HasColumnName("lastip")
                        .HasColumnType("text");

                    b.Property<DateTime>("LastLoginAt")
                        .HasColumnName("lastloginat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("LastName")
                        .HasColumnName("lastname")
                        .HasColumnType("text");

                    b.Property<DateTime>("LastUpdatedAt")
                        .HasColumnName("lastupdatedat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnName("lastupdatedby")
                        .HasColumnType("text");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnName("lockoutenabled")
                        .HasColumnType("boolean");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnName("lockoutend")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("NormalizedEmail")
                        .HasColumnName("normalizedemail")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.Property<string>("NormalizedUserName")
                        .HasColumnName("normalizedusername")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.Property<string>("PasswordHash")
                        .HasColumnName("passwordhash")
                        .HasColumnType("text");

                    b.Property<string>("PhoneNumber")
                        .HasColumnName("phonenumber")
                        .HasColumnType("text");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnName("phonenumberconfirmed")
                        .HasColumnType("boolean");

                    b.Property<string>("Position")
                        .HasColumnName("position")
                        .HasColumnType("text");

                    b.Property<string>("SecurityStamp")
                        .HasColumnName("securitystamp")
                        .HasColumnType("text");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnName("twofactorenabled")
                        .HasColumnType("boolean");

                    b.Property<string>("UserName")
                        .HasColumnName("username")
                        .HasColumnType("character varying(256)")
                        .HasMaxLength(256);

                    b.HasKey("Id")
                        .HasName("pk_users");

                    b.HasIndex("JobNo");

                    b.HasIndex("NormalizedEmail")
                        .HasName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasName("UserNameIndex");

                    b.ToTable("AspNetUsers");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.Organization", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnName("id")
                        .HasColumnType("text");

                    b.Property<string>("Address")
                        .HasColumnName("address")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnName("createdat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("CreatedBy")
                        .HasColumnName("createdby")
                        .HasColumnType("text");

                    b.Property<string>("Desc")
                        .HasColumnName("desc")
                        .HasColumnType("text");

                    b.Property<bool>("Enabled")
                        .HasColumnName("enabled")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("LastUpdatedAt")
                        .HasColumnName("lastupdatedat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnName("lastupdatedby")
                        .HasColumnType("text");

                    b.Property<string>("Mobile")
                        .HasColumnName("mobile")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnName("name")
                        .HasColumnType("text");

                    b.Property<string>("_parentId")
                        .HasColumnName("parentid")
                        .HasColumnType("text");

                    b.HasKey("Id")
                        .HasName("pk_organizations");

                    b.HasIndex("_parentId");

                    b.ToTable("organizations");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.OrganizationRole", b =>
                {
                    b.Property<string>("RoleId")
                        .HasColumnName("roleid")
                        .HasColumnType("text");

                    b.Property<string>("OrganizationId")
                        .HasColumnName("organizationid")
                        .HasColumnType("text");

                    b.HasKey("RoleId", "OrganizationId");

                    b.HasIndex("OrganizationId")
                        .HasName("ix_organizationrole_organizationid");

                    b.ToTable("organizationrole");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.Permission", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnName("id")
                        .HasColumnType("text");

                    b.Property<string>("ClientId")
                        .HasColumnName("clientid")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnName("createdat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("CreatedBy")
                        .HasColumnName("createdby")
                        .HasColumnType("text");

                    b.Property<string>("Description")
                        .HasColumnName("description")
                        .HasColumnType("text");

                    b.Property<bool>("Enabled")
                        .HasColumnName("enabled")
                        .HasColumnType("boolean");

                    b.Property<string>("Icon")
                        .HasColumnName("icon")
                        .HasColumnType("text");

                    b.Property<bool>("IsDeleted")
                        .HasColumnType("boolean");

                    b.Property<string>("Key")
                        .HasColumnName("key")
                        .HasColumnType("text");

                    b.Property<DateTime>("LastUpdatedAt")
                        .HasColumnName("lastupdatedat")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("LastUpdatedBy")
                        .HasColumnName("lastupdatedby")
                        .HasColumnType("text");

                    b.Property<int>("Level")
                        .HasColumnName("level")
                        .HasColumnType("integer");

                    b.Property<string>("Name")
                        .HasColumnName("name")
                        .HasColumnType("text");

                    b.Property<int>("Order")
                        .HasColumnName("order")
                        .HasColumnType("integer");

                    b.Property<int>("Type")
                        .HasColumnName("type")
                        .HasColumnType("integer");

                    b.Property<string>("Url")
                        .HasColumnName("url")
                        .HasColumnType("text");

                    b.Property<string>("_parentId")
                        .HasColumnName("parentid")
                        .HasColumnType("text");

                    b.HasKey("Id")
                        .HasName("pk_permissions");

                    b.HasIndex("_parentId");

                    b.ToTable("permissions");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.RolePermission", b =>
                {
                    b.Property<string>("RoleId")
                        .HasColumnName("roleid")
                        .HasColumnType("text");

                    b.Property<string>("PermissionId")
                        .HasColumnName("permissionid")
                        .HasColumnType("text");

                    b.HasKey("RoleId", "PermissionId");

                    b.HasIndex("PermissionId")
                        .HasName("ix_rolepermission_permissionid");

                    b.ToTable("rolepermission");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.UserOrganization", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.Property<string>("OrganizationId")
                        .HasColumnName("organizationid")
                        .HasColumnType("text");

                    b.Property<bool>("IsCharger")
                        .HasColumnName("ischarger")
                        .HasColumnType("boolean");

                    b.HasKey("UserId", "OrganizationId");

                    b.HasIndex("OrganizationId")
                        .HasName("ix_userorganization_organizationid");

                    b.ToTable("userorganization");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.UserPermission", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.Property<string>("PermissionId")
                        .HasColumnName("permissionid")
                        .HasColumnType("text");

                    b.Property<int>("Action")
                        .HasColumnName("action")
                        .HasColumnType("integer");

                    b.Property<string[]>("PermissionRoleIds")
                        .HasColumnName("permissionroleids")
                        .HasColumnType("text[]");

                    b.HasKey("UserId", "PermissionId");

                    b.HasIndex("PermissionId")
                        .HasName("ix_userpermission_permissionid");

                    b.ToTable("userpermission");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("id")
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("ClaimType")
                        .HasColumnName("claimtype")
                        .HasColumnType("text");

                    b.Property<string>("ClaimValue")
                        .HasColumnName("claimvalue")
                        .HasColumnType("text");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnName("roleid")
                        .HasColumnType("text");

                    b.HasKey("Id")
                        .HasName("pk_roleclaims");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnName("id")
                        .HasColumnType("integer")
                        .HasAnnotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn);

                    b.Property<string>("ClaimType")
                        .HasColumnName("claimtype")
                        .HasColumnType("text");

                    b.Property<string>("ClaimValue")
                        .HasColumnName("claimvalue")
                        .HasColumnType("text");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.HasKey("Id")
                        .HasName("pk_userclaims");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasColumnName("loginprovider")
                        .HasColumnType("text");

                    b.Property<string>("ProviderKey")
                        .HasColumnName("providerkey")
                        .HasColumnType("text");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnName("providerdisplayname")
                        .HasColumnType("text");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.Property<string>("RoleId")
                        .HasColumnName("roleid")
                        .HasColumnType("text");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnName("userid")
                        .HasColumnType("text");

                    b.Property<string>("LoginProvider")
                        .HasColumnName("loginprovider")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnName("name")
                        .HasColumnType("text");

                    b.Property<string>("Value")
                        .HasColumnName("value")
                        .HasColumnType("text");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.Organization", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Organization", "Parent")
                        .WithMany()
                        .HasForeignKey("_parentId")
                        .HasConstraintName("fk_organizations_organizations_parentid");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.OrganizationRole", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Organization", "Organization")
                        .WithMany("OrganizationRoles")
                        .HasForeignKey("OrganizationId")
                        .HasConstraintName("fk_organizationrole_organizations_organizationid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationRole", "Role")
                        .WithMany("OrganizationRoles")
                        .HasForeignKey("RoleId")
                        .HasConstraintName("fk_organizationrole_roles_roleid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.Permission", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Permission", "Parent")
                        .WithMany()
                        .HasForeignKey("_parentId")
                        .HasConstraintName("fk_permissions_permissions_parentid");
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.RolePermission", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Permission", "Permission")
                        .WithMany("RolePermissions")
                        .HasForeignKey("PermissionId")
                        .HasConstraintName("fk_rolepermission_permissions_permissionid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationRole", "Role")
                        .WithMany("Permissions")
                        .HasForeignKey("RoleId")
                        .HasConstraintName("fk_rolepermission_roles_roleid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.UserOrganization", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Organization", "Organization")
                        .WithMany("UserOrganizations")
                        .HasForeignKey("OrganizationId")
                        .HasConstraintName("fk_userorganization_organizations_organizationid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", "User")
                        .WithMany("UserOrganizations")
                        .HasForeignKey("UserId")
                        .HasConstraintName("fk_userorganization_users_userid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Charlie.OpenIam.Core.Models.UserPermission", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.Permission", "Permission")
                        .WithMany("UserPermissions")
                        .HasForeignKey("PermissionId")
                        .HasConstraintName("fk_userpermission_permissions_permissionid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", "User")
                        .WithMany("UserPermissions")
                        .HasForeignKey("UserId")
                        .HasConstraintName("fk_userpermission_users_userid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Charlie.OpenIam.Core.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
