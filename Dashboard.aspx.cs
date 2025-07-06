using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace EventMate
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=EventMateDB;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserName();
                LoadUpcomingEvents();
                LoadPastEvents();
            }
        }

        private void LoadUserName()
        {
            string email = Session["UserEmail"].ToString();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT fullname FROM usertable WHERE email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        lblWelcome.Text = $"Hello, {result.ToString()} 👋";
                    }
                    else
                    {
                        lblWelcome.Text = $"Hello, {email}";
                    }
                }
                catch (Exception ex)
                {
                    lblWelcome.Text = "Error loading user data: " + ex.Message;
                }
            }
        }

        private void LoadUpcomingEvents()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TOP 5 EventID, Title, Description, EventDate, Location FROM Events WHERE EventDate >= GETDATE() ORDER BY EventDate ASC";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptUpcomingEvents.DataSource = reader;
                    rptUpcomingEvents.DataBind();
                }
                catch (Exception ex)
                {
                    lblWelcome.Text = "Could not load upcoming events: " + ex.Message;
                }
            }
        }

        private void LoadPastEvents()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT EventID, Title, Description, EventDate, Location FROM Events WHERE EventDate < GETDATE() ORDER BY EventDate DESC";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptPastEvents.DataSource = reader;
                    rptPastEvents.DataBind();
                }
                catch (Exception ex)
                {
                    lblWelcome.Text = "Could not load past events: " + ex.Message;
                }
            }
        }

        public string GetRsvpStatus(object eventIdObj)
        {
            if (!int.TryParse(eventIdObj.ToString(), out int eventId))
                return "Invalid Event ID";

            string userEmail = Session["UserEmail"]?.ToString() ?? "";
            if (string.IsNullOrEmpty(userEmail))
                return "";

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                        SELECT u.fullname, r.useremail
                        FROM RSVP r
                        LEFT JOIN usertable u ON r.useremail = u.email
                        WHERE r.EventID = @EventID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@EventID", eventId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    var rsvpNames = new List<string>();
                    bool currentUserRsvped = false;

                    while (reader.Read())
                    {
                        string fullname = reader["fullname"] == DBNull.Value ? reader["useremail"].ToString() : reader["fullname"].ToString();
                        string email = reader["useremail"].ToString();
                        rsvpNames.Add(fullname);

                        if (email.Equals(userEmail, StringComparison.OrdinalIgnoreCase))
                        {
                            currentUserRsvped = true;
                        }
                    }
                    reader.Close();

                    if (rsvpNames.Count == 0)
                        return "No RSVPs yet";

                    if (currentUserRsvped)
                    {
                        int others = rsvpNames.Count - 1;
                        if (others > 0)
                            return $"You and {others} other{(others > 1 ? "s" : "")} RSVPed";
                        else
                            return "You RSVPed";
                    }
                    else
                    {
                        return string.Join(", ", rsvpNames);
                    }
                }
            }
            catch (Exception ex)
            {
                return "Error loading RSVPs: " + ex.Message;
            }
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventCreation.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
