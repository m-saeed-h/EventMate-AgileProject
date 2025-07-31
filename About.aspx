<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EventMate.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 60px 0;
            text-align: center;
            margin: -20px -20px 40px -20px;
            border-radius: 0 0 30px 30px;
        }

        .about-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .about-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        .about-content {
            padding: 40px 0;
        }

        .about-section {
            background: white;
            border-radius: 20px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border: 1px solid #f0f0f0;
        }

        .about-section h3 {
            color: #2c3e50;
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 20px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }

        .about-section p {
            color: #555;
            line-height: 1.8;
            font-size: 1.1rem;
            margin-bottom: 15px;
        }

        .mission-vision {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-top: 40px;
        }

        .mission-card, .vision-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 30px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(240, 147, 251, 0.3);
        }

        .mission-card h4, .vision-card h4 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .mission-card p, .vision-card p {
            line-height: 1.6;
            opacity: 0.9;
        }

        .team-section {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 40px;
            border-radius: 20px;
            margin-top: 30px;
            text-align: center;
        }

        .team-section h3 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .team-section p {
            font-size: 1.1rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        @media (max-width: 768px) {
            .about-title {
                font-size: 2.5rem;
            }
            
            .mission-vision {
                grid-template-columns: 1fr;
            }
            
            .about-section {
                padding: 30px 20px;
            }
        }
    </style>

    <div class="about-hero">
        <div class="container">
            <h1 class="about-title">About EventMate</h1>
            <p class="about-subtitle">Empowering communities to create, connect, and celebrate through seamless event management</p>
        </div>
    </div>

    <div class="about-content">
        <div class="container">
            <div class="about-section">
                <h3>Our Story</h3>
                <p>
                    EventMate was born from a simple idea: making event management accessible, beautiful, and efficient for everyone. 
                    We believe that great events bring people together, create lasting memories, and build stronger communities.
                </p>
                <p>
                    Founded in 2024, our platform has evolved from a basic event tracker to a comprehensive solution that 
                    serves thousands of users worldwide. We're passionate about technology that makes a real difference in people's lives.
                </p>
            </div>

            <div class="mission-vision">
                <div class="mission-card">
                    <h4>🎯 Our Mission</h4>
                    <p>
                        To simplify event management and bring people together through innovative, user-friendly technology 
                        that makes organizing and attending events effortless and enjoyable.
                    </p>
                </div>
                <div class="vision-card">
                    <h4>🌟 Our Vision</h4>
                    <p>
                        To become the world's most trusted platform for event management, connecting millions of people 
                        through meaningful experiences and memorable gatherings.
                    </p>
                </div>
            </div>

            <div class="team-section">
                <h3>Meet Our Team</h3>
                <p>
                    We're a dedicated team of developers, designers, and event enthusiasts who are committed to creating 
                    the best possible experience for our users. Every feature we build is designed with you in mind.
                </p>
            </div>

            <div class="about-section">
                <h3>Why Choose EventMate?</h3>
                <p>
                    <strong>✨ Simplicity:</strong> Our intuitive interface makes event management effortless, even for first-time users.
                </p>
                <p>
                    <strong>🚀 Performance:</strong> Built with modern technologies to ensure fast, reliable performance across all devices.
                </p>
                <p>
                    <strong>🔒 Security:</strong> Your data is protected with industry-standard security measures and encryption.
                </p>
                <p>
                    <strong>📱 Responsive:</strong> Works perfectly on desktop, tablet, and mobile devices with our responsive design.
                </p>
                <p>
                    <strong>💡 Innovation:</strong> We continuously improve our platform based on user feedback and emerging technologies.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
