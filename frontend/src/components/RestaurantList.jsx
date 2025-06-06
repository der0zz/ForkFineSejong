import "./RestaurantList.css";
import RestaurantCard from "./RestaurantCard";
import { useMemo } from "react";

// 음식점 리스트를 카테고리 기준으로 필터링해서 보여주는 컴포넌트
const RestaurantList = ({ restaurants = [], selectedCategory = "전체" }) => {
  // "전체" 카테고리면 모든 항목 유지, 아니면 해당 카테고리에 맞는 음식점만 필터링
  const filtered = restaurants.filter(
    (r) => selectedCategory === "전체" || r.category === selectedCategory
  );

  const shuffled = useMemo(() => {
    const copy = [...filtered];
    for (let i = copy.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [copy[i], copy[j]] = [copy[j], copy[i]];
    }
    return copy;
  }, [filtered]);

  // 필터링 결과가 없을 경우 메시지 표시
  if (filtered.length === 0) {
    return (
      <section className="grid-section">
        <p>해당 음식점을 찾을 수 없습니다</p>
      </section>
    );
  }

  // 필터링된 음식점들을 카드 형식으로 출력
  return (
    <section className="grid-section">
      <div className="card-grid">
        {shuffled.map((restaurant) => (
          <RestaurantCard key={restaurant.id} restaurant={restaurant} />
        ))}
      </div>
    </section>
  );
};

export default RestaurantList;
