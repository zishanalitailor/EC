using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Unique.EcommGroceryStore.Core.Common;
using Unique.EcommGroceryStore.Core.Interfaces;
using Unique.EcommGroceryStore.Core.Model;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Repository
{
    public class UserRepository : IDisposable, ICustomInterface<Users>
    {
        #region
        private UserModel _User = null;
        private EcommGroceryDataContext dataContext = null;
        #endregion

        #region Constructor
        public UserRepository()
        {
            dataContext = new EcommGroceryDataContext();
        }

        public UserRepository(int userId)
        {
            dataContext = new EcommGroceryDataContext();
            _User = new UserModel();
            _User.SetUserProperties(userId);
        }

        public bool CheckUserisExistOrNot(string username)
        {
            return dataContext.Users.Where(r => r.UserName.Equals(username) && r.IsDeleted == false).Any();
        }

        public UserRepository(string userName)
        {
            dataContext = new EcommGroceryDataContext();
            _User = new UserModel();
            _User.SetUserProperties(userName);
        }

        #endregion

        #region Public Method(s)

        public UserModel User
        {
            get
            {
                return _User;
            }
        }

        public Users Add(Users model)
        {
            dataContext.Users.Add(model);
            Update();
            return model;
        }

        public Users Delete(int id)
        {
            throw new NotImplementedException();
        }

        public Users Get(string userName)
        {
            var userInfo = (from s in dataContext.Users
                            where s.UserName == userName && s.Status == true && s.IsDeleted == false
                            select s).FirstOrDefault();
            return userInfo;
        }

        public Users Get(int userId)
        {
            var userInfo = (from s in dataContext.Users
                            where s.UserId == userId && s.Status == true && s.IsDeleted == false
                            select s).FirstOrDefault();
            return userInfo;
        }

        public IEnumerable<Users> GetList(int id)
        {
            return dataContext.Users.Where(r => r.Status == true && r.IsDeleted == false).OrderBy(r => r.UserName);
        }

        public Users GetUserByEmailId(string emailid)
        {
            var userInfo = (from s in dataContext.Users
                            where s.EmailId == emailid && s.Status == true && s.IsDeleted == false
                            select s).FirstOrDefault();
            return userInfo;
        }

        public void Update()
        {
            dataContext.SaveChanges();
        }

        public bool IsEmailIsExists(string emailid)
        {
            return dataContext.Users.Where(r => r.EmailId == emailid).Any();
        }

        public IEnumerable<UserModel> GetList()
        {
            return (from u in dataContext.Users
                    join r in dataContext.Roles on u.RoleId equals r.RoleId
                    where u.IsDeleted == false
                    select new UserModel
                    {
                        UserId = u.UserId,
                        UserName = u.UserName,
                        Password = u.Password,
                        EmailId = u.EmailId,
                        MobileNumber = u.MobileNumber,
                        AlternateNumber = u.AlternateNumber,
                        RegistrationDate = u.RegistrationDate,
                        FullName = u.FirstName + " " + u.LastName,
                        RoleName = r.RoleName
                    });
        }

        public void Dispose()
        {
            if (dataContext != null)
            {
                dataContext.Dispose();
                dataContext = null;
            }
        }

        #endregion

        #region Public Static Method(s)

        public static int GetUserId()
        {
            int userId = 0;
            int.TryParse(GetSessionValue(SessionManager.UserId), out userId);
            if (userId > 0)
            {
                return userId;
            }
            else
            {
                string userName = HttpContext.Current.User.Identity.Name;
                using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
                {
                    userId = (from s in dataContext.Users
                              where s.UserName == userName
                              select s.UserId).FirstOrDefault();

                    HttpContext.Current.Session[SessionManager.UserId] = userId;
                }
                return userId;
            }
        }

        public static int GetUserId(string userName)
        {
            int siteUserId = 0;
            if (HttpContext.Current.User.Identity.Name == userName)
            {
                return GetUserId();
            }
            else
            {
                using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
                {
                    siteUserId = (from s in dataContext.Users
                                  where s.UserName == userName
                                  select s.UserId).FirstOrDefault();
                }
                return siteUserId;
            }
        }

        public static string GetSessionValue(string key)
        {
            //check session   
            if (HttpContext.Current.Session != null && HttpContext.Current.Session[key] != null)
            {
                //return session value  
                return HttpContext.Current.Session[key].ToString();
            }
            else
            {
                //return empty string  
                return string.Empty;
            }
        }

        public static void Logout()
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            System.Web.Security.FormsAuthentication.SignOut();
            HttpContext.Current.Response.Redirect("~/Account/Login.aspx");
        }

        #endregion

    }
}
