using System;
using System.Data.SqlClient;

namespace EventMate
{
    public partial class EventEdit : System.Web.UI.Page
    {
        private string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EventMateDB;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string eventIdStr = Request.QueryString["EventID"];
                if (string.IsNullOrEmpty(eventIdStr) || !int.TryParse(eventIdStr, out int eventId))
                {
                    lblMessage.Text = "Invalid Event ID.";
                    btnSave.Enabled = false;
                    return;
                }

                LoadEventData(eventId);
            }
        }

        private void LoadEventData(int eventId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Title, Description, EventDate, Location FROM Events WHERE EventID = @EventID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventID", eventId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtTitle.Text = reader["Title"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        txtEventDate.Text = Convert.ToDateTime(reader["EventDate"]).ToString("yyyy-MM-dd");
                        txtLocation.Text = reader["Location"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Event not found.";
                        btnSave.Enabled = false;
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading event: " + ex.Message;
                    btnSave.Enabled = false;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string eventIdStr = Request.QueryString["EventID"];
            if (string.IsNullOrEmpty(eventIdStr) || !int.TryParse(eventIdStr, out int eventId))
            {
                lblMessage.Text = "Invalid Event ID.";
                return;
            }

            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string eventDateStr = txtEventDate.Text.Trim();
            string location = txtLocation.Text.Trim();

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(eventDateStr))
            {
                lblMessage.Text = "Please fill in all required fields (Title and Date).";
                return;
            }

            if (!DateTime.TryParse(eventDateStr, out DateTime eventDate))
            {
                lblMessage.Text = "Invalid date format.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string updateQuery = @"UPDATE Events 
                                       SET Title = @Title, Description = @Description, EventDate = @EventDate, Location = @Location
                                       WHERE EventID = @EventID";

                SqlCommand cmd = new SqlCommand(updateQuery, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@EventDate", eventDate);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@EventID", eventId);

                try
                {
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Event updated successfully!";
                    }
                    else
                    {
                        lblMessage.Text = "Update failed. Event not found.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error updating event: " + ex.Message;
                }
            }
        }
    }
}
