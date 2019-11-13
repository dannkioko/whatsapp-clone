package com.trial.whatsappclone;

public class User {
    private String name, phoneNumber;
    public User(String name, String number){
        this.name = name;
        phoneNumber = number;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
}
