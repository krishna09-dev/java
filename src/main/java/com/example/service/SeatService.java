package com.example.service;

import com.example.model.Seat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class SeatService {
    // In-memory storage for demonstration purposes
    private static final ConcurrentHashMap<String, Seat> seats = new ConcurrentHashMap<>();
    
    static {
        // Initialize some demo seats for different flights
        initializeSeats();
    }
    
    private static void initializeSeats() {
        // Flight FL001 seats
        for (int i = 1; i <= 20; i++) {
            String seatId = "FL001_" + String.format("%02d", i);
            String seatNumber = String.valueOf(i) + "A";
            seats.put(seatId, new Seat(seatId, seatNumber, false));
        }
        
        // Flight FL002 seats
        for (int i = 1; i <= 15; i++) {
            String seatId = "FL002_" + String.format("%02d", i);
            String seatNumber = String.valueOf(i) + "B";
            seats.put(seatId, new Seat(seatId, seatNumber, false));
        }
        
        // Flight FL003 seats
        for (int i = 1; i <= 25; i++) {
            String seatId = "FL003_" + String.format("%02d", i);
            String seatNumber = String.valueOf(i) + "C";
            seats.put(seatId, new Seat(seatId, seatNumber, false));
        }
    }
    
    /**
     * Get available (unreserved) seats for a given flight
     * @param flightId the flight identifier
     * @return list of available seats
     */
    public List<Seat> getAvailableSeats(String flightId) {
        List<Seat> availableSeats = new ArrayList<>();
        
        for (Seat seat : seats.values()) {
            if (seat.getId().startsWith(flightId + "_") && !seat.isReserved()) {
                availableSeats.add(seat);
            }
        }
        
        return availableSeats;
    }
    
    /**
     * Reserve a seat by its ID
     * @param seatId the seat identifier
     * @return true if reservation was successful, false if seat doesn't exist or is already reserved
     */
    public boolean reserveSeat(String seatId) {
        Seat seat = seats.get(seatId);
        if (seat != null && !seat.isReserved()) {
            seat.setReserved(true);
            return true;
        }
        return false;
    }
    
    /**
     * Get a seat by its ID
     * @param seatId the seat identifier
     * @return the seat object or null if not found
     */
    public Seat getSeat(String seatId) {
        return seats.get(seatId);
    }
}