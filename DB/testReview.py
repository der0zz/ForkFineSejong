import time
import pymysql
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException
from datetime import datetime

# DB 연결
conn = pymysql.connect(
    host='localhost',
    user='root',
    password='5242',
    db='restaurant_db',
    charset='utf8mb4'
)
cursor = conn.cursor()

# Selenium 설정
options = Options()
# options.add_argument('--headless')  # 필요 시 활성화
options.add_argument('--disable-gpu')
driver = webdriver.Chrome(options=options)

# restaurant 테이블에서 kakao_id와 id 가져오기
cursor.execute("SELECT id, kakao_id FROM restaurant")
restaurants = cursor.fetchall()

for restaurant_id, kakao_id in restaurants:
    try:
        url = f"https://place.map.kakao.com/{kakao_id}"
        driver.get(url)
        time.sleep(3)

        # '후기' 탭 클릭
        try:
            review_tab = driver.find_element(By.XPATH, "//a[contains(text(), '후기')]")
            driver.execute_script("arguments[0].click();", review_tab)
            time.sleep(2)
        except NoSuchElementException:
            print(f"{kakao_id} - 후기 탭 없음")
            continue

        # 리뷰 요소 가져오기
        reviews = driver.find_elements(By.CSS_SELECTOR, "ul.list_review > li")
        print(f"{kakao_id} - 전체 리뷰 개수: {len(reviews)}")

        top_reviews = []
        for r in reviews:
            try:
                # 별점 추출
                screen_outs = r.find_elements(By.CSS_SELECTOR, ".info_grade .starred_grade .screen_out")
                rating_texts = [s.text for s in screen_outs if s.text.replace('.', '').isdigit()]
                if not rating_texts:
                    continue
                rating = float(rating_texts[0])
                top_reviews.append((rating, r))
            except Exception:
                continue

        # 별점 높은 순 정렬 후 5개 선택
        top_reviews.sort(reverse=True, key=lambda x: x[0])
        top_reviews = top_reviews[:5]

        for rating, review in top_reviews:
            try:
                # 리뷰 텍스트
                try:
                    comment = review.find_element(By.CSS_SELECTOR, "p.desc_review").text.strip()
                except NoSuchElementException:
                    comment = None

                # 날짜
                try:
                    date_text = review.find_element(By.CSS_SELECTOR, "span.txt_date").text.strip()
                    created_at = datetime.strptime(date_text, "%Y.%m.%d.")
                except Exception as e:
                    print(f"{kakao_id} - 날짜 파싱 오류: {e}")
                    continue

                # DB 삽입
                cursor.execute("""
                    INSERT INTO review (restaurant_id, rating, comment, created_at)
                    VALUES (%s, %s, %s, %s)
                """, (restaurant_id, rating, comment, created_at))

            except Exception as e:
                print(f"{kakao_id} - 리뷰 삽입 오류: {e}")
                continue

        conn.commit()
        print(f"{kakao_id} - 리뷰 처리 완료.")

    except Exception as e:
        print(f"{kakao_id} - 전체 오류: {e}")
        continue

driver.quit()
conn.close()
