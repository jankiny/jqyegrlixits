using System;
using GetJob.Models;
using Microsoft.EntityFrameworkCore;

namespace GetJob.Data
{
    public class GetJobDbContext : DbContext
    {
        public GetJobDbContext(DbContextOptions<GetJobDbContext> options) : base(options)
        {
        }

        public DbSet<Company> Companies { get; set; }
        public DbSet<CompanyField> CompanyFields { get; set; }
        public DbSet<InterviewNotify> InterviewNotifies { get; set; }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<JobCharacter> JobCharacters { get; set; }
        public DbSet<JobKind> JobKinds { get; set; }
        public DbSet<JobPay> JobPays { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Nation> Nations { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Company>().ToTable("C_Company");
            modelBuilder.Entity<CompanyField>().ToTable("C_CompanyField");
            modelBuilder.Entity<InterviewNotify>().ToTable("C_InterviewNotify");
            modelBuilder.Entity<Job>().ToTable("C_Job");
            modelBuilder.Entity<JobCharacter>().ToTable("C_JobCharacter");
            modelBuilder.Entity<JobKind>().ToTable("C_JobKind");
            modelBuilder.Entity<JobPay>().ToTable("C_JobPay");
            modelBuilder.Entity<Student>().ToTable("S_Student");
            modelBuilder.Entity<Nation>().ToTable("S_Nation");

            #region 测试用种子数据

            var defaultGuid = new Guid("a1b0c2d4-eabc-1024-deed-adeabcdefabc");

            modelBuilder.Entity<CompanyField>().HasData(new CompanyField {CompanyFieldId = 1, Text = "服务业"});
            modelBuilder.Entity<Company>().HasData(new Company
                {Id = defaultGuid.ToString(), CompanyFieldId = 1, Name = "树苗", Description = "无"});
            modelBuilder.Entity<JobCharacter>().HasData(
                new JobCharacter {JobCharacterId = 1, Text = "全职"},
                new JobCharacter {JobCharacterId = 2, Text = "临时"},
                new JobCharacter {JobCharacterId = 3, Text = "实习"},
                new JobCharacter {JobCharacterId = 4, Text = "兼职"}
            );
            modelBuilder.Entity<JobKind>().HasData(
                new JobKind {JobKindId = 010000, Text = "计算机类"},
                new JobKind {JobKindId = 010001, Text = "测试"}
            );
            modelBuilder.Entity<JobPay>().HasData(
                new JobPay {JobPayId = 1, PayFrom = 0, PayTo = 1000, Text = "1000以下"},
                new JobPay {JobPayId = 2, PayFrom = 1000, PayTo = 2000, Text = "1000~2000"},
                new JobPay {JobPayId = 3, PayFrom = 2000, PayTo = 3000, Text = "2000~3000"},
                new JobPay {JobPayId = 4, PayFrom = 3000, PayTo = 4000, Text = "3000~4000"},
                new JobPay {JobPayId = 5, PayFrom = 4000, PayTo = 6000, Text = "4000~6000"},
                new JobPay {JobPayId = 6, PayFrom = 6000, PayTo = 8000, Text = "6000~8000"},
                new JobPay {JobPayId = 7, PayFrom = 8000, PayTo = 10000, Text = "8000~10000"},
                new JobPay {JobPayId = 8, PayFrom = 10000, PayTo = 15000, Text = "10000~15000"},
                new JobPay {JobPayId = 9, PayFrom = 15000, PayTo = 20000, Text = "15000~20000"},
                new JobPay {JobPayId = 10, PayFrom = 20000, PayTo = 30000, Text = "20000~30000"},
                new JobPay {JobPayId = 11, PayFrom = 30000, PayTo = 50000, Text = "30000~50000"},
                new JobPay {JobPayId = 12, PayFrom = 50000, PayTo = 10000000, Text = "50000以上"}
            );
            modelBuilder.Entity<Job>().HasData(new Job
            {
                Id = defaultGuid.ToString(),
                Name = "测试攻城师",
                CompanyId = defaultGuid.ToString(),
                JobCharacterId = 3,
                JobKindId = 010001,
                JobPayId = 4,
                Description = null,
                ResumeReceived = null
            });
            modelBuilder.Entity<InterviewNotify>().HasData(new InterviewNotify
            {
                Id = defaultGuid.ToString(),
                ToStudentId = defaultGuid.ToString(),
                JobId = defaultGuid.ToString(),
                Title = "通知测试种子数据",
                InterviewDate = DateTime.Now,
                InterviewLocation = "",
                Note = null
            });
            modelBuilder.Entity<Nation>().HasData(
                new Nation {NationId = 1, Text = "汉族"},
                new Nation {NationId = 2, Text = "蒙古族"}
            );
            modelBuilder.Entity<Student>().HasData(new Student
            {
                StudentId = defaultGuid.ToString(),
                Xh = "2017050213",
                Xm = "吴知",
                Xb = "男",
                Csny = "null",
                MzId = "null",
                ZzId = "null",
                Phone = "null",
                Mail = "null",
                Adress = "null"
            });

            #endregion
        }
    }
}