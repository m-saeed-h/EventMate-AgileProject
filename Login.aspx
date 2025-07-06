<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventMate.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - EventMate</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        /* Reset */
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: linear-gradient(135deg, #0071e3, #00a1ff);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #1d1d1f;
        }

        .login-container {
            background: #fff;
            border-radius: 20px;
            padding: 40px 35px 45px 35px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 20px 40px rgba(0, 113, 227, 0.2);
            text-align: center;
            transition: box-shadow 0.3s ease;
        }

        .login-container:hover {
            box-shadow: 0 25px 50px rgba(0, 113, 227, 0.35);
        }

        h2 {
            font-weight: 600;
            font-size: 28px;
            margin-bottom: 30px;
            color: #0071e3;
            letter-spacing: 1px;
            user-select: none;
        }

        .form-group {
            margin-bottom: 22px;
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
            padding: 12px 15px;
            border: 1.8px solid #d0d5dd;
            border-radius: 12px;
            font-size: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background-color: #fafafa;
            color: #1d1d1f;
            outline-offset: 2px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #0071e3;
            box-shadow: 0 0 8px rgba(0, 113, 227, 0.35);
            background-color: #fff;
            outline: none;
        }

        .btn-login {
            width: 100%;
            background-color: #0071e3;
            border: none;
            border-radius: 14px;
            padding: 14px 0;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
            margin-top: 10px;
        }

        .btn-login:hover {
            background-color: #005bb5;
        }

        .btn-register {
            width: 100%;
            margin-top: 18px;
            background-color: transparent;
            border: 2px solid #0071e3;
            color: #0071e3;
            font-weight: 600;
            font-size: 15px;
            padding: 12px 0;
            border-radius: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
            user-select: none;
        }

        .btn-register:hover {
            background-color: #0071e3;
            color: #fff;
        }

        .error-message {
            color: #d32f2f;
            font-size: 13px;
            margin-top: 15px;
            user-select: none;
            min-height: 18px;
            font-weight: 600;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 25px 35px 25px;
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
        <div class="login-container" role="main" aria-label="Login Form">
            <h2>Welcome Back</h2>
            <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Username" />
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" autocomplete="username" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" autocomplete="current-password" />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn-login" OnClick="btnLogin_Click" />
            <asp:Button ID="btnGoToRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnGoToRegister_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false" />
        </div>
    </form>
</body>
</html>
