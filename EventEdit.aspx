<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventEdit.aspx.cs" Inherits="EventMate.EventEdit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Event - EventMate</title>
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
            padding: 40px 20px;
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

        .edit-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 40px 32px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid #e5e7eb;
            position: relative;
            z-index: 10;
        }

        .header-section {
            margin-bottom: 32px;
            text-align: center;
        }

        .header-icon {
            width: 56px;
            height: 56px;
            background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 24px;
            color: white;
            box-shadow: 0 8px 24px rgba(59, 130, 246, 0.15);
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

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
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

        input[type="text"],
        input[type="password"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 16px 20px;
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
        input[type="email"]:focus,
        textarea:focus {
            border-color: #3b82f6;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.08);
        }

        textarea {
            min-height: 100px;
        }

        .btn-save {
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
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            letter-spacing: 0.025em;
        }

        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.18);
        }

        .btn-save:disabled {
            background: #95a5a6;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .message {
            margin-top: 20px;
            padding: 15px;
            border-radius: 12px;
            font-weight: 600;
            text-align: center;
            font-size: 1rem;
        }

        .message.success {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
        }

        .message.error {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-row .form-group {
            margin-bottom: 0;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #764ba2;
            text-decoration: none;
        }

        .required-field::after {
            content: " *";
            color: #e74c3c;
        }

        .loading {
            opacity: 0.6;
            pointer-events: none;
        }

        @media (max-width: 768px) {
            body {
                padding: 15px;
                align-items: flex-start;
                padding-top: 40px;
            }

            .edit-container {
                padding: 30px 25px;
                margin: 0;
                max-width: 100%;
                border-radius: 20px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            h2 {
                font-size: 1.8rem;
            }

            .header-icon {
                width: 60px;
                height: 60px;
                font-size: 1.5rem;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"],
            textarea {
                padding: 16px 18px;
                font-size: 16px; /* Prevents zoom on iOS */
            }

            .btn-save {
                padding: 16px 0;
                font-size: 1rem;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 10px;
                padding-top: 20px;
            }

            .edit-container {
                padding: 25px 20px;
                border-radius: 15px;
            }

            h2 {
                font-size: 1.6rem;
            }

            .header-icon {
                width: 50px;
                height: 50px;
                font-size: 1.3rem;
            }

            .subtitle {
                font-size: 1rem;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                font-size: 0.9rem;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"],
            textarea {
                padding: 14px 16px;
                font-size: 16px;
            }

            .btn-save {
                padding: 14px 0;
                font-size: 0.95rem;
            }
        }

        @media (max-width: 360px) {
            .edit-container {
                padding: 20px 15px;
            }

            h2 {
                font-size: 1.4rem;
            }

            .header-icon {
                width: 45px;
                height: 45px;
                font-size: 1.2rem;
            }

            .subtitle {
                font-size: 0.9rem;
            }
        }

        /* Landscape orientation for mobile */
        @media (max-height: 600px) and (orientation: landscape) {
            body {
                align-items: flex-start;
                padding-top: 20px;
            }

            .edit-container {
                padding: 25px 30px;
            }

            .header-section {
                margin-bottom: 25px;
            }

            .header-icon {
                width: 50px;
                height: 50px;
                font-size: 1.5rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .form-group {
                margin-bottom: 15px;
            }
        }

        /* High DPI displays */
        @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
            .edit-container {
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.12);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <div class="header-section">
                <div class="header-icon">✏️</div>
                <h2>Edit Event</h2>
                <p class="subtitle">Update your event details</p>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false" />

            <div class="form-group">
                <label for="txtTitle" class="required-field">Event Title</label>
                <asp:TextBox ID="txtTitle" runat="server" placeholder="Enter event title" />
            </div>

            <div class="form-group">
                <label for="txtDescription">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="Tell people about your event..." />
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="txtEventDate" class="required-field">Event Date</label>
                    <asp:TextBox ID="txtEventDate" runat="server" TextMode="Date" />
                </div>
                <div class="form-group">
                    <label for="txtLocation">Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" placeholder="Event location" />
                </div>
            </div>

            <asp:Button ID="btnSave" runat="server" Text="💾 Save Changes" CssClass="btn-save" OnClick="btnSave_Click" />

            <a href="Dashboard.aspx" class="back-link">← Back to Dashboard</a>
        </div>
    </form>
</body>
</html>
