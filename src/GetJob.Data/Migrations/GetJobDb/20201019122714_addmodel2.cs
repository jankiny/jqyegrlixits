using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class addmodel2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "PoliticalMc",
                table: "S_Provinces",
                maxLength: 50,
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldMaxLength: 50);

            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "InterviewDate",
                value: new DateTime(2020, 10, 19, 20, 27, 14, 64, DateTimeKind.Local).AddTicks(5077));

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "LastModify",
                value: new DateTime(2020, 10, 19, 20, 27, 14, 62, DateTimeKind.Local).AddTicks(9722));

            migrationBuilder.UpdateData(
                table: "S_Student",
                keyColumn: "SID",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "Csny", "Jdsj" },
                values: new object[] { new DateTime(2020, 10, 19, 20, 27, 14, 65, DateTimeKind.Local).AddTicks(164), new DateTime(2020, 10, 19, 20, 27, 14, 65, DateTimeKind.Local).AddTicks(2765) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "PoliticalMc",
                table: "S_Provinces",
                type: "int",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldMaxLength: 50,
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "InterviewDate",
                value: new DateTime(2020, 10, 19, 20, 20, 43, 478, DateTimeKind.Local).AddTicks(7362));

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "LastModify",
                value: new DateTime(2020, 10, 19, 20, 20, 43, 477, DateTimeKind.Local).AddTicks(605));

            migrationBuilder.UpdateData(
                table: "S_Student",
                keyColumn: "SID",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                columns: new[] { "Csny", "Jdsj" },
                values: new object[] { new DateTime(2020, 10, 19, 20, 20, 43, 479, DateTimeKind.Local).AddTicks(2712), new DateTime(2020, 10, 19, 20, 20, 43, 479, DateTimeKind.Local).AddTicks(5695) });
        }
    }
}
