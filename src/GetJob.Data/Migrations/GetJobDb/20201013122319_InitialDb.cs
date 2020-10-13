using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class InitialDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "C_CompanyField",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_CompanyField", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "C_JobCharacter",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_JobCharacter", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "C_JobKind",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_JobKind", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "C_JobPay",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_JobPay", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "S_Student",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(nullable: true),
                    NormalizedUserName = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    NormalizedEmail = table.Column<string>(nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    StudentId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Student", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "C_Company",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 50, nullable: false),
                    CompanyFieldId = table.Column<int>(nullable: false),
                    Description = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_Company", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_Company_C_CompanyField_CompanyFieldId",
                        column: x => x.CompanyFieldId,
                        principalTable: "C_CompanyField",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "C_Job",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 50, nullable: false),
                    PublisherId = table.Column<string>(nullable: false),
                    JobKindId = table.Column<int>(nullable: false),
                    JobCharacterId = table.Column<int>(nullable: false),
                    JobPayId = table.Column<int>(nullable: false),
                    Description = table.Column<string>(nullable: true),
                    ResumeReceived = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_Job", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_Job_C_JobCharacter_JobCharacterId",
                        column: x => x.JobCharacterId,
                        principalTable: "C_JobCharacter",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_C_JobKind_JobKindId",
                        column: x => x.JobKindId,
                        principalTable: "C_JobKind",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_C_JobPay_JobPayId",
                        column: x => x.JobPayId,
                        principalTable: "C_JobPay",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_C_Company_PublisherId",
                        column: x => x.PublisherId,
                        principalTable: "C_Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "C_InterviewNotify",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    ToStudentId = table.Column<string>(nullable: false),
                    JobId = table.Column<int>(nullable: false),
                    JobId1 = table.Column<string>(nullable: true),
                    Title = table.Column<string>(maxLength: 50, nullable: false),
                    InterviewDate = table.Column<DateTime>(nullable: false),
                    InterviewLocation = table.Column<string>(nullable: false),
                    Note = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_InterviewNotify", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_InterviewNotify_C_Job_JobId1",
                        column: x => x.JobId1,
                        principalTable: "C_Job",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                        column: x => x.ToStudentId,
                        principalTable: "S_Student",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_C_Company_CompanyFieldId",
                table: "C_Company",
                column: "CompanyFieldId");

            migrationBuilder.CreateIndex(
                name: "IX_C_InterviewNotify_JobId1",
                table: "C_InterviewNotify",
                column: "JobId1");

            migrationBuilder.CreateIndex(
                name: "IX_C_InterviewNotify_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_JobCharacterId",
                table: "C_Job",
                column: "JobCharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_JobKindId",
                table: "C_Job",
                column: "JobKindId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_JobPayId",
                table: "C_Job",
                column: "JobPayId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_PublisherId",
                table: "C_Job",
                column: "PublisherId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "C_InterviewNotify");

            migrationBuilder.DropTable(
                name: "C_Job");

            migrationBuilder.DropTable(
                name: "S_Student");

            migrationBuilder.DropTable(
                name: "C_JobCharacter");

            migrationBuilder.DropTable(
                name: "C_JobKind");

            migrationBuilder.DropTable(
                name: "C_JobPay");

            migrationBuilder.DropTable(
                name: "C_Company");

            migrationBuilder.DropTable(
                name: "C_CompanyField");
        }
    }
}
