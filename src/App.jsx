import "./App.css";
import Header from "./components/Header.jsx";
import MainBanner from "./components/MainBanner.jsx";
function App() {
  return (
    <>
      <Header onSearch={(text) => console.log("검색어:", text)} />
    </>
  );
}
export default App;
