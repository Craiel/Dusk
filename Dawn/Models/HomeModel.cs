using Dusk.Dawn.Logic;

namespace Dusk.Dawn.Models
{
    public class HomeModel
    {
        private readonly User user;

        // -------------------------------------------------------------------
        // Constructor
        // -------------------------------------------------------------------
        public HomeModel(User userInfo)
        {
            this.user = userInfo;

            //this.ExperienceNeeded = DawnLogic.GetNeededExperience();
        }

        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public string Name
        {
            get
            {
                return this.user.Name;
            }
        }

        public int Level
        {
            get
            {
                return this.user.Level;
            }
        }

        public long Experience
        {
            get
            {
                return this.user.Experience;
            }
        }

        public long ExperienceNeeded { get; private set; }

        public long Credits
        {
            get
            {
                return this.user.Credits;
            }
        }

        public int HP
        {
            get
            {
                return this.user.HP;
            }
        }

        public int HPMax
        {
            get
            {
                return this.user.HPMax;
            }
        }

        public int Leadership
        {
            get
            {
                return this.user.Leadership;
            }
        }

        public int LeadershipMax
        {
            get
            {
                return this.user.LeadershipMax;
            }
        }

        public int StatPoints
        {
            get
            {
                return this.user.StatPoints;
            }
        }
    }
}
