using GetJob.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GetJob.Data
{
    public class AppDbContext : IdentityDbContext<Company>
    //: IdentityDbContext<
    //    IdentityUser, IdentityUserClaim<string>, IdentityUserLogin<string>,
    //    IdentityUserToken<string>, IdentityRole, IdentityRoleClaim<string>,
    //    IdentityUserRole<string>>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            // 使用业务的表
            modelBuilder.Entity<Company>(b =>
            {
                b.ToTable("C_Company");
            });
            modelBuilder.Entity<CompanyField>(b =>
            {
                b.ToTable("C_CompanyField");
            });
            //modelBuilder.Entity<Student>(b =>
            //{
            //    b.ToTable("S_Student");
            //});


            modelBuilder.Entity<IdentityUserClaim<string>>(b =>
            {
                b.ToTable("Sys_UserClaim");
            });

            modelBuilder.Entity<IdentityUserLogin<string>>(b =>
            {
                b.ToTable("Sys_UserLogin");
            });

            modelBuilder.Entity<IdentityUserToken<string>>(b =>
            {
                b.ToTable("Sys_UserToken");
            });

            modelBuilder.Entity<IdentityRole>(b =>
            {
                b.ToTable("Sys_Role");
            });

            modelBuilder.Entity<IdentityRoleClaim<string>>(b =>
            {
                b.ToTable("Sys_RoleClaim");
            });

            modelBuilder.Entity<IdentityUserRole<string>>(b =>
            {
                b.ToTable("Sys_UserRole");
            });

            #region 添加种子数据

            //modelBuilder.Entity<IdentityRole>().HasData(
            //    new IdentityRole(){ Id = "1", Name = "root", NormalizedName = "ROOT" }
            //);

            #endregion
        }
    }
}
