import { useState, useEffect } from "react";
import { CiSearch } from "react-icons/ci";
import MainBanner from "./MainBanner";
const Header = ({ onSearch }) => {
  const [searchText, setSearchText] = useState("");
  // 타이핑 시 바로 검색 시작.
  useEffect(() => {
    onSearch(searchText);
  }, [searchText, onSearch]);

  return (
    <header>
      {/* 좌측 로고 */}
      <div>페이지로고</div>
      {/* 중앙 검색창 */}
      <div>
        <input
          type="text"
          placeholder="음식점 이름 입력"
          value={searchText}
          onChange={(e) => setSearchText(e.target.value)}
        />
        {/* 돋보기 아이콘 */}
        <CiSearch />
      </div>
      <MainBanner />
    </header>
  );
};
export default Header;
