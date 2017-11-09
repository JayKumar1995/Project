using DataLayer.DataHelper;
using EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBidding
{
    public partial class Dashboard : System.Web.UI.Page
    {
        QuestionnaireHelper questionnaireHelper = new QuestionnaireHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindQuestionnaire();
            }
        }

        private void BindQuestionnaire()
        {
            List<QuestionnaireData> lstQuestionnaireData = questionnaireHelper.GetAllQuestionnaire().Take(5).ToList();
            lstQuestionnaire.DataSource = lstQuestionnaireData;
            lstQuestionnaire.DataBind();
        }

        protected void lstQuestionnaire_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                Response.Redirect("QuestionAsnwer.aspx?QuestionnaireID=" + e.CommandArgument);
            }
        }
    }
}