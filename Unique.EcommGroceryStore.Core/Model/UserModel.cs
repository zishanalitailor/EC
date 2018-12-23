using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Provider;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Model
{
    public class UserModel
    {
        #region Properties
        public bool UserExist { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string EmailId { get; set; }
        public string MobileNumber { get; set; }
        public string AlternateNumber { get; set; }
        public bool Status { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string[] UserRoles { get; set; }
        public int RoleId { get; set; }
        public bool IsAccountLocked { get; set; }
        public string RoleName { get; set; }
        public string FullName { get; set; }
        #endregion

        #region Public Method(s)

        public void SetUserProperties(int userId)
        {
            if (userId > 0)
            {
                using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
                {
                    var user = (from c in dataContext.Users
                                where c.UserId == userId && c.IsDeleted == false
                                select c).FirstOrDefault();
                    if (user != null)
                    {
                        UserExist = true;
                        UserId = user.UserId;
                        MobileNumber = user.MobileNumber;
                        EmailId = user.EmailId;
                        Password = user.Password;
                        Status = user.Status;
                        UserName = user.UserName;
                        RoleId = user.RoleId;
                        RegistrationDate = user.RegistrationDate == null ? DateTime.MinValue : Convert.ToDateTime(user.RegistrationDate);
                        IsAccountLocked = user.Status;
                        AlternateNumber = user.AlternateNumber;
                        UserRoles = new CustomRoleProvider().GetRolesForUser(user.UserName);
                    }
                }
            }
        }

        public void SetUserProperties(string userName)
        {
            if (userName != string.Empty)
            {
                using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
                {
                    var user = (from c in dataContext.Users
                                where c.UserName == userName && c.IsDeleted == false
                                select c).FirstOrDefault();
                    if (user != null)
                    {
                        UserExist = true;
                        UserId = user.UserId;
                        MobileNumber = user.MobileNumber;
                        EmailId = user.EmailId;
                        Password = user.Password;
                        Status = user.Status;
                        UserName = user.UserName;
                        RoleId = user.RoleId;
                        RegistrationDate = user.RegistrationDate == null ? DateTime.MinValue : Convert.ToDateTime(user.RegistrationDate);
                        IsAccountLocked = user.Status;
                        AlternateNumber = user.AlternateNumber;
                        UserRoles = new CustomRoleProvider().GetRolesForUser(user.UserName);
                    }
                }
            }
        }

        public static void SaveSiteUser(Users newUser)
        {
            using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
            {
                dataContext.Users.Add(newUser);
                dataContext.SaveChanges();
            }
        }

        #endregion
    }
}
