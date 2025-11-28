// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  fill: rgb("#F2F4F6") // Toss/Modern UI Background (Clean Gray)
)
#set text(
  font: "Apple SD Gothic Neo",
  size: 10pt,
  lang: "ko",
  fill: rgb("#333d4b"), // Dark Gray for better readability
  fallback: true
)

// MARK: 컬러 정의
#let color-s = rgb("#e94e58") // 상황 (Soft Red)
#let color-b = rgb("#2ea456") // 행동 (Soft Green)
#let color-i = rgb("#3182f6") // 결과 (Toss Blue)
#let color-dark = rgb("#191f28")
#let color-gray = rgb("#8b95a1")

// Modern Card Style (Clean White + Soft Shadow)
#let card-box(content, radius: 16pt, inset: 1.5em, fill: white) = {
  block(
    width: 100%,
    radius: radius,
    inset: inset,
    fill: fill,
    // Very subtle shadow for "Floating" effect
    stroke: 0.5pt + rgb("#e5e8eb"), 
    content
  )
}

// Modern Tag (Clean Gray)
#let modern-tag(content) = {
  box(
    radius: 6pt, // Slightly rounded rect, not full pill
    fill: rgb("#f9fafb"),
    stroke: 0.5pt + rgb("#d1d6db"),
    inset: (x: 0.6em, y: 0.3em),
    content
  )
}

// 섹션 타이틀 (Modern)
#let section-title(title) = {
  v(2.5em)
  text(size: 17pt, weight: "bold", fill: color-dark)[#title]
  v(-0.8em)
  line(length: 100%, stroke: 2pt + color-dark)
  v(1.2em)
}

// 회사 헤더 (Clean & Bold)
#let company-header(name, period, role) = {
  v(1.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (left + horizon, right + horizon),
    // 회사명: Black Badge (High Contrast)
    box(
      fill: color-dark, 
      radius: 8pt,
      inset: (x: 1em, y: 0.6em),
      text(size: 12pt, weight: "bold", fill: white)[#name]
    ),
    stack(
      dir: ltr,
      spacing: 0.8em,
      text(size: 12pt, weight: "bold", fill: color-dark)[#role],
      text(size: 10pt, weight: "medium", fill: color-gray)[#period]
    )
  )
}

// 회사 요약 (Clean Layout)
#let company-summary(tags, summary) = {
  v(0.8em)
  // 1. 태그 영역
  grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 0.5em,
    ..tags.map(tag => modern-tag(
      text(size: 9pt, weight: "medium", fill: rgb("#4e5968"))[\##tag]
    ))
  )
  v(0.8em)
  // 2. 요약 텍스트 (인용구 스타일)
  block(
    width: 100%,
    fill: rgb("#f9fafb"), // Very light gray background for emphasis
    radius: 8pt,
    inset: 1em,
    text(size: 10pt, style: "italic", fill: rgb("#333d4b"))[
      #summary
    ]
  )
  v(1.5em)
}

// [NEW] SBI 아이템 로우 (2글자 라벨)
#let sbi-row(label, color, content) = {
  grid(
    columns: (2.5em, 1fr), // 2글자에 맞춰 너비 축소
    gutter: 0.8em,
    text(size: 10pt, weight: "bold", fill: color)[#label],
    text(size: 10pt, fill: color-dark, weight: "regular")[#content]
  )
}

// 프로젝트 아이템 (White Card)
#let project-item(title, period, problem, solution, result) = {
  v(0.5em)
  card-box(inset: 1.2em)[
    // 타이틀
    #block(width: 100%, breakable: false)[
      #grid(
        columns: (auto, 1fr),
        gutter: 0.5em,
        align: (left + horizon, right + horizon),
        text(size: 12pt, weight: "bold", fill: color-dark)[#title],
        text(size: 9pt, fill: color-gray)[#period]
      )
    ]
    
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + rgb("#f2f4f6"))
    #v(0.5em)

    // SBI 내용
    #pad(top: 0.2em)[
      #set par(leading: 0.7em)
      #grid(
        columns: (1fr),
        row-gutter: 1em,
        
        sbi-row("상황", color-s, problem),
        sbi-row("행동", color-b, solution),
        sbi-row("결과", color-i, result)
      )
    ]
  ]
  v(0.8em)
}


// ==========================================================================
// 문서 시작 (Template Mode)
// ==========================================================================

#align(center)[
  // Neutral Title Box (No Kakao Branding)
  #block(
    width: 100%,
    fill: white, 
    radius: 16pt,
    inset: (y: 2em),
    stroke: 0.5pt + rgb("#e5e8eb"),
    [
      #text(size: 24pt, weight: "black", fill: rgb("#191f28"))[Project Documentation]
      #v(0.6em)
      #text(size: 12pt, weight: "bold", fill: rgb("#8b95a1"))[Technical Specification & Architecture Review]
    ]
  )
]

// ---------------------------------------------------------
// 1. Section A
// ---------------------------------------------------------
#section-title("Core Architecture")

#company-header("Platform Team", "2024.01 – Present", "Staff Engineer")

#company-summary(
  ("Microservices", "Event-Driven", "Scalability", "Cloud-Native"),
  [Designed and implemented a scalable #text(weight: "black")[event-driven architecture] to handle high-throughput data streams, improving system reliability by 99.9%.]
)

#project-item(
  "Legacy System Migration",
  "2024.01 - 2024.06",
  "The existing monolithic application was suffering from high latency and frequent downtimes during peak traffic.",
  "Decomposed the monolith into domain-driven microservices using Kafka for asynchronous communication.",
  "Reduced API latency by 40% and achieved zero downtime deployments."
)

#project-item(
  "Real-time Data Pipeline",
  "2024.03 - 2024.05",
  "Business stakeholders lacked real-time visibility into key performance metrics.",
  "Built a streaming data pipeline using Flink and Elasticsearch to aggregate metrics in real-time.",
  "Enabled sub-second dashboard updates, empowering data-driven decision making."
)

// ---------------------------------------------------------
// 2. Section B
// ---------------------------------------------------------
#section-title("Mobile Experience")

#company-header("Mobile Squad", "2022.01 – 2023.12", "Senior Developer")

#company-summary(
  ("iOS", "SwiftUI", "Modularization", "CI/CD"),
  [Led the transition to #text(weight: "black")[SwiftUI and Modular Architecture], significantly reducing build times and improving developer productivity.]
)

#project-item(
  "App Performance Optimization",
  "2023.01 - 2023.06",
  "App launch time was exceeding 3 seconds, leading to high user drop-off rates.",
  "Optimized startup sequence by deferring non-critical initializations and implementing pre-warming techniques.",
  "Reduced launch time to under 1 second, increasing user retention by 15%."
)

#project-item(
  "Design System Implementation",
  "2022.06 - 2022.12",
  "Inconsistent UI components across the app resulted in a fragmented user experience and slow feature development.",
  "Collaborated with design team to build a reusable component library based on Atomic Design principles.",
  "Accelerated UI development speed by 2x and ensured visual consistency across all screens."
)
