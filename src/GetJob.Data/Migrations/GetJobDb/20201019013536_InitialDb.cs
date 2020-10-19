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
                    CompanyFieldId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_CompanyField", x => x.CompanyFieldId);
                });

            migrationBuilder.CreateTable(
                name: "C_JobCharacter",
                columns: table => new
                {
                    JobCharacterId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_JobCharacter", x => x.JobCharacterId);
                });

            migrationBuilder.CreateTable(
                name: "C_JobKind",
                columns: table => new
                {
                    JobKindId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_JobKind", x => x.JobKindId);
                });

            migrationBuilder.CreateTable(
                name: "C_JobPay",
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
                    table.PrimaryKey("PK_C_JobPay", x => x.JobPayId);
                });

            migrationBuilder.CreateTable(
                name: "S_Nation",
                columns: table => new
                {
                    NationId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Nation", x => x.NationId);
                });

            migrationBuilder.CreateTable(
                name: "S_Student",
                columns: table => new
                {
                    StudentId = table.Column<string>(nullable: false),
                    Xh = table.Column<string>(maxLength: 10, nullable: true),
                    Xm = table.Column<string>(nullable: true),
                    Xb = table.Column<string>(nullable: true),
                    Csny = table.Column<string>(nullable: true),
                    MzId = table.Column<string>(nullable: true),
                    ZzId = table.Column<string>(nullable: true),
                    Phone = table.Column<string>(nullable: true),
                    Mail = table.Column<string>(nullable: true),
                    Adress = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Student", x => x.StudentId);
                });

            migrationBuilder.CreateTable(
                name: "C_Company",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 50, nullable: false),
                    CompanyFieldId = table.Column<int>(nullable: false),
                    Description = table.Column<string>(maxLength: 450, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_Company", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_Company_C_CompanyField_CompanyFieldId",
                        column: x => x.CompanyFieldId,
                        principalTable: "C_CompanyField",
                        principalColumn: "CompanyFieldId",
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
                    Description = table.Column<string>(maxLength: 450, nullable: true),
                    ResumeReceived = table.Column<string>(maxLength: 450, nullable: true)
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
                        name: "FK_C_Job_C_JobCharacter_JobCharacterId",
                        column: x => x.JobCharacterId,
                        principalTable: "C_JobCharacter",
                        principalColumn: "JobCharacterId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_C_JobKind_JobKindId",
                        column: x => x.JobKindId,
                        principalTable: "C_JobKind",
                        principalColumn: "JobKindId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_Job_C_JobPay_JobPayId",
                        column: x => x.JobPayId,
                        principalTable: "C_JobPay",
                        principalColumn: "JobPayId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "C_InterviewNotify",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    ToStudentId = table.Column<string>(nullable: false),
                    JobId = table.Column<string>(nullable: false),
                    Title = table.Column<string>(maxLength: 50, nullable: false),
                    InterviewDate = table.Column<DateTime>(nullable: false),
                    InterviewLocation = table.Column<string>(nullable: false),
                    Note = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_C_InterviewNotify", x => x.Id);
                    table.ForeignKey(
                        name: "FK_C_InterviewNotify_C_Job_JobId",
                        column: x => x.JobId,
                        principalTable: "C_Job",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                        column: x => x.ToStudentId,
                        principalTable: "S_Student",
                        principalColumn: "StudentId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "C_CompanyField",
                columns: new[] { "CompanyFieldId", "Text" },
                values: new object[] { 1, "服务业" });

            migrationBuilder.InsertData(
                table: "C_JobCharacter",
                columns: new[] { "JobCharacterId", "Text" },
                values: new object[,]
                {
                    { 1, "全职" },
                    { 2, "临时" },
                    { 3, "实习" },
                    { 4, "兼职" }
                });

            migrationBuilder.InsertData(
                table: "C_JobKind",
                columns: new[] { "JobKindId", "Text" },
                values: new object[,]
                {
                    { 10000, "计算机类" },
                    { 10001, "测试" }
                });

            migrationBuilder.InsertData(
                table: "C_JobPay",
                columns: new[] { "JobPayId", "PayFrom", "PayTo", "Text" },
                values: new object[,]
                {
                    { 12, 50000.0, 10000000.0, "50000以上" },
                    { 11, 30000.0, 50000.0, "30000~50000" },
                    { 10, 20000.0, 30000.0, "20000~30000" },
                    { 9, 15000.0, 20000.0, "15000~20000" },
                    { 8, 10000.0, 15000.0, "10000~15000" },
                    { 7, 8000.0, 10000.0, "8000~10000" },
                    { 4, 3000.0, 4000.0, "3000~4000" },
                    { 5, 4000.0, 6000.0, "4000~6000" },
                    { 3, 2000.0, 3000.0, "2000~3000" },
                    { 2, 1000.0, 2000.0, "1000~2000" },
                    { 1, 0.0, 1000.0, "1000以下" },
                    { 6, 6000.0, 8000.0, "6000~8000" }
                });

            migrationBuilder.InsertData(
                table: "S_Nation",
                columns: new[] { "NationId", "Text" },
                values: new object[,]
                {
                    { 2, "蒙古族" },
                    { 1, "汉族" }
                });

            migrationBuilder.InsertData(
                table: "S_Student",
                columns: new[] { "StudentId", "Adress", "Csny", "Mail", "MzId", "Phone", "Xb", "Xh", "Xm", "ZzId" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", "null", "null", "null", "null", "null", "男", "2017050213", "吴知", "null" });

            migrationBuilder.InsertData(
                table: "C_Company",
                columns: new[] { "Id", "CompanyFieldId", "Description", "Name" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", 1, "无", "树苗" });

            migrationBuilder.InsertData(
                table: "C_Job",
                columns: new[] { "Id", "CompanyId", "Description", "JobCharacterId", "JobKindId", "JobPayId", "Name", "ResumeReceived" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", "a1b0c2d4-eabc-1024-deed-adeabcdefabc", null, 3, 10001, 4, "测试攻城师", null });

            migrationBuilder.InsertData(
                table: "C_InterviewNotify",
                columns: new[] { "Id", "InterviewDate", "InterviewLocation", "JobId", "Note", "Title", "ToStudentId" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", new DateTime(2020, 10, 19, 9, 35, 35, 652, DateTimeKind.Local).AddTicks(4948), "", "a1b0c2d4-eabc-1024-deed-adeabcdefabc", null, "通知测试种子数据", "a1b0c2d4-eabc-1024-deed-adeabcdefabc" });

            migrationBuilder.CreateIndex(
                name: "IX_C_Company_CompanyFieldId",
                table: "C_Company",
                column: "CompanyFieldId");

            migrationBuilder.CreateIndex(
                name: "IX_C_InterviewNotify_JobId",
                table: "C_InterviewNotify",
                column: "JobId");

            migrationBuilder.CreateIndex(
                name: "IX_C_InterviewNotify_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId");

            migrationBuilder.CreateIndex(
                name: "IX_C_Job_CompanyId",
                table: "C_Job",
                column: "CompanyId");

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
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "C_InterviewNotify");

            migrationBuilder.DropTable(
                name: "S_Nation");

            migrationBuilder.DropTable(
                name: "C_Job");

            migrationBuilder.DropTable(
                name: "S_Student");

            migrationBuilder.DropTable(
                name: "C_Company");

            migrationBuilder.DropTable(
                name: "C_JobCharacter");

            migrationBuilder.DropTable(
                name: "C_JobKind");

            migrationBuilder.DropTable(
                name: "C_JobPay");

            migrationBuilder.DropTable(
                name: "C_CompanyField");
        }
    }
}
