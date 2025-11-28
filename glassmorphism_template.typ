// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  // Glassmorphism Background: Colorful Mesh Gradient Simulation
  background: {
    place(top + left, dx: -10%, dy: -10%, circle(radius: 300pt, fill: gradient.radial(rgb("#ff9a9e").transparentize(30%), rgb("#fad0c4").transparentize(80%))))
    place(bottom + right, dx: 10%, dy: 10%, circle(radius: 400pt, fill: gradient.radial(rgb("#a18cd1").transparentize(30%), rgb("#fbc2eb").transparentize(80%))))
    place(center, circle(radius: 200pt, fill: gradient.radial(rgb("#84fab0").transparentize(40%), rgb("#8fd3f4").transparentize(90%))))
  }
)

#set text(
  font: "Apple SD Gothic Neo",
  size: 10pt,
  lang: "ko",
  fill: rgb("#2d3436"),
  fallback: true
)

// MARK: 컬러 정의
#let color-dark = rgb("#2d3436")
#let color-gray = rgb("#636e72")
#let glass-stroke = gradient.linear(white.transparentize(20%), white.transparentize(80%), angle: 135deg)

// Glass Box (Frosted Glass Effect)
#let glass-box(content, radius: 16pt, inset: 1.5em) = {
  block(
    width: 100%,
    radius: radius,
    inset: inset,
    // Semi-transparent white fill to simulate glass
    fill: white.transparentize(40%), 
    // White border with gradient to simulate light reflection on edges
    stroke: 1.5pt + glass-stroke,
    content
  )
}

// Glass Pill (Tag)
#let glass-pill(content) = {
  box(
    radius: 100pt,
    fill: white.transparentize(50%),
    stroke: 1pt + glass-stroke,
    inset: (x: 0.8em, y: 0.4em),
    content
  )
}

// 섹션 타이틀
#let section-title(title) = {
  v(2.5em)
  text(size: 17pt, weight: "bold", fill: color-dark)[#title]
  v(-0.8em)
  line(length: 100%, stroke: 2pt + color-dark.transparentize(50%))
  v(1.2em)
}

// 회사 헤더
#let company-header(name, period, role) = {
  v(1.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (left + horizon, right + horizon),
    // Glass Badge
    box(
      fill: color-dark.transparentize(10%), 
      radius: 12pt,
      inset: (x: 1em, y: 0.6em),
      text(size: 12pt, weight: "bold", fill: white)[#name]
    ),
    stack(
      dir: ltr,
      spacing: 0.8em,
      text(size: 12pt, weight: "bold", fill: color-dark)[#role],
      text(size: 10pt, weight: "medium", fill: color-dark.transparentize(30%))[#period]
    )
  )
}

// 회사 요약
#let company-summary(tags, summary) = {
  v(0.8em)
  grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 0.5em,
    ..tags.map(tag => glass-pill(
      text(size: 9pt, weight: "bold", fill: rgb("#2d3436"))[\##tag]
    ))
  )
  v(0.8em)
  block(
    width: 100%,
    fill: white.transparentize(60%),
    radius: 8pt,
    inset: 1em,
    stroke: 0.5pt + white.transparentize(50%),
    text(size: 10pt, style: "italic", fill: color-dark)[
      #summary
    ]
  )
  v(1.5em)
}

// 프로젝트 아이템
#let project-item(title, period, problem, solution, result) = {
  v(0.5em)
  glass-box(inset: 1.2em)[
    #grid(
      columns: (auto, 1fr),
      gutter: 0.5em,
      align: (left + horizon, right + horizon),
      text(size: 12pt, weight: "bold", fill: color-dark)[#title],
      text(size: 9pt, fill: color-dark.transparentize(40%))[#period]
    )
    
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + white.transparentize(50%))
    #v(0.5em)

    #pad(top: 0.2em)[
      #set par(leading: 0.7em)
      #grid(
        columns: (2.5em, 1fr),
        row-gutter: 1em,
        gutter: 0.8em,
        
        text(weight: "bold", fill: rgb("#c0392b"))[Problem], text(fill: color-dark)[#problem],
        text(weight: "bold", fill: rgb("#27ae60"))[Action], text(fill: color-dark)[#solution],
        text(weight: "bold", fill: rgb("#2980b9"))[Result], text(fill: color-dark)[#result]
      )
    ]
  ]
  v(0.8em)
}

// ==========================================================================
// 문서 시작 (Template Mode)
// ==========================================================================

#align(center)[
  #glass-box(inset: 2em)[
    #text(size: 24pt, weight: "black", fill: color-dark)[System Architecture Review]
    #v(0.6em)
    #text(size: 12pt, weight: "bold", fill: color-dark.transparentize(30%))[Internal Technical Specification]
  ]
]

#section-title("Core Infrastructure")

#company-header("Platform Engineering", "2024.01 – Present", "Principal Engineer")

#company-summary(
  ("Kubernetes", "ServiceMesh", "Golang", "gRPC"),
  [Architected a multi-region #text(weight: "black")[Service Mesh] infrastructure to ensure high availability and secure service-to-service communication.]
)

#project-item(
  "Global Traffic Management",
  "2024.01 - 2024.06",
  "Cross-region latency was affecting user experience for global customers.",
  "Implemented a geo-DNS routing strategy combined with an Anycast network topology.",
  "Reduced average global latency by 150ms and improved availability to 99.99%."
)

#section-title("Mobile Framework")

#company-header("Mobile Core Team", "2022.01 – 2023.12", "Lead Developer")

#company-summary(
  ("iOS", "Metal", "CoreML", "Swift"),
  [Developed a custom #text(weight: "black")[Rendering Engine] using Metal to support high-performance AR features on low-end devices.]
)

#project-item(
  "AR Feature Optimization",
  "2023.01 - 2023.06",
  "Standard ARKit implementation was consuming excessive battery and causing thermal throttling.",
  "Wrote custom shaders in Metal to offload processing from CPU to GPU.",
  "Extended battery life by 30% during AR sessions and maintained stable 60fps."
)
