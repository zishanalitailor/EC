using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;
using System.Configuration.Provider;
using Unique.EcommGroceryStore.DAL.EntityModel;

namespace Unique.EcommGroceryStore.Core.Provider
{
    public class CustomRoleProvider : RoleProvider
    {
        #region "Const"
        public static string ROLEADMIN = "Admin";
        public static string ROLEUSER = "User";
        #endregion
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
            {
                return dataContext.Roles.Select(x => x.RoleName).ToArray();
            }
        }

        public override string[] GetRolesForUser(string username)
        {
            using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
            {
                string[] roles = null;
                roles = (from c in dataContext.Users
                         join
                             r in dataContext.Roles on c.RoleId equals r.RoleId
                         where c.UserName == username
                         select r.RoleName).ToArray();
                return roles;
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            string[] userId = { "0" };
            using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
            {
                int userRoleId = (from c in dataContext.Roles
                                  where c.RoleName == roleName
                                  select c.RoleId).FirstOrDefault();
                int siteUserId = (from c in dataContext.Users
                                  where c.RoleId == userRoleId
                                  select c.UserId).FirstOrDefault();
                userId[0] = siteUserId.ToString();

            }
            return userId;
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            using (EcommGroceryDataContext dataContext = new EcommGroceryDataContext())
            {
                return (from u in dataContext.Users
                        join
                            r in dataContext.Roles on u.RoleId equals r.RoleId
                        where u.UserName == username && r.RoleName == roleName
                        select u).Any();
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}
