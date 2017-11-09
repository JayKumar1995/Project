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
    public partial class QuestionAsnwer : System.Web.UI.Page
    {
        QuestionnaireHelper qaHelper = new QuestionnaireHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindQuestionAnswer();
            }
        }

        private void BindQuestionAnswer()
        {
            List<QuestionAnswerData> lstQuestionnaireData = qaHelper.GetAllQA(Convert.ToInt32(Request.QueryString["QuestionnaireID"]));
            lstQuestionnaire.DataSource = lstQuestionnaireData;
            lstQuestionnaire.DataBind();
        }

        protected void btnAddQA_Click(object sender, EventArgs e)
        {
            if (Session["Mode"] == null)
            {
                QuestionData question = new QuestionData();
                question.Question1 = txtQuestionTitle.Text;
                question.CreatedBy = Session["Username"].ToString();
                question.QuestionnaireID = Convert.ToInt32(Request.QueryString["QuestionnaireID"]);
                int questionid = qaHelper.AddQuestion(question);
                if (questionid > 0)
                {
                    AnswerData answer = new AnswerData();
                    answer.AnswerOne = txtAnswer1.Text;
                    answer.AnswerTwo = txtAnswer2.Text;
                    answer.AnswerThree = txtAnswer3.Text;
                    answer.AnswerFour = txtAnswer4.Text;
                    answer.CorrectAnswer = ddlCorrectAnswer.SelectedItem.Text;
                    answer.Reward = Convert.ToInt32(txtRewardPoint.Text);
                    answer.QuestionID = questionid;

                    if (qaHelper.AddAnswer(answer))
                    {
                        Response.Write("<script>alert('Question Answer added successfully.');</script>");
                        BindQuestionAnswer();
                    }
                    else
                    {
                        Response.Write("<script>alert('Some error occured.');</script>");
                    }
                }
            }
            else
            {
                QuestionData question = new QuestionData();
                question.Question1 = txtQuestionTitle.Text;
                question.CreatedBy = Session["Username"].ToString();
                question.QuestionnaireID = Convert.ToInt32(Request.QueryString["QuestionnaireID"]);
                question.QuestionID = Convert.ToInt32(Session["Mode"].ToString());
                bool questionedited = qaHelper.EditQuestion(question);
                if (questionedited)
                {
                    AnswerData answer = new AnswerData();
                    answer.AnswerOne = txtAnswer1.Text;
                    answer.AnswerTwo = txtAnswer2.Text;
                    answer.AnswerThree = txtAnswer3.Text;
                    answer.AnswerFour = txtAnswer4.Text;
                    answer.CorrectAnswer = ddlCorrectAnswer.SelectedItem.Text;
                    answer.Reward = Convert.ToInt32(txtRewardPoint.Text);
                    answer.QuestionID = Convert.ToInt32(Session["Mode"].ToString());

                    if (qaHelper.EditAnswer(answer))
                    {
                        Session["Mode"] = null;
                        btnAddQA.Text = "Add QA";
                        Response.Write("<script>alert('Question Answer edited successfully.');</script>");
                        BindQuestionAnswer();
                    }
                    else
                    {
                        Response.Write("<script>alert('Some error occured.');</script>");
                    }
                }
            }
        }

        protected void lstQuestionnaire_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstQuestionnaire.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindQuestionAnswer();
        }

        protected void lstQuestionnaire_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                QuestionAnswerData qaData = qaHelper.GetAllQA(Convert.ToInt32(Request.QueryString["QuestionnaireID"])).Where(x => x.QuestionID == Convert.ToInt32(e.CommandArgument)).FirstOrDefault();
                txtAnswer1.Text = qaData.AnswerOne;
                txtAnswer2.Text = qaData.AnswerTwo;
                txtAnswer3.Text = qaData.AnswerThree;
                txtAnswer4.Text = qaData.AnswerFour;
                txtRewardPoint.Text = qaData.Reward.ToString();
                txtQuestionTitle.Text = qaData.Question1;
                Session["Mode"] = e.CommandArgument.ToString();
                btnAddQA.Text = "Edit QA";
            }
        }

        protected void lstQuestionnaire_ItemEditing(object sender, ListViewEditEventArgs e)
        {

        }
    }
}