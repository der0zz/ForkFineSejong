// KakaoMapList.jsx
import { useEffect, useRef } from "react";

const { kakao } = window;

const KakaoMapList = ({ addresses = [] }) => {
  const mapRef = useRef(null);

  useEffect(() => {
    if (!mapRef.current || addresses.length === 0 || !kakao?.maps) return;

    const map = new kakao.maps.Map(mapRef.current, {
      center: new kakao.maps.LatLng(37.550821, 127.074161), // 기본 중심 서울
      level: 3,
    });

    const geocoder = new kakao.maps.services.Geocoder();

    addresses.forEach((address) => {
      geocoder.addressSearch(address, (result, status) => {
        if (status === kakao.maps.services.Status.OK) {
          const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

          new kakao.maps.Marker({
            map,
            position: coords,
          });

          // 첫 번째 주소를 기준으로 중심 이동
          if (address === addresses[0]) {
            map.setCenter(coords);
          }
        } else {
          console.warn(`❌ 주소 검색 실패: ${address}`);
        }
      });
    });
  }, [addresses]);

  return (
    <div
      id="map"
      ref={mapRef}
      style={{
        width: "100%",
        height: "100%",
      }}
    />
  );
};

export default KakaoMapList;
