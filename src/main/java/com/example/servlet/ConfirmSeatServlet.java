package com.example.servlet;

import com.example.model.Seat;
import com.example.service.SeatService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ConfirmSeatServlet extends HttpServlet {
    private SeatService seatService = new SeatService();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String seatId = request.getParameter("seatId");
        String flightId = request.getParameter("flightId");
        
        if (seatId == null || seatId.trim().isEmpty()) {
            request.setAttribute("error", "Please select a seat");
            // Re-fetch available seats for display
            if (flightId != null && !flightId.trim().isEmpty()) {
                List<Seat> availableSeats = seatService.getAvailableSeats(flightId.trim());
                request.setAttribute("availableSeats", availableSeats);
                request.setAttribute("flightId", flightId);
            }
            request.getRequestDispatcher("/WEB-INF/checkseat.jsp").forward(request, response);
            return;
        }
        
        boolean reserved = seatService.reserveSeat(seatId.trim());
        
        if (reserved) {
            // Success - store seat in session and redirect to assignseat.jsp
            HttpSession session = request.getSession();
            Seat confirmedSeat = seatService.getSeat(seatId.trim());
            session.setAttribute("seatConfirmed", confirmedSeat);
            response.sendRedirect("assignseat.jsp");
        } else {
            // Failure - forward back to checkseat.jsp with error
            request.setAttribute("error", "Failed to reserve seat. It may have been taken by another user.");
            // Re-fetch available seats for display
            if (flightId != null && !flightId.trim().isEmpty()) {
                List<Seat> availableSeats = seatService.getAvailableSeats(flightId.trim());
                request.setAttribute("availableSeats", availableSeats);
                request.setAttribute("flightId", flightId);
            }
            request.getRequestDispatcher("/WEB-INF/checkseat.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}