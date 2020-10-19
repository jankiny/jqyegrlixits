using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class addmodel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify");

            migrationBuilder.DropPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student");

            migrationBuilder.DeleteData(
                table: "S_Student",
                keyColumn: "StudentId",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DropColumn(
                name: "StudentId",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Xh",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "ZzId",
                table: "S_Student");

            migrationBuilder.AlterColumn<string>(
                name: "Xm",
                table: "S_Student",
                maxLength: 50,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Xb",
                table: "S_Student",
                maxLength: 2,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Phone",
                table: "S_Student",
                maxLength: 11,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MzId",
                table: "S_Student",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Mail",
                table: "S_Student",
                maxLength: 50,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "Csny",
                table: "S_Student",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Adress",
                table: "S_Student",
                maxLength: 200,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "SID",
                table: "S_Student",
                maxLength: 50,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "College",
                table: "S_Student",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DegreeID",
                table: "S_Student",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "Jdsj",
                table: "S_Student",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Jg",
                table: "S_Student",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Major",
                table: "S_Student",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Sfzh",
                table: "S_Student",
                maxLength: 18,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "XlID",
                table: "S_Student",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "ZzmmId",
                table: "S_Student",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<string>(
                name: "ToStudentId",
                table: "C_InterviewNotify",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student",
                column: "SID");

            migrationBuilder.CreateTable(
                name: "S_Degree",
                columns: table => new
                {
                    NationId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Degree", x => x.NationId);
                });

            migrationBuilder.CreateTable(
                name: "S_Deliver",
                columns: table => new
                {
                    DID = table.Column<string>(maxLength: 50, nullable: false),
                    JID = table.Column<string>(nullable: true),
                    RSID = table.Column<string>(maxLength: 50, nullable: true),
                    State = table.Column<string>(maxLength: 50, nullable: true),
                    Tdsj = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Deliver", x => x.DID);
                });

            migrationBuilder.CreateTable(
                name: "S_Political",
                columns: table => new
                {
                    PoliticalId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Political", x => x.PoliticalId);
                });

            migrationBuilder.CreateTable(
                name: "S_PostCollection",
                columns: table => new
                {
                    PID = table.Column<string>(maxLength: 50, nullable: false),
                    SID = table.Column<string>(maxLength: 50, nullable: true),
                    JID = table.Column<string>(nullable: true),
                    State = table.Column<string>(maxLength: 50, nullable: true),
                    Scsj = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_PostCollection", x => x.PID);
                });

            migrationBuilder.CreateTable(
                name: "S_Provinces",
                columns: table => new
                {
                    PoliticalId = table.Column<int>(maxLength: 6, nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PoliticalMc = table.Column<int>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Provinces", x => x.PoliticalId);
                });

            migrationBuilder.CreateTable(
                name: "S_Resume",
                columns: table => new
                {
                    RID = table.Column<string>(maxLength: 50, nullable: false),
                    SID = table.Column<string>(maxLength: 50, nullable: true),
                    Theme = table.Column<string>(maxLength: 50, nullable: true),
                    Cjsj = table.Column<DateTime>(nullable: false),
                    JobKindId = table.Column<int>(nullable: false),
                    JobAdress = table.Column<string>(maxLength: 50, nullable: true),
                    JobCharacterID = table.Column<int>(nullable: false),
                    JobPayID = table.Column<int>(nullable: false),
                    Certificate = table.Column<string>(nullable: true),
                    Gzjl = table.Column<string>(nullable: true),
                    Zwpj = table.Column<string>(nullable: true),
                    State = table.Column<string>(maxLength: 10, nullable: true),
                    Visible = table.Column<string>(maxLength: 2, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Resume", x => x.RID);
                });

            migrationBuilder.CreateTable(
                name: "S_ResumeSubmitted",
                columns: table => new
                {
                    RSID = table.Column<string>(maxLength: 50, nullable: false),
                    SID = table.Column<string>(maxLength: 50, nullable: true),
                    Theme = table.Column<string>(maxLength: 50, nullable: true),
                    Cjsj = table.Column<DateTime>(nullable: false),
                    JobKindId = table.Column<int>(nullable: false),
                    JobAdress = table.Column<string>(maxLength: 50, nullable: true),
                    JobCharacterID = table.Column<int>(nullable: false),
                    JobPayID = table.Column<int>(nullable: false),
                    Certificate = table.Column<string>(nullable: true),
                    Gzjl = table.Column<string>(nullable: true),
                    Zwpj = table.Column<string>(nullable: true),
                    State = table.Column<string>(maxLength: 10, nullable: true),
                    Visible = table.Column<string>(maxLength: 2, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_ResumeSubmitted", x => x.RSID);
                });

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "Description", "LastModify", "ResumeReceived" },
                values: new object[] { "", new DateTime(2020, 10, 19, 20, 20, 43, 477, DateTimeKind.Local).AddTicks(605), "" });

            migrationBuilder.InsertData(
                table: "S_Student",
                columns: new[] { "SID", "Adress", "College", "Csny", "DegreeID", "Jdsj", "Jg", "Mail", "Major", "MzId", "Phone", "Sfzh", "Xb", "XlID", "Xm", "ZzmmId" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", "null", "null", new DateTime(2020, 10, 19, 20, 20, 43, 479, DateTimeKind.Local).AddTicks(2712), 1, new DateTime(2020, 10, 19, 20, 20, 43, 479, DateTimeKind.Local).AddTicks(5695), "null", "null", null, 1, "null", "330682199909301038", "男", 1, "吴知", 1 });

            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "InterviewDate", "Note" },
                values: new object[] { new DateTime(2020, 10, 19, 20, 20, 43, 478, DateTimeKind.Local).AddTicks(7362), "" });

            migrationBuilder.AddForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId",
                principalTable: "S_Student",
                principalColumn: "SID",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify");

            migrationBuilder.DropTable(
                name: "S_Degree");

            migrationBuilder.DropTable(
                name: "S_Deliver");

            migrationBuilder.DropTable(
                name: "S_Political");

            migrationBuilder.DropTable(
                name: "S_PostCollection");

            migrationBuilder.DropTable(
                name: "S_Provinces");

            migrationBuilder.DropTable(
                name: "S_Resume");

            migrationBuilder.DropTable(
                name: "S_ResumeSubmitted");

            migrationBuilder.DropPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student");

            migrationBuilder.DeleteData(
                table: "S_Student",
                keyColumn: "SID",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DropColumn(
                name: "SID",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "College",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "DegreeID",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Jdsj",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Jg",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Major",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Sfzh",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "XlID",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "ZzmmId",
                table: "S_Student");

            migrationBuilder.AlterColumn<string>(
                name: "Xm",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 50,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Xb",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 2,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Phone",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 11,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "MzId",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AlterColumn<string>(
                name: "Mail",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 50,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Csny",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(DateTime));

            migrationBuilder.AlterColumn<string>(
                name: "Adress",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 200,
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "StudentId",
                table: "S_Student",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Xh",
                table: "S_Student",
                type: "nvarchar(10)",
                maxLength: 10,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ZzId",
                table: "S_Student",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "ToStudentId",
                table: "C_InterviewNotify",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string));

            migrationBuilder.AddPrimaryKey(
                name: "PK_S_Student",
                table: "S_Student",
                column: "StudentId");

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "Description", "LastModify", "ResumeReceived" },
                values: new object[] { null, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), null });

            migrationBuilder.InsertData(
                table: "S_Student",
                columns: new[] { "StudentId", "Adress", "Csny", "Mail", "MzId", "Phone", "Xb", "Xh", "Xm", "ZzId" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", "null", "null", "null", "null", "null", "男", "2017050213", "吴知", "null" });

            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "InterviewDate", "Note" },
                values: new object[] { new DateTime(2020, 10, 19, 14, 20, 17, 903, DateTimeKind.Local).AddTicks(3878), null });

            migrationBuilder.AddForeignKey(
                name: "FK_C_InterviewNotify_S_Student_ToStudentId",
                table: "C_InterviewNotify",
                column: "ToStudentId",
                principalTable: "S_Student",
                principalColumn: "StudentId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
