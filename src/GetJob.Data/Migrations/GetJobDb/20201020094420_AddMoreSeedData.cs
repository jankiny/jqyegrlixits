using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class AddMoreSeedData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "InterviewDate",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 794, DateTimeKind.Local).AddTicks(6653));

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "LastModify",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 791, DateTimeKind.Local).AddTicks(482));

            migrationBuilder.UpdateData(
                table: "C_StudentCollection",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CollectionDateTime",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 795, DateTimeKind.Local).AddTicks(2310));

            migrationBuilder.UpdateData(
                table: "Dir_DeliverStatus",
                keyColumn: "DeliverStatusId",
                keyValue: 1,
                column: "Text",
                value: "待审核");

            migrationBuilder.UpdateData(
                table: "Dir_DeliverStatus",
                keyColumn: "DeliverStatusId",
                keyValue: 2,
                column: "Text",
                value: "审核通过");

            migrationBuilder.InsertData(
                table: "Dir_DeliverStatus",
                columns: new[] { "DeliverStatusId", "Text" },
                values: new object[] { 3, "审核未通过" });

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 2,
                column: "Text",
                value: "1k~2k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 3,
                column: "Text",
                value: "2k~3k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 4,
                column: "Text",
                value: "3k~4k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 5,
                column: "Text",
                value: "4k~6k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 6,
                column: "Text",
                value: "6k~8k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 7,
                column: "Text",
                value: "8k~1k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 8,
                column: "Text",
                value: "10k~15k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 9,
                column: "Text",
                value: "15k~20k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 10,
                column: "Text",
                value: "20k~30k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 11,
                column: "Text",
                value: "30k~50k");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 12,
                column: "Text",
                value: "50k以上");

            migrationBuilder.InsertData(
                table: "Dir_JobStatus",
                columns: new[] { "JobStatusId", "Text" },
                values: new object[] { 2, "招聘结束" });

            migrationBuilder.InsertData(
                table: "Dir_Location",
                columns: new[] { "LocationId", "Text" },
                values: new object[,]
                {
                    { 330200, "浙江省宁波市" },
                    { 110000, "北京市" }
                });

            migrationBuilder.UpdateData(
                table: "S_Deliver",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "DeliverDateTime",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 794, DateTimeKind.Local).AddTicks(4045));

            migrationBuilder.UpdateData(
                table: "S_JobCollection",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CollectionDateTime",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 794, DateTimeKind.Local).AddTicks(9865));

            migrationBuilder.UpdateData(
                table: "S_Resume",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CreateDateTime",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 793, DateTimeKind.Local).AddTicks(571));

            migrationBuilder.UpdateData(
                table: "S_ResumeSubmitted",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CreateDateTime",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 793, DateTimeKind.Local).AddTicks(6402));

            migrationBuilder.UpdateData(
                table: "S_Student",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "Birthday",
                value: new DateTime(2020, 10, 20, 17, 44, 19, 792, DateTimeKind.Local).AddTicks(4947));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Dir_DeliverStatus",
                keyColumn: "DeliverStatusId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Dir_JobStatus",
                keyColumn: "JobStatusId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Dir_Location",
                keyColumn: "LocationId",
                keyValue: 110000);

            migrationBuilder.DeleteData(
                table: "Dir_Location",
                keyColumn: "LocationId",
                keyValue: 330200);

            migrationBuilder.UpdateData(
                table: "C_InterviewNotify",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "InterviewDate",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 985, DateTimeKind.Local).AddTicks(9126));

            migrationBuilder.UpdateData(
                table: "C_Job",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "LastModify",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 982, DateTimeKind.Local).AddTicks(2074));

            migrationBuilder.UpdateData(
                table: "C_StudentCollection",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CollectionDateTime",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 986, DateTimeKind.Local).AddTicks(5023));

            migrationBuilder.UpdateData(
                table: "Dir_DeliverStatus",
                keyColumn: "DeliverStatusId",
                keyValue: 1,
                column: "Text",
                value: "未审核");

            migrationBuilder.UpdateData(
                table: "Dir_DeliverStatus",
                keyColumn: "DeliverStatusId",
                keyValue: 2,
                column: "Text",
                value: "已审核");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 2,
                column: "Text",
                value: "1000~2000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 3,
                column: "Text",
                value: "2000~3000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 4,
                column: "Text",
                value: "3000~4000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 5,
                column: "Text",
                value: "4000~6000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 6,
                column: "Text",
                value: "6000~8000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 7,
                column: "Text",
                value: "8000~10000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 8,
                column: "Text",
                value: "10000~15000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 9,
                column: "Text",
                value: "15000~20000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 10,
                column: "Text",
                value: "20000~30000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 11,
                column: "Text",
                value: "30000~50000");

            migrationBuilder.UpdateData(
                table: "Dir_JobPay",
                keyColumn: "JobPayId",
                keyValue: 12,
                column: "Text",
                value: "50000以上");

            migrationBuilder.UpdateData(
                table: "S_Deliver",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "DeliverDateTime",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 985, DateTimeKind.Local).AddTicks(6509));

            migrationBuilder.UpdateData(
                table: "S_JobCollection",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CollectionDateTime",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 986, DateTimeKind.Local).AddTicks(2511));

            migrationBuilder.UpdateData(
                table: "S_Resume",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CreateDateTime",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 984, DateTimeKind.Local).AddTicks(2564));

            migrationBuilder.UpdateData(
                table: "S_ResumeSubmitted",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "CreateDateTime",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 984, DateTimeKind.Local).AddTicks(8603));

            migrationBuilder.UpdateData(
                table: "S_Student",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc",
                column: "Birthday",
                value: new DateTime(2020, 10, 20, 0, 20, 5, 983, DateTimeKind.Local).AddTicks(6641));
        }
    }
}
