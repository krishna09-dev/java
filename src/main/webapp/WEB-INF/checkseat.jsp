<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Choose Your Seat - Flight Booking</title>
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
        .flight-info {
            background-color: #e7f3ff;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .seats-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 10px;
            margin: 20px 0;
        }
        .seat-option {
            border: 2px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .seat-option:hover {
            border-color: #007bff;
            background-color: #f8f9fa;
        }
        .seat-option input[type="radio"] {
            margin-right: 8px;
        }
        .seat-number {
            font-weight: bold;
            font-size: 18px;
        }
        .seat-id {
            font-size: 12px;
            color: #666;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            cursor: pointer;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .back-link {
            color: #007bff;
            text-decoration: none;
            margin-right: 20px;
        }
        .back-link:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
        }
        .form-actions {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Choose Your Seat</h1>
        
        <div class="flight-info">
            <strong>Flight ID:</strong> ${flightId}
        </div>
        
        <c:if test="${not empty error}">
            <div class="error">
                ${error}
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${not empty availableSeats}">
                <form action="confirmSeat" method="post">
                    <input type="hidden" name="flightId" value="${flightId}">
                    
                    <p>Available seats: ${availableSeats.size()} seat(s)</p>
                    
                    <div class="seats-container">
                        <c:forEach var="seat" items="${availableSeats}">
                            <div class="seat-option">
                                <label for="seat_${seat.id}">
                                    <input type="radio" id="seat_${seat.id}" name="seatId" value="${seat.id}" required>
                                    <div class="seat-number">${seat.number}</div>
                                    <div class="seat-id">${seat.id}</div>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="form-actions">
                        <a href="assignseat.jsp" class="back-link">← Back to Flight Selection</a>
                        <input type="submit" value="Confirm Seat Selection">
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <p>No available seats found for this flight.</p>
                <div class="form-actions">
                    <a href="assignseat.jsp" class="back-link">← Back to Flight Selection</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>