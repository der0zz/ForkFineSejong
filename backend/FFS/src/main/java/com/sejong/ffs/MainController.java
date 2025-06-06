package com.sejong.ffs;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.transaction.annotation.Transactional;

import com.sejong.ffs.dto.RestaurantDetailResponse;
import com.sejong.ffs.entity.Restaurant;
import com.sejong.ffs.repository.RestaurantRepository;


@RestController		// REST API 컨트롤러로 지정
// @CrossOrigin(origins = "http://localhost:3000")		// React가 호출할 수 있게 CORS 허용
// @CrossOrigin(origins = "http://localhost:5173")		// React가 호출할 수 있게 CORS 허용
@CrossOrigin(origins = "*")		// React가 호출할 수 있게 CORS 허용
public class MainController {
	private final RestaurantRepository restaurantRepository;	// Spring이 자동으로 DB 접근 기능 연결

    public MainController(RestaurantRepository restaurantRepository) {
        this.restaurantRepository = restaurantRepository;
    }

    @GetMapping("/restaurants")		//	GET 요청 시 전체 음식점 목록 반환
    public List<Restaurant> getAllRestaurants() {
        return restaurantRepository.findAll();		// JPA가 자동으로 DB에서 전체 row를 가져옴
    }
    
    @Transactional
    @GetMapping("/restaurant/{name}")
    public ResponseEntity<?> getRestaurantDetail(@PathVariable String name) {
        List<Restaurant> list = restaurantRepository.findByName(name);
        if (list.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Restaurant r = list.get(0); // 같은 이름이 여러 개일 경우 첫 번째만 사용

        // 메뉴 DTO 변환
     // 메뉴 DTO 변환
        List<RestaurantDetailResponse.MenuDto> menus = r.getMenus().stream()
            .map(m -> new RestaurantDetailResponse.MenuDto(
                m.getName(),
                m.getPrice(),
                m.getDescription(),
                m.getImageUrl()
            ))
            .toList();


        // 리뷰 DTO 변환
        List<RestaurantDetailResponse.ReviewDto> reviews = r.getReviews().stream()
            .map(rv -> new RestaurantDetailResponse.ReviewDto(rv.getRating(), rv.getComment()))
            .toList();

        RestaurantDetailResponse response = new RestaurantDetailResponse(
            r.getName(),
            r.getCategory(),
            r.getDescription(),
            r.getRating(),
            menus,
            reviews
        );

        return ResponseEntity.ok(response);
    }

}
