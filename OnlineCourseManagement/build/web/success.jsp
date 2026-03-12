<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - Operation Completed</title>
    
    <!-- Google Fonts & Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }
        
        .success-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 50px 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            animation: slideUp 0.6s ease-out;
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .success-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #4CAF50, #45a049);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            animation: scaleIn 0.5s ease-out 0.2s both;
        }
        
        @keyframes scaleIn {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }
        
        .success-icon i {
            font-size: 50px;
            color: white;
        }
        
        h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 15px;
            font-weight: 600;
            animation: fadeIn 0.5s ease-out 0.4s both;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        .message {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
            line-height: 1.6;
            padding: 0 20px;
            animation: fadeIn 0.5s ease-out 0.6s both;
        }
        
        .details-card {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: left;
            animation: fadeIn 0.5s ease-out 0.8s both;
            border-left: 4px solid #4CAF50;
        }
        
        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
            padding: 8px 0;
            border-bottom: 1px solid #e9ecef;
        }
        
        .detail-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        
        .detail-item i {
            width: 30px;
            color: #4CAF50;
            font-size: 18px;
        }
        
        .detail-label {
            font-weight: 500;
            color: #555;
            width: 120px;
        }
        
        .detail-value {
            color: #333;
            font-weight: 500;
            flex: 1;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            animation: fadeIn 0.5s ease-out 1s both;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
        }
        
        .btn-secondary {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
        }
        
        .btn-secondary:hover {
            background: #f8f9ff;
            transform: translateY(-2px);
        }
        
        .btn i {
            font-size: 14px;
        }
        
        .timestamp {
            margin-top: 20px;
            color: #999;
            font-size: 14px;
            animation: fadeIn 0.5s ease-out 1.2s both;
        }
        
        /* Responsive Design */
        @media (max-width: 600px) {
            .success-container {
                padding: 30px 20px;
            }
            
            h1 {
                font-size: 28px;
            }
            
            .detail-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            
            .detail-label {
                width: auto;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
        
        <h1>Success!</h1>
        <p class="message">Your enrollment has been completed successfully.</p>
        
        <div class="details-card">
            <div class="detail-item">
                <i class="fas fa-check-circle"></i>
                <span class="detail-label">Status</span>
                <span class="detail-value" style="color: #4CAF50;">Completed</span>
            </div>
            <div class="detail-item">
                <i class="fas fa-clock"></i>
                <span class="detail-label">Time</span>
                <span class="detail-value">
                    <%
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String currentTime = sdf.format(new java.util.Date());
                        out.print(currentTime);
                    %>
                </span>
            </div>
            <div class="detail-item">
                <i class="fas fa-id-card"></i>
                <span class="detail-label">Reference ID</span>
                <span class="detail-value">
                    <% 
                        String refId = "REF" + System.currentTimeMillis();
                        out.print(refId);
                    %>
                </span>
            </div>
        </div>
        
        <div class="action-buttons">
            <a href="dashboard.jsp" class="btn btn-primary">
                <i class="fas fa-home"></i> Go to Dashboard
            </a>
            <a href="courses.jsp" class="btn btn-secondary">
                <i class="fas fa-redo"></i> Perform Another
            </a>
        </div>
        
        <div class="timestamp">
            <i class="far fa-clock"></i> 
            Last updated: <%= new java.util.Date().toString() %>
        </div>
    </div>
    
  
    
</body>
</html>s