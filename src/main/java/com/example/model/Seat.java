package com.example.model;

public class Seat {
    private String id;
    private String number;
    private boolean reserved;
    
    public Seat() {
    }
    
    public Seat(String id, String number, boolean reserved) {
        this.id = id;
        this.number = number;
        this.reserved = reserved;
    }
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getNumber() {
        return number;
    }
    
    public void setNumber(String number) {
        this.number = number;
    }
    
    public boolean isReserved() {
        return reserved;
    }
    
    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }
    
    @Override
    public String toString() {
        return "Seat{" +
                "id='" + id + '\'' +
                ", number='" + number + '\'' +
                ", reserved=" + reserved +
                '}';
    }
}