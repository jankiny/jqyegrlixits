using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class ChangeJobModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            migrationBuilder.DeleteData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            migrationBuilder.DeleteData(
                table: "S_Student",
                keyColumn: "StudentId",
                keyValue: "a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            migrationBuilder.DeleteData(
                table: "C_Company",
                keyColumn: "Id",
                keyValue: "a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastModify",
                table: "C_Job",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.InsertData(
                table: "C_Company",
                columns: new[] { "Id", "CompanyFieldId", "Description", "Name" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", 1, "无", "树苗" });

            migrationBuilder.InsertData(
                table: "S_Student",
                columns: new[] { "StudentId", "Adress", "Csny", "Mail", "MzId", "Phone", "Xb", "Xh", "Xm", "ZzId" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", "null", "null", "null", "null", "null", "男", "2017050213", "吴知", "null" });

            migrationBuilder.InsertData(
                table: "C_Job",
                columns: new[] { "Id", "CompanyId", "Description", "JobCharacterId", "JobKindId", "JobPayId", "LastModify", "Name", "ResumeReceived" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", "3eed3eed-3eed-2020-3eed-123456789abc", null, 3, 10001, 4, new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), "测试攻城师", null });

            migrationBuilder.InsertData(
                table: "C_InterviewNotify",
                columns: new[] { "Id", "InterviewDate", "InterviewLocation", "JobId", "Note", "Title", "ToStudentId" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", new DateTime(2020, 10, 19, 14, 20, 17, 903, DateTimeKind.Local).AddTicks(3878), "", "3eed3eed-3eed-2020-3eed-123456789abc", null, "通知测试种子数据", "3eed3eed-3eed-2020-3eed-123456789abc" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DeleteData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DeleteData(
                table: "S_Student",
                keyColumn: "StudentId",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DeleteData(
                table: "C_Company",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.DropColumn(
                name: "LastModify",
                table: "C_Job");

            migrationBuilder.InsertData(
                table: "C_Company",
                columns: new[] { "Id", "CompanyFieldId", "Description", "Name" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", 1, "无", "树苗" });

            migrationBuilder.InsertData(
                table: "S_Student",
                columns: new[] { "StudentId", "Adress", "Csny", "Mail", "MzId", "Phone", "Xb", "Xh", "Xm", "ZzId" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", "null", "null", "null", "null", "null", "男", "2017050213", "吴知", "null" });

            migrationBuilder.InsertData(
                table: "C_Job",
                columns: new[] { "Id", "CompanyId", "Description", "JobCharacterId", "JobKindId", "JobPayId", "Name", "ResumeReceived" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", "a1b0c2d4-eabc-1024-deed-adeabcdefabc", null, 3, 10001, 4, "测试攻城师", null });

            migrationBuilder.InsertData(
                table: "C_InterviewNotify",
                columns: new[] { "Id", "InterviewDate", "InterviewLocation", "JobId", "Note", "Title", "ToStudentId" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", new DateTime(2020, 10, 19, 9, 35, 35, 652, DateTimeKind.Local).AddTicks(4948), "", "a1b0c2d4-eabc-1024-deed-adeabcdefabc", null, "通知测试种子数据", "a1b0c2d4-eabc-1024-deed-adeabcdefabc" });
        }
    }
}
