// src/api/loadKakaoMapScript.js
export const loadKakaoMapScript = () => {
  return new Promise((resolve, reject) => {
    if (window.kakao && window.kakao.maps) {
      resolve(window.kakao);
      return;
    }

    const kakaoKey = import.meta.env.VITE_KAKAO_MAP_KEY;

    if (!kakaoKey) {
      console.error("❌ Kakao API 키가 없습니다. .env 파일을 확인하세요.");
      reject(new Error("Kakao API 키 없음"));
      return;
    }

    const script = document.createElement("script");
    script.src = `https://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${kakaoKey}&libraries=services`;

    script.async = true;
    script.onload = () => {
      window.kakao.maps.load(() => resolve(window.kakao));
    };
    script.onerror = reject;

    document.head.appendChild(script);
  });
};
