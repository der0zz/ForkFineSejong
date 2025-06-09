import { useEffect, useRef } from "react";
import { loadKakaoMapScript } from "../api/loadKakaoMapScript"; // 경로는 맞게 조정

const KakaoMapSingle = ({ address }) => {
  const mapRef = useRef(null);

  useEffect(() => {
    if (!mapRef.current || !address) return;

    loadKakaoMapScript()
      .then((kakao) => {
        const map = new kakao.maps.Map(mapRef.current, {
          center: new kakao.maps.LatLng(37.550821, 127.074161), // 기본 중심
          level: 3,
        });

        const geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(address, (result, status) => {
          if (status === kakao.maps.services.Status.OK) {
            const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            new kakao.maps.Marker({
              map,
              position: coords,
            });

            map.setCenter(coords);
          } else {
            console.warn("❌ 주소 검색 실패:", status, address);
          }
        });
      })
      .catch((err) => {
        console.error("카카오맵 로딩 실패:", err);
      });
  }, [address]);

  return (
    <div
      id="map"
      ref={mapRef}
      style={{
        width: "100%",
        height: "400px",
      }}
    />
  );
};

export default KakaoMapSingle;
