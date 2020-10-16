﻿// <auto-generated />
using System;
using GetJob.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace GetJob.Data.Migrations.GetJobDb
{
    [DbContext(typeof(GetJobDbContext))]
    partial class GetJobDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
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

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.HasIndex("CompanyFieldId");

                    b.ToTable("C_Company");
                });

            modelBuilder.Entity("GetJob.Models.CompanyField", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("C_CompanyField");
                });

            modelBuilder.Entity("GetJob.Models.InterviewNotify", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime>("InterviewDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("InterviewLocation")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("JobId")
                        .HasColumnType("int");

                    b.Property<string>("JobId1")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Note")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Title")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("ToStudentId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("JobId1");

                    b.HasIndex("ToStudentId");

                    b.ToTable("C_InterviewNotify");
                });

            modelBuilder.Entity("GetJob.Models.Job", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("JobCharacterId")
                        .HasColumnType("int");

                    b.Property<int>("JobKindId")
                        .HasColumnType("int");

                    b.Property<int>("JobPayId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("PublisherId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("ResumeReceived")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("JobCharacterId");

                    b.HasIndex("JobKindId");

                    b.HasIndex("JobPayId");

                    b.HasIndex("PublisherId");

                    b.ToTable("C_Job");
                });

            modelBuilder.Entity("GetJob.Models.JobCharacter", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.ToTable("C_JobCharacter");
                });

            modelBuilder.Entity("GetJob.Models.JobKind", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.ToTable("C_JobKind");
                });

            modelBuilder.Entity("GetJob.Models.JobPay", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.ToTable("C_JobPay");
                });

            modelBuilder.Entity("GetJob.Models.Nation", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(2)")
                        .HasMaxLength(2);

                    b.Property<string>("Text")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("Id");

                    b.ToTable("S_Nation");
                });

            modelBuilder.Entity("GetJob.Models.Student", b =>
                {
                    b.Property<string>("StudentId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Adress")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Csny")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Mail")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("MzId")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Xb")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Xh")
                        .HasColumnType("nvarchar(10)")
                        .HasMaxLength(10);

                    b.Property<string>("Xm")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ZzId")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("StudentId");

                    b.ToTable("S_Student");
                });

            modelBuilder.Entity("GetJob.Models.Company", b =>
                {
                    b.HasOne("GetJob.Models.CompanyField", "CompanyField")
                        .WithMany()
                        .HasForeignKey("CompanyFieldId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.InterviewNotify", b =>
                {
                    b.HasOne("GetJob.Models.Job", "Job")
                        .WithMany()
                        .HasForeignKey("JobId1");

                    b.HasOne("GetJob.Models.Student", "ToStudent")
                        .WithMany()
                        .HasForeignKey("ToStudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("GetJob.Models.Job", b =>
                {
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

                    b.HasOne("GetJob.Models.Company", "Publisher")
                        .WithMany()
                        .HasForeignKey("PublisherId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
