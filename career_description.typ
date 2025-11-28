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

// Topic Header (Framework Style)
#let topic-header(name, type, summary) = {
  v(1.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.5em,
    align: (left + horizon, right + horizon),
    text(size: 14pt, weight: "bold", fill: apple-black)[#name],
    doc-badge(type)
  )
  v(0.5em)
  text(size: 10.5pt, fill: apple-black)[#summary]
  v(0.5em)
}

// API Symbol Row
#let api-symbol(name, description) = {
  v(0.5em)
  grid(
    columns: (12em, 1fr),
    gutter: 1em,
    text(size: 9.5pt, weight: "bold", font: ("Menlo", "Courier New"), fill: apple-blue)[#name],
    text(size: 10pt, fill: apple-black)[#description]
  )
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + apple-border)
}

// MARK: Resume Specific Components

#let company-header(name, period, role, color: none) = {
  // --- 색상 로직 ---
  // 1. color 값을 안 넣었을 때 (기본값: 차분한 회색 스타일)
  let text-color = apple-black
  let bg-color = rgb("#F5F5F7")

  // 2. color 값을 넣었을 때 (브랜드 컬러 모드)
  if color != none {
    text-color = color
    // 브랜드 컬러를 88% 밝게 만들어서 배경으로 씀 (파스텔톤 자동 생성)
    bg-color = color.lighten(88%) 
  }
  // ----------------

  v(1em)
  grid(
    columns: (auto, 1fr),
    gutter: 1em,
    align: (left + horizon, right + horizon),
    
    // 회사 배지 (칩) - Neumorphism Style
    box(
      // Gradient Fill: #E8EBF2 -> #F2F3F7 (Convex)
      fill: gradient.linear(rgb("#E8EBF2"), rgb("#F2F3F7"), angle: 135deg),
      radius: 16pt,
      inset: (x: 1em, y: 0.6em),
      // Stroke to simulate 3D edge (Light Top-Left, Dark Bottom-Right)
      stroke: (
        paint: gradient.linear(white, rgb("#D1D6DB"), angle: 135deg), 
        thickness: 1.5pt
      ),
      text(size: 12pt, weight: "bold", fill: text-color)[#name]
    ),
    
    // 우측 정보 (직무, 기간)
    stack(
      dir: ltr,
      spacing: 1fr,
      text(size: 12pt, weight: "bold", fill: apple-black)[#role],
      text(size: 11pt, weight: "regular", fill: apple-gray)[#period]
    )
  )
}

#let company-summary(tags, summary) = {
  v(0.5em)
  text(size: 10.5pt, fill: apple-black)[#summary]
  v(0.5em)
  grid(
    columns: (auto,) * tags.len(),
    gutter: 0.5em,
    ..tags.map(tag => doc-badge(tag))
  )
  v(1em)
}

// 프로젝트 아이템 함수 (TDD 컬러 적용)
#let project-item(title, period, problem, solution, result) = {
  v(0.8em)
  // Title and Period in a single row
  block(width: 100%, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 0.5em,
      text(size: 11pt, weight: "bold", fill: apple-black)[#title],
      text(size: 9pt, weight: "regular", fill: apple-gray)[#period]
    )
  ]
  
  pad(left: 1em, top: 0.5em)[
    #grid(
      columns: (3em, 1fr),
      gutter: 0.8em,
      
      // S: Situation
      text(size: 10pt, weight: "bold", fill: apple-gray)[상황],
      text(size: 10pt, fill: apple-black)[#problem],

      // B: Behavior
      text(size: 10pt, weight: "bold", fill: apple-gray)[행동],
      text(size: 10pt, fill: apple-black)[#solution],

      // I: Impact
      text(size: 10pt, weight: "bold", fill: apple-gray)[영향],
      text(size: 10pt, weight: "semibold", fill: apple-black)[#result]
    )
  ]
  
  v(1.5em)
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

#text(size: 13pt, fill: apple-black)[
  iOS 앱 개발자 | 7년차 (Total 11년)
]

#v(0.5pt)
#declaration-block[
  비즈니스 임팩트를 창출하는 엔지니어링. 7년차 iOS 리드로서 복잡한 기술 부채를 해결하고 확장 가능한 아키텍처를 설계합니다. \
  데이터 기반의 의사결정으로 제품 성장을 주도하며, 적극적인 지식 공유로 팀의 잠재력을 극대화합니다.
]
#v(-20pt)

// MARK: - Career Description
#section-header("주요 경력 (iOS)")
#company-header("컬리", "2021.10 – 현재", "검색·추천 도메인 iOS 리드", color: rgb("#5a31f4"))

#company-summary(
  ("iOS 15+", "Swift 5.9", "Architecture"),
  [기술 부채 해결을 넘어선 비즈니스 가속화. SDUI 및 DI 아키텍처를 도입하여 급변하는 커머스 환경에 유연성을 더했습니다.]
)


// 2025년 성과 (최신순)

#project-item(
  "Core Architecture: 상품 리스트 현대화 및 레거시 청산",
  "24.08 - 25.09 (예상)", // 기간은 엑셀 기반으로 조정
  // Situation
  [복잡한 UI 구현의 한계.\ 레거시 리스트 구조로 인해 애니메이션 구현이 불가능하고 유지보수 비용이 증가했습니다.],
  // Behavior
  [뷰 계층 단순화 및 로직 재설계.\ Modern CollectionView 도입과 헤더 분리로 구조를 개선하고, 스크롤 보정 로직을 최적화했습니다.],
  // Impact
  [고도화된 인터랙션 구현.\ 확장 가능한 아키텍처를 기반으로 모핑 애니메이션 등 정교한 UX를 실현했습니다.]
)

#project-item(
  "Hybrid UI Architecture: SwiftUI 도입 및 검색 경험 개선",
  "25.08 - 25.09",
  // Situation
  [빠른 이터레이션의 필요성.\ UIKit 환경에서는 UI 수정과 최신 기술 도입에 제약이 있었습니다.],
  // Behavior
  [SwiftUI 기반 하이브리드 아키텍처 구축.\ 검색 탭을 재구축하여 호환성을 검증하고, 보일러플레이트 코드를 대폭 줄였습니다.],
  // Impact
  [생산성 향상 및 UX 고도화.\ 팀 내 SwiftUI 환경을 전파하고, 고품질 애니메이션으로 사용자 경험을 개선했습니다.]
)

#project-item(
  "Marketing Tech Infrastructure: Appsflyer 전환 및 표준화",
  "25.06 - 25.08",
  // Situation
  [코드 수정 리스크와 벤더 종속성.\ MMP 변경에 따른 전수 수정 부담이 컸습니다.],
  // Behavior
  [로깅 아키텍처 추상화.\ 인터페이스 표준화로 교체 비용을 최소화하고, Universal Link로 전환했습니다.],
  // Impact
  [데이터 정합성 및 유연성 확보.\ 안정적인 트래킹 환경을 구축하여 마케팅 효율을 높였습니다.]
)

#project-item(
  "Developer Experience: 모듈화 기반 조성 및 레거시 청산",
  "24.11 - 25.09",
  // Situation
  [관리 비용 증가 및 모듈 분리 난항.\ 논리적 그룹과 물리적 경로의 불일치가 문제였습니다.],
  // Behavior
  [물리적 폴더 구조 재구성.\ Tuist로 가상 그룹을 제거하고, 의존성 주입 패턴으로 테스트 가능성을 확보했습니다.],
  // Impact
  [멀티 모듈 전환 토대 마련.\ 물리적 모듈화를 완료하여 프로젝트의 기술적 정합성을 높였습니다.]
)

#project-item(
  "멀티섹션 검색결과: SDUI 도입 및 비즈니스 확장성 확보",
  "2023.07 - 2023.10",
  // Situation
  [멀티 섹션 도입의 난항.\ 백엔드와의 기술적 이견으로 SDUI 구축이 지연되었습니다.],
  // Behavior
  [Time-to-Market을 위한 설득과 합의.\ 배포 의존성 제거의 중요성을 강조하여 도입을 이끌어내고, 렌더링 성능을 최적화했습니다.],
  // Impact
  [유연한 운영 환경 구축.\ 개발자 없이 섹션을 제어하고, 탐색 편의성을 높여 매출 성장에 기여했습니다.]
)

#project-item(
  "상품 탐색 필터 신규 구축: 플랫폼 간 경험 동기화 및 컴포넌트화",
  "2022.08 - 2022.09",
  // Situation
  [플랫폼 간 경험 격차.\ iOS의 필터 기능 부재로 사용자 경험이 파편화되었습니다.],
  // Behavior
  [독립 컴포넌트 설계.\ ReactorKit으로 결합도를 낮추고, 렌더링 제어로 스크롤 동기화 문제를 해결했습니다.],
  // Impact
  [UX Parity 달성.\ 안드로이드와 동등한 기능을 적시에 런칭하고, 재사용 가능한 구조를 확보했습니다.]
)

#project-item(
  "뷰티컬리 런칭: 확장형 버티컬 서비스 아키텍처 구축",
  "2022.05 - 2022.07",
  // Situation
  [네트워크 계층의 복잡도 증가.\ 신규 버티컬 추가로 API가 분리되어 파편화 우려가 있었습니다.],
  // Behavior
  [OCP 기반 프로토콜 설계.\ UI와 라우팅 정책을 캡슐화하고, DI 컨테이너로 유연성을 확보했습니다.],
  // Impact
  [안정적인 서비스 런칭.\ 의존성을 완벽히 분리하여 뷰티컬리의 성공적인 런칭과 매출 성장을 견인했습니다. #link("https://helloworld.kurly.com/blog/beauty-kurly-launching-app/")[#text(fill: apple-blue, size: 9pt)[📎 관련 기술 블로그]]]
)

#project-item(
  "장바구니 시스템 리뉴얼: 상태 관리 최적화 및 리스크 방어",
  "2022.03 - 2022.07",
  // Situation
  [프로젝트 중단 위기.\ 백엔드 재설계와 인력 공백, 강한 결합도가 맞물린 상황이었습니다.],
  // Behavior
  [단방향 상태 관리 도입.\ ReactorKit으로 사이드 이펙트를 차단하고, Rebase 전략으로 충돌을 최소화했습니다.],
  // Impact
  [결함 없는 런칭.\ 예측 가능한 구조로 유지보수성을 확보하고, 핵심 매출 파이프라인을 안정화했습니다.]
)

#project-item(
  "데이터 기반 플랫폼: GrowthBook & 광고 솔루션",
  "2022.05 - 2022.11",
  // Situation
  [데이터 검증 난항.\ 실험 플랫폼 부재와 메인 스레드 부하 우려가 있었습니다.],
  // Behavior
  [스레드 안전성 확보.\ GrowthBook 도입 및 \@globalActor로 비동기 처리를 최적화했습니다.],
  // Impact
  [데이터 기반 문화 정착.\ 성능 저하 없이 실험 환경을 구축하여 매출 증대에 기여했습니다.]
)

// 2. KST Mobility
#company-header("케이에스티모빌리티", "2020.10 – 2021.10", "iOS 개발 / 마카롱M")

#company-summary(
  ("RIBs", "Modularization", "SSE", "AppClip"),
  [모놀리식 구조의 한계 극복. RIBs 아키텍처 도입으로 모듈화 및 유지보수성을 확보했습니다.]
)

#project-item(
  "RIBs 아키텍처 도입 및 지도 자원 최적화",
  "2020.10 - 2021.10",
  // Situation
  [메모리 효율 저하.\ MVP 패턴의 강결합으로 지도 인스턴스 재사용이 불가능했습니다.],
  // Behavior
  [비즈니스 로직 모듈화.\ Uber RIBs를 도입하고 지도 뷰를 분리하여 리팩토링했습니다.],
  // Impact
  [유지보수성 강화.\ 메모리 효율을 개선하고 모듈 간 의존성을 명확히 분리했습니다.]
)

#project-item(
  "호출 코어 SDK 모듈화 및 실시간성 개선 (SSE)",
  "2020.10 - 2021.10",
  // Situation
  [확장성 한계.\ 앱 종속적인 호출 로직과 비효율적인 통신 방식이 문제였습니다.],
  // Behavior
  [핵심 로직 SDK 분리.\ 독립 SDK로 분리하고 SSE를 도입하여 통신을 최적화했습니다.],
  // Impact
  [실시간성 확보.\ 호출 응답 속도를 개선하고 비즈니스 확장의 기반을 마련했습니다.]
)

// 3. Visual
#company-header("비주얼 (Visual)", "2019.07 – 2020.08", "iOS 개발 / 아몬즈")

#company-summary(
  ("RxSwift", "ReactiveUI", "CI/CD"),
  [비동기 프로그래밍 표준 정립. 팀 내 최초 RxSwift 도입으로 데이터 흐름을 체계화했습니다.]
)

#project-item(
  "RxSwift 도입 및 반응형 프로그래밍 기반 구축",
  "2019.07 - 2020.08",
  // Situation
  [가독성 저하 및 버그 빈발.\ 복잡한 비동기 처리와 상태 동기화가 원인이었습니다.],
  // Behavior
  [선언형 비동기 로직 전환.\ RxSwift를 도입하여 데이터 흐름을 단방향으로 구조화했습니다.],
  // Impact
  [탐색 경험 개선.\ 코드 복잡도를 낮추고 반응형 UI를 구축했습니다.]
)

// ---------------------------------------------------------
// Other Experience
// ---------------------------------------------------------
#section-header("Other Experience")

#company-header("케어랩스 (인턴)", "2019.02 – 2019.05", "굿닥 iOS 개발")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - 네이버 지도 SDK 및 구형 로직 마이그레이션(Obj-C → Swift). 앱 현대화 기여.
  - 건강 관리 기능 기획 및 1인 개발. 로컬 알림 기반 서비스 배포.
]

#company-header("한국이엔이", "2015.08 – 2018.09", "임베디드 SW 개발")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - 여신전문금융업법 기준 IC 리더기 암호화. 민감 정보(Track2) 마스킹 로직 구현.
  - ISO-8583 금융 표준 준수. 결제 전문 파싱 및 시리얼 통신 프로토콜 설계.
  - 보안 인증(KSEL) 20회 이상 획득. VAN사 및 POS 연동으로 금융 보안 무결성 입증.
]

#company-header("케이엠데이타 / 나무가", "2013.09 – 2015.07", "임베디드 & 생산기술")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - Green Hills RTOS 기반 전장 시스템 디버깅. 미션 크리티컬 환경의 안정성 확보.
  - 카메라 모듈 공정 표준화 및 양산 승인. 삼성전자 납품 품질 기준 확립.
]


// 2025년 성과 (최신순)

#project-item(
  "Core Architecture: 상품 리스트 현대화 및 레거시 청산",
  "24.08 - 25.09 (예상)", // 기간은 엑셀 기반으로 조정
  "오래된 레거시 리스트 구조로 인해 복잡한 UI(애니메이션, 헤더 인터랙션) 구현이 불가능하고 유지보수 비용 증가.",
  "Modern CollectionView(Compositional Layout) 도입 및 헤더 뷰 분리를 통해 뷰 계층 구조를 단순화.\n스크롤 오프셋 보정 로직을 재설계하여 탭 전환 시의 UX 끊김 현상 해결.",
  "확장 가능한 리스트 아키텍처를 확보하여 모핑 애니메이션 등 고도화된 인터랙션 구현 성공."
)

#project-item(
  "Hybrid UI Architecture: SwiftUI 도입 및 검색 경험 개선",
  "25.08 - 25.09",
  "UIKit 위주의 프로젝트에서 빠른 UI 이터레이션과 최신 기술 스택 도입의 필요성 대두.",
  "검색 탭(최근/추천 검색어)을 SwiftUI로 재구축하여 하이브리드 호환성 검증 및 보일러플레이트 코드 감소.\n연관 상품 섹션에 고품질 애니메이션을 적용하여 사용자 주목도 강화.",
  "생산성 높은 SwiftUI 개발 환경을 팀 내 전파하고 검색 UX 품질 고도화."
)

#project-item(
  "Marketing Tech Infrastructure: Appsflyer 전환 및 표준화",
  "25.06 - 25.08",
  "마케팅 툴 변경(MMP)에 따른 전수 코드 수정 리스크 및 벤더 종속성 문제.",
  "Analytics 인터페이스를 추상화/표준화하여 벤더 교체 비용을 최소화하는 로깅 아키텍처 설계.\nDynamic Link를 Universal Link로 전환하여 딥링크 안정성 확보.",
  "마케팅 데이터 정합성 확보 및 유연한 트래킹 환경 구축."
)

#project-item(
  "Developer Experience: 모듈화 기반 조성 및 레거시 청산",
  "24.11 - 25.09",
  "모놀리식 구조 내 Xcode Group과 실제 폴더 경로 불일치로 인한 관리 비용 증가 및 모듈 분리 난항.",
  "Tuist를 활용해 가상 그룹(Group)을 제거하고 '물리적 폴더 구조(Physical Structure)'로 프로젝트를 재구성하여 SPM 도입 기반 마련.\n싱글톤 객체(JWT 등)에 '기본값 주입(Default Argument Injection)' 패턴을 적용하여 구조 변경 없이 테스트 가능성(Testability) 확보.",
  "물리적 모듈화(Physical Modularization)를 완료하여 향후 멀티 모듈 전환을 위한 확실한 기술적 토대 및 정합성 확보."
)

#project-item(
  "멀티섹션 검색결과: SDUI 도입 및 비즈니스 확장성 확보",
  "2023.07 - 2023.10",
  // Situation
  [단순 나열형 구조의 한계로 멀티 섹션 도입이 필요했으나, 백엔드 조직과 View Logic 처리에 대한 이견 발생.\ SDUI 구축 및 확장성 확보에 난항.],
  // Behavior
  [의사결정권자에게 앱 배포 의존성 제거(Time-to-Market)의 중요성을 설득하여 SDUI 도입 합의 도출.\ 클라이언트 주도 JSON 스키마 설계 및 Modern CollectionView 적용으로 렌더링 성능 최적화.],
  // Impact
  [기획/운영팀이 개발자 없이 섹션을 제어할 수 있는 유연한 환경 마련.\ 탐색 편의성 증대로 오가닉 대비 약 20% 추가 매출 창출(25년 기준).]
)

#project-item(
  "상품 탐색 필터 신규 구축: 플랫폼 간 경험 동기화 및 컴포넌트화",
  "2022.08 - 2022.09",
  // Situation
  [Android 대비 iOS 필터 기능 부재로 플랫폼 간 경험 격차 발생.\ 레거시 리스트 구조 위에서 신규 스펙을 제로 베이스로 구현해야 하는 난제.],
  // Behavior
  [ReactorKit 도입으로 비즈니스 로직을 UI와 분리된 '독립 컴포넌트'로 설계하여 결합도 최소화.\ 레거시와는 Delegate 패턴으로 소통하고, 렌더링 루프 제어로 스크롤 동기화 이슈 해결.],
  // Impact
  [안드로이드와 동등한 수준의 필터 기능을 런칭하여 플랫폼 간 UX Parity 달성.\ 재사용 가능한 컴포넌트 구조 확보 및 오픈 직후 클릭률 2.8% 달성.]
)

#project-item(
  "뷰티컬리 런칭: 확장형 버티컬 서비스 아키텍처 구축",
  "2022.05 - 2022.07",
  // Situation
  [단일 앱 내 신규 버티컬(뷰티) 추가로 백엔드 API가 도메인별로 물리적 분리.\ 클라이언트 네트워크 계층의 파편화 및 복잡도 급증 우려.],
  // Behavior
  [OCP 원칙 기반 'Site' 프로토콜로 UI 테마와 API 라우팅 정책 캡슐화.\ DI 컨테이너를 통해 실행 시점에 맞는 구현체와 Endpoint가 자동 주입되도록 설계.],
  // Impact
  [서비스 간 의존성을 완벽히 분리하여 뷰티컬리를 안정적으로 런칭.\ 뷰티 주문 비중 2.5% 및 상단 탭 전환 유입 6.3% 달성.\ 전사 3천억 순증 목표 달성의 핵심 기술적 토대 마련. #link("https://helloworld.kurly.com/blog/beauty-kurly-launching-app/")[#text(fill: apple-blue, size: 9pt)[📎 관련 기술 블로그]]]
)

#project-item(
  "장바구니 시스템 리뉴얼: 상태 관리 최적화 및 리스크 방어",
  "2022.03 - 2022.07",
  // Situation
  [백엔드 재설계로 클라이언트 전면 재개발이 필요했으나, 핵심 인력 공백으로 중단 위기.\ '상품 개편' 브랜치와의 강한 결합으로 데이터 정합성 유지 난이도 최상.],
  // Behavior
  [ReactorKit(UDH) 도입으로 복잡한 상태 흐름을 단방향 통제하여 사이드 이펙트 차단.\ Rebase 전략으로 매일 변경되는 코어 로직과의 충돌을 해소하며 20일(WD) 만에 재구축 완수.],
  // Impact
  [예측 가능한 상태 관리로 QA 리소스 최소화 및 유지보수성 확보.\ 핵심 매출 파이프라인을 결함 없이 연결하여 대규모 개편 성공적 런칭.]
)

#project-item(
  "데이터 기반 플랫폼: GrowthBook & 광고 솔루션",
  "2022.05 - 2022.11",
  // Situation
  [실험 플랫폼 부재로 데이터 검증 난항.\ 광고 SDK 도입 시 메인 스레드 부하 우려.],
  // Behavior
  [GrowthBook SDK 도입 및 \@globalActor로 Thread-safe 환경 구축.\ 광고 노출 처리에 Actor 기반 비동기 파이프라인 적용.],
  // Impact
  [검색 자동완성 도입(qCTR 5.9%↑) 등 데이터 기반 문화 정착.\ 광고 도입 2주 만에 장바구니 담기 40만 건 유도.]
)

// 2. KST Mobility
#company-header("케이에스티모빌리티", "2020.10 – 2021.10", "iOS 개발 / 마카롱M")

#company-summary(
  ("RIBs", "Modularization", "SSE", "AppClip"),
  [유지보수가 불가능한 모놀리식 구조를 RIBs 아키텍처로 모듈화하여 살려냈습니다.]
)

#project-item(
  "RIBs 아키텍처 도입 및 지도 자원 최적화",
  "2020.10 - 2021.10",
  // Situation
  [MVP 패턴 하에서 지도 인스턴스와 로직 강결합.\ 메모리 효율 저하 및 재사용 불가 문제 지속.],
  // Behavior
  [Uber RIBs 도입으로 비즈니스 로직 모듈화.\ 지도 뷰를 Attach/Detach 가능한 구조로 리팩토링.],
  // Impact
  [메모리 효율성 개선 및 모듈 간 의존성 분리.\ 유지보수성 대폭 강화 (Modular Architecture).]
)

#project-item(
  "호출 코어 SDK 모듈화 및 실시간성 개선 (SSE)",
  "2020.10 - 2021.10",
  // Situation
  [호출 로직의 앱 종속성으로 확장 불가.\ Polling 방식의 비효율적인 통신으로 배차 응답 지연.],
  // Behavior
  [호출 핵심 로직을 독립 SDK로 분리.\ 통신 방식을 SSE(Server-Sent Events)로 전환.],
  // Impact
  [호출 응답 실시간성 확보.\ 비즈니스 확장을 위한 기술적 기반 마련.]
)

// 3. Visual
#company-header("비주얼", "2019.07 – 2020.08", "iOS 개발 / 아몬즈")

#company-summary(
  ("RxSwift", "ReactiveUI", "CI/CD"),
  [팀 내 최초로 RxSwift를 도입하여 비동기 프로그래밍의 표준을 정립했습니다.]
)

#project-item(
  "RxSwift 도입 및 반응형 프로그래밍 기반 구축",
  "2019.07 - 2020.08",
  // Situation
  [복잡한 비동기 처리와 상태 동기화 문제.\ 코드 가독성 저하 및 버그 빈발.],
  // Behavior
  [팀 내 최초로 RxSwift 도입 제안.\ 비동기 로직을 선언형으로 전환하여 데이터 흐름 단방향화.],
  // Impact
  [코드 복잡도 감소 및 유지보수성 향상.\ 반응형 UI('태그 탭') 구축으로 탐색 경험 개선.]
)

// ---------------------------------------------------------
// Other Experience
// ---------------------------------------------------------
#section-header("Other Experience")

#company-header("케어랩스 (인턴)", "2019.02 – 2019.05", "굿닥 iOS 개발")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - 네이버 지도 SDK 및 구형 로직을 Obj-C에서 Swift로 마이그레이션하여 앱 현대화 기여
  - 로컬 알림 기반의 건강 관리 기능을 기획부터 구현까지 1인 개발하여 배포
]

#company-header("한국이엔이", "2015.08 – 2018.09", "임베디드 SW 개발")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - 여신전문금융업법 기술 기준에 맞춰 IC 리더기 암호화 및 민감 정보(Track2) 마스킹 로직 구현
  - ISO-8583 금융 표준 규격을 준수한 결제 전문 파싱 및 시리얼 통신 프로토콜 설계
  - VAN사/POS 연동에 따른 보안 인증(KSEL) 20회 이상 획득하며 금융 보안 무결성 입증
]

#company-header("케이엠데이타 / 나무가", "2013.09 – 2015.07", "임베디드 & 생산기술")
#v(0.5em)
#text(size: 10pt, fill: apple-black)[
  - Green Hills RTOS 기반 전장 시스템의 크래시 디버깅을 통해 미션 크리티컬 환경의 안정성 확보
  - 삼성전자 납품용 카메라 모듈의 공정 표준화 및 양산 승인 프로세스를 담당하며 품질 기준 확립
]

