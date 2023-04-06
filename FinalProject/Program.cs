using Microsoft.EntityFrameworkCore;
using FinalProject.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddDbContext<FinalProjectContext>(
options => options.UseSqlServer(
builder.Configuration.GetConnectionString("FinalProjectConnection")
));

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
	// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseSession();
app.UseAuthorization();

app.MapControllerRoute(
	name: "MyArea",
	pattern: "{area:exists=Home}/{controller=Index}/{action}/{id?}");

app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Login}/{id?}");

app.MapAreaControllerRoute(
	name: "default",
	areaName: "Client",
	pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
