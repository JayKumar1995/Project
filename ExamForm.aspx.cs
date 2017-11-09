using DataLayer.DataHelper;
using EntityLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer.Helper;

namespace OnlineBidding
{
    public partial class ExamForm : System.Web.UI.Page
    {
        QuestionnaireHelper qaHelper = new QuestionnaireHelper();
        static List<QuestionAnswerData> lstQuestionnaireData;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["QuestionCounter"] == null)
            {
                Session["QuestionCounter"] = 0;
            }
            if (!this.IsPostBack)
            {
                
                if (Convert.ToInt32(Session["QuestionCounter"]) == 0)
                {
                    Session["QuestionCounter"] = 0;
                }
                
                if (Session["QuestionTime"] == null)
                {
                    Session["QuestionTime"] = DateTime.Today.ToJavaScriptMilliseconds();
                    hidTimeValue.Value = Session["QuestionTime"].ToString();
                }
                else
                {
                    hidTimeValue.Value = Session["QuestionTime"].ToString();
                }

                lstQuestionnaireData = qaHelper.GetAllQA(Convert.ToInt32(Request.QueryString["QuestionnaireID"]));
                //Session["questionnaire"] = lstQuestionnaireData;
                Session["QuestionnaireID"] = Request.QueryString["QuestionnaireID"].ToString();
                this.BindQuestionAnswer();
            }
        }

        private void BindQuestionAnswer()
        {
            
            Session["questionnaire"] = lstQuestionnaireData;
            QuestionAnswerData questionAnswerData = lstQuestionnaireData[Convert.ToInt32(Session["QuestionCounter"])];
            lblQuestionTitle.Text = questionAnswerData.Question1;
            radAnswer1.Text = questionAnswerData.AnswerOne;
            radAnswer2.Text = questionAnswerData.AnswerTwo;
            radAnswer3.Text = questionAnswerData.AnswerThree;
            radAnswer4.Text = questionAnswerData.AnswerFour;
            lblRewardPoint.Text = questionAnswerData.Reward.ToString();
            
            if (Convert.ToInt32(Session["QuestionCounter"]) == 0)
            {
                btnFinishExam.Visible = false;
                btnPrevious.Visible = false;
            }
            else
            {
                btnPrevious.Visible = true;
            }
            if (Convert.ToInt32(Session["QuestionCounter"]) == lstQuestionnaireData.Count - 1)
            {
                btnNext.Visible = false;
                btnFinishExam.Visible = true;
            }
            else
            {
                btnFinishExam.Visible = false;
                btnNext.Visible = true;
            }
            lblQuestionSeq.Text = (Convert.ToInt32(Session["QuestionCounter"]) + 1).ToString() + " of " + lstQuestionnaireData.Count.ToString() + " Questions.";
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(hidSelectedAnswer.Value))
            {
                string givenanswer = hidSelectedAnswer.Value.Replace("radAnswer", "");
                if (!string.IsNullOrEmpty(givenanswer))
                {
                    lstQuestionnaireData = (List<QuestionAnswerData>)Session["questionnaire"];

                    lstQuestionnaireData[Convert.ToInt32(Session["QuestionCounter"])].GivenAnswer = givenanswer;
                    Session["questionnaire"] = lstQuestionnaireData;
                }
            }
            if (Session["QuestionCounter"] == null)
            {
                Session["QuestionCounter"] = 0;
            }
            //Session["QuestionTime"] = hidTimeValue.Value;
            Session["QuestionCounter"] = Convert.ToInt32(Session["QuestionCounter"]) - 1;
            this.BindQuestionAnswer();
            deselectAll();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(hidSelectedAnswer.Value))
            {
                string givenanswer = hidSelectedAnswer.Value.Replace("radAnswer", "");
                if (!string.IsNullOrEmpty(givenanswer))
                {
                    lstQuestionnaireData = (List<QuestionAnswerData>)Session["questionnaire"];

                    lstQuestionnaireData[Convert.ToInt32(Session["QuestionCounter"])].GivenAnswer = givenanswer;
                    Session["questionnaire"] = lstQuestionnaireData;
                }
            }
            if (Session["QuestionCounter"] == null)
            {
                Session["QuestionCounter"] = 0;
            }
            //Session["QuestionTime"] = hidTimeValue.Value;
            Session["QuestionCounter"] = Convert.ToInt32(Session["QuestionCounter"]) + 1;
            this.BindQuestionAnswer();
            deselectAll();
        }

        protected void btnFinishExam_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(hidSelectedAnswer.Value))
            {
                string givenanswer = hidSelectedAnswer.Value.Replace("radAnswer", "");
                if (!string.IsNullOrEmpty(givenanswer))
                {
                    lstQuestionnaireData = (List<QuestionAnswerData>)Session["questionnaire"];

                    lstQuestionnaireData[Convert.ToInt32(Session["QuestionCounter"])].GivenAnswer = givenanswer;
                    Session["questionnaire"] = lstQuestionnaireData;
                }
            }
            Session["questionnaire"] = lstQuestionnaireData;
            Response.Redirect("ExamResult.aspx");
        }

        public void deselectAll()
        {
            radAnswer1.Checked = false;
            radAnswer2.Checked = false;
            radAnswer3.Checked = false;
            radAnswer4.Checked = false;
        }

        protected void btnCheckResults_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(hidSelectedAnswer.Value))
            {
                string givenanswer = hidSelectedAnswer.Value.Replace("radAnswer", "");
                if (!string.IsNullOrEmpty(givenanswer))
                {
                    lstQuestionnaireData = (List<QuestionAnswerData>)Session["questionnaire"];

                    lstQuestionnaireData[Convert.ToInt32(Session["QuestionCounter"])].GivenAnswer = givenanswer;
                    Session["questionnaire"] = lstQuestionnaireData;
                }
            }
            Session["questionnaire"] = lstQuestionnaireData;
            Response.Redirect("ExamResult.aspx");
        }
    }
}