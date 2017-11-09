using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBidding
{
    public partial class ComplianceMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usertype"] != null)
            {
                string utype = Session["Usertype"].ToString();
                if (utype == "Admin")
                {

                }
                else
                    if (utype == "Student")
                    {
                        qsm.Visible = false;
                        lstLecturers.Visible = false;
                        lstResults.Visible = false;
                        lstStudents.Visible = false;
                    }
                    else
                        if (utype == "Lecturer")
                        {
                            exam.Visible = false;
                            lstLecturers.Visible = false;
                            lstStudents.Visible = false;
                            lstUserResults.Visible = false;
                        }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}