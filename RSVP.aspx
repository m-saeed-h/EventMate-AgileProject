<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RSVP.aspx.cs" Inherits="EventMate.RSVP" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RSVP - EventMate</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #f5f5f7;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 40px 0;
        }

        .container {
            background: #fff;
            border-radius: 16px;
            padding: 30px;
            width: 400px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #1d1d1f;
            font-weight: 600;
        }

        .event-info {
            margin-bottom: 20px;
            font-size: 16px;
            color: #333;
        }

        button {
            margin-top: 15px;
            background-color: #0071e3;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #005bb5;
        }

        .message {
            margin-top: 15px;
            font-size: 14px;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>RSVP for Event</h2>

            <asp:Label ID="lblEventTitle" runat="server" CssClass="event-info" />

            <asp:Button ID="btnRSVP" runat="server" Text="RSVP" OnClick="btnRSVP_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
