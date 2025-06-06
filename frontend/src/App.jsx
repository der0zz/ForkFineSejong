import "./App.css";
import { useState, useEffect } from "react";
import { useLocation, Routes, Route } from "react-router-dom";
import Header from "./components/Header.jsx";
import CategoryFilter from "./components/CategoryFilter.jsx";
import RestaurantDetail from "./components/RestaurantDetail.jsx";
import RestaurantList from "./components/RestaurantList.jsx";
import MainBanner from "./components/MainBanner.jsx";
import FindMap from "./components/FindMap.jsx";
import LocationFilter from "./components/LocationFilter.jsx";
import api from "./api/axiosInstance";

function App() {
  // 음식점 전체 데이터
  const [restaurantData, setRestaurantData] = useState([]);
  // 카테고리 필터 상태
  const [selectedCategory, setSelectedCategory] = useState("전체");
  // 검색어 상태 (검색 실행된 텍스트)
  const [searchText, setSearchText] = useState("");
  // 검색 입력 상태 (입력 중인 텍스트)
  const [inputText, setInputText] = useState("");
  // URL 경로
  const location = useLocation();
  // find 페이지 여부 확인
  const isFindMap = location.pathname === "/find";
  //필터상태 전체 초기화
  const resetAllFilters = () => {
    setSelectedCategory("전체");
    setSearchText("");
    setInputText("");
  };
  //음식점  데이터 서버에서 불러오기
  useEffect(() => {
    api
      .get("/restaurants") // 올바른 백엔드 주소
      .then((res) => {
        setRestaurantData(res.data); // 성공 시 데이터 세팅
      })
      .catch((err) => {
        console.error(
          "❌ 음식점 데이터를 불러오는데 실패했습니다",
          err.message,
          err.response
        );
      });
  }, []);
  console.log(restaurantData);

  return (
    //FindMap페이지일 경우 스크롤 비활성화
    <div className={isFindMap ? "App no-scroll" : "App"}>
      {/* 검색창, 최근검색, 자동완성, 로고 등 출력  */}
      <Header
        inputText={inputText}
        setInputText={setInputText}
        setSearchText={setSearchText}
        resetAllFilters={resetAllFilters}
        restaurantData={restaurantData}
      />
      {/* 라우팅 */}
      <Routes>
        {/* 메인 홈 화면 */}
        <Route
          path="/"
          element={
            <>
              {/* 메인 배너 */}
              <MainBanner />
              {/* 카테고리 필터 버튼 */}
              <CategoryFilter
                selectedCategory={selectedCategory}
                setSelectedCategory={setSelectedCategory}
              />
              {/* 음식점 리스트 */}
              <RestaurantList
                restaurants={restaurantData}
                selectedCategory={selectedCategory}
                searchText={searchText}
              />
              {/* 정문 카테고리를 가진 음식점 리스트 */}
              <LocationFilter
                restaurants={restaurantData}
                locationFilter="정문"
              />
              {/* 후문 카테고리를 가진 음식점 리스트 */}
              <LocationFilter
                restaurants={restaurantData}
                locationFilter="후문"
              />
              {/* 기타 카테고리를 가진 음식점 리스트 */}
              <LocationFilter
                restaurants={restaurantData}
                locationFilter="기타"
              />
            </>
          }
        />
        {/* 음식점 상세 페이지 */}
        <Route
          path="/restaurant/:id"
          element={<RestaurantDetail restaurants={restaurantData} />}
        />
        {/* 검색 결과 지도 페이지 */}
        <Route
          path="/find"
          element={<FindMap restaurants={restaurantData} />}
        />
      </Routes>
    </div>
  );
}

export default App;
