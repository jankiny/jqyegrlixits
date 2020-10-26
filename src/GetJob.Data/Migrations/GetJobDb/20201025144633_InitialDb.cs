using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class InitialDb : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Dir_CompanyField",
                columns: table => new
                {
                    CompanyFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_CompanyField", x => x.CompanyFieldId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_CompanyScale",
                columns: table => new
                {
                    CompanyScaleId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_CompanyScale", x => x.CompanyScaleId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_Degree",
                columns: table => new
                {
                    DegreeId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_Degree", x => x.DegreeId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_DeliverStatus",
                columns: table => new
                {
                    DeliverStatusId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_DeliverStatus", x => x.DeliverStatusId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_JobCharacter",
                columns: table => new
                {
                    JobCharacterId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_JobCharacter", x => x.JobCharacterId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_JobKind",
                columns: table => new
                {
                    JobKindId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_JobKind", x => x.JobKindId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_JobPay",
                columns: table => new
                {
                    JobPayId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false),
                    PayFrom = table.Column<double>(nullable: false),
                    PayTo = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_JobPay", x => x.JobPayId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_JobStatus",
                columns: table => new
                {
                    JobStatusId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_JobStatus", x => x.JobStatusId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_Location",
                columns: table => new
                {
                    LocationId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_Location", x => x.LocationId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_Nation",
                columns: table => new
                {
                    NationId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_Nation", x => x.NationId);
                });

            migrationBuilder.CreateTable(
                name: "Dir_PoliticalOutlook",
                columns: table => new
                {
                    PoliticalOutlookId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Dir_PoliticalOutlook", x => x.PoliticalOutlookId);
                });

            migrationBuilder.CreateTable(
                name: "C_Company",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 50, nullable: false),
                    CompanyFieldId = table.Column<int>(nullable: false),
                    CompanyScaleId = table.Column<int>(nullable: false),
                    Description = table.Column<string>(maxLength: 450, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_Company", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_Company_Dir_CompanyField_CompanyFieldId",
                        column: x => x.CompanyFieldId,
                        principalTable: "Dir_CompanyField",
                        principalColumn: "CompanyFieldId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Company_Dir_CompanyScale_CompanyScaleId",
                        column: x => x.CompanyScaleId,
                        principalTable: "Dir_CompanyScale",
                        principalColumn: "CompanyScaleId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "S_Student",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    IdentityNumber = table.Column<string>(maxLength: 18, nullable: true),
                    Name = table.Column<string>(maxLength: 50, nullable: true),
                    Sex = table.Column<string>(maxLength: 2, nullable: true),
                    BirthPlaceId = table.Column<int>(nullable: false),
                    Address = table.Column<string>(maxLength: 200, nullable: true),
                    Birthday = table.Column<DateTime>(nullable: false),
                    NationId = table.Column<int>(nullable: false),
                    PoliticalOutlookId = table.Column<int>(nullable: false),
                    Phone = table.Column<string>(maxLength: 11, nullable: true),
                    Mail = table.Column<string>(maxLength: 50, nullable: true),
                    Major = table.Column<string>(maxLength: 50, nullable: true),
                    College = table.Column<string>(maxLength: 50, nullable: true),
                    StudyDate = table.Column<DateTime>(nullable: false),
                    DegreeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Student", x => x.Id);
                    table.ForeignKey(
                        name: "FK_S_Student_Dir_Location_BirthPlaceId",
                        column: x => x.BirthPlaceId,
                        principalTable: "Dir_Location",
                        principalColumn: "LocationId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Student_Dir_Degree_DegreeId",
                        column: x => x.DegreeId,
                        principalTable: "Dir_Degree",
                        principalColumn: "DegreeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Student_Dir_Nation_NationId",
                        column: x => x.NationId,
                        principalTable: "Dir_Nation",
                        principalColumn: "NationId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Student_Dir_PoliticalOutlook_PoliticalOutlookId",
                        column: x => x.PoliticalOutlookId,
                        principalTable: "Dir_PoliticalOutlook",
                        principalColumn: "PoliticalOutlookId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "C_Job",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 50, nullable: false),
                    CompanyId = table.Column<string>(nullable: false),
                    JobCharacterId = table.Column<int>(nullable: false),
                    JobKindId = table.Column<int>(nullable: false),
                    JobPayId = table.Column<int>(nullable: false),
                    JobStatusId = table.Column<int>(nullable: false),
                    LocationId = table.Column<int>(nullable: false),
                    DegreeId = table.Column<int>(nullable: false),
                    RecruitNumber = table.Column<int>(nullable: false),
                    Description = table.Column<string>(maxLength: 450, nullable: true),
                    LastModify = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_Job", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_Job_C_Company_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "C_Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_Degree_DegreeId",
                        column: x => x.DegreeId,
                        principalTable: "Dir_Degree",
                        principalColumn: "DegreeId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_JobCharacter_JobCharacterId",
                        column: x => x.JobCharacterId,
                        principalTable: "Dir_JobCharacter",
                        principalColumn: "JobCharacterId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_JobKind_JobKindId",
                        column: x => x.JobKindId,
                        principalTable: "Dir_JobKind",
                        principalColumn: "JobKindId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_JobPay_JobPayId",
                        column: x => x.JobPayId,
                        principalTable: "Dir_JobPay",
                        principalColumn: "JobPayId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_JobStatus_JobStatusId",
                        column: x => x.JobStatusId,
                        principalTable: "Dir_JobStatus",
                        principalColumn: "JobStatusId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_Dir_Location_LocationId",
                        column: x => x.LocationId,
                        principalTable: "Dir_Location",
                        principalColumn: "LocationId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "C_StudentCollection",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    StudentId = table.Column<string>(nullable: false),
                    CompanyId = table.Column<string>(nullable: false),
                    CollectionDateTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_StudentCollection", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_StudentCollection_C_Company_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "C_Company",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_StudentCollection_S_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "S_Student",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "S_Resume",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    StudentId = table.Column<string>(nullable: false),
                    Title = table.Column<string>(maxLength: 50, nullable: true),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    ForJobKindId = table.Column<int>(nullable: false),
                    ForJobAddressId = table.Column<int>(nullable: false),
                    ForJobCharacterId = table.Column<int>(nullable: false),
                    ForJobPayId = table.Column<int>(nullable: false),
                    Certificate = table.Column<string>(nullable: true),
                    WorkExperience = table.Column<string>(nullable: true),
                    SelfEvaluation = table.Column<string>(nullable: true),
                    State = table.Column<string>(maxLength: 10, nullable: true),
                    Visible = table.Column<string>(maxLength: 2, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Resume", x => x.Id);
                    table.ForeignKey(
                        name: "FK_S_Resume_Dir_Location_ForJobAddressId",
                        column: x => x.ForJobAddressId,
                        principalTable: "Dir_Location",
                        principalColumn: "LocationId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Resume_Dir_JobCharacter_ForJobCharacterId",
                        column: x => x.ForJobCharacterId,
                        principalTable: "Dir_JobCharacter",
                        principalColumn: "JobCharacterId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Resume_Dir_JobKind_ForJobKindId",
                        column: x => x.ForJobKindId,
                        principalTable: "Dir_JobKind",
                        principalColumn: "JobKindId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Resume_Dir_JobPay_ForJobPayId",
                        column: x => x.ForJobPayId,
                        principalTable: "Dir_JobPay",
                        principalColumn: "JobPayId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Resume_S_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "S_Student",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "S_ResumeSubmitted",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    StudentId = table.Column<string>(nullable: false),
                    Title = table.Column<string>(maxLength: 50, nullable: true),
                    CreateDateTime = table.Column<DateTime>(nullable: false),
                    ForJobKindId = table.Column<int>(nullable: false),
                    ForJobAddressId = table.Column<int>(nullable: false),
                    ForJobCharacterId = table.Column<int>(nullable: false),
                    ForJobPayId = table.Column<int>(nullable: false),
                    Certificate = table.Column<string>(nullable: true),
                    WorkExperience = table.Column<string>(nullable: true),
                    SelfEvaluation = table.Column<string>(nullable: true),
                    State = table.Column<string>(maxLength: 10, nullable: true),
                    Visible = table.Column<string>(maxLength: 2, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_ResumeSubmitted", x => x.Id);
                    table.ForeignKey(
                        name: "FK_S_ResumeSubmitted_Dir_Location_ForJobAddressId",
                        column: x => x.ForJobAddressId,
                        principalTable: "Dir_Location",
                        principalColumn: "LocationId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_ResumeSubmitted_Dir_JobCharacter_ForJobCharacterId",
                        column: x => x.ForJobCharacterId,
                        principalTable: "Dir_JobCharacter",
                        principalColumn: "JobCharacterId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_ResumeSubmitted_Dir_JobKind_ForJobKindId",
                        column: x => x.ForJobKindId,
                        principalTable: "Dir_JobKind",
                        principalColumn: "JobKindId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_ResumeSubmitted_Dir_JobPay_ForJobPayId",
                        column: x => x.ForJobPayId,
                        principalTable: "Dir_JobPay",
                        principalColumn: "JobPayId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_ResumeSubmitted_S_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "S_Student",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "S_JobCollection",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    StudentId = table.Column<string>(nullable: false),
                    JobId = table.Column<string>(nullable: false),
                    CollectionDateTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_JobCollection", x => x.Id);
                    table.ForeignKey(
                        name: "FK_S_JobCollection_C_Job_JobId",
                        column: x => x.JobId,
                        principalTable: "C_Job",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_JobCollection_S_Student_StudentId",
                        column: x => x.StudentId,
                        principalTable: "S_Student",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "S_Deliver",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    JobId = table.Column<string>(nullable: false),
                    ResumeSubmittedId = table.Column<string>(nullable: false),
                    DeliverStatusId = table.Column<int>(nullable: false),
                    DeliverDateTime = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Deliver", x => x.Id);
                    table.ForeignKey(
                        name: "FK_S_Deliver_Dir_DeliverStatus_DeliverStatusId",
                        column: x => x.DeliverStatusId,
                        principalTable: "Dir_DeliverStatus",
                        principalColumn: "DeliverStatusId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Deliver_C_Job_JobId",
                        column: x => x.JobId,
                        principalTable: "C_Job",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_S_Deliver_S_ResumeSubmitted_ResumeSubmittedId",
                        column: x => x.ResumeSubmittedId,
                        principalTable: "S_ResumeSubmitted",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "C_InterviewNotify",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    DeliverId = table.Column<string>(nullable: false),
                    Title = table.Column<string>(maxLength: 50, nullable: false),
                    InterviewDate = table.Column<DateTime>(nullable: false),
                    InterviewLocation = table.Column<string>(nullable: false),
                    Note = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_InterviewNotify", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_InterviewNotify_S_Deliver_DeliverId",
                        column: x => x.DeliverId,
                        principalTable: "S_Deliver",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_C_Company_CompanyFieldId",
                table: "C_Company",
                column: "CompanyFieldId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Company_CompanyScaleId",
                table: "C_Company",
                column: "CompanyScaleId");

            migrationBuilder.CreateIndex(
                name: "IX_C_InterviewNotify_DeliverId",
                table: "C_InterviewNotify",
                column: "DeliverId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_CompanyId",
                table: "C_Job",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_DegreeId",
                table: "C_Job",
                column: "DegreeId");

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
                name: "IX_C_Job_JobStatusId",
                table: "C_Job",
                column: "JobStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_LocationId",
                table: "C_Job",
                column: "LocationId");

            migrationBuilder.CreateIndex(
                name: "IX_C_StudentCollection_CompanyId",
                table: "C_StudentCollection",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_C_StudentCollection_StudentId",
                table: "C_StudentCollection",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Deliver_DeliverStatusId",
                table: "S_Deliver",
                column: "DeliverStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Deliver_JobId",
                table: "S_Deliver",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Deliver_ResumeSubmittedId",
                table: "S_Deliver",
                column: "ResumeSubmittedId");

            migrationBuilder.CreateIndex(
                name: "IX_S_JobCollection_JobId",
                table: "S_JobCollection",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_S_JobCollection_StudentId",
                table: "S_JobCollection",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Resume_ForJobAddressId",
                table: "S_Resume",
                column: "ForJobAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Resume_ForJobCharacterId",
                table: "S_Resume",
                column: "ForJobCharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Resume_ForJobKindId",
                table: "S_Resume",
                column: "ForJobKindId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Resume_ForJobPayId",
                table: "S_Resume",
                column: "ForJobPayId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Resume_StudentId",
                table: "S_Resume",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_S_ResumeSubmitted_ForJobAddressId",
                table: "S_ResumeSubmitted",
                column: "ForJobAddressId");

            migrationBuilder.CreateIndex(
                name: "IX_S_ResumeSubmitted_ForJobCharacterId",
                table: "S_ResumeSubmitted",
                column: "ForJobCharacterId");

            migrationBuilder.CreateIndex(
                name: "IX_S_ResumeSubmitted_ForJobKindId",
                table: "S_ResumeSubmitted",
                column: "ForJobKindId");

            migrationBuilder.CreateIndex(
                name: "IX_S_ResumeSubmitted_ForJobPayId",
                table: "S_ResumeSubmitted",
                column: "ForJobPayId");

            migrationBuilder.CreateIndex(
                name: "IX_S_ResumeSubmitted_StudentId",
                table: "S_ResumeSubmitted",
                column: "StudentId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Student_BirthPlaceId",
                table: "S_Student",
                column: "BirthPlaceId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Student_DegreeId",
                table: "S_Student",
                column: "DegreeId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Student_NationId",
                table: "S_Student",
                column: "NationId");

            migrationBuilder.CreateIndex(
                name: "IX_S_Student_PoliticalOutlookId",
                table: "S_Student",
                column: "PoliticalOutlookId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "C_InterviewNotify");

            migrationBuilder.DropTable(
                name: "C_StudentCollection");

            migrationBuilder.DropTable(
                name: "S_JobCollection");

            migrationBuilder.DropTable(
                name: "S_Resume");

            migrationBuilder.DropTable(
                name: "S_Deliver");

            migrationBuilder.DropTable(
                name: "Dir_DeliverStatus");

            migrationBuilder.DropTable(
                name: "C_Job");

            migrationBuilder.DropTable(
                name: "S_ResumeSubmitted");

            migrationBuilder.DropTable(
                name: "C_Company");

            migrationBuilder.DropTable(
                name: "Dir_JobStatus");

            migrationBuilder.DropTable(
                name: "Dir_JobCharacter");

            migrationBuilder.DropTable(
                name: "Dir_JobKind");

            migrationBuilder.DropTable(
                name: "Dir_JobPay");

            migrationBuilder.DropTable(
                name: "S_Student");

            migrationBuilder.DropTable(
                name: "Dir_CompanyField");

            migrationBuilder.DropTable(
                name: "Dir_CompanyScale");

            migrationBuilder.DropTable(
                name: "Dir_Location");

            migrationBuilder.DropTable(
                name: "Dir_Degree");

            migrationBuilder.DropTable(
                name: "Dir_Nation");

            migrationBuilder.DropTable(
                name: "Dir_PoliticalOutlook");
        }
    }
}
