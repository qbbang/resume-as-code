// --- 설정 시작 ---
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.5cm),
)

// 폰트 설정 (Mac: "Apple SD Gothic Neo", Windows: "Malgun Gothic")
#set text(
  font: "Apple SD Gothic Neo", 
  size: 10pt,
  lang: "ko"
)

// --- 커스텀 함수 정의 ---
#let name-header(name, role, phone, email) = {
  align(center)[
    #text(size: 20pt, weight: "bold")[#name] \
    #v(0.5em)
    #text(size: 11pt, weight: "medium")[#role] \
    #v(0.3em)
    #text(size: 9pt, fill: rgb("#555555"))[#phone | #link("mailto:" + email)[#email]]
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + rgb("#aaaaaa"))
  ]
}

#let section-title(title) = {
  v(1em)
  text(size: 14pt, weight: "bold", fill: rgb("#000000"))[#title]
  v(0.3em)
  line(length: 100%, stroke: 0.5pt + rgb("#333333"))
  v(0.5em)
}

#let exp-item(company, date, role, content) = {
  v(0.5em)
  grid(
    columns: (1fr, auto),
    gutter: 0.5em,
    text(size: 11pt, weight: "bold")[#company],
    text(size: 10pt, style: "italic", fill: rgb("#555555"))[#date]
  )
  if role != "" {
    text(size: 10pt, weight: "semibold", fill: rgb("#333333"))[#role]
  }
  v(0.3em)
  content
}

// --- 문서 본문 시작 ---

#exp-item("컬리", "2021.10 – 현재", "검색·추천 도메인 iOS 리드", [
  - 뷰티컬리 런칭을 위한 OCP 기반 멀티 서비스 아키텍처 설계 및 의존성 분리
  - 멀티 섹션 검색 결과를 위한 SDUI 스키마 역제안 및 확장 가능한 검색 시스템 구축
  - 전사 A/B 테스트 플랫폼(GrowthBook) PoC 성공 및 확대, 기술 가이드 전파 주도
  - 광고 솔루션(Moloco) 도입 및 CTR 정합성을 위한 이벤트 표준화, Actor 기반 비동기 최적화
  - 텍스트 렌더링 표준화(First-party) 및 콜스택 최적화로 렌더링 성능 개선 (25ms→16ms)
])

#exp-item("케이에스티모빌리티", "2020.10.01 – 2021.10.01", "iOS 개발 / 마카롱M", [
  - 지도 자원 효율화를 위해 MVP에서 RIBs 아키텍처로 점진적 리팩토링
  - 비즈니스 확장을 위한 호출 코어 SDK 모듈화 및 SSE 기반 실시간성 개선
  - 신규 유입 확대를 위한 App Clip 기술 제안 및 구현으로 서비스 접근성 개선
  - *퇴사사유: 회사 경영 악화로 인한 퇴사*
])

#exp-item("비주얼", "2019.07.01 – 2020.08.14", "iOS 개발 / 아몬즈(Amondz)", [
  - RxSwift 도입으로 반응형 프로그래밍 기반 구축 및 태그 탭 개발
  - Remote Config 기반 Feature Flag 도입으로 안정적 배포 환경 마련
  - MD 승인 업무 자동화를 위한 사내용 iOS 앱 개발 및 리소스 절감
])

#exp-item("케어랩스", "2019.02.25 – 2019.05.24", "iOS 인턴 / 굿닥", [
  - 네이버 지도 SDK 연동 등 레거시 코드의 Swift 마이그레이션 수행
  - Local Notification 기반 '간헐적 단식' 기능 기획·디자인·개발 (인턴 전환 과제)
])

#exp-item("한국이엔이", "2015.08.06 – 2018.09.01", "임베디드 SW 개발", [
  - **[여신전문금융업법 기술 기준에 따른 셀프주유기 임베디드 SW 개발 및 보안 인증 주도]**
  - VAN사·POS·단말기 조합 변경에 따른 파생 인증을 포함하여 총 20회 이상 보안 인증(KSEL) 획득
  - ISO-8583 표준 규격을 적용한 단말기-POS 간 시리얼 통신 프로토콜 설계 및 결제 전문 파싱 로직 개발
  - IC 카드리더기 암호화 데이터 연동, 민감 정보 마스킹 및 메모리 적재 금지 로직 구현
])

#exp-item("케이엠데이타", "2014.07.07 – 2015.07.26", "임베디드 시스템 기술 지원", [
  - Green Hills RTOS 기반 차량용 전장 소프트웨어 기술 지원
  - 고객사 시스템 크래시 디버깅 및 개발 가이드라인 제공
])

#exp-item("나무가", "2013.09.10 – 2014.03.25", "생산기술 / 모바일 카메라 모듈", [
  - 삼성전자 무선사업부 납품용 5M 카메라 모듈 양산 승인 절차 담당
  - 제조 공정 표준화 및 품질 이슈 대응
])