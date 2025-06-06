import "./RestaurantDetail.css";
import githubImage from "../asset/github.svg";
import good from "../asset/default_thumb.png";
import KakaoMapSingle from "./KaKaoMapSingle.jsx";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";

const RestaurantDetail = ({ restaurants }) => {
  const { id } = useParams();
  const restaurantId = parseInt(id, 10);
  const restaurant = restaurants.find((r) => r.id === restaurantId);

  const [menu, setMenu] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [visibleCount, setVisibleCount] = useState(3);
  const [visibleCountReview, setVisibleCountReview] = useState(5);

  useEffect(() => {
    if (!restaurant?.name) return;

    axios
      .get(
        //음식점 상세 데이터 데이터베이스에서 불러옴
        `/api/restaurant//${encodeURIComponent(restaurant.name)}`
      )
      .then((res) => {
        const data = res.data;
        setMenu(data.menus);
        setReviews(data.reviews);
        console.log("[DEBUG] 메뉴 데이터:", data.menus);
      })
      .catch((err) => {
        console.error("음식점 상세 정보 불러오기 실패", err);
      });
  }, [restaurant?.name]);

  if (!restaurant) {
    return <div>음식점 정보를 찾을 수 없습니다.</div>;
  }

  const menuToShow = menu.slice(0, visibleCount);
  const reviewsToShow = reviews.slice(0, visibleCountReview);

  console.log("요청할 음식점 이름:", restaurant.name);
  console.log("URI 인코딩된 이름:", encodeURIComponent(restaurant.name));
  return (
    <>
      <div className="app">
        <h2>{restaurant.name}</h2>
        <div className="store-intro">
          <h3>매장 소개</h3>
          <p>{restaurant.description}</p>
        </div>
        <div className="store-info">
          <h3>카테고리</h3>
          <p>{restaurant.category}</p>
          <h3>평점</h3>
          <p>{restaurant.rating}</p>
        </div>
        <div className="menu-board">
          <h3>메뉴</h3>
          {menuToShow.length > 0 ? (
            menuToShow.map((item, index) => (
              <div key={index} className="menu-item">
                {item.imageUrl && item.imageUrl.trim() !== "" && (
                  <img
                    src={item.imageUrl}
                    alt={item.name}
                    className="menu-item-image"
                    onError={(e) => {
                      e.target.onerror = null;
                      e.target.src = good;
                    }}
                  />
                )}
                <div className="menu-item-content">
                  <div className="menu-title">
                    <span>{item.name}</span>
                    <span className="menu-price">{item.price}원</span>
                  </div>
                  <p className="menu-desc">{item.description}</p>
                </div>
              </div>
            ))
          ) : (
            <p>등록된 메뉴가 없습니다.</p>
          )}

          {menu.length > visibleCount && (
            <div className="load-more-section menu-load-more">
              {/* 메뉴 더보기 버튼 클릭시 메뉴 최대 목록 개수가 3개 늘어남 */}
              <button
                className="load-more-btn"
                onClick={() => setVisibleCount((prev) => prev + 3)}
              >
                메뉴 더보기
              </button>
            </div>
          )}
        </div>
        <div className="store-detail-section">
          <div className="store-intro">
            <h3>매장 소개</h3>
            <p>{restaurant.description}</p>
            <img
              className="store-intro-img"
              src={
                restaurant.mainImageUrl && restaurant.mainImageUrl.trim() !== ""
                  ? restaurant.mainImageUrl
                  : good // 기본 이미지
              }
              alt={restaurant.name}
              onError={(e) => {
                e.target.onerror = null;
                e.target.src = good;
              }}
            />
          </div>
          <div className="store-info">
            <h3>영업시간</h3>
            <li>{restaurant.openTime}</li>
            <li>주소 : {restaurant.address}</li>
            <li>전화번호 : {restaurant.phone}</li>
          </div>
        </div>

        <div className="review-section">
          <h3>리뷰</h3>
          {reviewsToShow.length > 0 ? (
            reviewsToShow.map((review, index) => (
              <div key={index} className="review-card">
                <p>
                  <strong>⭐ {review.rating}</strong> - {review.comment}
                </p>
              </div>
            ))
          ) : (
            <p>아직 리뷰가 없습니다.</p>
          )}
          {reviews.length > visibleCountReview && (
            <div className="load-more-section review-load-more">
              {/* 리뷰 더보기 버튼 클릭시 리뷰 최대 목록 개수가 5개 늘어남 */}
              <button
                className="load-more-btn"
                onClick={() => setVisibleCountReview((prev) => prev + 5)}
              >
                리뷰 더보기
              </button>
            </div>
          )}

          <KakaoMapSingle address={restaurant.address || "주소 없음"} />
        </div>
      </div>
      <footer className="footer">
        <div className="footer-inner">
          <div className="footer-text">
            <h3>세종대 맛집 지도</h3>
            <p>Copyright &copy;2025 </p>

            <p>Fork&Find Team</p>
          </div>
          <div className="footer-icons">
            <button
              className="footer-icon"
              onClick={() =>
                window.open("https://github.com/der0zz/ForkFineSejong")
              }
            >
              <img src={githubImage} alt="로고" height="36" width="36" />
            </button>
            <div className="footer-icon">I</div>
            <div className="footer-icon">T</div>
          </div>
        </div>
      </footer>
    </>
  );
};

export default RestaurantDetail;
