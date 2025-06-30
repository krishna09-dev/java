<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seat Assignment - Flight Booking</title>
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
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="text"] {
            width: 300px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border: none;
            padding: 12px 24px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
        .success {
            color: green;
            margin-bottom: 20px;
        }
        .confirmed-seat {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .payment-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 4px;
            margin-top: 20px;
        }
        .payment-form h3 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Flight Seat Assignment</h1>
        
        <c:if test="${not empty sessionScope.seatConfirmed}">
            <div class="confirmed-seat">
                <h3>✓ Seat Confirmed</h3>
                <p><strong>Seat Number:</strong> ${sessionScope.seatConfirmed.number}</p>
                <p><strong>Seat ID:</strong> ${sessionScope.seatConfirmed.id}</p>
                <p class="success">Your seat has been reserved successfully!</p>
            </div>
            
            <div class="payment-form">
                <h3>Complete Your Payment</h3>
                <form action="makePayment" method="post">
                    <input type="hidden" name="seatId" value="${sessionScope.seatConfirmed.id}">
                    
                    <div class="form-group">
                        <label for="cardHolder">Card Holder Name:</label>
                        <input type="text" id="cardHolder" name="cardHolder" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cardNumber">Card Number:</label>
                        <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date (MM/YY):</label>
                        <input type="text" id="expiryDate" name="expiryDate" placeholder="12/25" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" placeholder="123" required>
                    </div>
                    
                    <div class="form-group">
                        <input type="submit" value="Make Payment ($149.99)">
                    </div>
                </form>
            </div>
        </c:if>
        
        <c:if test="${empty sessionScope.seatConfirmed}">
            <form action="chooseSeat" method="post">
                <div class="form-group">
                    <label for="flightId">Enter Flight ID:</label>
                    <input type="text" id="flightId" name="flightId" placeholder="e.g., FL001, FL002, FL003" required>
                </div>
                
                <div class="form-group">
                    <input type="submit" value="Choose Seat">
                </div>
            </form>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="error">
                ${error}
            </div>
        </c:if>
    </div>
</body>
</html>