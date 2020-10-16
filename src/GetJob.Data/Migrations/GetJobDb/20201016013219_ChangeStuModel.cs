using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class ChangeStuModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify");

            migrationBuilder.DropPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "AccessFailedCount",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "ConcurrencyStamp",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "EmailConfirmed",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "LockoutEnabled",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "LockoutEnd",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "NormalizedEmail",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "NormalizedUserName",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "PasswordHash",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "PhoneNumberConfirmed",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "SecurityStamp",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "TwoFactorEnabled",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "UserName",
                table: "S_Student");

            migrationBuilder.AlterColumn<string>(
                name: "StudentId",
                table: "S_Student",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student",
                column: "StudentId");

            migrationBuilder.AddForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId",
                principalTable: "S_Student",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify");

            migrationBuilder.DropPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student");

            migrationBuilder.AlterColumn<int>(
                name: "StudentId",
                table: "S_Student",
                type: "int",
                nullable: false,
                oldClrType: typeof(string));

            migrationBuilder.AddColumn<string>(
                name: "Id",
                table: "S_Student",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "AccessFailedCount",
                table: "S_Student",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ConcurrencyStamp",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "EmailConfirmed",
                table: "S_Student",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "LockoutEnabled",
                table: "S_Student",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTimeOffset>(
                name: "LockoutEnd",
                table: "S_Student",
                type: "datetimeoffset",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NormalizedEmail",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NormalizedUserName",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PasswordHash",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "PhoneNumberConfirmed",
                table: "S_Student",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "SecurityStamp",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "TwoFactorEnabled",
                table: "S_Student",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "UserName",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId",
                principalTable: "S_Student",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
