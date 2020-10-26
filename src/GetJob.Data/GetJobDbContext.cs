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
    public DbSet<CompanyScale> CompanyScales { get; set; }
    public DbSet<Degree> Degrees { get; set; }
    public DbSet<Deliver> Delivers { get; set; }
    public DbSet<DeliverStatus> DeliverStatuses { get; set; }
    public DbSet<InterviewNotify> InterviewNotifies { get; set; }
    public DbSet<Job> Jobs { get; set; }
    public DbSet<JobCharacter> JobCharacters { get; set; }
    public DbSet<JobCollection> JobCollections { get; set; }
    public DbSet<JobKind> JobKinds { get; set; }
    public DbSet<JobPay> JobPays { get; set; }
    public DbSet<JobStatus> JobStatuses { get; set; }
    public DbSet<Location> Locations { get; set; }
    public DbSet<Nation> Nations { get; set; }
    public DbSet<PoliticalOutlook> PoliticalOutlooks { get; set; }
    public DbSet<Resume> Resumes { get; set; }
    public DbSet<ResumeSubmitted> SubmittedResumes { get; set; }
    public DbSet<Student> Students { get; set; }
    public DbSet<StudentCollection> StudentCollections { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Company>().ToTable("C_Company");
        modelBuilder.Entity<CompanyField>().ToTable("Dir_CompanyField");
        modelBuilder.Entity<CompanyScale>().ToTable("Dir_CompanyScale");
        modelBuilder.Entity<Degree>().ToTable("Dir_Degree");
        modelBuilder.Entity<Deliver>().ToTable("S_Deliver");
        modelBuilder.Entity<DeliverStatus>().ToTable("Dir_DeliverStatus");
        modelBuilder.Entity<InterviewNotify>().ToTable("C_InterviewNotify");
        modelBuilder.Entity<Job>().ToTable("C_Job");
        modelBuilder.Entity<JobCharacter>().ToTable("Dir_JobCharacter");
        modelBuilder.Entity<JobCollection>().ToTable("S_JobCollection");
        modelBuilder.Entity<JobKind>().ToTable("Dir_JobKind");
        modelBuilder.Entity<JobPay>().ToTable("Dir_JobPay");
        modelBuilder.Entity<JobStatus>().ToTable("Dir_JobStatus");
        modelBuilder.Entity<Location>().ToTable("Dir_Location");
        modelBuilder.Entity<Nation>().ToTable("Dir_Nation");
        modelBuilder.Entity<PoliticalOutlook>().ToTable("Dir_PoliticalOutlook");
        modelBuilder.Entity<Resume>().ToTable("S_Resume");
        modelBuilder.Entity<ResumeSubmitted>().ToTable("S_ResumeSubmitted");
        modelBuilder.Entity<Student>().ToTable("S_Student");
        modelBuilder.Entity<StudentCollection>().ToTable("C_StudentCollection");

        

        #region 测试用种子数据

        //var defaultGuid = new Guid("3eed3eed-3eed-2020-3eed-123456789abc");
        //modelBuilder.Entity<CompanyField>().HasData(new CompanyField {CompanyFieldId = 1, Text = "服务业"});
        //modelBuilder.Entity<CompanyScale>().HasData(new CompanyScale {CompanyScaleId = 1, Text = "20人以下"});
        //modelBuilder.Entity<Company>().HasData(
        //    new Company
        //    {
        //        Id = defaultGuid.ToString(),
        //        CompanyFieldId = 1,
        //        CompanyScaleId = 1,
        //        Name = "树苗",
        //        Description = "无"
        //    });
        //modelBuilder.Entity<JobCharacter>().HasData(
        //    new JobCharacter {JobCharacterId = 1, Text = "全职"},
        //    new JobCharacter {JobCharacterId = 2, Text = "临时"},
        //    new JobCharacter {JobCharacterId = 3, Text = "实习"},
        //    new JobCharacter {JobCharacterId = 4, Text = "兼职"}
        //);
        //modelBuilder.Entity<JobKind>().HasData(
        //    new JobKind {JobKindId = 010000, Text = "计算机类"},
        //    new JobKind {JobKindId = 010001, Text = "测试"}
        //);
        //modelBuilder.Entity<JobPay>().HasData(
        //    new JobPay {JobPayId = 1, PayFrom = 0, PayTo = 1000, Text = "1000以下"},
        //    new JobPay {JobPayId = 2, PayFrom = 1000, PayTo = 2000, Text = "1k~2k"},
        //    new JobPay {JobPayId = 3, PayFrom = 2000, PayTo = 3000, Text = "2k~3k"},
        //    new JobPay {JobPayId = 4, PayFrom = 3000, PayTo = 4000, Text = "3k~4k"},
        //    new JobPay {JobPayId = 5, PayFrom = 4000, PayTo = 6000, Text = "4k~6k"},
        //    new JobPay {JobPayId = 6, PayFrom = 6000, PayTo = 8000, Text = "6k~8k"},
        //    new JobPay {JobPayId = 7, PayFrom = 8000, PayTo = 10000, Text = "8k~1k"},
        //    new JobPay {JobPayId = 8, PayFrom = 10000, PayTo = 15000, Text = "10k~15k"},
        //    new JobPay {JobPayId = 9, PayFrom = 15000, PayTo = 20000, Text = "15k~20k"},
        //    new JobPay {JobPayId = 10, PayFrom = 20000, PayTo = 30000, Text = "20k~30k"},
        //    new JobPay {JobPayId = 11, PayFrom = 30000, PayTo = 50000, Text = "30k~50k"},
        //    new JobPay {JobPayId = 12, PayFrom = 50000, PayTo = 10000000, Text = "50k以上"}
        //);
        //modelBuilder.Entity<JobStatus>().HasData(new JobStatus
        //    {
        //        JobStatusId = 1,
        //        Text = "招聘中"
        //    }, new JobStatus
        //    {
        //        JobStatusId = 2,
        //        Text = "招聘结束"
        //    }
        //);
        //modelBuilder.Entity<Location>().HasData(
        //    new Location
        //    {
        //        LocationId = 110000,
        //        Text = "北京市"
        //    },
        //    new Location
        //    {
        //        LocationId = 330000,
        //        Text = "浙江省"
        //    },
        //    new Location
        //    {
        //        LocationId = 330100,
        //        Text = "浙江省杭州市"
        //    },
        //    new Location
        //    {
        //        LocationId = 330200,
        //        Text = "浙江省宁波市"
        //    },
        //    new Location
        //    {
        //        LocationId = 330105,
        //        Text = "浙江省杭州市拱墅区"
        //    },
        //    new Location
        //    {
        //        LocationId = 330106,
        //        Text = "浙江省杭州市西湖区"
        //    });
        //modelBuilder.Entity<Degree>().HasData(
        //    new Degree
        //    {
        //        DegreeId = 1,
        //        Text = "博士后"
        //    },
        //    new Degree
        //    {
        //        DegreeId = 2,
        //        Text = "博士"
        //    }
        //);
        //modelBuilder.Entity<Job>().HasData(new Job
        //{
        //    Id = defaultGuid.ToString(),
        //    Name = "测试攻城师",
        //    CompanyId = defaultGuid.ToString(),
        //    JobCharacterId = 3,
        //    JobKindId = 010001,
        //    JobPayId = 4,
        //    JobStatusId = 1,
        //    LocationId = 330105,
        //    DegreeId = 2,
        //    RecruitNumber = 19,
        //    Description = "",
        //    LastModify = DateTime.Now
        //});

        //modelBuilder.Entity<Nation>().HasData(
        //    new Nation {NationId = 1, Text = "汉族"},
        //    new Nation {NationId = 2, Text = "蒙古族"}
        //);
        //modelBuilder.Entity<PoliticalOutlook>().HasData(
        //    new PoliticalOutlook {PoliticalOutlookId = 1, Text = "共青团员"},
        //    new PoliticalOutlook {PoliticalOutlookId = 2, Text = "中共党员"}
        //);

        //modelBuilder.Entity<Student>().HasData(new Student
        //{
        //    Id = defaultGuid.ToString(),
        //    IdentityNumber = "330682199909301038",
        //    Name = "吴知",
        //    Sex = "男",
        //    Address = "null",
        //    BirthPlaceId = 330106,
        //    Birthday = DateTime.Now,
        //    NationId = 1,
        //    PoliticalOutlookId = 1,
        //    Phone = "12345678900",
        //    Mail = "123@123.com",
        //    Major = "计算机",
        //    College = "浙江树人大学",
        //    StudyDate = new DateTime(2017, 9, 10),
        //    DegreeId = 2
        //});
        //modelBuilder.Entity<Resume>().HasData(
        //    new Resume
        //    {
        //        Id = defaultGuid.ToString(),
        //        StudentId = defaultGuid.ToString(),
        //        Title = "简历种子数据",
        //        CreateDateTime = DateTime.Now,
        //        ForJobKindId = 010001,
        //        ForJobAddressId = 330105,
        //        ForJobCharacterId = 1,
        //        ForJobPayId = 1,
        //        Certificate = "",
        //        WorkExperience = "",
        //        SelfEvaluation = "",
        //        State = "",
        //        Visible = ""
        //    }
        //    );

        //modelBuilder.Entity<ResumeSubmitted>().HasData(
        //    new ResumeSubmitted
        //    {
        //        Id = defaultGuid.ToString(),
        //        StudentId = defaultGuid.ToString(),
        //        Title = "简历种子数据",
        //        CreateDateTime = DateTime.Now,
        //        ForJobKindId = 010001,
        //        ForJobAddressId = 330105,
        //        ForJobCharacterId = 1,
        //        ForJobPayId = 1,
        //        Certificate = "",
        //        WorkExperience = "",
        //        SelfEvaluation = "",
        //        State = "",
        //        Visible = ""
        //    });
        //modelBuilder.Entity<DeliverStatus>().HasData(
        //    new DeliverStatus
        //    {
        //        DeliverStatusId = 1,
        //        Text = "待审核"
        //    },
        //    new DeliverStatus
        //    {
        //        DeliverStatusId = 2,
        //        Text = "审核通过"
        //    },
        //    new DeliverStatus
        //    {
        //        DeliverStatusId = 3,
        //        Text = "审核未通过"
        //    });

        //modelBuilder.Entity<Deliver>().HasData(
        //    new Deliver
        //    {
        //        Id = defaultGuid.ToString(),
        //        JobId = defaultGuid.ToString(),
        //        ResumeSubmittedId = defaultGuid.ToString(),
        //        DeliverStatusId = 1,
        //        DeliverDateTime = DateTime.Now
        //    });
        //modelBuilder.Entity<InterviewNotify>().HasData(new InterviewNotify
        //{
        //    Id = defaultGuid.ToString(),
        //    DeliverId = defaultGuid.ToString(),
        //    Title = "通知测试种子数据",
        //    InterviewDate = DateTime.Now,
        //    InterviewLocation = "",
        //    Note = ""
        //});
        //modelBuilder.Entity<JobCollection>().HasData(new JobCollection
        //{
        //    Id = defaultGuid.ToString(),
        //    StudentId = defaultGuid.ToString(),
        //    JobId = defaultGuid.ToString(),
        //    CollectionDateTime = DateTime.Now
        //});
        //modelBuilder.Entity<StudentCollection>().HasData(new StudentCollection
        //{
        //    Id = defaultGuid.ToString(),
        //    StudentId = defaultGuid.ToString(),
        //    CompanyId = defaultGuid.ToString(),
        //    CollectionDateTime = DateTime.Now
        //});

        #endregion

    }
}
}