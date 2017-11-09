using DataLayer.DataHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBidding
{
    public partial class ListUserResults : System.Web.UI.Page
    {
        QuestionnaireHelper questionnaireHelper = new QuestionnaireHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindLecturers();
            }
        }

        private void BindLecturers()
        {
            List<EntityLayer.ResultData> lstResult = questionnaireHelper.GetAllResults().Where(x => x.Username.Equals(Session["Username"].ToString())).ToList();
            lstResults.DataSource = lstResult;
            lstResults.DataBind();
        }

        protected void lstStudents_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstResults.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindLecturers();
        }
    }
}