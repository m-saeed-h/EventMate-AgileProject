<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventEdit.aspx.cs" Inherits="EventMate.EventEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Event - EventMate</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #f5f5f7;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
        }
        .edit-container {
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            width: 400px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #333;
        }
        input[type="text"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 14px;
            resize: vertical;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #0071e3;
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #005bb5;
        }
        .message {
            margin-top: 15px;
            font-size: 14px;
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <h2>Edit Event</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <label for="txtTitle">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" />

            <label for="txtDescription">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" />

            <label for="txtEventDate">Date</label>
            <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date" />

            <label for="txtLocation">Location</label>
            <asp:TextBox ID="txtLocation" runat="server" />

            <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>
