using System;
using System.Data.SqlClient;

namespace EventMate
{
    public partial class EventCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string dateStr = txtEventDate.Text.Trim();
            string location = txtLocation.Text.Trim();

            DateTime eventDate;
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(dateStr) || !DateTime.TryParse(dateStr, out eventDate))
            {
                lblMessage.Text = "Please fill out all required fields with valid data.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EventMateDB;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Events (Title, Description, EventDate, Location) VALUES (@Title, @Description, @EventDate, @Location)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@EventDate", eventDate);
                    cmd.Parameters.AddWithValue("@Location", location);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Event created successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        // Clear fields after success
                        txtTitle.Text = "";
                        txtDescription.Text = "";
                        txtEventDate.Text = "";
                        txtLocation.Text = "";
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error creating event: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
