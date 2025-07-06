<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventCreation.aspx.cs" Inherits="EventMate.EventCreation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Event - EventMate</title>
    <style>
        /* Basic styling, you can adjust */
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
        }

        h2 {
            margin-bottom: 20px;
            color: #1d1d1f;
            font-weight: 600;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
            color: #555;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        input:focus, textarea:focus {
            border-color: #0071e3;
            background-color: #fff;
            outline: none;
        }

        button {
            margin-top: 25px;
            background-color: #0071e3;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
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
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Create New Event</h2>

            <label for="txtTitle">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" MaxLength="100" />

            <label for="txtDescription">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" />

            <label for="txtEventDate">Date</label>
            <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date" />

            <label for="txtLocation">Location</label>
            <asp:TextBox ID="txtLocation" runat="server" MaxLength="150" />

            <asp:Button ID="btnCreateEvent" runat="server" Text="Create Event" OnClick="btnCreateEvent_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
