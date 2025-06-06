package com.sejong.ffs.entity;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, length = 50)
    private String category;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, length = 255)
    private String address;

    @Column(nullable = false, length = 30)
    private String phone;

    @Column(name = "open_time", nullable = false, length = 100)
    private String openTime;

    @Column(name = "main_image_url", length = 255)
    private String mainImageUrl;

    @Column(name = "kakao_id", nullable = false, length = 50, unique = true)
    private String kakaoId;

    // @Column(precision = 2, scale = 1)
    private Double rating = 0.0;

    @Enumerated(EnumType.STRING)
    @Column(name = "location_tag", columnDefinition = "ENUM('정문', '후문', '기타') DEFAULT '기타'")
    private LocationTag locationTag = LocationTag.기타;

    @Column(name = "is_new")
    private Boolean isNew = false;

    public enum LocationTag {
        정문, 후문, 기타
    }
    
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Menu> menus = new ArrayList<>();
    
    @OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Review> reviews = new ArrayList<>();
}
