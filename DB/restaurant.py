import requests
import pymysql
import time

API_KEY = "6ac973f6f1586ff7c12f5f87f7cd28e6"
headers = {"Authorization": f"KakaoAK {API_KEY}"}

categories = {
    "한식": "한식",
    "일식": "일식",
    "중식": "중식",
    "양식": "양식"
}

x, y = "127.073651", "37.550978"

conn = pymysql.connect(
    host='localhost',
    port=3306,
    user='root',
    password='5242',
    db='restaurant_db',
    charset='utf8mb4'
)
cursor = conn.cursor()

for category, keyword in categories.items():
    params = {
        "query": keyword,
        "x": 127.073651,
        "y": 37.550978,
        "radius": 2000,
        "size": 15
    }
    url = "https://dapi.kakao.com/v2/local/search/keyword.json"
    response = requests.get(url, headers=headers, params=params)
    documents = response.json().get("documents", [])[:10]

    for doc in documents:
        try:
            kakao_id = doc['id']
            kakao_url = f"https://place.map.kakao.com/{kakao_id}"

            cursor.execute("""
                INSERT INTO restaurant (
                    name, category, description, address, phone,
                    open_time, main_image_url, kakao_id, kakao_url
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                doc['place_name'],
                category,
                None,
                doc['road_address_name'] or doc['address_name'],
                doc['phone'],
                None,
                None,
                kakao_id,
                kakao_url
            ))

        except pymysql.err.IntegrityError:
            continue

    time.sleep(0.5)

conn.commit()
conn.close()
print("✅ 음식점 정보 저장 완료!")
