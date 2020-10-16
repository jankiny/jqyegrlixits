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
        }
    }
}
