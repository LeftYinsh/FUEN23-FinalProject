using Microsoft.AspNetCore.Mvc;
using FinalProject.Areas.Client.Models;
using FinalProject.Areas.Server.Models;

namespace FinalProject.Models
{
    public class CGlobalParameters
    {
        public static int FetchCustomerId(Controller con)
        {
            if (con.HttpContext.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TCustomer>(con.HttpContext.Session.GetString(CDictionaryLogin.SK_LOGINED_CUSTOMER)).FId;
            }
            return 0;
        }
        public static int FetchCustomerId(HttpContext _context)
        {
            if (_context.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TCustomer>(_context.Session.GetString(CDictionaryLogin.SK_LOGINED_CUSTOMER)).FId;
            }
            return 0;
        }
        public static string FetchCustomerFirstName(HttpContext _context)
        {
            if (_context.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TCustomer>(_context.Session.GetString(CDictionaryLogin.SK_LOGINED_CUSTOMER)).FFirstName;
            }
            return "";
        }
        public static int FetchProviderId(Controller con)
        {
            if (con.HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_PROVIDER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TProvider>(con.HttpContext.Session.GetString(CDictionary.SK_LOGINED_PROVIDER)).FId;
            }
            return 0;
        }
        public static int FetchProviderId(HttpContext _context)
        {
            if (_context.Session.Keys.Contains(CDictionary.SK_LOGINED_PROVIDER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TProvider>(_context.Session.GetString(CDictionary.SK_LOGINED_PROVIDER)).FId;
            }
            return 0;
        }
        public static string FetchProviderName(HttpContext _context)
        {
            if (_context.Session.Keys.Contains(CDictionary.SK_LOGINED_PROVIDER))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TProvider>(_context.Session.GetString(CDictionary.SK_LOGINED_PROVIDER)).FCompanyName;
            }
            return "";
        }
        public static string FetchManagerName(HttpContext _context)
        {
            if (_context.Session.Keys.Contains(CDictionary.SK_LOGINED_ADMIN))
            {
                return System.Text.Json.JsonSerializer.Deserialize<TManager>(_context.Session.GetString(CDictionary.SK_LOGINED_ADMIN)).FAccount;
            }
            return "";
        }
        public static bool IsCustomer(Controller con)
        {
            return con.HttpContext.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER);
        }
        public static bool IsCustomer(HttpContext _context)
        {
            return _context.Session.Keys.Contains(CDictionaryLogin.SK_LOGINED_CUSTOMER);
        }
        public static bool IsProvider(Controller con)
        {
            return con.HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_PROVIDER);
        }
        public static bool IsProvider(HttpContext _context)
        {
            return _context.Session.Keys.Contains(CDictionary.SK_LOGINED_PROVIDER);
        }
        public static bool IsAdmin(Controller con)
        {
            return con.HttpContext.Session.Keys.Contains(CDictionary.SK_LOGINED_ADMIN);
        }
        public static bool IsAdmin(HttpContext _context)
        {
            return _context.Session.Keys.Contains(CDictionary.SK_LOGINED_ADMIN);
        }
    }
}
