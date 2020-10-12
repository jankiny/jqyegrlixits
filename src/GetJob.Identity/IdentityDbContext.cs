using GetJob.Model;
using Identity.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Identity
{
    public class IdentityDbContext : IdentityDbContext<AppUser>
    //: IdentityDbContext<
    //    IdentityUser, IdentityUserClaim<string>, IdentityUserLogin<string>,
    //    IdentityUserToken<string>, IdentityRole, IdentityRoleClaim<string>,
    //    IdentityUserRole<string>>
    {
        public IdentityDbContext(DbContextOptions<IdentityDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            // 使用系统的表
            modelBuilder.Entity<Company>().ToTable("Company");

            modelBuilder.Entity<AppUser>(b =>
            {
                b.ToTable("Users");
            });

            modelBuilder.Entity<IdentityUserClaim<string>>(b =>
            {
                b.ToTable("UserClaims");
            });

            modelBuilder.Entity<IdentityUserLogin<string>>(b =>
            {
                b.ToTable("UserLogins");
            });

            modelBuilder.Entity<IdentityUserToken<string>>(b =>
            {
                b.ToTable("UserTokens");
            });

            modelBuilder.Entity<IdentityRole>(b =>
            {
                b.ToTable("Roles");
            });

            modelBuilder.Entity<IdentityRoleClaim<string>>(b =>
            {
                b.ToTable("RoleClaims");
            });

            modelBuilder.Entity<IdentityUserRole<string>>(b =>
            {
                b.ToTable("UserRoles");
            });

            #region 添加种子数据

            modelBuilder.Entity<IdentityRole>().HasData(
                new IdentityRole(){ Id = "1", Name = "root", NormalizedName = "ROOT" }
            );

            #endregion
        }
    }
}
