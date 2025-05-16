import { useState, useEffect } from "react";
import "./MainBanner.css";
const bannerText = [
  "식사하라. 세종처럼",
  "수업보다 중요한건 점심",
  "쩝쩝박사 선정 세종대 맛집",
  "세종대 맛집, 여기 다 있어!",
  "밥값 하는 집만 모았습니다",
];
const MainBanner = () => {
  const [text, setText] = useState("");

  useEffect(() => {
    changeText();

    const interval = setInterval(() => {
      changeText();
    }, 10000); //10000ms

    return () => {
      clearInterval(interval);
    }; //인터벌 정리
  }, []);
  const changeText = () => {
    const random = Math.floor(Math.random() * bannerText.length);
    setText(bannerText[random]);
  };
  return <div className="main__banner">{text}</div>;
};
export default MainBanner;
