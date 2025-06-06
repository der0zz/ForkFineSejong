package com.sejong.ffs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sejong.ffs.entity.Restaurant;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {
    List<Restaurant> findByName(String name);
}
