// MARK: 페이지 및 폰트 설정
#set page(
  paper: "a4",
  margin: (top: 3.5cm, bottom: 2cm, x: 2cm), // Top margin increased for header
  fill: white,
  header: {
    // 1. Global Nav Bar Background (Full Bleed)
    place(
      top + left,
      dx: -2cm, // Align to left page edge (compensate margin)
      dy: -2.5cm, // Align to top page edge
      rect(
        width: 21cm, // A4 Full Width
        height: 50pt,
        fill: rgb("#1d1d1f"), // Apple Global Nav Dark
        stroke: none
      )
    )
    // 2. Logo & Text (Aligned with content)
    place(
      top + left,
      dy: -1.8cm, // Vertically center in the bar
      text(fill: white, size: 12pt, weight: "semibold", font: "SF Pro Text")[
         Developer
      ]
    )
  }
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
  v(2.5em)
  text(size: 19pt, weight: "bold", fill: rgb("#1d1d1f"))[#title]
  v(-0.6em)
  line(length: 100%, stroke: 1pt + apple-border)
  v(1em)
}

// Declaration Block (Code Style Summary)
#let declaration-block(content) = {
  block(
    width: 100%,
    fill: code-bg,
    radius: 8pt,
    inset: 1em,
    stroke: none,
    text(font: ("Menlo", "Courier New"), size: 9.5pt, fill: rgb("#1d1d1f"))[#content]
  )
}

// Topic Header (Framework Style)
#let topic-header(name, type, summary) = {
  v(1.5em)
  grid(
    columns: (auto, 1fr),
    gutter: 0.5em,
    align: (left + horizon, right + horizon),
    text(size: 14pt, weight: "bold", fill: rgb("#1d1d1f"))[#name],
    doc-badge(type)
  )
  v(0.5em)
  text(size: 10.5pt, fill: rgb("#1d1d1f"))[#summary]
  v(0.5em)
}

// API Symbol Row
#let api-symbol(name, description) = {
  v(0.5em)
  grid(
    columns: (12em, 1fr),
    gutter: 1em,
    text(size: 9.5pt, weight: "bold", font: ("Menlo", "Courier New"), fill: apple-blue)[#name],
    text(size: 10pt, fill: rgb("#1d1d1f"))[#description]
  )
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + apple-border)
}

// ==========================================================================
// 문서 시작 (Apple Docs Template - SwiftUI Study Mode)
// ==========================================================================

// Top Navigation Simulation
#breadcrumb(("Documentation", "SwiftUI", "Essentials"))
#v(1em)

// Title Area
#text(size: 9pt, weight: "bold", fill: apple-gray)[FRAMEWORK]
#v(0.2em)
#text(size: 32pt, weight: "bold", fill: rgb("#1d1d1f"))[SwiftUI]
#v(0.5em)
#text(size: 13pt, fill: rgb("#1d1d1f"))[
  Declare the user interface and behavior for your app on every platform.
]

#v(1em)
#grid(
  columns: (auto, auto, auto, auto),
  gutter: 0.5em,
  doc-badge("iOS 13.0+"),
  doc-badge("macOS 10.15+"),
  doc-badge("tvOS 13.0+"),
  doc-badge("watchOS 6.0+")
)

#v(2em)

// Declaration (Overview)
#text(size: 13pt, weight: "bold", fill: rgb("#1d1d1f"))[Overview]
#v(0.5em)
#text(size: 10.5pt, fill: rgb("#1d1d1f"))[
  SwiftUI provides views, controls, and layout structures for declaring your app's user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app's models down to the views and controls that users will see and interact with.
]

#v(1em)
#declaration-block[
  import SwiftUI

  struct ContentView: View {
      var body: some View {
          Text("Hello, World!")
              .padding()
      }
  }
]

// ---------------------------------------------------------
// Topics Section
// ---------------------------------------------------------
#section-header("Topics")

// 1. View Layout
#topic-header("View Layout", "Protocol", "Define the structure and layout of your user interface.")

#api-symbol("VStack", "A view that arranges its subviews in a vertical line.")
#api-symbol("HStack", "A view that arranges its subviews in a horizontal line.")
#api-symbol("ZStack", "A view that overlays its subviews, aligning them in both axes.")
#api-symbol("Grid", "A container that arranges views in a two-dimensional grid.")

// 2. State Management
#topic-header("State and Data Flow", "Property Wrapper", "Manage the flow of data between your app's data model and views.")

#api-symbol("@State", "A property wrapper type that can read and write a value managed by SwiftUI.")
#api-symbol("@Binding", "A property wrapper type that can read and write a value owned by a source of truth.")
#api-symbol("@Environment", "A property wrapper that reads a value from a view's environment.")
#api-symbol("@ObservedObject", "A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.")

// 3. View Modifiers
#topic-header("View Modifiers", "Method", "Configure views and adjust their appearance and behavior.")

#api-symbol(".padding()", "Pads this view using the specified edge insets and amount.")
#api-symbol(".background()", "Sets the view's background to a style.")
#api-symbol(".frame()", "Positions this view within an invisible frame with the specified size.")
#api-symbol(".onAppear()", "Adds an action to perform when this view appears.")

// ---------------------------------------------------------
// See Also Section
// ---------------------------------------------------------
#section-header("See Also")

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #text(size: 11pt, weight: "bold", fill: rgb("#1d1d1f"))[Essentials]
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + apple-border)
    #v(0.5em)
    #text(fill: apple-blue)[App Structure and Behavior]     #v(0.3em)
    #text(fill: apple-blue)[Previews in Xcode]
  ],
  [
    #text(size: 11pt, weight: "bold", fill: rgb("#1d1d1f"))[User Interface]
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + apple-border)
    #v(0.5em)
    #text(fill: apple-blue)[Views and Controls]     #v(0.3em)
    #text(fill: apple-blue)[View Layout and Presentation]
  ]
)
