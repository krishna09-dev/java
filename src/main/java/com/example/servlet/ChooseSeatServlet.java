package com.example.servlet;

import com.example.model.Seat;
import com.example.service.SeatService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ChooseSeatServlet extends HttpServlet {
    private SeatService seatService = new SeatService();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String flightId = request.getParameter("flightId");
        
        if (flightId == null || flightId.trim().isEmpty()) {
            request.setAttribute("error", "Flight ID is required");
            request.getRequestDispatcher("/assignseat.jsp").forward(request, response);
            return;
        }
        
        List<Seat> availableSeats = seatService.getAvailableSeats(flightId.trim());
        
        if (availableSeats.isEmpty()) {
            request.setAttribute("error", "No available seats found for flight " + flightId);
            request.getRequestDispatcher("/assignseat.jsp").forward(request, response);
            return;
        }
        
        request.setAttribute("availableSeats", availableSeats);
        request.setAttribute("flightId", flightId.trim());
        request.getRequestDispatcher("/WEB-INF/checkseat.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}