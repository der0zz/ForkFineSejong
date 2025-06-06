package com.sejong.ffs.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class RestaurantDetailResponse {

    private String name;
    private String category;
    private String description;
    private double rating;
    private List<MenuDto> menus;
    private List<ReviewDto> reviews;

    @Getter
    @AllArgsConstructor
    public static class MenuDto {
        private String name;
        private int price;
        private String description;     // 메뉴 설명
        private String imageUrl;        // 이미지 경로
    }


    @Getter
    @AllArgsConstructor
    public static class ReviewDto {
        private double rating;
        private String comment;
    }
}
