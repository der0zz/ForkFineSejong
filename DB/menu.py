import time
import pymysql
import re
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException, WebDriverException, ElementClickInterceptedException
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
        url = f"https://place.map.kakao.com/m/{kakao_id}"
        driver.get(url)
        time.sleep(3)
        
        # 탭 선택 및 더보기 처리
        try:
            # 메뉴/배달 탭 찾기
            tabs = driver.find_elements(By.CSS_SELECTOR, 'a[role="tab"]')
            menu_tab = None
            delivery_tab = None

            for tab in tabs:
                if '메뉴' in tab.text:
                    menu_tab = tab
                elif '배달' in tab.text:
                    delivery_tab = tab

            # 메뉴 수 추출
            def extract_count(tab_text):
                match = re.search(r'\d+', tab_text)
                return int(match.group()) if match else 0

            menu_count = extract_count(menu_tab.text) if menu_tab else 0
            delivery_count = extract_count(delivery_tab.text) if delivery_tab else 0

            # 더 많은 항목이 있는 탭 선택
            if delivery_tab and delivery_count > menu_count:
                driver.execute_script("arguments[0].click();", delivery_tab)
                active_tab_name = '배달'
            else:
                if menu_tab:
                    driver.execute_script("arguments[0].click();", menu_tab)
                active_tab_name = '메뉴'

            time.sleep(2)

            # 해당 탭의 '더보기' 버튼 클릭 (텍스트로 구분)
            try:
                more_buttons = driver.find_elements(By.CSS_SELECTOR, 'a.link_more')
                for button in more_buttons:
                    if active_tab_name in button.text:
                        driver.execute_script("arguments[0].click();", button)
                        time.sleep(2)
                        break
            except NoSuchElementException:
                    pass  # 더보기 버튼 없으면 무시

        except Exception as e:
            print(f"{kakao_id}: 탭 선택 중 오류 - {e}")


        # 메뉴 파싱
        menus = driver.find_elements(By.CSS_SELECTOR, 'ul.list_goods > li')
        print(f"{kakao_id} 메뉴 개수: {len(menus)}")

        for menu in menus:
            try:
                name = menu.find_element(By.CSS_SELECTOR, 'strong.tit_item').text.strip()
            except NoSuchElementException:
                name = None
            try:
                price_raw = menu.find_element(By.CSS_SELECTOR, 'p.desc_item').text.strip()
                price_match = re.search(r'\d[\d,]*', price_raw)
                price = int(price_match.group().replace(',', '')) if price_match else None
            except NoSuchElementException:
                price = None
            try:
                desc = menu.find_element(By.CSS_SELECTOR, 'p.desc_item2').text.strip()
            except NoSuchElementException:
                desc = None
            try:
                img = menu.find_element(By.CSS_SELECTOR, 'img').get_attribute('src')
                img = img[:255] if img else None
            except NoSuchElementException:
                img = None

            cursor.execute("""
                INSERT INTO menu (restaurant_id, name, price, description, image_url)
                VALUES (%s, %s, %s, %s, %s)
            """, (restaurant_id, name, price, desc, img))

        conn.commit()
        print(f"{kakao_id} 처리 완료.")

    except WebDriverException as e:
        print(f"{kakao_id} 처리 중 오류: {e}")
        continue

driver.quit()
conn.close()
