﻿// <auto-generated />
using System;
using GetJob.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace GetJob.Data.Migrations.GetJobDb
{
    [DbContext(typeof(GetJobDbContext))]
    [Migration("20201025144633_InitialDb")]
    partial class InitialDb
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("GetJob.Models.Company", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("CompanyFieldId")
                        .HasColumnType("int");

                    b.Property<int>("CompanyScaleId")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(450)")
                        .HasMaxLength(450);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.HasIndex("CompanyFieldId");

                    b.HasIndex("CompanyScaleId");

                    b.ToTable("C_Company");
                });

            modelBuilder.Entity("GetJob.Models.CompanyField", b =>
                {
                    b.Property<int>("CompanyFieldId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("CompanyFieldId");

                    b.ToTable("Dir_CompanyField");
                });

            modelBuilder.Entity("GetJob.Models.CompanyScale", b =>
                {
                    b.Property<int>("CompanyScaleId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("CompanyScaleId");

                    b.ToTable("Dir_CompanyScale");
                });

            modelBuilder.Entity("GetJob.Models.Degree", b =>
                {
                    b.Property<int>("DegreeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("DegreeId");

                    b.ToTable("Dir_Degree");
                });

            modelBuilder.Entity("GetJob.Models.Deliver", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("DeliverDateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("DeliverStatusId")
                        .HasColumnType("int");

                    b.Property<string>("JobId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("ResumeSubmittedId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("DeliverStatusId");

                    b.HasIndex("JobId");

                    b.HasIndex("ResumeSubmittedId");

                    b.ToTable("S_Deliver");
                });

            modelBuilder.Entity("GetJob.Models.DeliverStatus", b =>
                {
                    b.Property<int>("DeliverStatusId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("DeliverStatusId");

                    b.ToTable("Dir_DeliverStatus");
                });

            modelBuilder.Entity("GetJob.Models.InterviewNotify", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("DeliverId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("InterviewDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("InterviewLocation")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Note")
                        .HasColumnType("nvarchar(100)")
                        .HasMaxLength(100);

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.HasIndex("DeliverId");

                    b.ToTable("C_InterviewNotify");
                });

            modelBuilder.Entity("GetJob.Models.Job", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("CompanyId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("DegreeId")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(450)")
                        .HasMaxLength(450);

                    b.Property<int>("JobCharacterId")
                        .HasColumnType("int");

                    b.Property<int>("JobKindId")
                        .HasColumnType("int");

                    b.Property<int>("JobPayId")
                        .HasColumnType("int");

                    b.Property<int>("JobStatusId")
                        .HasColumnType("int");

                    b.Property<DateTime>("LastModify")
                        .HasColumnType("datetime2");

                    b.Property<int>("LocationId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<int>("RecruitNumber")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CompanyId");

                    b.HasIndex("DegreeId");

                    b.HasIndex("JobCharacterId");

                    b.HasIndex("JobKindId");

                    b.HasIndex("JobPayId");

                    b.HasIndex("JobStatusId");

                    b.HasIndex("LocationId");

                    b.ToTable("C_Job");
                });

            modelBuilder.Entity("GetJob.Models.JobCharacter", b =>
                {
                    b.Property<int>("JobCharacterId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("JobCharacterId");

                    b.ToTable("Dir_JobCharacter");
                });

            modelBuilder.Entity("GetJob.Models.JobCollection", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("CollectionDateTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("JobId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("StudentId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("JobId");

                    b.HasIndex("StudentId");

                    b.ToTable("S_JobCollection");
                });

            modelBuilder.Entity("GetJob.Models.JobKind", b =>
                {
                    b.Property<int>("JobKindId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("JobKindId");

                    b.ToTable("Dir_JobKind");
                });

            modelBuilder.Entity("GetJob.Models.JobPay", b =>
                {
                    b.Property<int>("JobPayId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<double>("PayFrom")
                        .HasColumnType("float");

                    b.Property<double>("PayTo")
                        .HasColumnType("float");

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("JobPayId");

                    b.ToTable("Dir_JobPay");
                });

            modelBuilder.Entity("GetJob.Models.JobStatus", b =>
                {
                    b.Property<int>("JobStatusId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("JobStatusId");

                    b.ToTable("Dir_JobStatus");
                });

            modelBuilder.Entity("GetJob.Models.Location", b =>
                {
                    b.Property<int>("LocationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("LocationId");

                    b.ToTable("Dir_Location");
                });

            modelBuilder.Entity("GetJob.Models.Nation", b =>
                {
                    b.Property<int>("NationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("NationId");

                    b.ToTable("Dir_Nation");
                });

            modelBuilder.Entity("GetJob.Models.PoliticalOutlook", b =>
                {
                    b.Property<int>("PoliticalOutlookId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("PoliticalOutlookId");

                    b.ToTable("Dir_PoliticalOutlook");
                });

            modelBuilder.Entity("GetJob.Models.Resume", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Certificate")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("CreateDateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("ForJobAddressId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobCharacterId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobKindId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobPayId")
                        .HasColumnType("int");

                    b.Property<string>("SelfEvaluation")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("State")
                        .HasColumnType("nvarchar(10)")
                        .HasMaxLength(10);

                    b.Property<string>("StudentId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("Visible")
                        .HasColumnType("nvarchar(2)")
                        .HasMaxLength(2);

                    b.Property<string>("WorkExperience")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ForJobAddressId");

                    b.HasIndex("ForJobCharacterId");

                    b.HasIndex("ForJobKindId");

                    b.HasIndex("ForJobPayId");

                    b.HasIndex("StudentId");

                    b.ToTable("S_Resume");
                });

            modelBuilder.Entity("GetJob.Models.ResumeSubmitted", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Certificate")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("CreateDateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("ForJobAddressId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobCharacterId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobKindId")
                        .HasColumnType("int");

                    b.Property<int>("ForJobPayId")
                        .HasColumnType("int");

                    b.Property<string>("SelfEvaluation")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("State")
                        .HasColumnType("nvarchar(10)")
                        .HasMaxLength(10);

                    b.Property<string>("StudentId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("Visible")
                        .HasColumnType("nvarchar(2)")
                        .HasMaxLength(2);

                    b.Property<string>("WorkExperience")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ForJobAddressId");

                    b.HasIndex("ForJobCharacterId");

                    b.HasIndex("ForJobKindId");

                    b.HasIndex("ForJobPayId");

                    b.HasIndex("StudentId");

                    b.ToTable("S_ResumeSubmitted");
                });

            modelBuilder.Entity("GetJob.Models.Student", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(200)")
                        .HasMaxLength(200);

                    b.Property<int>("BirthPlaceId")
                        .HasColumnType("int");

                    b.Property<DateTime>("Birthday")
                        .HasColumnType("datetime2");

                    b.Property<string>("College")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<int>("DegreeId")
                        .HasColumnType("int");

                    b.Property<string>("IdentityNumber")
                        .HasColumnType("nvarchar(18)")
                        .HasMaxLength(18);

                    b.Property<string>("Mail")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("Major")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<int>("NationId")
                        .HasColumnType("int");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(11)")
                        .HasMaxLength(11);

                    b.Property<int>("PoliticalOutlookId")
                        .HasColumnType("int");

                    b.Property<string>("Sex")
                        .HasColumnType("nvarchar(2)")
                        .HasMaxLength(2);

                    b.Property<DateTime>("StudyDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("BirthPlaceId");

                    b.HasIndex("DegreeId");

                    b.HasIndex("NationId");

                    b.HasIndex("PoliticalOutlookId");

                    b.ToTable("S_Student");
                });

            modelBuilder.Entity("GetJob.Models.StudentCollection", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("CollectionDateTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("CompanyId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("StudentId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("CompanyId");

                    b.HasIndex("StudentId");

                    b.ToTable("C_StudentCollection");
                });

            modelBuilder.Entity("GetJob.Models.Company", b =>
                {
                    b.HasOne("GetJob.Models.CompanyField", "CompanyField")
                        .WithMany()
                        .HasForeignKey("CompanyFieldId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.CompanyScale", "CompanyScale")
                        .WithMany()
                        .HasForeignKey("CompanyScaleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.Deliver", b =>
                {
                    b.HasOne("GetJob.Models.DeliverStatus", "DeliverStatus")
                        .WithMany()
                        .HasForeignKey("DeliverStatusId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Job", "Job")
                        .WithMany()
                        .HasForeignKey("JobId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.ResumeSubmitted", "ResumeSubmitted")
                        .WithMany()
                        .HasForeignKey("ResumeSubmittedId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.InterviewNotify", b =>
                {
                    b.HasOne("GetJob.Models.Deliver", "Deliver")
                        .WithMany()
                        .HasForeignKey("DeliverId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.Job", b =>
                {
                    b.HasOne("GetJob.Models.Company", "Company")
                        .WithMany()
                        .HasForeignKey("CompanyId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Degree", "Degree")
                        .WithMany()
                        .HasForeignKey("DegreeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobCharacter", "JobCharacter")
                        .WithMany()
                        .HasForeignKey("JobCharacterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobKind", "JobKind")
                        .WithMany()
                        .HasForeignKey("JobKindId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobPay", "JobPay")
                        .WithMany()
                        .HasForeignKey("JobPayId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobStatus", "JobStatus")
                        .WithMany()
                        .HasForeignKey("JobStatusId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Location", "Location")
                        .WithMany()
                        .HasForeignKey("LocationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.JobCollection", b =>
                {
                    b.HasOne("GetJob.Models.Job", "Job")
                        .WithMany()
                        .HasForeignKey("JobId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.Resume", b =>
                {
                    b.HasOne("GetJob.Models.Location", "ForJobAddress")
                        .WithMany()
                        .HasForeignKey("ForJobAddressId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobCharacter", "ForJobCharacter")
                        .WithMany()
                        .HasForeignKey("ForJobCharacterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobKind", "ForJobKind")
                        .WithMany()
                        .HasForeignKey("ForJobKindId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobPay", "ForJobPay")
                        .WithMany()
                        .HasForeignKey("ForJobPayId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.ResumeSubmitted", b =>
                {
                    b.HasOne("GetJob.Models.Location", "ForJobAddress")
                        .WithMany()
                        .HasForeignKey("ForJobAddressId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobCharacter", "ForJobCharacter")
                        .WithMany()
                        .HasForeignKey("ForJobCharacterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobKind", "ForJobKind")
                        .WithMany()
                        .HasForeignKey("ForJobKindId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.JobPay", "ForJobPay")
                        .WithMany()
                        .HasForeignKey("ForJobPayId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.Student", b =>
                {
                    b.HasOne("GetJob.Models.Location", "BirthPlace")
                        .WithMany()
                        .HasForeignKey("BirthPlaceId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Degree", "Degree")
                        .WithMany()
                        .HasForeignKey("DegreeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Nation", "Nation")
                        .WithMany()
                        .HasForeignKey("NationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.PoliticalOutlook", "PoliticalOutlook")
                        .WithMany()
                        .HasForeignKey("PoliticalOutlookId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.StudentCollection", b =>
                {
                    b.HasOne("GetJob.Models.Company", "Company")
                        .WithMany()
                        .HasForeignKey("CompanyId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("GetJob.Models.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}