// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1cm),
)
#set text(
  font: "Apple SD Gothic Neo",
  size: 10pt,
  lang: "ko",
  fill: rgb("#2d3436")
)

// MARK: 스타일 정의

/// Situation (Red): 문제 정의
#let color-s = rgb("#e02424") 

/// Behavior (Green): 기능 구현
#let color-b = rgb("#009000") 

/// Impact (Blue): 리팩토링/최적화
#let color-i = rgb("#0052cc")

// Main Theme
#let color-primary = rgb("#2c3e50") 
#let color-gray = rgb("#636e72")

/// 회사 헤더
#let company-header(name, period, role) = {
  v(2em)
  grid(
    columns: (auto, auto, 1fr), // 이름, 직책, 기간(우측 정렬)
    gutter: 0.6em,
    align: (left + horizon, left + horizon, right + horizon),
    box(
      fill: black, 
      inset: (x: 1.2em, y: 0.6em), 
      radius: 12pt,
      text(size: 13pt, weight: "bold", fill: white)[#name]
    ),
      text(size: 11pt, weight: "bold", fill: rgb("#34495e"))[#role],
      text(size: 10pt, weight: "medium", fill: rgb("#7f8c8d"))[#period]
  )
}

// 섹션 타이틀 함수
#let section-title(title) = {
  text(size: 16pt, weight: "black", fill: color-primary)[#title]
  v(-1.2em)
  line(length: 100%, stroke: 2pt + color-primary)
  v(-2em)
}

// 프로젝트 아이템 함수 (TDD 컬러 적용)
#let project-item(title, period, problem, solution, result) = {
  // 1. 제목과 기간을 한 줄에 배치 (좌측: 제목, 우측: 기간)
  block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.5em,
      text(size: 11pt, weight: "bold", fill: black)[#title],
      text(size: 8pt, style: "normal", weight: "regular", fill: rgb("#666666"))[#period]
    )
  ]
  
  // SBI 내용
  pad(left: 0.4em)[
    #set par(leading: 0.7em) // 텍스트 줄 간격(행간) 확대
    #grid(
      columns: (2.2em, 1fr),
      row-gutter: 1.2em,    // S, B, I 항목 간 간격 대폭 확대
      column-gutter: 0.6em,
      
      // S: Situation -> RED
      text(size: 10pt, weight: "black", fill: color-s)[상황],
      text(size: 10pt, fill: rgb("#444444"))[#problem],

      // B: Behavior -> GREEN
      text(size: 10pt, weight: "black", fill: color-b)[행동],
      text(size: 10pt)[#solution],

      // I: Impact -> BLUE
      text(size: 10pt, weight: "black", fill: color-i)[영향],
      text(size: 10pt, weight: "semibold")[#result]
    )
  ]
  v(0.5em)
}

// MARK: 문서 타이틀 (카카오 스타일 노란 박스)
#align(center)[
  #block(
    width: 100%,
    fill: rgb("#FEE500"), // 카카오 옐로우
    radius: 12pt, // 라운드 값을 조금 줄여서 세련되게
    inset: 1em,
    [
      #text(size: 22pt, weight: "black", fill: black)[경력 기술서]
      #v(-1.5em)
      #align(center)[
        #grid(
          columns: (auto, auto, auto, auto, auto),
          gutter: 0.6em,
          text(size: 11pt, weight: "bold")[이규현],
          text(size: 11pt, fill: rgb("#555555"))[|],
          text(size: 11pt)[iOS 앱 개발자],
          text(size: 11pt, fill: rgb("#555555"))[|],
          text(size: 11pt)[7년차 (Total 11년)]
        )
      ]
    ]
  )
]

// ---------------------------------------------------------
// 1. 컬리
// ---------------------------------------------------------
#section-title("주요 경력 (iOS)")

#company-header("컬리 (Kurly)", "2021.10.20 – 현재", "검색·추천 도메인 iOS 리드")

/// 멀티섹션 2023.07 - 10
#project-item(
  "멀티섹션 검색결과: SDUI 도입 및 비즈니스 확장성 확보",
  "23.07 - 23.10",

  // Situation
  "단순 나열형 탐색 구조를 탈피하여 멀티 섹션을 도입하려 했으나, 백엔드 조직의 View Logic 처리에 대한 기술적 이견 발생.\n이로 인해 SDUI 구축 및 확장성 확보에 난항을 겪는 상황.",
  
  // Behavior: '상위 리더 소집' -> '의사결정권자 설득'으로 표현 업그레이드
  "실무진 및 의사결정권자를 소집하여 앱 배포 의존성 제거(Time-to-Market)의 중요성을 설득, SDUI 도입 합의를 이끌어냄.\n클라이언트 주도의 JSON 스키마 '역제안' 및 Modern CollectionView 적용으로 복잡한 멀티 섹션 렌더링 성능 최적화.",
  
  // Impact: '현재까지 이어지는 성과'임을 명시
  "기획/운영팀이 개발자 없이도 섹션의 노출 및 위치를 즉시 제어 가능한 유연한 환경 마련.\n탐색 편의성 증대로 오가닉 대비 약 20%의 추가 매출(25년 기준)을 창출, 비즈니스 성장을 견인하는 핵심 지면."
)

/// 상품 탐색 필터 2022.03 - 07
#project-item(
  "상품 탐색 필터 신규 구축: 플랫폼 간 경험 동기화 및 컴포넌트화",
  "22.08 - 22.09",

  // Situation: Android 고도화에 따른 iOS의 추격(Catch-up) & 신규 개발 필요성
  "Android의 필터 기능 고도화에 발맞춰, iOS에서도 동일한 수준의 탐색 경험을 제공하기 위해 신규 필터 시스템 구축 필요.
기존 레거시 리스트 구조 위에서 최신 스펙을 제로 베이스로 구현해야 하는 과제.",
  
  // Behavior: '모듈' 대신 '독립 컴포넌트' 사용, 설계의 우수성 강조
  "ReactorKit을 도입하여 비즈니스 로직이 UI와 분리된 '독립 컴포넌트(Component)'로 설계.
향후 물리적 모듈 분리가 용이하도록 결합도 최소화.\n레거시 뷰 컨트롤러와는 Delegate 패턴으로 소통하고, 렌더링 루프(LayoutSubviews) 제어로 스크롤 동기화 이슈 해결.",
  
  // Impact: UX 통일 + 확장성
  "안드로이드와 동등한 수준의 필터 기능을 적시에 런칭하여 플랫폼 간 UX 격차(Parity) 해소.\n재사용 가능한 컴포넌트 구조로 상품 리스트 전반의 확장성을 확보했으며, 오픈 직후 클릭률 2.8% 달성."
)

/// 뷰티컬리 런칭 2022.05 - 07
#project-item(
  "뷰티컬리 런칭: 확장형 버티컬 서비스 아키텍처 구축",
  "22.05 - 22.07",
  
  // Situation
  "단일 커머스 앱에 신규 버티컬(뷰티)을 추가하는 과정에서, 백엔드 API가 도메인별 Path로 물리적 분리.\n따라서 클라이언트 네트워크 계층의 파편화 및 복잡도가 급증할 위기.",
  
  // Behavior
  "OCP 원칙에 기반한 'Site' 프로토콜을 정의하여 UI 테마와 API 라우팅 정책을 캡슐화.\nDI 컨테이너를 통해 앱 실행 시점의 서비스 타입에 맞는 구현체와 API Endpoint가 네트워크 레이어에 자동 주입되도록 설계.",
  
  // Impact
  [서비스 간 의존성을 완벽히 분리하여 뷰티컬리를 안정적으로 런칭.\ 뷰티 주문 비중 2.5% 및 상단 탭 전환 유입 6.3% 달성.\ 이를 통해 전사 3천억 순증 목표 달성의 핵심 기술적 토대 마련. #link("https://helloworld.kurly.com/blog/beauty-kurly-launching-app/")[#text(fill: blue, size: 9pt)[📎 관련 기술 블로그]]]
)

/// 장바구니 리뉴얼 2022.03 - 07
#project-item(
  "장바구니 시스템 리뉴얼: 상태 관리 최적화 및 리스크 방어",
  "22.03 - 22.07",

  // Situation: 절체절명의 위기 (담당자 부재 + 기술적 난이도 + 의존성)
  "백엔드 아키텍처 재설계로 클라이언트 전면 재개발이 요구되었으나, 핵심 인력 공백으로 프로젝트 중단 위기.\n동시에 '상품 개편' 브랜치와 강하게 결합되어 있어 데이터 정합성 유지 난이도가 최상인 상황.",
  
  // Behavior: 기술적 해법(ReactorKit) + 프로세스 해법(Rebase/긴급투입)
  "긴급 투입되어 ReactorKit(UDH)을 도입, 복잡한 장바구니 상태/액션을 단방향으로 통제하여 사이드 이펙트 차단.\nRebase 기반의 형상 관리 전략을 수립하여 매일 변하는 상품 코어 로직과의 충돌을 해소하고 약 20일(WD) 만에 코드 재구축 완수.",
  
  // Impact: 안정성 + 연결(Integration)
  "예측 가능한 상태 관리 구조를 통해 QA 리소스를 최소화하고 유지보수성 확보.\n상품 탐색에서 주문으로 이어지는 핵심 매출 파이프라인을 결함 없이 연결하여 대규모 개편 프로젝트의 성공적 런칭 견인."
)

#project-item(
  "데이터 기반 플랫폼: GrowthBook & 광고 솔루션",
  "2022.05 - 2022.11",
  "실험 플랫폼 부재로 데이터 검증이 어려웠고, 광고 도입 시 메인 스레드 부하 우려.",
  "1) GrowthBook SDK 도입 시 @globalActor로 Thread-safe 환경 구축. \n2) 광고 노출 처리에 Actor 기반 비동기 파이프라인 적용.",
  "검색 자동완성 도입(qCTR 5.9%↑) 등 데이터 기반 문화 정착 및 광고 도입 2주 만에 장바구니 담기 40만 건 유도."
)

// ---------------------------------------------------------
// 2. KST Mobility
// ---------------------------------------------------------
#company-header("케이에스티모빌리티", "2020.10 – 2021.10", "iOS 개발 / 마카롱M")

#project-item(
  "RIBs 아키텍처 도입 및 지도 자원 최적화",
  "2022.05 - 2022.11",
  "MVP 패턴 하에서 지도 인스턴스와 로직이 강결합되어 메모리 효율이 낮고 재사용 불가.",
  "Uber의 RIBs 아키텍처를 도입하여 비즈니스 로직을 모듈화하고, 무거운 지도 뷰를 Attach/Detach 가능한 구조로 리팩토링.",
  "메모리 효율성 개선 및 모듈 간 의존성 분리로 유지보수성 대폭 강화 (Modular Architecture)."
)

#project-item(
  "호출 코어 SDK 모듈화 및 실시간성 개선 (SSE)",
  "2022.05 - 2022.11",
  "택시 호출 로직이 앱에 종속되어 확장이 어렵고, Polling 방식으로 배차 응답이 느림.",
  "호출 핵심 로직을 독립 SDK로 분리하고, 통신 방식을 SSE(Server-Sent Events)로 전환.",
  "호출 응답 실시간성 확보 및 비즈니스 확장을 위한 기술적 기반 마련."
)

// ---------------------------------------------------------
// 3. 비주얼
// ---------------------------------------------------------
#company-header("비주얼 (Visual)", "2019.07 – 2020.08", "iOS 개발 / 아몬즈")

#project-item(
  "RxSwift 도입 및 반응형 프로그래밍 기반 구축",
  "2022.05 - 2022.11",
  "복잡한 비동기 처리와 상태 동기화 문제로 코드 가독성 저하 및 버그 발생.",
  "팀 내 최초로 RxSwift 도입을 제안하고, 비동기 로직을 선언형으로 전환하여 데이터 흐름을 단방향으로 구조화.",
  "코드 복잡도를 낮추고 유지보수성을 높였으며, 반응형 UI('태그 탭') 구축으로 탐색 경험 개선."
)


// ---------------------------------------------------------
// 4. 이전 경력
// ---------------------------------------------------------
#section-title("기타 경력 (임베디드 및 기반 기술)")

#company-header("케어랩스 (인턴)", "2019.02 – 2019.05", "굿닥 iOS 개발")
- 네이버 지도 SDK 마이그레이션(Obj-C $->$ Swift) 및 로컬 알림 기반 건강 기능 1인 개발 (전환 과제)

#company-header("한국이엔이 (임베디드)", "2015.08 – 2018.09", "보안 인증 SW 개발")
- ISO-8583 금융 표준 프로토콜 설계 및 메모리 보안(Zeroization) 로직 구현 (보안 인증 20회 획득)

#company-header("케이엠데이타 / 나무가", "2013.09 – 2015.07", "임베디드 & 생산기술")
- RTOS 커널 디버깅 및 삼성전자 공정 표준화 경험 (안정성/품질 마인드셋)