using System;
using System.Data.Entity;

using Dusk.Dawn.Models;

using WebMatrix.WebData;

namespace Dusk.Dawn
{
    internal class SimpleMembershipInitializer
    {
        public SimpleMembershipInitializer()
        {
            Database.SetInitializer<UserContext>(null);

            try
            {
                using (var context = new UserContext())
                {
                    if (!context.Database.Exists())
                    {
                        throw new InvalidOperationException("Database was not found!");
                    }
                }

                WebSecurity.InitializeDatabaseConnection("DawnConnectionString", "User", "Id", "Name", true);
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("The ASP.NET Membership database could not be initialized. For more information, please see http://go.microsoft.com/fwlink/?LinkId=256588", ex);
            }
        }
    }
}
