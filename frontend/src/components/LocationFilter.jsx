import { useRef } from "react";
import RestaurantCard from "./RestaurantCard";
import "./LocationFilter.css";
import { HiOutlineChevronLeft, HiOutlineChevronRight } from "react-icons/hi";

const LocationFilter = ({ restaurants = [], locationFilter }) => {
  const containerRef = useRef();
  //지역태그가 부착된 음식점만 filtered에 저장
  const filtered = restaurants.filter((r) => r.locationTag === locationFilter);
  //스크롤 이동처리
  const scrollLeft = () => {
    containerRef.current.scrollBy({ left: -240, behavior: "smooth" });
  };
  const scrollRight = () => {
    containerRef.current.scrollBy({ left: 240, behavior: "smooth" });
  };

  return (
    <section className="location-section">
      {/* {필터된 지역 이름} */}
      <h3>{locationFilter}</h3>
      {/* 죄우 스크롤 영역 */}
      <div className="scroll-wrapper">
        {/* 왼쪽 이동버튼 */}
        <button className="scroll-btn left" onClick={scrollLeft}>
          <HiOutlineChevronLeft size={24} />
        </button>
        {/* 음식점 카드 목록 출력 */}
        <div className="card-row" ref={containerRef}>
          {filtered.map((restaurant) => (
            <RestaurantCard key={restaurant.id} restaurant={restaurant} />
          ))}
        </div>
        {/* 오른쪽 이동버튼 */}
        <button className="scroll-btn right" onClick={scrollRight}>
          <HiOutlineChevronRight size={24} />
        </button>
      </div>
    </section>
  );
};

export default LocationFilter;
