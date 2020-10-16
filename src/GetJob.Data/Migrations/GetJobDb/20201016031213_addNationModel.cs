using Microsoft.EntityFrameworkCore.Migrations;

namespace GetJob.Data.Migrations.GetJobDb
{
    public partial class addNationModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Adress",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Csny",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Mail",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "MzId",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Phone",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Xb",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Xm",
                table: "S_Student",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ZzId",
                table: "S_Student",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "S_Nation",
                columns: table => new
                {
                    Id = table.Column<string>(maxLength: 2, nullable: false),
                    Text = table.Column<string>(maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_S_Nation", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "S_Nation");

            migrationBuilder.DropColumn(
                name: "Adress",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Csny",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Mail",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "MzId",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Phone",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Xb",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "Xm",
                table: "S_Student");

            migrationBuilder.DropColumn(
                name: "ZzId",
                table: "S_Student");
        }
    }
}
