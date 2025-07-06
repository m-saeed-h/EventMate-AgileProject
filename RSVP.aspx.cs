using System;
using System.Data.SqlClient;

namespace EventMate
{
    public partial class RSVP : System.Web.UI.Page
    {
        private int eventId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["EventId"] != null && int.TryParse(Request.QueryString["EventId"], out eventId))
                {
                    LoadEvent(eventId);
                }
                else
                {
                    lblMessage.Text = "Invalid event ID.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    btnRSVP.Enabled = false;
                }
            }
        }

        private void LoadEvent(int id)
        {
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EventMateDB;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Title FROM Events WHERE EventID = @EventID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EventID", id);

                    try
                    {
                        conn.Open();
                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            lblEventTitle.Text = "Event: " + result.ToString();
                        }
                        else
                        {
                            lblMessage.Text = "Event not found.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            btnRSVP.Enabled = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error loading event: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        btnRSVP.Enabled = false;
                    }
                }
            }
        }

        protected void btnRSVP_Click(object sender, EventArgs e)
        {
            string email = Session["UserEmail"].ToString();

            if (!int.TryParse(Request.QueryString["EventId"], out eventId))
            {
                lblMessage.Text = "Invalid event ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EventMateDB;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Assuming you have an RSVP table with columns: RSVPId (PK), EventID, UserEmail, RSVPDate
                string query = @"
                    IF NOT EXISTS (SELECT 1 FROM RSVP WHERE EventID = @EventID AND UserEmail = @UserEmail)
                    BEGIN
                        INSERT INTO RSVP (EventID, UserEmail, RSVPDate) VALUES (@EventID, @UserEmail, GETDATE())
                    END";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EventID", eventId);
                    cmd.Parameters.AddWithValue("@UserEmail", email);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "RSVP successful! See you there 🎉";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        btnRSVP.Enabled = false;
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error during RSVP: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
