using DataLayer.DataHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBidding
{
    public partial class ListStudents : System.Web.UI.Page
    {
        UserHelper userHelper = new UserHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindStudents();
            }
        }

        private void BindStudents()
        {
            List<EntityLayer.User> lstStudent = userHelper.GetAllUsers().Where(x => x.UserType.Equals("Student")).ToList();
            lstStudents.DataSource = lstStudent;
            lstStudents.DataBind();
        }

        protected void lstStudents_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }

        protected void lstStudents_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lstStudents_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstStudents.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindStudents();
        }
    }
}