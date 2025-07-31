<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EventMate.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EventMate - Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Subtle background elements */
        body::before,
        body::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(59, 130, 246, 0.05) 0%, rgba(147, 51, 234, 0.05) 100%);
            animation: float 8s ease-in-out infinite;
        }

        body::before {
            top: -100px;
            right: -100px;
            animation-delay: 0s;
        }

        body::after {
            bottom: -100px;
            left: -100px;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 0.5; }
            50% { transform: translateY(-15px) rotate(180deg); opacity: 0.8; }
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 48px 40px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            position: relative;
            z-index: 10;
        }

        .header-section {
            margin-bottom: 40px;
        }

        .logo-icon {
            width: 64px;
            height: 64px;
            background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            font-size: 28px;
            color: white;
            box-shadow: 0 8px 24px rgba(59, 130, 246, 0.25);
            animation: pulse 3s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); }
        }

        h2 {
            font-weight: 700;
            font-size: 28px;
            margin-bottom: 8px;
            color: #1e293b;
            letter-spacing: -0.025em;
        }

        .subtitle {
            color: #64748b;
            font-size: 16px;
            font-weight: 400;
            line-height: 1.5;
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
            color: #374151;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 18px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 16px 20px 16px 48px;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 16px;
            font-family: inherit;
            transition: all 0.2s ease;
            background-color: #ffffff;
            color: #1f2937;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #3b82f6;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            transform: translateY(-1px);
        }

        .btn {
            width: 100%;
            background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 16px 0;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-top: 8px;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.25);
            letter-spacing: 0.025em;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.35);
        }

        .btn-secondary {
            width: 100%;
            margin-top: 16px;
            background: transparent;
            border: 2px solid #e5e7eb;
            color: #6b7280;
            font-weight: 600;
            font-size: 16px;
            padding: 14px 0;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.2s ease;
            letter-spacing: 0.025em;
        }

        .btn-secondary:hover {
            background: #f9fafb;
            border-color: #d1d5db;
            color: #374151;
            transform: translateY(-1px);
        }

        .message {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            padding: 16px;
            border-radius: 12px;
            font-weight: 600;
            margin-top: 16px;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-8px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .divider {
            margin: 24px 0;
            display: flex;
            align-items: center;
            color: #9ca3af;
            font-size: 14px;
            font-weight: 500;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e5e7eb;
        }

        .divider::before {
            margin-right: 16px;
        }

        .divider::after {
            margin-left: 16px;
        }

        .social-register {
            display: flex;
            gap: 12px;
            margin-top: 16px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            background: #ffffff;
            color: #6b7280;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .social-btn:hover {
            border-color: #3b82f6;
            background: #f8fafc;
            color: #3b82f6;
            transform: translateY(-1px);
        }

        .required-field::after {
            content: " *";
            color: #ef4444;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 16px;
                align-items: flex-start;
                padding-top: 32px;
            }

            .form-container {
                padding: 40px 32px;
                margin: 0;
                max-width: 100%;
                border-radius: 20px;
            }

            h2 {
                font-size: 24px;
            }

            .logo-icon {
                width: 56px;
                height: 56px;
                font-size: 24px;
            }

            .social-register {
                flex-direction: column;
                gap: 8px;
            }

            .social-btn {
                padding: 14px;
                font-size: 15px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                padding: 14px 18px 14px 44px;
                font-size: 16px;
            }

            .btn,
            .btn-secondary {
                padding: 14px 0;
                font-size: 15px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 12px;
                padding-top: 24px;
            }

            .form-container {
                padding: 32px 24px;
                border-radius: 16px;
            }

            h2 {
                font-size: 22px;
            }

            .logo-icon {
                width: 48px;
                height: 48px;
                font-size: 20px;
            }

            .subtitle {
                font-size: 15px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                font-size: 13px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                padding: 12px 16px 12px 40px;
                font-size: 16px;
            }

            .btn,
            .btn-secondary {
                padding: 12px 0;
                font-size: 14px;
            }

            .divider {
                margin: 20px 0;
            }
        }

        @media (max-width: 360px) {
            .form-container {
                padding: 24px 20px;
            }

            h2 {
                font-size: 20px;
            }

            .logo-icon {
                width: 40px;
                height: 40px;
                font-size: 18px;
            }

            .subtitle {
                font-size: 14px;
            }
        }

        /* Landscape orientation for mobile */
        @media (max-height: 600px) and (orientation: landscape) {
            body {
                align-items: flex-start;
                padding-top: 16px;
            }

            .form-container {
                padding: 24px 32px;
            }

            .header-section {
                margin-bottom: 20px;
            }

            .logo-icon {
                width: 40px;
                height: 40px;
                font-size: 18px;
            }

            h2 {
                font-size: 20px;
            }

            .form-group {
                margin-bottom: 16px;
            }
        }

        /* High DPI displays */
        @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
            .form-container {
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.06);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="form-container" role="main" aria-label="Registration Form">
            <div class="header-section">
                <div class="logo-icon">🚀</div>
                <h2>Create Your Account</h2>
                <p class="subtitle">Join EventMate and start creating amazing events</p>
            </div>

            <div class="form-group">
                <label for="txtFullName" class="required-field">Full Name</label>
                <div class="input-wrapper">
                    <span class="input-icon">👤</span>
                    <asp:TextBox ID="txtFullName" runat="server" autocomplete="name" placeholder="Enter your full name" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtusername" class="required-field">Username</label>
                <div class="input-wrapper">
                    <span class="input-icon">🎯</span>
                    <asp:TextBox ID="txtusername" runat="server" autocomplete="username" placeholder="Choose a username" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtPassword" class="required-field">Password</label>
                <div class="input-wrapper">
                    <span class="input-icon">🔒</span>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password" placeholder="Create a strong password" />
                </div>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn" OnClick="btnRegister_Click" />

            <div class="divider">or</div>

            <div class="social-register">
                <button type="button" class="social-btn">📘 Facebook</button>
                <button type="button" class="social-btn">🐦 Twitter</button>
            </div>

            <asp:Button ID="btnGoToLogin" runat="server" Text="Sign In Instead" CssClass="btn-secondary" OnClick="btnGoToLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false" />
        </div>
    </form>
</body>
</html>
