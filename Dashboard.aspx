<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventMate.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - EventMate</title>
    <style>
    /* Global Styles */
body {
    font-family: "Segoe UI", Roboto, -apple-system, sans-serif;
    background-color: #f2f4f8;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
}

/* Centered Card Container */
.dashboard-container {
    width: 100%;
    max-width: 600px;
    margin-top: 60px;
    padding: 30px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
}

/* Top Bar */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.welcome-text {
    font-size: 18px;
    font-weight: 600;
    color: #333;
}

/* Buttons */
.btn-group {
    display: flex;
    gap: 10px;
}

.btn {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}

/* Headings */
h3 {
    font-size: 16px;
    font-weight: 600;
    margin-top: 30px;
    color: #222;
    border-bottom: 1px solid #e0e0e0;
    padding-bottom: 6px;
}

/* Event List */
.event-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
    margin-top: 20px;
}

/* Event Cards */
.event-card {
    background-color: #f9f9f9;
    border-radius: 10px;
    padding: 16px 20px;
    border-left: 4px solid #007bff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.event-card h4 {
    margin: 0 0 6px;
    font-size: 16px;
    font-weight: 600;
    color: #222;
}

.event-card p {
    margin: 4px 0;
    font-size: 14px;
    color: #555;
}

/* Event Action Links */
.event-card .btn-link {
    display: inline-block;
    margin-top: 10px;
    margin-right: 8px;
    background-color: #007bff;
    color: #fff;
    padding: 6px 12px;
    font-size: 13px;
    border-radius: 6px;
    text-decoration: none;
    transition: background-color 0.25s ease;
}

.event-card .btn-link:hover {
    background-color: #0056b3;
}

.event-card .btn-link.rsvp {
    background-color: #28a745;
}

.event-card .btn-link.rsvp:hover {
    background-color: #1e7e34;
}

/* Past Events Styling */
.event-card.past,
.event-card[style*="border-left-color: #999"] {
    border-left-color: #999 !important;
    background-color: #f1f1f1;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="top-bar">
                <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-text" />
                <div class="btn-group">
                    <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" CssClass="btn" OnClick="btnAddEvent_Click" />
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn" OnClick="btnLogout_Click" />
                </div>
            </div>

            <h3>Upcoming Events</h3>
            <asp:Repeater ID="rptUpcomingEvents" runat="server">
                <HeaderTemplate><div class="event-list"></HeaderTemplate>
                <ItemTemplate>
                    <div class="event-card">
                        <h4><%# Eval("Title") %></h4>
                        <p><strong>Date:</strong> <%# Convert.ToDateTime(Eval("EventDate")).ToString("MMM dd, yyyy") %></p>
                        <p><strong>Location:</strong> <%# Eval("Location") %></p>
                        <p><%# Eval("Description") %></p>

                        <p><strong>RSVPs:</strong> <%# GetRsvpStatus(Eval("EventID")) %></p>

                        <asp:HyperLink ID="lnkEdit" runat="server"
                            NavigateUrl='<%# "EventEdit.aspx?EventID=" + Eval("EventID") %>'
                            CssClass="btn-link">
                            Edit
                        </asp:HyperLink>

                        <asp:HyperLink ID="lnkRSVP" runat="server"
                            NavigateUrl='<%# "RSVP.aspx?EventID=" + Eval("EventID") %>'
                            CssClass="btn-link rsvp">
                            RSVP
                        </asp:HyperLink>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>

            <h3>Past Events</h3>
            <asp:Repeater ID="rptPastEvents" runat="server">
                <HeaderTemplate><div class="event-list"></HeaderTemplate>
                <ItemTemplate>
                    <div class="event-card" style="border-left-color: #999;">
                        <h4><%# Eval("Title") %></h4>
                        <p><strong>Date:</strong> <%# Convert.ToDateTime(Eval("EventDate")).ToString("MMM dd, yyyy") %></p>
                        <p><strong>Location:</strong> <%# Eval("Location") %></p>
                        <p><%# Eval("Description") %></p>

                        <p><strong>RSVPs:</strong> <%# GetRsvpStatus(Eval("EventID")) %></p>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
