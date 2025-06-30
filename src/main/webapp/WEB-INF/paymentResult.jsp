<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Result - Flight Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .success-message {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            font-size: 18px;
        }
        .error-message {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            font-size: 18px;
        }
        .action-buttons {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            margin: 0 10px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .confirmation-details {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 4px;
            margin: 20px 0;
            text-align: left;
        }
        .confirmation-details h3 {
            margin-top: 0;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Result</h1>
        
        <c:choose>
            <c:when test="${message.startsWith('Payment successful')}">
                <div class="success-message">
                    <h2>✓ Payment Successful!</h2>
                    <p>${message}</p>
                </div>
                
                <div class="confirmation-details">
                    <h3>Booking Details</h3>
                    <p><strong>Seat ID:</strong> ${seatId}</p>
                    <p><strong>Status:</strong> Confirmed and Paid</p>
                    <p><strong>Next Steps:</strong> Please save this confirmation for your records. You will receive an email confirmation shortly.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="error-message">
                    <h2>❌ Payment Failed</h2>
                    <p>${message}</p>
                </div>
            </c:otherwise>
        </c:choose>
        
        <div class="action-buttons">
            <c:choose>
                <c:when test="${message.startsWith('Payment successful')}">
                    <a href="assignseat.jsp" class="btn btn-primary">Book Another Flight</a>
                    <button onclick="window.print()" class="btn btn-secondary">Print Confirmation</button>
                </c:when>
                <c:otherwise>
                    <a href="assignseat.jsp" class="btn btn-primary">Try Again</a>
                    <a href="javascript:history.back()" class="btn btn-secondary">Go Back</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>