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
#options.add_argument('--headless')
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

        # 후기 탭 클릭
        try:
            review_tab = driver.find_element(By.XPATH, "//a[contains(text(), '후기')]")
            driver.execute_script("arguments[0].click();", review_tab)
            time.sleep(2)
        except NoSuchElementException:
            print(f"{kakao_id} - 후기 탭 없음")
            continue

        # 평점 높은 순으로 정렬 (선택자 확인 필요)
        try:
            sort_button = driver.find_element(By.CSS_SELECTOR, "div.sort_box a[data-sort='rating']")
            sort_button.click()
            time.sleep(2)
        except NoSuchElementException:
            pass  # 기본 정렬이면 무시

        # 리뷰 5개까지 크롤링
        reviews = driver.find_elements(By.CSS_SELECTOR, "ul.list_review > li")
        print(f"{kakao_id} - 리뷰 요소 감지됨: {len(reviews)}")
        for review in reviews:
            try:
                rating = len(review.find_elements(By.CSS_SELECTOR, "span.ico_star.full"))
                comment = review.find_element(By.CSS_SELECTOR, "p.txt_comment").text.strip()
                date_text = review.find_element(By.CSS_SELECTOR, "span.txt_date").text.strip()
                created_at = datetime.strptime(date_text, "%Y.%m.%d")
            except NoSuchElementException:
                continue

            cursor.execute("""
                INSERT INTO review (restaurant_id, rating, comment, created_at)
                VALUES (%s, %s, %s, %s)
            """, (restaurant_id, rating, comment, created_at))

        conn.commit()
        print(f"{kakao_id} 리뷰 처리 완료.")

    except Exception as e:
        print(f"{kakao_id} 처리 중 오류: {e}")
        continue

driver.quit()
conn.close()
