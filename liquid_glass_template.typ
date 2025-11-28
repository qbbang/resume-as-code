// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  // Liquid Glass Background: Deep, Fluid, Abstract (VisionOS inspired)
  background: {
    // Deep dark background
    rect(width: 100%, height: 100%, fill: rgb("#000000"))
    // Fluid Orbs
    place(top + left, dx: -20%, dy: -10%, circle(radius: 400pt, fill: gradient.radial(rgb("#0047AB").transparentize(40%), rgb("#000000").transparentize(100%))))
    place(bottom + right, dx: 10%, dy: 20%, circle(radius: 500pt, fill: gradient.radial(rgb("#8E44AD").transparentize(50%), rgb("#000000").transparentize(100%))))
    place(center + horizon, circle(radius: 300pt, fill: gradient.radial(rgb("#1ABC9C").transparentize(60%), rgb("#000000").transparentize(100%))))
  }
)

#set text(
  font: "Apple SD Gothic Neo",
  size: 10pt,
  lang: "ko",
  fill: rgb("#ffffff"), // White text for dark mode
  fallback: true
)

// MARK: 컬러 정의
#let color-accent = rgb("#2980b9")
#let liquid-stroke = gradient.linear(white.transparentize(10%), white.transparentize(90%), angle: 145deg)

// Liquid Glass Box (VisionOS Style Platter)
#let liquid-box(content, radius: 24pt, inset: 1.5em) = {
  block(
    width: 100%,
    radius: radius,
    inset: inset,
    // Highly transparent, slightly brightened background to simulate glass material
    fill: white.transparentize(85%), 
    // Sharp, bright stroke on top-left to simulate specular highlight
    stroke: 1pt + liquid-stroke,
    content
  )
}

// Liquid Pill (Tag)
#let liquid-pill(content) = {
  box(
    radius: 100pt,
    fill: white.transparentize(80%),
    stroke: 0.5pt + liquid-stroke,
    inset: (x: 0.8em, y: 0.4em),
    content
  )
}

// 섹션 타이틀
#let section-title(title) = {
  v(2.5em)
  text(size: 17pt, weight: "bold", fill: white)[#title]
  v(-0.8em)
  // Glowing line
  line(length: 100%, stroke: 1pt + gradient.linear(rgb("#3498db"), rgb("#9b59b6")))
  v(1.2em)
}

// 회사 헤더
#let company-header(name, period, role) = {
  v(1.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.8em,
    align: (left + horizon, right + horizon),
    // Liquid Badge
    box(
      fill: white.transparentize(80%), 
      radius: 16pt,
      inset: (x: 1em, y: 0.6em),
      stroke: 0.5pt + white.transparentize(50%),
      text(size: 12pt, weight: "bold", fill: white)[#name]
    ),
    stack(
      dir: ltr,
      spacing: 0.8em,
      text(size: 12pt, weight: "bold", fill: white)[#role],
      text(size: 10pt, weight: "medium", fill: white.transparentize(30%))[#period]
    )
  )
}

// 회사 요약
#let company-summary(tags, summary) = {
  v(0.8em)
  grid(
    columns: (auto, auto, auto, auto, auto),
    gutter: 0.5em,
    ..tags.map(tag => liquid-pill(
      text(size: 9pt, weight: "bold", fill: white)[\##tag]
    ))
  )
  v(0.8em)
  block(
    width: 100%,
    fill: white.transparentize(90%),
    radius: 12pt,
    inset: 1em,
    text(size: 10pt, style: "italic", fill: white.transparentize(10%))[
      #summary
    ]
  )
  v(1.5em)
}

// 프로젝트 아이템
#let project-item(title, period, problem, solution, result) = {
  v(0.5em)
  liquid-box(inset: 1.2em)[
    #grid(
      columns: (auto, 1fr),
      gutter: 0.5em,
      align: (left + horizon, right + horizon),
      text(size: 12pt, weight: "bold", fill: white)[#title],
      text(size: 9pt, fill: white.transparentize(40%))[#period]
    )
    
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + white.transparentize(80%))
    #v(0.5em)

    #pad(top: 0.2em)[
      #set par(leading: 0.7em)
      #grid(
        columns: (2.5em, 1fr),
        row-gutter: 1em,
        gutter: 0.8em,
        
        text(weight: "bold", fill: rgb("#ff6b6b"))[Prob], text(fill: white.transparentize(10%))[#problem],
        text(weight: "bold", fill: rgb("#4ecdc4"))[Act], text(fill: white.transparentize(10%))[#solution],
        text(weight: "bold", fill: rgb("#45b7d1"))[Res], text(fill: white.transparentize(10%))[#result]
      )
    ]
  ]
  v(0.8em)
}

// ==========================================================================
// 문서 시작 (Template Mode)
// ==========================================================================

#align(center)[
  #liquid-box(inset: 2em)[
    #text(size: 24pt, weight: "black", fill: white)[VisionOS Design Study]
    #v(0.6em)
    #text(size: 12pt, weight: "bold", fill: white.transparentize(30%))[Spatial Interface Guidelines & Research]
  ]
]

#section-title("Spatial Computing")

#company-header("XR Lab", "2024.01 – Present", "Research Engineer")

#company-summary(
  ("VisionOS", "RealityKit", "SpatialAudio", "SwiftUI"),
  [Prototyped immersive #text(weight: "black")[Spatial User Interfaces] focusing on gaze-based interaction and hand gesture recognition.]
)

#project-item(
  "Immersive Video Player",
  "2024.01 - 2024.06",
  "Traditional 2D video players lacked depth and immersion in a 3D space.",
  "Developed a curved screen video player using RealityKit with dynamic lighting reflection.",
  "Achieved a cinema-like experience with 180-degree field of view support."
)

#section-title("Core Technologies")

#company-header("Framework Team", "2022.01 – 2023.12", "Senior Developer")

#company-summary(
  ("Metal", "Shaders", "Performance", "C++"),
  [Optimized the core rendering pipeline to support #text(weight: "black")[4K textures] at 90fps on mobile chipsets.]
)

#project-item(
  "Texture Streaming System",
  "2023.01 - 2023.06",
  "High-resolution textures were causing memory overflows on older devices.",
  "Implemented a virtual texture streaming system to load only visible mipmaps.",
  "Reduced memory footprint by 60% while maintaining visual fidelity."
)
