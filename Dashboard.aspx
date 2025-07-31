<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventMate.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - EventMate</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: #f8fafc;
            min-height: 100vh;
            color: #1e293b;
           position:relative;
            overflow-x: hidden;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 40px 16px;
            position: relative;
            z-index: 10;
        }

        .header-section {
            background: #fff;
            border-radius: 20px;
            padding: 32px 28px 24px 28px;
            margin-bottom: 32px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.06);
            border: 1px solid #e5e7eb;
            text-align: center;
        }

        .welcome-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            margin-bottom: 18px;
        }

        .welcome-text {
            font-size: 2rem;
            font-weight: 700;
            color: #1e293b;
            letter-spacing: -0.02em;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn {
            background: linear-gradient(90deg, #3b82f6 0%, #8b5cf6 100%);
            color: #fff;
            border: none;
            padding: 12px 22px;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: box-shadow 0.2s, transform 0.2s;
            box-shadow: 0 2px 8px rgba(59,130,246,0.08);
        }
        .btn:hover {
            box-shadow: 0 4px 16px rgba(59,130,246,0.13);
            transform: translateY(-2px);
        }
        .btn-logout {
            background: #f3f4f6;
            color: #ef4444;
            border: 1px solid #e5e7eb;
            box-shadow: none;
        }
        .btn-logout:hover {
            background: #fee2e2;
            color: #b91c1c;
        }

        .events-section {
            background: #fff;
            border-radius: 20px;
            padding: 28px 24px;
            margin-bottom: 32px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.06);
            border: 1px solid #e5e7eb;
        }

        .section-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
            letter-spacing: -0.01em;
        }
        .section-title::before {
            content: "📅";
            font-size: 1.3rem;
        }
        .past-events-title {
            color: #6b7280;
        }
        .past-events-title::before {
            content: "📚";
        }
        .event-list {
            display: grid;
            gap: 18px;
        }
        .event-card {
            background: #f9fafb;
            border-radius: 14px;
            padding: 22px 18px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            transition: box-shadow 0.2s, transform 0.2s;
            position: relative;
        }
        .event-card:hover {
            box-shadow: 0 6px 24px rgba(59,130,246,0.10);
            transform: translateY(-2px);
        }
        .event-card.past {
            background: #f3f4f6;
            border-color: #d1d5db;
        }
        .event-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
            flex-wrap: wrap;
            gap: 10px;
        }
        .event-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #1e293b;
            margin: 0;
            flex: 1;
            min-width: 160px;
        }
        .event-date {
            background: #e0e7ff;
            color: #3730a3;
            padding: 5px 12px;
            border-radius: 7px;
            font-size: 0.95rem;
            font-weight: 600;
            white-space: nowrap;
        }
        .event-details {
            margin-bottom: 12px;
        }
        .event-detail {
            display: flex;
            align-items: center;
            margin-bottom: 6px;
            font-size: 0.98rem;
            color: #475569;
        }
        .event-detail strong {
            color: #1e293b;
            margin-right: 7px;
            min-width: 70px;
        }
        .event-description {
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 10px;
            font-style: italic;
        }
        .rsvp-status {
            background: #d1fae5;
            color: #047857;
            padding: 5px 12px;
            border-radius: 7px;
            font-size: 0.95rem;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 10px;
        }
        .event-actions {
            display: flex;
            gap: 7px;
            flex-wrap: wrap;
        }
        .btn-link {
            background: linear-gradient(90deg, #3b82f6 0%, #8b5cf6 100%);
            color: #fff;
            padding: 7px 14px;
            border-radius: 7px;
            font-size: 0.98rem;
            font-weight: 600;
            text-decoration: none;
            transition: box-shadow 0.2s, transform 0.2s;
            display: inline-block;
        }
        .btn-link:hover {
            box-shadow: 0 2px 8px rgba(59,130,246,0.13);
            transform: translateY(-1px);
            color: #fff;
            text-decoration: none;
        }
        .btn-link.rsvp {
            background: linear-gradient(90deg, #10b981 0%, #059669 100%);
        }
        .btn-link.rsvp:hover {
            box-shadow: 0 2px 8px rgba(16,185,129,0.13);
        }
        .empty-state {
            text-align: center;
            padding: 48px 10px;
            color: #6b7280;
        }
        .empty-state h3 {
            font-size: 1.1rem;
            margin-bottom: 10px;
            color: #9ca3af;
        }
        .empty-state p {
            font-size: 0.98rem;
            opacity: 0.8;
        }
        @media (max-width: 900px) {
            .dashboard-container {
                padding: 32px 6px;
            }
            .header-section, .events-section {
                padding: 18px 8px;
            }
        }
        @media (max-width: 600px) {
            .dashboard-container {
                padding: 16px 2px;
            }
            .header-section, .events-section {
                padding: 10px 2px;
                border-radius: 12px;
            }
            .welcome-section {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            .event-list {
               gap:10px;
            }
            .event-card {
                padding: 12px 6px;
                border-radius: 8px;
            }
            .event-title {
                font-size: 1rem;
            }
            .section-title {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="header-section">
                <div class="welcome-section">
                    <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-text" />
                    <div class="action-buttons">
                        <asp:Button ID="btnAddEvent" runat="server" Text="➕ Add Event" CssClass="btn" OnClick="btnAddEvent_Click" />
                        <asp:Button ID="btnLogout" runat="server" Text="🚪 Logout" CssClass="btn btn-logout" OnClick="btnLogout_Click" />
                    </div>
                </div>
            </div>

            <div class="events-section">
                <h3 class="section-title">Upcoming Events</h3>
                <asp:Repeater ID="rptUpcomingEvents" runat="server">
                    <HeaderTemplate><div class="event-list"></HeaderTemplate>
                    <ItemTemplate>
                        <div class="event-card">
                            <div class="event-header">
                                <h4 class="event-title"><%# Eval("Title") %></h4>
                                <div class="event-date"><%# Convert.ToDateTime(Eval("EventDate")).ToString("MMM dd, yyyy") %></div>
                            </div>
                            <div class="event-details">
                                <div class="event-detail">
                                    <strong>📍 Location:</strong> <%# Eval("Location") %>
                                </div>
                                <div class="event-description"><%# Eval("Description") %></div>
                                <div class="rsvp-status">
                                    <strong>👥 RSVPs:</strong> <%# GetRsvpStatus(Eval("EventID")) %>
                                </div>
                            </div>
                            <div class="event-actions">
                                <asp:HyperLink ID="lnkEdit" runat="server"
                                    NavigateUrl='<%# "EventEdit.aspx?EventID=" + Eval("EventID") %>'
                                    CssClass="btn-link">
                                    ✏️ Edit
                                </asp:HyperLink>
                                <asp:HyperLink ID="lnkRSVP" runat="server"
                                    NavigateUrl='<%# "RSVP.aspx?EventID=" + Eval("EventID") %>'
                                    CssClass="btn-link rsvp">
                                    ✅ RSVP
                                </asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            </div>

            <div class="events-section">
                <h3 class="section-title past-events-title">Past Events</h3>
                <asp:Repeater ID="rptPastEvents" runat="server">
                    <HeaderTemplate><div class="event-list"></HeaderTemplate>
                    <ItemTemplate>
                        <div class="event-card past">
                            <div class="event-header">
                                <h4 class="event-title"><%# Eval("Title") %></h4>
                                <div class="event-date"><%# Convert.ToDateTime(Eval("EventDate")).ToString("MMM dd, yyyy") %></div>
                            </div>
                            <div class="event-details">
                                <div class="event-detail">
                                    <strong>📍 Location:</strong> <%# Eval("Location") %>
                                </div>
                                <div class="event-description"><%# Eval("Description") %></div>
                                <div class="rsvp-status">
                                    <strong>👥 RSVPs:</strong> <%# GetRsvpStatus(Eval("EventID")) %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
