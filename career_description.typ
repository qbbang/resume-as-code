// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (top: 32pt, bottom: 32pt, x: 32pt), // Converted to pt
  fill: white
)

#set text(
  font: ("SF Pro Text", "Apple SD Gothic Neo"),
  size: 10pt,
  fill: rgb("#1d1d1f"), // Apple Dark Gray (Almost Black)
  fallback: true
)

// MARK: Colors (Apple Design System)
#let apple-blue = rgb("#0066cc") // Link Blue
#let apple-gray = rgb("#86868b") // Secondary Text
#let apple-light-gray = rgb("#f5f5f7") // Backgrounds
#let apple-border = rgb("#d2d2d7") // Dividers
#let code-bg = rgb("#f5f5f7") // Code Block Background

// New Colors
#let apple-black = rgb("#1d1d1f") // Primary Text
#let apple-red = rgb("#FF3B30").lighten(50%) // System Red (Pastel)
#let apple-green = rgb("#34C759").lighten(50%) // System Green (Pastel)
#let apple-system-blue = rgb("#007AFF").lighten(50%) // System Blue (Pastel)

// MARK: Components

// Breadcrumb Navigation
#let breadcrumb(items) = {
  text(size: 9pt, fill: apple-gray)[
    #items.join("  ›  ")
  ]
}

// Badge (Platform/Version style)
#let doc-badge(content) = {
  box(
    stroke: 1pt + apple-border,
    radius: 4pt,
    inset: (x: 0.4em, y: 0.2em),
    text(size: 8pt, weight: "medium", fill: apple-gray)[#content]
  )
}

// Section Header (Topics style)
#let section-header(title) = {
  v(16pt)
  text(size: 19pt, weight: "bold", fill: apple-black)[#title]
  v(-10pt)
  line(length: 100%, stroke: 1pt + apple-border)
  v(-4pt)
}

// Declaration Block (Code Style Summary)
#let declaration-block(content) = {
  block(
    width: 100%,
    fill: code-bg,
    radius: 8pt,
    inset: 1em,
    stroke: none,
    text(font: ("SF Pro Text", "Apple SD Gothic Neo"), size: 9.5pt, fill: apple-black)[#content]
  )
}

// MARK: Resume Specific Components

#let company-header(name, period, role, color: none) = {
  // --- 색상 로직 ---
  let text-color = apple-black
  let bg-color = rgb("#F5F5F7") // Apple Light Gray

  if color != none {
    text-color = color
    bg-color = color.lighten(92%) // Ultra subtle tint for clean look
  }

  v(1.2em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (left + horizon, right + horizon),
    
    // 회사 배지 (칩) - Modern Flat Style (Apple Tag)
    // 뉴모피즘 제거 -> 플랫하고 깔끔한 디자인
    box(
      fill: bg-color,
      radius: 6pt,
      inset: (x: 0.6em, y: 0.4em),
      text(size: 11pt, weight: "bold", fill: text-color)[#name]
    ),
    
    // 우측 정보 (직무, 기간)
    stack(
      dir: ltr,
      spacing: 1fr,
      text(size: 12pt, weight: "semibold", fill: apple-black)[#role],
      text(size: 10pt, weight: "regular", fill: apple-gray)[#period]
    )
  )
}

#let company-summary(tags, summary) = {
  v(0.5em)
  text(size: 11pt, fill: apple-black)[#summary]
  v(0.5em)
  grid(
    columns: (auto,) * tags.len(),
    gutter: 0.5em,
    ..tags.map(tag => doc-badge(tag))
  )
  v(1em)
}

#let project-item(title, period, problem, solution, result) = {
  v(1.0em)
  
  // 1. 프로젝트 타이틀 & 기간
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.5em,
      text(size: 11.5pt, weight: "bold", fill: apple-black)[#title],
      text(size: 9.5pt, weight: "regular", fill: apple-gray)[#period]
    )
  ]
  
  v(0.3em)
  
  // 2. SBI 본문 (장식 제거, 텍스트 위계 중심)
  // 내부 함수: 라벨 + 내용 구조화
  let sbi-row(label, content) = {
    pad(left: 0.2em, bottom: 0.6em)[
      #grid(
        columns: (4.5em, 1fr), // 라벨 너비 고정 (정렬 맞춤)
        gutter: 0.5em,
        
        // Label (작고 회색으로 처리하여 거슬리지 않게 함)
        align(right + top)[
          #text(size: 9pt, weight: "medium", fill: apple-gray)[#label]
        ],
        
        // Content (Summary는 Bold, Detail은 Regular가 섞인 텍스트)
        text(size: 10pt, fill: apple-black, bottom-edge: "descender")[#content]
      )
    ]
  }

  sbi-row("Situation", problem)
  sbi-row("Behavior", solution)
  sbi-row("Impact", result)
  
  // 구분선 (아주 연하게)
  v(0.5em)
  line(length: 100%, stroke: 0.3pt + rgb("#e5e5ea"))
}


// ==========================================================================
// 문서 시작 (Career Description -> Apple Docs Style)
// ==========================================================================

#breadcrumb((
  text(fill: apple-blue)[#link("https://developer.apple.com/pathways/")[Pathway]],
  text(fill: apple-blue)[#link("https://developer.apple.com/")[Apple Developer]],
  "platforms",
  text(fill: apple-blue)[#link("https://developer.apple.com/ios/")[iOS]]
))

#v(4pt)

#text(size: 13pt, fill: apple-black)[
  iOS 앱 개발자 | 7년차 (Total 11년)
]

#v(10pt)

#declaration-block[
  증명 가능한 엔지니어링. 7년차 iOS 아키텍트로서 데이터와 지표를 근거로 합리적인 의사결정을 이끌어냅니다. \
  코드는 팀의 자산이라는 책임감으로, 테스트와 정량적 검증을 통해 안정성을 스스로 입증하며 지속 가능한 성장을 만듭니다.
]

// MARK: - Kruly Description
#section-header("주요 경력 (iOS)")

#company-header("컬리", "2021.10 – 현재", "검색·추천 도메인 iOS 리드 | 컬리", color: rgb("#5a31f4"))

#company-summary(
  ("Architecture", "Performance", "DevOps", "Infrastructure", "Data Culture"), 
  [기술 부채 제로화와 데이터 기반의 의사결정 체계 구축. 유연한 아키텍처(SDUI, Modular)와 고성능 렌더링 파이프라인을 도입하여, 급변하는 커머스 환경에서 비즈니스 속도와 서비스 안정성을 동시에 확보했습니다.]
)

// MARK: - Kurly Projects

#project-item(
  "[Optimization] 텍스트 렌더링 엔진 표준화 및 레거시 청산",
  "25.10 - 25.11", 
  // Situation
  [
    *파편화된 텍스트 처리 방식과 외부 의존성 리스크.* \
    서드파티 라이브러리(BonMot)와 600여 곳의 파편화된 확장 함수 사용으로 런타임 오버헤드가 발생했고,\ 누적된 Deprecated 경고가 빌드 안정성을 위협했습니다.
  ],
  // Behavior
  [
    *네이티브 표준화 및 렌더링 파이프라인 최적화.* \
    외부 의존성을 제거하고 순수 UIKit 기반의 표준 인터페이스(Convenience Init)를 구축했습니다.\ 특히 ParagraphStyle 캐싱 전략을 셀(Cell) 라이프사이클에 도입해 렌더링 비용을 최소화했습니다.
  ],
  // Impact
  [
    *기술 부채 제로화 및 렌더링 성능 확보.* \
    4,500 라인 규모의 대대적 마이그레이션을 통해 관련 빌드 경고를 100% 제거하고,\ 복잡한 리스트 UI에서도 프레임 드랍 0%(Max 16ms)를 달성하며 시스템 안정성을 입증했습니다.
  ]
)

#project-item(
  "[DevOps & Modular] 모듈화 기반 조성 및 물리적 구조 표준화",
  "25.10 - 25.10",
  // Situation
  [
    *논리적 그룹과 물리적 디렉토리 구조의 불일치.* \
    Xcode 가상 그룹(Group)은 실제 파일 위치와 무관하게 구성될 수 있어, \ 향후 SPM 등 디렉토리 기준의 모듈 단위로 경계를 명확히 구분하는 데 구조적 제약이 있었습니다.
  ],
  // Behavior
  [
    *Tuist 기반의 물리적 구조 동기화(Physical Sync) 체계 도입.* \
    프로젝트 내비게이터와 디스크 경로가 1:1로 논리적 구조와 물리적 구조를 동기화(buildableFolders)했습니다. \ 이를 통해 디렉토리 기준으로 모듈 간 경계를 명확히 하고, Common 레이어 및 의존성 규칙을 정립했습니다.
  ],
  // Impact
  [
    *모듈화 토대 완비 및 SPM 전환 용이성 확보.* \
    파일 시스템 수준에서 모듈 경계를 확립하여 프로젝트의 물리적 복잡도를 낮췄습니다. \ 이를 통해 향후 별도의 파일 재배치 없이 즉시 SPM 패키지로 분리 가능한 'Ready-to-Extract' 상태를 완성했습니다.
  ]
)

#project-item(
  "[Architecture & Refactoring] 리스트 구조 정상화 및 인터랙션 고도화",
  "25.08 - 25.09",
  // Situation
  [
    *잘못된 레이아웃 설계로 인한 터치 인터페이스 결함.* \
    단일 섹션 상단에 다수의 헤더를 적층하여 좌표계 불일치가 발생했고, 필터 터치 시 상품이 선택되는 버그가 존재했습니다.
  ],
  // Behavior
  [
    *멀티 섹션 구조 재설계 및 대규모 리팩토링.* \
    약 5,000라인(+2,322/-2,591)을 재작성하여 3차 카테고리를 독립 뷰로 분리해 간섭을 차단했습니다.\ 또한 비대한 ReactorKit 상태를 경량화하고 모핑 애니메이션을 적용했습니다.
  ],
  // Impact
  [
    *인터페이스 신뢰성 회복 및 High-Fidelity UX 달성.* \
    터치 영역 오류를 100% 해결하여 이탈률을 방어했으며,\ 정교하게 튜닝된 애니메이션 커브를 통해 필터링 경험의 시각적 품질을 극대화했습니다.
  ]
)

#project-item(
  "[Modernization] SwiftUI 점진적 도입 및 검색 경험 현대화",
  "25.08 - 25.08",
  // Situation
  [
    *UIKit의 표현력 한계와 높은 구현 비용.* \
    최근 검색어의 요구사항인 가변 칩(Chip)의 멀티라인 페이징 등 복잡한 동적 레이아웃을\ 기존 UIKit으로 구현하기에는 구조적 제약이 컸으며, 뷰 갱신 시의 불필요한 오버헤드가 발생했습니다.
  ],
  // Behavior
  [
    *하이브리드 렌더링 파이프라인 구축.* \
    복잡한 뷰를 SwiftUI로 전환해 선언형으로 간결하게 구현하고,\ HostingController를 단일 인스턴스로 캐싱(Lazy Init)하여 뷰 스위칭 비용을 획기적으로 줄였습니다.
  ],
  // Impact
  [
    *매출 기여 및 레거시 의존성 제거.* \
    검색 진입점을 고도화하여 연간 약 133억 원의 매출 증대 효과를 시뮬레이션했으며,\ SwiftUI전환을 통해 유지보수 효율을 높였습니다.
  ]
)

#project-item(
  "[Architecture & Abstraction] AppsFlyer 도입 및 트래킹 시스템 표준화",
  "25.06 - 25.08",
  
  // Situation: 'N개의 벤더 = N번의 호출'이라는 비효율과 강결합 문제 지적
  [
    *다중 싱글톤 의존성으로 인한 코드 중복과 강한 결합.* \
    여러 트래킹 툴(Branch 등)이 각각 싱글톤으로 구현되어 있어, \이벤트 전송 시마다 벤더별 인터페이스를\ 반복 호출해야 했으며 신규 툴(AppsFlyer) 도입 시 수정 범위가 광범위했습니다.
  ],
  
  // Behavior: Composite 패턴 & 딕셔너리 디스패치 구조 설명
  [
    *Composite 패턴 기반의 단일 인터페이스 구축.* \
    트래커를 프로토콜로 추상화하고 Composite 패턴으로 묶어, 딕셔너리 형태의 단일 이벤트를 전송하면 내부 로직이\ Key 유무에 따라 적절한 벤더에게 자동 라우팅하는 구조로 표준화했습니다.
  ],
  
  // Impact: 코드 간결성 확보 & 확장성
  [
    *보일러플레이트 제거 및 벤더 중립적 환경 완성.* \
    복잡한 분기 처리 없이 단 한 줄의 호출로 다중 트래킹이 가능해져 비즈니스 로직의 오염을 막았으며,\ AppsFlyer 전환 및 향후 어떤 벤더 추가에도 유연한 아키텍처를 완성했습니다.
  ]
)

#project-item(
  "[Infrastructure & Culture] GrowthBook 도입 및 데이터 실험 문화 정착",
  "24.04 - 24.08",
  
  // Situation
  [
    *데이터 기반 의사결정 체계의 부재.* \
    조직 내 실험 인프라가 전무하여 TF가 결성되었으며,\ 비용 효율성과 데이터 파이프라인 연동성을 모두 만족하는 최적의 솔루션 선정이 시급했습니다.
  ],
  
  // Behavior: 검토 과정(주도성) -> 의사결정(비용) -> 기술적 보완(SDK)
  [
    *솔루션 비교 검토 주도 및 정합성 보장 SDK 설계.* \
    Amplitude와의 기술 미팅을 직접 주관하며 도입을 검토했으나, 비용 효율성을 고려해 GrowthBook을 최종 채택하였고\ \`Actor\` 기반의 동시성 제어 로직을 적용하여, 실험 할당 시점의 데이터 정합성을 완벽히 보장하도록 구현하였습니다.
  ],
  
  // Impact
  [
    *검색 CTR +3.3% 달성 및 실험의 표준 프로세스화.* \
    PoC 실험(검색 탭)에서 클릭률을 12.3% 개선하며 플랫폼의 효용을 입증했고, 사내 세미나와 가이드 배포를 통해\ A/B 테스트를 개발 조직의 필수 표준(Default) 문화로 안착시켰습니다.
  ]
)

#project-item(
  "[Architecture & SDUI] 멀티섹션 검색결과: SDUI 도입 및 비즈니스 유연성 확보",
  "23.07 - 23.10",
  
  // Situation: 팩트 중심 (기술적 이견 -> 교착 상태)
  [
    *기술적 이견으로 인한 SDUI 도입 난항.* \
    단순 나열형 구조를 탈피하고자 했으나, 백엔드 조직과의 View Logic 처리에 대한 기술적 이견으로\ SDUI 구축 및 확장성 확보가 지연되는 교착 상태였습니다.
  ],
  
  // Behavior: 스키마 설계 주도 -> 방향성 수립 -> 파이프라인 구축
  [
    *JSON 스키마 설계 및 Modern CollectionView 구현.* \
    클라이언트 주도의 JSON 스키마를 직접 설계 및 제안하여 개발 방향성을 확립했습니다.\ 렌더링 계층에서는 \`Compositional Layout\`을 도입, 멀티 섹션 구조로 동적으로 처리하도록 설계하고 개발하였습니다.
  ],
  
  // Impact: 운영 유연성 -> 매출 성과
  [
    *운영 유연성 확보 및 매출 기여.* \
    개발자 개입 없이 기획/운영팀이 섹션을 즉시 제어 가능한 환경을 구축했습니다.\ 이를 통해 탐색 편의성을 높여 오가닉 대비 약 20%(25년 기준)의 추가 매출을 창출하는 핵심 지면으로 성장시켰습니다.
  ]
)

/* 상품 필터 생략
#project-item(
  "[Componentization & UX Parity] 상품 탐색 필터 신규 구축: 컴포넌트화 및 UX 동기화",
  "22.08 - 22.09",
  
  // Situation
  [
    *플랫폼 간 경험 격차와 레거시 제약.* \
    Android의 필터 고도화에 따른 UX 격차(Parity)를 해소해야 했으나, 기존 레거시 리스트 구조 위에서 최신 스펙을 제로 베이스로 구현해야 하는 기술적 부채가 존재했습니다.
  ],
  
  // Behavior
  [
    *독립 컴포넌트 설계 및 렌더링 동기화.* \
    ReactorKit을 도입하여 UI와 로직이 분리된 '독립 컴포넌트'로 설계해 결합도를 최소화했습니다. 레거시 뷰 컨트롤러와는 Delegate로 소통하되, 렌더링 루프(LayoutSubviews)를 직접 제어하여 스크롤 동기화 문제를 해결했습니다.
  ],
  
  // Impact
  [
    *UX Parity 달성 및 확장성 확보.* \
    안드로이드와 동등한 수준의 기능을 적시에 런칭하여 사용자 경험을 통일했습니다. 재사용 가능한 컴포넌트 구조 덕분에 오픈 직후 클릭률 2.8%를 달성하며 상품 탐색 효율을 입증했습니다.
  ]
)
*/

#project-item(
  "[Architecture & Scalability] 뷰티컬리 런칭: 버티컬 서비스 아키텍처 구축",
  "22.05 - 22.07",
  
  // Situation
  [
    *도메인 분리에 따른 네트워크 파편화 위기.* \
    단일 앱에 신규 버티컬(뷰티)이 추가되면서 백엔드 API가 물리적으로 분리되었고,\ 이로 인해 클라이언트 네트워크 계층의 복잡도와 파편화가 급증할 위험이 있었습니다.
  ],
  
  // Behavior: SitePath 추상화 & 하위 계층 의존성 제어
  [
    *프로토콜 기반 추상화 및 의존성 주입(DI) 설계.* \
    API 경로(`SitePath`) 분기 처리를 위한 `SiteProtocol`을 정의하여 도메인별 정책을 캡슐화했습니다.\ 하위 네트워크 계층이 구체적인 서비스 대신 추상화된 인터페이스에만 의존하도록 DI 구조를 설계해,\ 기존 로직의 수정 없이도 안정적인 확장을 가능케 했습니다.
  ],
  
  // Impact
  [
    *안정적 런칭 및 비즈니스 목표 달성.* \
    서비스 간 의존성을 완벽히 분리하여 뷰티컬리의 성공적인 런칭을 견인했습니다.\ 뷰티 주문 비중 2.5% 및 탭 전환 유입 6.3%를 달성하며 전사 3천억 순증 목표의 기술적 토대를 마련했습니다.\ #link("https://helloworld.kurly.com/blog/beauty-kurly-launching-app/")[#text(fill: apple-blue, size: 9pt)[📎 관련 기술 블로그]]
  ]
)

/* 장바구니 리뉴얼 생략
#project-item(
  "[Stability & State Management] 장바구니 시스템 리뉴얼: 리스크 제로화 및 안정성 확보",
  "22.03 - 22.07",
  // Situation
  [프로젝트 중단 위기.\ 백엔드 재설계와 인력 공백, 강한 결합도가 맞물린 상황이었습니다.],
  // Behavior
  [단방향 상태 관리 도입.\ ReactorKit으로 사이드 이펙트를 차단하고, Rebase 전략으로 충돌을 최소화했습니다.],
  // Impact
  [결함 없는 런칭.\ 예측 가능한 구조로 유지보수성을 확보하고, 핵심 매출 파이프라인을 안정화했습니다.]
)
*/


// MARK: - KST Mobility
#company-header("KST Mobility (마카롱M)", "2020.10 – 2021.10", "iOS 개발자", color: rgb("#333333"))

#company-summary(
  ("RIBs Architecture", "SDK Development", "App Clip", "Optimization"), 
  [외부 연동을 위한 택시 호출 코어 SDK 개발 및 App Clip을 도입했습니다. 특히 Uber RIBs 아키텍처로 점진적으로 리뉴얼하여, 지도 기반 서비스의 고질적인 메모리 누수 문제를 아키텍처 레벨에서 해결했습니다.]
)

#project-item(
  "[SDK & Extension] 외부 호출 코어 SDK 개발 및 App Clip 구현",
  "21.04 - 21.10",
  // Situation
  [
    *서비스 접근성 확대 및 외부 연동 니즈.* \
    외부 앱에서 택시 호출 기능을 활용할 수 있는 코어 SDK가 필요했으며,\ 호출 수 향상을 위한 경량화된 진입점(App Clip) 구축이 요구되었습니다.
  ],
  // Behavior
  [
    *SDK 설계 및 App Clip 10MB 최적화.* \
    Decorator/Strategy 패턴을 활용해 확장 가능한 SDK 구조를 설계했습니다.\ App Clip 도입 시 10MB 제한을 준수하기 위해 리소스를 최적화하고 Apple App Site Association을 연동했습니다.
  ],
  // Impact
  [
    *서비스 확장 기반 마련.* \
    외부 제휴처를 위한 호출 SDK를 배포하고, App Clip을 통해 앱 설치 없이도 즉시 호출 가능한 환경을 구축하여\ 사용자 유입 경로를 다각화했습니다.
  ]
)

#project-item(
  "[Architecture & Optimization] 마카롱M RIBs 리뉴얼 및 메모리 누수 해결",
  "20.10 - 21.02",
  // Situation: '문제 감지'와 '도구를 통한 원인 규명' 강조
  [
    *Instruments 프로파일링을 통한 고용량 메모리 릭(Leak) 발견.* \
    화면 진입 시 메모리 사용량이 비정상적으로 증가함을 감지하고 Instruments로 추적했습니다.\ 지도 인스턴스가 해제되지 않고 재진입 시마다 100MB씩 중복 누적되는 치명적인 버그를 찾아냈습니다.
  ],
  // Behavior: RIBs 도입을 통한 해결 (기존 유지)
  [
    *RIBs 아키텍처 도입 및 모듈 생명주기 제어.* \
    Router를 통해 지도 모듈을 명확히 Attach/Detach 하는 구조를 설계하여,\ 화면 이탈 시 강한 참조를 끊고 메모리가 즉시 해제되도록 구현했습니다.
  ],
  // Impact: 성과 (기존 유지)
  [
    *메모리 누수 100% 해결 및 앱 안정성 확보.* \
    Instruments 재검증 결과 메모리 누수 0건을 달성했으며, 복잡한 지도 상태 관리를 아키텍처 레벨에서 통제하여\ 크래시 없는(Crash-free) 안정적인 서비스를 구축했습니다.
  ]
)
// MARK: - Bejewel
#company-header("Bejewel", "2019.07 – 2020.08", "iOS 개발자 | 아몬즈", color: rgb("#333333"))

#company-summary(
  ("Commerce UI", "Admin Tool", "RxSwift", "Refactoring"), 
  [커머스 핵심인 태그/상품 UI 기능을 고도화하고, 운영 효율을 위한 사내 관리자(MD) 앱을 개발했습니다.\ MVVM과 RxSwift를 도입해 코드 구조를 개선했습니다.]
)

#project-item(
  "[Feature] 태그 기능 추가 및 상품 UI 고도화",
  "20.02 - 20.07",
  // Situation
  [
    *상품 탐색 경험 개선을 위한 태그 시스템 도입.* \
    사용자가 상품을 더 쉽게 탐색할 수 있도록 태그 탭과 상품 상세 UI에 태그 기반 필터링 및 노출 기능이 필요했습니다.
  ],
  // Behavior
  [
    *Custom FlowLayout 및 Reactive 프로그래밍.* \
    Custom FlowLayout을 구현하여 유동적인 태그 UI를 구성했습니다.\ MVVM 패턴과 RxSwift를 활용해 비동기 데이터 처리와 UI 바인딩을 효율적으로 구현했습니다.
  ],
  // Impact
  [
    *UX 개선 및 코드 품질 향상.* \
    직관적인 태그 탐색 환경을 제공하여 사용성을 높였으며, SwiftLint 도입과 리팩토링을 병행해 유지보수성을 강화했습니다.
  ]
)

#project-item(
  "[Admin] MD를 위한 관리자 승인 앱 개발",
  "19.09 - 19.11",
  // Situation
  [
    *입점 상품 승인 프로세스의 비효율.* \
    MD가 상품 승인 업무를 처리하기 위한 모바일 환경의 부재로 업무 효율이 저하되는 상황이었습니다.
  ],
  // Behavior
  [
    *관리자 전용 앱 신규 구축.* \
    Moya를 활용한 네트워킹 레이어 구축 및 Apple Login 등을 적용하여,\ MD가 외부에서도 빠르게 상품을 검토하고 승인할 수 있는 전용 앱을 개발했습니다.
  ],
  // Impact
  [
    *운영 업무 효율화.* \
    모바일 기반의 승인 시스템을 구축하여 MD의 업무 시공간 제약을 해소하고 운영 속도를 높였습니다.
  ]
)

// MARK: - Carelabs
#company-header("케어랩스", "2019.02 – 2019.05", "iOS 인턴 | 굿닥", color: rgb("#333333"))

#company-summary(
  ("Migration", "Full-Prototyping"),
  [네이버 지도 SDK의 Swift 마이그레이션을 수행하고, 정규직 전환 과제로 '간헐적 단식' 기능을 기획부터 개발까지 전담하여 서비스 확장 가능성을 검증했습니다.]
)

#project-item(
  "[Migration & Full-cycle] 레거시 마이그레이션 및 신규 기능 PoC",
  "19.02 - 19.05",
  // Situation
  [
    *기술 스택 전환 및 유저 락인(Lock-in)을 위한 기능 발굴.* \
    Objective-C 기반의 지도 SDK를 Swift로 전환해야 했으며,\ 실제 프로덕트에 기여할 수 있는 과제 요청에 유저 리텐션용 부가 기능(간헐적 단식) 기능을 생각하였습니다.
  ],
  // Behavior
  [
    *Obj-C to Swift 전환 및 1인 풀사이클(Full-cycle) 개발.* \
    지도 SDK 연동 코드를 Swift로 마이그레이션하여 모던 환경을 구축했습니다.\ 또한 '간헐적 단식' 기능을 직접 기획/디자인하고, \`LocalNotification\`을 활용하여 개발하였습니다.
  ],
  // Impact
  [
    *최신 개발 환경 도입 및 서비스 확장성 검증.* \
    성공적인 마이그레이션으로 유지보수 효율을 높였으며, 기획부터 개발까지 주도한 프로토타입을 통해\ 헬스케어 부가 서비스의 확장 가능성을 제시하였습니다.
  ]
)

// MARK: - Other Experiences header
#v(-10pt)
#text(size: 16pt, weight: "bold", fill: apple-black)[그 외 경력 (Embedded & H/W)]
#v(-8pt)
#line(length: 100%, stroke: 1pt + apple-border)

// 1. 한국이엔이
#v(-6pt)
#company-header("한국이엔이", "2015.08 – 2018.08", "임베디드 SW 개발", color: rgb("#333333"))
#text(size: 10pt, fill: black)[
  - 여신전문금융업법 기술 기준에 맞춰 IC 리더기 암호화 및 민감 정보(Track2) 마스킹 로직 구현
  - ISO-8583 금융 표준 규격을 준수한 결제 전문 파싱 및 시리얼 통신 프로토콜 설계
  - GUI(Qt) 개발 및 VAN/POS 연동 보안 인증(K-SEL)을 주도하며 3년간 금융 보안 무결성 입증
]

// 2. 케이엠데이타.
#v(-6pt)
#company-header("케이엠데이타", "2014.07 – 2015.08", "임베디드 솔루션 기술지원", color: rgb("#333333"))
#text(size: 10pt, fill: black)[
  - Green Hills RTOS 기반 전장 시스템의 크래시 디버깅(J-Tag)을 통해 미션 크리티컬 환경의 안정성 지원
  - 차량용 임베디드 솔루션의 기술 이슈 대응 및 시스템 최적화 가이드 제공
]
// 3. 나무가
#v(-6pt)
#company-header("나무가", "2013.07 – 2014.03", "카메라 모듈 공정 기술", color: rgb("#333333"))
#text(size: 10pt, fill: black)[
  - 삼성전자 납품용 5M 후면 카메라 모듈의 후공정 셋업 및 생산 라인 표준화 담당
  - 양산 승인 프로세스 관리 및 회로 검증을 통해 모듈 품질 기준(QA) 확립
]