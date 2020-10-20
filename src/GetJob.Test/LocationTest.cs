using System.Threading.Tasks;
using GetJob.Services.Impl;
using GetJob.Web;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Xunit;

namespace GetJob.Services.Test
{
    public class LocationTest : IClassFixture<WebApplicationFactory<Startup>>
    {
        private readonly WebApplicationFactory<Startup> _factory;

        public LocationTest(WebApplicationFactory<Startup> _factory)
        {
            this._factory = _factory;
        }

        [Fact]
        public void CanServiceGetProvinces()
        {
            // Arrange
            var client = _factory.WithWebHostBuilder(builder =>
                {
                    builder.ConfigureTestServices(services =>
                    {
                        services.AddScoped<ILocationService, LocationService>();
                    });
                })
                .CreateClient();
        }

        [Fact]
        public void CanServiceGetCitiesByProvinceId()
        {
        }

        [Fact]
        public void CanServiceGetDistrictByCityId()
        {
        }
    }
}