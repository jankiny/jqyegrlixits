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
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Company>().ToTable("C_Company");
            modelBuilder.Entity<CompanyField>().ToTable("C_CompanyField");
            modelBuilder.Entity<InterviewNotify>().ToTable("C_InterviewNotify");
            modelBuilder.Entity<Job>().ToTable("C_Job");
            modelBuilder.Entity<JobCharacter>().ToTable("C_JobCharacter");
            modelBuilder.Entity<JobCharacter>().HasData(
                new JobCharacter { Id = 1, Text = "全职" },
                new JobCharacter { Id = 1, Text = "临时" },
                new JobCharacter { Id = 1, Text = "实习" },
                new JobCharacter { Id = 1, Text = "兼职" }
                );
            modelBuilder.Entity<JobKind>().ToTable("C_JobKind");
            modelBuilder.Entity<JobKind>().HasData(
                new JobKind {}
                );
            modelBuilder.Entity<JobPay>().ToTable("C_JobPay");
            modelBuilder.Entity<JobPay>().HasData(
                new JobPay { PayFrom = 0, PayTo = 1000, Text = "1000以下" },
                new JobPay { PayFrom = 1000, PayTo = 2000, Text = "1000~2000" },
                new JobPay { PayFrom = 2000, PayTo = 3000, Text = "2000~3000" },
                new JobPay { PayFrom = 3000, PayTo = 4000, Text = "3000~4000" },
                new JobPay { PayFrom = 4000, PayTo = 6000, Text = "4000~6000" },
                new JobPay { PayFrom = 6000, PayTo = 8000, Text = "6000~8000" },
                new JobPay { PayFrom = 8000, PayTo = 10000, Text = "8000~10000" },
                new JobPay { PayFrom = 10000, PayTo = 15000, Text = "10000~15000" },
                new JobPay { PayFrom = 15000, PayTo = 20000, Text = "15000~20000" },
                new JobPay { PayFrom = 20000, PayTo = 30000, Text = "20000~30000" },
                new JobPay { PayFrom = 30000, PayTo = 50000, Text = "30000~50000" },
                new JobPay { PayFrom = 50000, PayTo = 10000000, Text = "50000以上" }
                );
            modelBuilder.Entity<Student>().ToTable("S_Student");
        }
    }
}
