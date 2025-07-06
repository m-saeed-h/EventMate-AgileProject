<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EventMate.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EventMate - Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        /* Reset */
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: linear-gradient(135deg, #0071e3, #00a1ff);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #1d1d1f;
        }

        .form-container {
            background: #fff;
            border-radius: 20px;
            padding: 45px 40px 50px 40px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 20px 40px rgba(0, 113, 227, 0.25);
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        .form-container:hover {
            box-shadow: 0 25px 50px rgba(0, 113, 227, 0.4);
        }

        h2 {
            font-weight: 600;
            font-size: 28px;
            margin-bottom: 35px;
            color: #0071e3;
            letter-spacing: 1px;
            user-select: none;
        }

        .form-group {
            margin-bottom: 24px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 14px;
            color: #444;
            user-select: none;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 14px 18px;
            border: 1.8px solid #d0d5dd;
            border-radius: 14px;
            font-size: 15px;
            background-color: #fafafa;
            color: #1d1d1f;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            outline-offset: 2px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #0071e3;
            box-shadow: 0 0 10px rgba(0, 113, 227, 0.35);
            background-color: #fff;
            outline: none;
        }

        .btn {
            width: 100%;
            background-color: #0071e3;
            border: none;
            border-radius: 16px;
            padding: 15px 0;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
            margin-top: 8px;
        }

        .btn:hover {
            background-color: #005bb5;
        }

        .btn-secondary {
            background-color: transparent;
            color: #0071e3;
            border: 2px solid #0071e3;
            margin-top: 15px;
            font-weight: 600;
            border-radius: 16px;
            padding: 14px 0;
        }

        .btn-secondary:hover {
            background-color: #0071e3;
            color: #fff;
        }

        .message {
            margin-top: 22px;
            font-size: 14px;
            text-align: center;
            color: #28a745;
            font-weight: 600;
            user-select: none;
            min-height: 18px;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 35px 30px 40px 30px;
                max-width: 320px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="form-container" role="main" aria-label="Registration Form">
            <h2>Create Your Account</h2>

            <div class="form-group">
                <asp:Label ID="lblFullName" runat="server" Text="Full Name" AssociatedControlID="txtFullName"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field" autocomplete="name" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtusername"></asp:Label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="input-field" autocomplete="username" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" autocomplete="new-password" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />

            <asp:Button ID="btnGoToLogin" runat="server" Text="Back to Login" CssClass="btn-secondary" OnClick="btnGoToLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
