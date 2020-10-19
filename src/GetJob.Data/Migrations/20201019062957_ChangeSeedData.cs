using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations
{
    public partial class ChangeSeedData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Sys_User",
                keyColumn: "Id",
                keyValue: "a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            migrationBuilder.InsertData(
                table: "Sys_User",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "3eed3eed-3eed-2020-3eed-123456789abc", 0, "e559ae7b-3a71-4047-878e-845df8688436", "123456@test.com", true, true, null, "123456@TEST.COM", "TEST", "AQAAAAEAACcQAAAAEJUaVTjZwGFbhiLxeTG8AeKARILXbRDwAjE5iBCLO/Yt/YLkqN0EBWQafi+Q1JJsAg==", "12387654321", false, "EUKRFQG3CKQNR33NIXQEH6D4SZHKD4H5", false, "test" });

            migrationBuilder.InsertData(
                table: "Sys_UserClaim",
                columns: new[] { "Id", "ClaimType", "ClaimValue", "UserId" },
                values: new object[] { 1, "Identity", "Company", "3eed3eed-3eed-2020-3eed-123456789abc" });

            migrationBuilder.InsertData(
                table: "Sys_UserClaim",
                columns: new[] { "Id", "ClaimType", "ClaimValue", "UserId" },
                values: new object[] { 2, "CompanyId", "3eed3eed-3eed-2020-3eed-123456789abc", "3eed3eed-3eed-2020-3eed-123456789abc" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Sys_UserClaim",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Sys_UserClaim",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Sys_User",
                keyColumn: "Id",
                keyValue: "3eed3eed-3eed-2020-3eed-123456789abc");

            migrationBuilder.InsertData(
                table: "Sys_User",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "a1b0c2d4-eabc-1024-deed-adeabcdefabc", 0, "e559ae7b-3a71-4047-878e-845df8688436", "123456@test.com", true, true, null, "123456@TEST.COM", "TEST", "AQAAAAEAACcQAAAAEJUaVTjZwGFbhiLxeTG8AeKARILXbRDwAjE5iBCLO/Yt/YLkqN0EBWQafi+Q1JJsAg==", "12387654321", false, "EUKRFQG3CKQNR33NIXQEH6D4SZHKD4H5", false, "test" });
        }
    }
}
