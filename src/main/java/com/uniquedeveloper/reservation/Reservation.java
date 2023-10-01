package com.uniquedeveloper.reservation;

public class Reservation {
    private String date;
    private String time;
    private String location;
    private String vehicleNo;
    private String mileage;
    private String message;

    // Default constructor
    public Reservation() {
    }

    // Parameterized constructor
    public Reservation(String date, String time, String location, String vehicleNo, String mileage, String message) {
        this.date = date;
        this.time = time;
        this.location = location;
        this.vehicleNo = vehicleNo;
        this.mileage = mileage;
        this.message = message;
    }

    // Getters and setters for date
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    // Getters and setters for time
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    // Getters and setters for location
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    // Getters and setters for vehicleNo
    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    // Getters and setters for mileage
    public String getMileage() {
        return mileage;
    }

    public void setMileage(String mileage) {
        this.mileage = mileage;
    }

    // Getters and setters for message
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}


