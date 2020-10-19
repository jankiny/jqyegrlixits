using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GetJob.Data
{
    public class AppDbContext : IdentityDbContext
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
            modelBuilder.Entity<IdentityUser>(b => { b.ToTable("Sys_User"); });

            modelBuilder.Entity<IdentityUserClaim<string>>(b => { b.ToTable("Sys_UserClaim"); });

            modelBuilder.Entity<IdentityUserLogin<string>>(b => { b.ToTable("Sys_UserLogin"); });

            modelBuilder.Entity<IdentityUserToken<string>>(b => { b.ToTable("Sys_UserToken"); });

            modelBuilder.Entity<IdentityRole>(b => { b.ToTable("Sys_Role"); });

            modelBuilder.Entity<IdentityRoleClaim<string>>(b => { b.ToTable("Sys_RoleClaim"); });

            modelBuilder.Entity<IdentityUserRole<string>>(b => { b.ToTable("Sys_UserRole"); });

            #region 添加种子数据

            //modelBuilder.Entity<IdentityRole>().HasData(
            //    new IdentityRole(){ Id = "1", Name = "root", NormalizedName = "ROOT" }
            //);
            var defaultGuid = new Guid("3eed3eed-3eed-2020-3eed-123456789abc");
            modelBuilder.Entity<IdentityUser>().HasData(
                new IdentityUser
                {
                    Id = defaultGuid.ToString(),
                    UserName = "test",
                    NormalizedUserName = "TEST",
                    Email = "123456@test.com",
                    NormalizedEmail = "123456@TEST.COM",
                    EmailConfirmed = true,
                    PasswordHash =
                        "AQAAAAEAACcQAAAAEJUaVTjZwGFbhiLxeTG8AeKARILXbRDwAjE5iBCLO/Yt/YLkqN0EBWQafi+Q1JJsAg==",
                    SecurityStamp = "EUKRFQG3CKQNR33NIXQEH6D4SZHKD4H5",
                    ConcurrencyStamp = "e559ae7b-3a71-4047-878e-845df8688436",
                    PhoneNumber = "12387654321",
                    PhoneNumberConfirmed = false,
                    TwoFactorEnabled = false,
                    LockoutEnd = null,
                    LockoutEnabled = true,
                    AccessFailedCount = 0
                }
            );
            //modelBuilder.Entity<IdentityUserClaim<string>>().HasData(
            //    new IdentityUserClaim<string>
            //    {
            //        Id = 1,
            //        UserId = defaultGuid.ToString(),
            //        ClaimType = "Identity",
            //        ClaimValue = "Company"
            //    },
            //    new IdentityUserClaim<string>
            //    {
            //        Id = 1,
            //        UserId = defaultGuid.ToString(),
            //        ClaimType = "CompanyId",
            //        ClaimValue = defaultGuid.ToString()
            //    });

            #endregion
        }
    }
}