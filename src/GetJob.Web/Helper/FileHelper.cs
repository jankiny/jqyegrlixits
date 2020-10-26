using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace GetJob.Web.Helper
{
    public class FileHelper
    {
        public static async Task<string> ReadAsync(IFormFile formFile)
        {
            await using var stream = new MemoryStream();
            await formFile.CopyToAsync(stream);
            using var reader = new StreamReader(stream);
            stream.Position = 0;
            return await reader.ReadToEndAsync();
        }

        public static async Task<string> UploadFileAsync(IFormFile file, string uploadPath)
        {
            var fileName = file.FileName.Trim();
            fileName = Guid.NewGuid() + $".{fileName.Split('.')[1]}";
            await using var fs = File.Create(uploadPath + fileName);
            await file.CopyToAsync(fs);
            fs.Flush();
            return fileName;
        }
    }
}