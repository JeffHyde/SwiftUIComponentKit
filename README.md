# SwiftUIComponentKit

## Overview

The **SwiftUIComponentKit** library is a SwiftUI-based framework designed to simplify and streamline the creation of reusable UI components. By leveraging a robust **MVVM (Model-View-ViewModel)** architecture pattern with **Combine**, the library aims to create a highly testable and maintainable structure for SwiftUI views. The components are encapsulated as enums, where each type of view has its own customizable and overridable view model.

This library provides a simple, flexible system for building components while maintaining testability in your SwiftUI projects. The library allows developers to quickly and effectively display views, promoting best practices in code organization and maintainability.

## Key Features and Benefits

### 1. **Enum-Based Component Management**

The library organizes UI components using an enum, **`ViewComponent`**, with cases that represent different UI components like buttons, text, progress indicators, and more. Each enum case contains a view model, allowing for clean, modular, and scalable code.

Example:
```swift
public enum ViewComponent {
    case button(viewModel: ButtonComponentViewModel)
    case cell(viewModel: CellComponentViewModel)
    case divider(viewModel: DividerComponentViewModel)
    case image(viewModel: ImageComponentViewModel)
    case picker(viewModel: SegmentedPickerComponentViewModel)
    case progress(viewModel: ProgressComponentViewModel)
    case slider(viewModel: SliderComponentViewModel)
    case text(viewModel: TextComponentViewModel)
    case toggle(viewModel: ToggleComponentViewModel)
}
```

### 2. MVVM Architecture with Combine
The components and their corresponding view models follow the MVVM (Model-View-ViewModel) pattern.  View models manage data and business logic, while Views focus on UI presentation.  By utilizing Combine, each ViewModel is reactive, ensuring that changes in the data are automatically reflected in the view.

Example: A `TextComponentView` has a corresponding `TextComponentViewModel` that contains all the necessary properties such as text, font, foregroundColor, etc. The `@Published` property wrappers assigned to the view model properties ensure that any change in the data triggers an automatic update in the view.

This architecture enforces a clean separation of concerns, ensuring that the UI remains decoupled from business logic and can be more easily tested.

### 3. Customizable ViewModels
Each component is fully customizable by providing an easily modifiable and overridable view model. This provides flexibility in how each component behaves without needing to modify the component itself.

For example, developers can change properties like text, font, foregroundColor, padding, alignment, and more, via the TextComponentViewModel. The values are dynamically bound to the SwiftUI view and can be changed reactively.

```swift 
import SwiftUI
import Combine
import SwiftUIComponentKit

public class MyTextComponentViewModel: TextComponentViewModel {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Published var tapCount: Int = 0
    
    private var text: String
    private var cancellables: Set<AnyCancellable> = Set()
    
    public init(text: String) {
        self.text = text
        
        super.init(
            textType: .standard(text),
            textAlignment: .center,
            horizontalAlignment: .center,
            foregroundColor: .primary,
            backgroundColor: .secondary,
            borderColor: .primary,
            borderWidth: .small,
            cornerRadius:  .small,
            sizeType: .height(.xxxLarge),
            innerPadding: .all(.medium),
            outerPadding: .horizontal(.large),
            outerBackgroundColor: .clear
        )
        
        self.font = .clampedFont(
            for: dynamicTypeSize,
            size:  16,
            factor: 2.0,
            weight: .regular
        )
        
        self.action = { [weak self] _ in
            self?.itemTapped()
        }
        
        updateText()
    }
    
    private func updateText() {
        $tapCount
            .sink { output in
                self.textType = .standard("\(self.text): \(output)")
            }
            .store(in: &cancellables)
    }
    
    func itemTapped() {
        self.tapCount += 1
    }
}

struct MyComponentScreen: View {
    @StateObject var myTextViewModel = MyTextComponentViewModel(text: "Tap Count")

    var body: some View {
        ComponentView(viewComponent: .text(viewModel: myTextViewModel))
    }
}

#Preview {
  MyComponentScreen()
}

```

### 4. Reusable and Modular UI Components

The library’s enum-based structure makes components modular, reusable, and easy to extend. It enables developers to compose complex UIs by combining simpler components efficiently.

### 5. Testability
By leveraging MVVM and Combine, the library enforces a structure that is inherently testable. Each ViewModel can be unit tested independently of the UI, ensuring the behavior of the components is verified without needing to interact with the user interface.

```swift
    @Test func test_tap_count() async throws {
        // Arrange
        let viewModel = MyTextComponentViewModel(text: "Tap Count")
        
        // Act
        viewModel.itemTapped()
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        
        // Assert
        if case .standard("Tap Count: 1") = viewModel.textType {
            #expect(true)
        } else {
            #expect(Bool(false))
        }
    }
```

This results in faster development cycles, fewer bugs, and easier debugging.

### 6. Flexible and Easy-to-Use Views

After understanding the basic structure, integrating the components into your project becomes a simple task. The views are designed to be flexible with customizable styles and can be extended by modifying their corresponding view model. Developers can easily create a variety of UI elements with just a few lines of code.

Example: 

```swift
ComponentView(
  viewComponent: .text(
    viewModel: TextComponentViewModel(
      text: "Hello, SwiftUI!"
    )
  )
)
```

### 7. Combining Views

The library also provides container views to combine multiple component views into more complex layouts, reducing the need for boilerplate code when creating more intricate UIs.  Such as **VerticalComponentView**, **HorizontalComponentView** and **ScrollableComponentView**

## Conclusion

The SwiftUIComponentKit library is a powerful framework for building reusable, customizable UI components in SwiftUI while maintaining best practices in architecture and testability. By leveraging the MVVM pattern with Combine, it ensures a clean separation of concerns, enhanced testability, and flexibility, making it a valuable tool for modern SwiftUI applications.

Whether you're building simple UIs or complex layouts, SwiftUIComponentKit streamlines development while promoting maintainable, scalable, and testable code. Its modular design makes it easy to extend, and its tight integration with SwiftUI ensures you're using the latest and most efficient design patterns.

## Compatibility 

Swift 6.0
iOS 17 +

## Installation

### Swift Package Manager:

To use the SwiftUIComponentKit library, simply integrate into your Xcode project's target using Swift Package manager and `import SwiftUIComponentKit`.

### Create Your Own Component Kit:

```swift 
import SwiftUI

// 1. A Component View Model
class MySpecialComponentViewModel: ObservableObject, Identifiable {
    @Published var id = UUID().uuidString
    @Published var text: String
    @Published var font: Font
    
    init(text: String, font: Font = .body) {
        self.text = text
        self.font = font
    }
}

// 2. A Component View
struct MySpecialComponentView: View {
    @ObservedObject var viewModel: MySpecialComponentViewModel
    
    var body: some View {
        Text(viewModel.text)
            .font(viewModel.font)
    }
}

// 3. Base Component Enumerated Type
enum MyViewComponent {
    case myComponent(viewModel: MySpecialComponentViewModel)
}

// 4. Base Component View
struct MyComponentView: View {
    private let viewComponent: MyViewComponent
    
    init(viewComponent: MyViewComponent) {
        self.viewComponent = viewComponent
    }
    
    public var body: some View {
        switch viewComponent {
        case .myComponent(let viewModel):
            MySpecialComponentView(viewModel: viewModel)
        }
    }
}

// 5. Parent View Model
class MyScreenViewModel: ObservableObject, Identifiable {
    @Published var topComponentViewModel = MySpecialComponentViewModel(
        text: "Top Component",
        font: .title.bold()
    )
    @Published var bottomComponentViewModel = MySpecialComponentViewModel(
        text: "Bottom Component"
    )
}

// 6. Component Usage
struct MyScreen: View {
    @StateObject var viewModel = MyScreenViewModel()
    
    public var body: some View {
        VStack(spacing: .zero) {
            MyComponentView(viewComponent: .myComponent(viewModel: viewModel.topComponentViewModel))
            MyComponentView(viewComponent: .myComponent(viewModel: viewModel.bottomComponentViewModel))
        }
    }
}
```
