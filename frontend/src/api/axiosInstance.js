// src/api/axiosInstance.js
import axios from "axios";

// 절대 주소가 아니라, 상대경로만 설정
// 실제 배포 환경에선 Vercel이 /api/** 를 rewrite 해서 뒤에서 HTTP 백엔드로 포워딩해준다.
const api = axios.create({
  baseURL: "/api", // ← 절대 URL이 아니라 "/api" 만 가리키면 됨
});

export default api;
