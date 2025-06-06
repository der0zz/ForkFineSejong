import "./CategoryFilter.css";
const categories = [
  "전체",
  "한식",
  "양식",
  "중식",
  "일식",
  "분식",
  "아시안",
  "카페",
];

const CategoryFilter = ({ selectedCategory, setSelectedCategory }) => {
  //props로 App.jsx 로 부터 필터링 상태값을 받아옴
  // selectedCategory : 현재 선택된 카테고리
  // setSelectedCategory : 선택된 카테고리를 바꾸는 함수
  return (
    <div className="filters">
      {/* map함수를 사용하여 카테고리를 버튼을 출력 */}
      {categories.map((category) => (
        <button
          key={category}
          className={`filter-btn ${
            selectedCategory === category ? "active" : ""
          }`}
          // 버튼 클릭시 카테고리값을 App.jsx로 보냄
          onClick={() => setSelectedCategory(category)}
        >
          {category}
        </button>
      ))}
    </div>
  );
};

export default CategoryFilter;
