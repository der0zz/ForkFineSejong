import "./FindMap.css";
import KakaoMapList from "./KakaoMapList";
import { useLocation } from "react-router-dom";
import { useEffect, useState } from "react";
import axios from "axios";

const FindMap = ({ restaurants }) => {
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const searchText = queryParams.get("query") || "";

  const filtered = searchText
    ? restaurants.filter((r) => r.name.includes(searchText))
    : [];

  const [detailsMap, setDetailsMap] = useState({});

  useEffect(() => {
    filtered.forEach((r) => {
      if (detailsMap[r.name]) return;
      axios
        .get(`/api/restaurant/${encodeURIComponent(r.name)}`)
        .then((res) => {
          setDetailsMap((prev) => ({
            ...prev,
            [r.name]: res.data,
          }));
        })
        .catch((err) => {
          console.error(`❌ ${r.name} 상세정보 불러오기 실패`, err);
        });
    });
  }, [filtered]);

  const fallbackAddress = ["서울특별시 광진구 능동로 209"];

  return (
    <div className="find-map-container">
      <div className="restaurant-list-wrapper">
        <div className="restaurant-list">
          {filtered.length === 0 ? (
            <div className="no-result">
              <p>
                <strong>"{searchText}"</strong> 에 대한 검색 결과가 없어요.
              </p>
            </div>
          ) : (
            filtered.map((restaurant) => {
              const detail = detailsMap[restaurant.name];
              const menus = detail?.menus || [];
              const reviews = detail?.reviews || [];

              return (
                <div
                  onClick={() => {
                    const url = `${window.location.origin}/restaurant/${restaurant.id}`;
                    window.open(url, "_blank");
                  }}
                  className="restaurant-item"
                  key={restaurant.id}
                >
                  <div className="restaurant-header">
                    <h3 className="restaurant-name">{restaurant.name}</h3>
                    <div className="rating-score">
                      <strong>{restaurant.rating}</strong>점 · ⭐{" "}
                      <span className="review-count">({reviews.length}명)</span>
                    </div>
                  </div>

                  <div className="restaurant-desc">{restaurant.desc}</div>

                  <div className="tags">
                    {menus.slice(0, 3).map((m, idx) => (
                      <span key={idx} className="tag">
                        {m.name}
                      </span>
                    ))}
                  </div>

                  <p className="address">📍 {restaurant.address}</p>

                  <div className="image-list">
                    {(() => {
                      // 메뉴 중 이미지가 있는 항목만 골라낸다
                      const images = menus.filter(
                        (m) => m.imageUrl && m.imageUrl.trim() !== ""
                      );

                      // 메뉴 이미지가 있을 때만, 최대 3개까지 렌더링
                      if (images.length > 0) {
                        return images.slice(0, 3).map((m, idx) => (
                          <img
                            key={idx}
                            src={m.imageUrl}
                            alt={`${restaurant.name} 메뉴 ${idx + 1}`}
                            onError={(e) => {
                              e.target.onerror = null;
                              e.target.src = ""; // 오류 났을 때도 빈 src → 보이지 않음
                            }}
                          />
                        ));
                      }

                      // 메뉴 이미지가 하나도 없으면 null 반환 → 아무것도 출력하지 않음
                      return null;
                    })()}
                  </div>

                  <div className="review_comment">
                    {reviews.length > 0
                      ? `"${reviews[0].comment}"`
                      : "리뷰가 없어요.."}
                  </div>
                </div>
              );
            })
          )}
        </div>
      </div>

      <div className="map-area">
        <KakaoMapList
          addresses={
            filtered.length > 0
              ? filtered.map((r) => r.address)
              : fallbackAddress
          }
        />
      </div>
    </div>
  );
};

export default FindMap;
