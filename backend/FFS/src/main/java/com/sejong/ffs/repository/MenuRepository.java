package com.sejong.ffs.repository;

import com.sejong.ffs.entity.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MenuRepository extends JpaRepository<Menu, Long> {
    // 필요한 경우 나중에 findByRestaurantId 등 추가 가능
}
