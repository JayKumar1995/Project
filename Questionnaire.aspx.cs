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
    public partial class Questionnaire : System.Web.UI.Page
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
            List<QuestionnaireData> lstQuestionnaireData = questionnaireHelper.GetAllQuestionnaire();
            lstQuestionnaire.DataSource = lstQuestionnaireData;
            lstQuestionnaire.DataBind();
        }

        protected void btnAddQuestionnaire_Click(object sender, EventArgs e)
        {
            QuestionnaireData questionnaireData = new QuestionnaireData();
            questionnaireData.Name = txtQuestionnaireTitle.Text;
            questionnaireData.Subject = ddlSubjects.SelectedItem.Text;
            questionnaireData.CreatedBy = Session["Username"].ToString();
            if (questionnaireHelper.AddQuestionnaire(questionnaireData))
            {
                Response.Write("<script>alert('Questionnaire added successfully.');</script>");
                BindQuestionnaire();
            }
            else
            {
                Response.Write("<script>alert('Some error occured.');</script>");
            }
        }

        protected void lstQuestionnaire_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstQuestionnaire.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindQuestionnaire();
        }

        protected void lstQuestionnaire_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                Response.Redirect("QuestionAsnwer.aspx?QuestionnaireID=" + e.CommandArgument);
            }
            else
                if (e.CommandName == "Delete")
                {
                    questionnaireHelper.DeleteQuestionnaire(Convert.ToInt32(e.CommandArgument));
                    this.BindQuestionnaire();
                }
        }

        protected void lstQuestionnaire_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}