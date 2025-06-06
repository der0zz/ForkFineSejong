# Fork&Fine

세종대학교 주변 음식점 정보를 기반으로 한 맛집 추천 플랫폼입니다.  
사용자 맞춤형 추천 및 리뷰 기반 정렬 기능을 제공합니다.

## 프로젝트 개요

- **프로젝트명**: Fork&FineSejong
- **목표**: 세종대 주변 음식점 정보를 수집하고, 리뷰 및 평점을 기반으로 사용자 맞춤형 추천 제공
- **기간**: 2025.05.07 ~ 2025.06.11 (5주)
- **팀원 역할 분담**
  - 프론트엔드: React
  - 백엔드: Spring Boot + MariaDB
  - 데이터 수집: Kakao맵 API + Selenium 기반 웹 크롤러

## 주요 기능

- 음식점 목록 및 상세 페이지 UI 구성
- KakaoMap 기반 크롤링 데이터 연동
  - 음식점 이름, 카테고리, 위치 정보, 메뉴, 영업시간 수집
- KakaoMap 기반 위치 시각화
- 음식점 검색 기능
- 상세 페이지에서 메뉴, 리뷰, 위치 확인
- 정문/후문/기타 위치 기반 태그 자동 분류

## 기술 스택

| 분야         | 기술                      |
| ------------ | ------------------------- |
| 프론트엔드   | React, Axios              |
| 백엔드       | Spring Boot, Spring JPA   |
| 데이터베이스 | MariaDB                   |
| 크롤링       | Python, Selenium          |
| 기타         | GitHub, Sourcetree, Figma |

## 프로젝트 구조

```bash
ForkFineSejong/
├── frontend/                     # React 프로젝트
│   ├── src/                      # 소스 코드 루트
│   │   ├── asset/                # 로고, 썸네일 등 정적 이미지 리소스
│   │   ├── components/           # 주요 UI 컴포넌트 모음
│   │   ├── App.jsx               # 라우팅 및 전체 페이지 구성
│   │   └── …
│   └── …                         # Vite 설정 파일 등 기타 프론트엔드 자원
├── backend/                      # Spring Boot 프로젝트
│   ├── src/main/
│   │   ├── java/
│   │   └── resources/            # Schema, data 등 sql파일 포함
│   └── …
├── db/                           # DB 스키마 및 초기 데이터
│   ├── crawler/                  # 데이터 수집용 파이썬 코드
│   │   ├── restaurant.py
│   │   └── …
│   └── …
└── README.md                     # 프로젝트 설명 파일
```

## 백엔드 실행 방법

아래 단계만 따라 하면 백엔드 서버를 바로 실행할 수 있습니다. 모든 명령은 프로젝트 루트 폴더의 `backend/FFS` 디렉터리에서 실행하세요.

### 백엔드 서버 배포 (AWS EC2)

본 프로젝트는 `AWS EC2`에서 Spring Boot 백엔드를 원격 서버로 배포했습니다.

---

### 1. EC2 인스턴스 생성

- EC2 인스턴스 생성 및 기본 설정 방법은 아래 공식 가이드를 참고하세요.

  🔗 [AWS EC2 시작하기 가이드](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/EC2_GetStarted.html)

### 2. 서버 내 환경 설정 및 실행

- Java, MariaDB 설치(jdk 17 권장)

  ```bash
  sudo apt update
  sudo apt install openjdk-17-jdk
  sudo apt install mariadb-server
  ```

- 권한 설정 및 데이터베이스 준비

  ```bash
  sudo mariadb

  CREATE USER 'ffs_user'@'localhost' IDENTIFIED BY '0000';
  GRANT ALL PRIVILEGES ON FFS.* TO 'ffs_user'@'localhost';
  FLUSH PRIVILEGES;

  CREATE DATABASE FFS CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
  ```

- 스프링 프로젝트 clone 및 프로젝트 빌드

  ```bash
  git clone https://github.com/사용자명/ForkFineSejong.git
  cd ForkFineSejong/Spring/FFS
  ./mvnw clean package
  chmod +x mvnw                 # 실행 권한 부여(Permission denied 오류 시)
  ```

- 백엔드 서버(프로젝트) 실행

  ```bash
  ./mvnw spring-boot:run
  ```

### ⚠️ 서버 실행 전 확인 사항

- 백엔드(Spring Boot)는 외부 DB와 연결되므로, **EC2 인스턴스가 반드시 실행 중이어야 합니다.**
- EC2 인스턴스가 꺼져 있으면 접속해도 연결되지 않습니다.
- 프론트엔드와 연동 시에도 EC2 인스턴스 상태를 반드시 확인하세요.

---

## 프론트엔드 실행 방법

Fork&FineSejong의 프론트엔드는 `frontend/` 디렉토리 하위에 구성되어 있으며, **React + Vite** 기반으로 개발되었습니다.  
Spring Boot 백엔드 서버(`localhost:8080`)와 연동하여 음식점 정보를 제공합니다.

---

### 1. Node.js 및 npm 설치

- **macOS (Homebrew)**

  ```bash
  brew install node
  ```

- **Windows/기타 OS**

  공식 사이트에서 Node.js LTS 버전 다운로드
  < https://nodejs.org>

---

### 2. 의존성 설치 및 개발 서버 실행

```bash
cd frontend
npm install
npm install react-icons
npm run dev
```

- Vite 개발 서버가 기본적으로 `http://localhost:5173` 에서 작동합니다.
- 백엔드 서버(`localhost:8080`)가 먼저 실행 중이어야 정상 작동합니다.

---

### 3. 주요 명령어 요약

| 명령어            | 설명                      |
| ----------------- | ------------------------- |
| `npm install`     | 패키지 의존성 설치        |
| `npm run dev`     | 개발 모드 실행 (Vite)     |
| `npm run build`   | 프로덕션 빌드             |
| `npm run preview` | 빌드된 정적 파일 미리보기 |

---

### 4. 프론트엔드 컴포넌트 목록

| 컴포넌트명         | 설명                                              |
| ------------------ | ------------------------------------------------- |
| `Header`           | 상단 로고, 검색창, 자동완성/최근검색 기능 포함    |
| `MainBanner`       | 메인 페이지 최상단 배너 UI                        |
| `CategoryFilter`   | 카테고리별 음식점 필터 (예: 한식, 중식, 양식 등)  |
| `LocationFilter`   | 정문/후문/기타 위치 기반 음식점 필터 스크롤 UI    |
| `RestaurantCard`   | 음식점 정보를 카드 형태로 보여주는 컴포넌트       |
| `RestaurantList`   | 음식점 카드들을 리스트로 나열                     |
| `RestaurantDetail` | 특정 음식점의 상세정보 페이지 (메뉴, 리뷰 포함)   |
| `FindMap`          | 검색 결과 음식점 목록과 지도를 함께 보여주는 화면 |
| `KakaoMapList`     | 여러 음식점의 주소를 기반으로 마커를 표시         |
| `KakaoMapSingle`   | 단일 음식점의 위치를 지도에 표시                  |

- 각 컴포넌트에 대응하는 .css 파일도 함께 존재하여, 모듈 단위로 UI 및 로직을 분리한 구조

## 배포 관련 정보

### 배포 정보

- 배포 플랫폼: Vercel
- 배포 주소: https://fork-find-sejong.vercel.app
- 프로젝트 루트: frontend/

### 라우팅 및 프록시 설정 (vercel.json)

```
{
"rewrites": [
  {
    "source": "/api/:path*",
    "destination": "http://3.35.234.131:8080/:path*"
  },
  {
    "source": "/(.*)",
    "destination": "/index.html"
  }
]
}
```

- /api/\* 요청은 벤엔드 서버로 프록시
- 나머지 요청은 index.html로 React Router가 처리
- master에 병합시 자동으로 배포되게 설정
