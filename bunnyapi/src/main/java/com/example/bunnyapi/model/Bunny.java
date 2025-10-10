package com.example.bunnyapi.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Bunny {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bunnyId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    private String breed;
    private double age;

    private String favoriteFood;
    private Date arrivalDate;

    // Getters and Setters
    public Long getBunnyId() { return bunnyId; }
    public void setBunnyId(Long bunnyId) { this.bunnyId = bunnyId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }

    public double getAge() { return age; }
    public void setAge(double age) { this.age = age; }

    public String getFavoriteFood() { return favoriteFood; }
    public void setFavoriteFood(String favoriteFood) { this.favoriteFood = favoriteFood; }

    public Date getArrivalDate() { return arrivalDate; }
    public void setArrivalDate(Date arrivalDate) { this.arrivalDate = arrivalDate; }
}
