﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace SmartPay.Models
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // Access the application context and create result variables.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Then, you create the "admin" role if it doesn't already exist.
            if (!roleMgr.RoleExists("Staff"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Staff" });
            }

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "AngellaWaite",
                Email = "aw@smartpay.com"
            };
            IdUserResult = userMgr.Create(appUser, "P@$$w0rd");

            // If the new "admin" user was successfully created, 
            // add the "admin" user to the "canEdit" role. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("aw@smartpay.com").Id, "AuthorisedUser"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("aw@smartpay.com").Id, "AuthorisedUser");
            }
        }
    }
}