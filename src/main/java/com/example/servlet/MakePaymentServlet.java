package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MakePaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String seatId = request.getParameter("seatId");
        String cardNumber = request.getParameter("cardNumber");
        String cardHolder = request.getParameter("cardHolder");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        
        String message;
        
        // Simulate payment processing
        if (seatId == null || seatId.trim().isEmpty()) {
            message = "Error: No seat information found for payment.";
        } else if (cardNumber == null || cardNumber.trim().isEmpty() ||
                   cardHolder == null || cardHolder.trim().isEmpty() ||
                   expiryDate == null || expiryDate.trim().isEmpty() ||
                   cvv == null || cvv.trim().isEmpty()) {
            message = "Error: All payment fields are required.";
        } else {
            // Simulate successful payment
            message = "Payment successful! Your seat " + extractSeatNumber(seatId) + 
                     " has been confirmed. Total amount: $149.99. " +
                     "Confirmation number: PAY" + System.currentTimeMillis();
        }
        
        request.setAttribute("message", message);
        request.setAttribute("seatId", seatId);
        request.getRequestDispatcher("/WEB-INF/paymentResult.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    private String extractSeatNumber(String seatId) {
        if (seatId != null && seatId.contains("_")) {
            // Extract seat number from seatId format like "FL001_01"
            String[] parts = seatId.split("_");
            if (parts.length > 1) {
                return parts[1];
            }
        }
        return seatId;
    }
}