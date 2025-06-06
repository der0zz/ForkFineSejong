import "./Header.css";
import logo from "../asset/logo.png";
import { Link } from "react-router-dom";
import { CiSearch } from "react-icons/ci";
import { FaMapMarkerAlt, FaSearch } from "react-icons/fa";
import { useState, useRef, useEffect } from "react";

const Header = ({
  inputText,
  setInputText,
  setSearchText,
  resetAllFilters,
  restaurantData,
}) => {
  //검색어로 필터링된 결과
  const [suggestions, setSuggestions] = useState([]);
  // 최근 검색어 목록 (localStorage 값)
  const [recentKeywords, setRecentKeywords] = useState([]);
  // 검색창 포커싱 여부
  const [isFocused, setIsFocused] = useState(false);
  const searchBoxRef = useRef(null);
  const lastOpened = useRef("");

  // 문자열 포함 여부 (검색기능)
  const includesQuery = (text, query) =>
    text?.toLowerCase().includes(query?.toLowerCase());

  // 최근 검색어 저장 (최대 5개, 중복 제거)
  //  문자열, 객체를 localStorage에 recentKeywords로 저장함
  const saveKeyword = (item) => {
    let saved = JSON.parse(localStorage.getItem("recentKeywords")) || [];
    //item이 문자열인지 객체인지 판별하여 중복 제거 기준을 정함
    const isSame =
      typeof item === "string"
        ? (k) => k === item
        : (k) => typeof k === "object" && k.id === item.id;
    // isSame을 통과한 검색어만 배열 앞에 저장 -> 이미 배열이 5개면 마지막 배열 자름
    // filter의 k 값을 인자로 isSame이 false면 저장
    saved = [item, ...saved.filter((k) => !isSame(k))].slice(0, 5);
    // 문자열로 변환하여 localStorage에 저장
    localStorage.setItem("recentKeywords", JSON.stringify(saved));
    //최신 saved로 상태 저장
    setRecentKeywords(saved);
  };

  // 검색 실행 함수
  // - 공백만 입력되었을 경우 무시
  // - 이전에 열었던 검색어와 동일하면 중복 실행 방지
  // - 검색어를 상태로 저장하고, 최근 검색어 목록에 추가한 뒤, 새 창으로 검색 결과 페이지 오픈
  const triggerSearch = () => {
    // 입력값이 비어 있거나 공백만 있을 경우 실행하지 않음
    if (!inputText.trim()) return;
    // 검색어를 URI 인코딩 (예: 한글 → %EA%B0...)
    const encoded = encodeURIComponent(inputText.trim());
    // 동일한 검색어가 연속으로 입력되었을 경우 중복 검색 방지 (창이 여러개 뜨는 것을 방지)
    if (lastOpened.current === encoded) return;
    lastOpened.current = encoded;
    // 검색어를 상위 상태로 전달 (검색 결과 렌더링용)
    setSearchText(inputText);
    // 최근 검색어로 저장
    saveKeyword(inputText);
    // 검색 결과 페이지를 새 창으로 열기
    window.open(`/find?query=${encoded}`, "_blank", "noopener,noreferrer");
  };

  // Enter 키 입력 시 검색 실행
  const handleKeyDown = (e) => {
    if (e.key === "Enter") {
      e.preventDefault(); //form 태그를 사용할경우 엔터를 누르면 새로고침이 된다. 이를 방지
      triggerSearch(); //우리 코드에선 form 태그를 사용하진 않음
    }
  };

  // 추천 음식점 클릭 → 상세 페이지 이동
  const handleSuggestionClick = (restaurant) => {
    saveKeyword(restaurant);
    window.open(
      `/restaurant/${restaurant.id}`,
      "_blank",
      "noopener,noreferrer"
    );
    setSuggestions([]);
  };

  // 검색창 입력 시 추천 음식점 필터링
  // input창에 입력될 대 수행하는 함수
  const onChangeContent = (e) => {
    const keyword = e.target.value;
    //입력값 상태 업데이트
    setInputText(keyword);
    //keyword가 null 일때 -> 추천어 없음. 최근 검색어 로딩.
    if (!keyword.trim()) {
      const saved = JSON.parse(localStorage.getItem("recentKeywords")) || [];
      setRecentKeywords(saved); //최근 검색어 로딩
      setSuggestions([]); //추천 음식점 초기화
      return;
    }
    //restaurantData에서 검색어를 filter해서 보여줌
    const filtered = restaurantData.filter((r) =>
      includesQuery(r.name, keyword)
    );
    //filtered된 추천 음식점 상태 업데이트
    setSuggestions(filtered);
  };

  // 검색창 포커스 시 최근 검색어 보여줌
  const handleInputFocus = () => {
    setIsFocused(true);
    //localStorage에 저장된 최근 검색어 불러오기
    const saved = JSON.parse(localStorage.getItem("recentKeywords")) || [];
    setRecentKeywords(saved);
    if (!inputText.trim()) setSuggestions([]); //입력이 없으면 추천 목록 초기화
  };

  // 최근 검색어 삭제
  //
  const deleteKeyword = (target, e) => {
    e.preventDefault();
    e.stopPropagation();
    const isText = typeof target === "string";
    //최근 검색어 목록에서 target 제거
    const updated = recentKeywords.filter((k) =>
      isText ? k !== target : typeof k === "string" || k.id !== target.id
    );
    localStorage.setItem("recentKeywords", JSON.stringify(updated));
    setRecentKeywords(updated);
  };

  // 외부 클릭 시 추천어 닫기
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (searchBoxRef.current && !searchBoxRef.current.contains(e.target)) {
        setSuggestions([]);
        setIsFocused(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const showRecent = isFocused && suggestions.length === 0;

  return (
    <>
      {(showRecent || suggestions.length > 0) && (
        <div
          className="search-overlay"
          onClick={() => {
            setInputText("");
            setSuggestions([]);
          }}
        />
      )}

      <header className="app-header">
        <div className="header-inner">
          {/* 좌측 로고 및 브랜드 */}
          <div className="header-left">
            <Link to="/" onClick={resetAllFilters}>
              <img className="logo" src={logo} alt="logo" />
            </Link>
            <span className="brand" onClick={resetAllFilters}>
              F&FS
            </span>
          </div>

          {/* 중앙 검색창 */}
          <div className="header-center">
            <div
              ref={searchBoxRef}
              className={`search-box ${
                showRecent || suggestions.length > 0 ? "has-suggestions" : ""
              }`}
            >
              <input
                className="search-bar"
                type="text"
                placeholder="음식점 이름 입력"
                value={inputText}
                onChange={onChangeContent}
                onFocus={handleInputFocus}
                onKeyDown={handleKeyDown}
              />
              <button
                type="button"
                className="search-btn"
                onClick={(e) => {
                  e.preventDefault();
                  e.stopPropagation();
                  triggerSearch();
                }}
              >
                <CiSearch className="search-icon" />
              </button>

              {/* 최근 검색어 리스트 */}
              {showRecent && (
                <div className="suggestion-list">
                  <div className="suggestion-header">
                    <span>최근 검색</span>
                  </div>
                  {recentKeywords.length > 0 ? (
                    <ul>
                      {recentKeywords.map((item, index) => {
                        const isText = typeof item === "string";
                        const name = isText ? item : item.name;
                        const address = isText ? null : item.address;
                        const icon = isText ? (
                          <FaSearch className="left-icon" />
                        ) : (
                          <FaMapMarkerAlt className="left-icon" />
                        );
                        return (
                          <li key={index}>
                            <span
                              className="keyword-name"
                              onClick={() =>
                                isText
                                  ? window.open(
                                      `/find?query=${encodeURIComponent(item)}`,
                                      "_blank",
                                      "noopener,noreferrer"
                                    )
                                  : window.open(
                                      `/restaurant/${item.id}`,
                                      "_blank",
                                      "noopener,noreferrer"
                                    )
                              }
                            >
                              {icon}
                              {name}
                            </span>
                            {address && <p className="addr">{address}</p>}
                            <button
                              className="delete-keyword"
                              tabIndex={-1}
                              onClick={(e) => deleteKeyword(item, e)}
                            >
                              x
                            </button>
                          </li>
                        );
                      })}
                    </ul>
                  ) : (
                    <div className="no-recent">최근 검색어가 없습니다.</div>
                  )}
                </div>
              )}

              {/* 추천 음식점 리스트 */}
              {suggestions.length > 0 && (
                <div className="suggestion-list">
                  <ul>
                    {suggestions.map((item, index) => (
                      <li key={index}>
                        <span
                          className="keyword-name"
                          onClick={() => handleSuggestionClick(item)}
                        >
                          <FaMapMarkerAlt className="left-icon" />
                          {item.name}
                        </span>
                        {item.address && <p className="addr">{item.address}</p>}
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          </div>

          {/* 우측 메뉴 */}
          <nav className="header-nav">메뉴</nav>
        </div>
      </header>
    </>
  );
};

export default Header;
