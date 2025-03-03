# SwiftUIComponentKit

## Overview

The **ViewComponent** library is a SwiftUI-based framework designed to simplify and streamline the creation of reusable UI components. By enforcing a robust **MVVM (Model-View-ViewModel)** architecture pattern using **Combine**, the library aims to create a highly testable and maintainable structure for SwiftUI views. The components are encapsulated as enums, where each type of view has its own customizable and overridable `ViewModel`.

The goal of this library is to provide an easy-to-use system for building components while maintaining flexibility and testability in your SwiftUI projects. Once the core concepts are understood, using this library allows developers to quickly and effectively display views, promoting best practices in code organization and maintainability.

## Key Features and Benefits

### 1. **Enum-Based Component Management**

The library organizes UI components using an enum, **`ViewComponent`**, with cases that represent different UI components like buttons, text, progress indicators, and more. Each enum case contains a `ViewModel`, allowing for clean, modular, and scalable code.

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
The components and their corresponding view models follow the MVVM (Model-View-ViewModel) pattern. Each ViewModel is responsible for handling the data and logic behind the view, while the View is solely concerned with presenting the UI. By utilizing Combine, each ViewModel is reactive, ensuring that changes in the data are automatically reflected in the view.

Example: A TextComponentView has a corresponding TextComponentViewModel that contains all the necessary properties such as text, font, and foregroundColor etc. The @Published properties in the ViewModel ensure that any change in the data triggers an automatic update in the view.

```swift
open class TextComponentViewModel: ComponentViewModel {
    @Published var text: String
    @Published var font: Font
    @Published var textAlignment: TextAlignment
    @Published var foregroundColor: Color
    // Other properties...
}
```

This architecture enforces a clean separation of concerns, ensuring that the UI remains decoupled from business logic and can be more easily tested.


### 3. Customizable ViewModels
Each component is fully customizable by providing an easily modifiable and overridable ViewModel. This provides flexibility in how each component behaves without needing to modify the component itself.

For example, developers can change properties like text, font, foregroundColor, padding, alignment, and more, via the TextComponentViewModel. The values are dynamically bound to the SwiftUI view and can be changed reactively.

```swift 
import SwiftUI
import Combine
import SwiftUIComponentKit

class MyTextViewModel: TextComponentViewModel {
    @Environment(\.sizeCategory) private var sizeCategory
    @Published var tapCount: Int = 0
    private var cancellables: Set<AnyCancellable> = Set()
    
    init(text: String) {
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
        
        self.font = .clampedFont(for: sizeCategory, minSize: 10, maxSize: 24, weight: .bold)
        self.onTap = { [weak self] _ in
            self?.itemTapped()
        }
        
        updateText()
    }
    
    private func updateText() {
        $tapCount
            .receive(on: DispatchQueue.main)
            .sink { output in
                self.textType = .standard("\(self.textString): \(output)")
            }
            .store(in: &cancellables)
    }
    
    private func itemTapped() {
        self.tapCount += 1
    }
}

struct MyComponentScreen: View {
    @StateObject var myTextViewModel = MyTextComponentViewModel()

    var body: some View {
        ComponentView(viewComponent: .text(viewModel: myTextViewModel))
    }
}

#Preview {
  MyComponentScreen()
}
```

### 4. Reusable and Modular UI Components
All components within the library are built to be reusable. The enum structure makes it easy to manage and add new components to the system. For example, you can add more component cases to the ViewComponent enum (e.g., TextFieldComponentView or ButtonGroupComponentView) without disrupting the existing structure.

The components are modular and designed to work together, making it possible to compose complex UIs by combining simpler components.

### 5. Testability
By leveraging MVVM and Combine, the library enforces a structure that is inherently testable. Each ViewModel can be unit tested independently of the UI, ensuring the behavior of the components is verified without needing to interact with the user interface.

```swift
@Test func textComponentViewModel_text_didChange() async throws {
    // Arrange
    let viewModel = TextComponentViewModel(text: "Hello, World!")
    
    // Act
    viewModel.text = "New Text"
    
    // Assert
    #expect(viewModel.text == "New Text")
}
```

This results in faster development cycles, fewer bugs, and easier debugging.

### 6. Flexible and Easy-to-Use Views
After understanding the basic structure, integrating the components into your project becomes a simple task. The views are designed to be flexible with customizable styles and can be extended by modifying their corresponding ViewModel. Developers can easily create a variety of UI elements with just a few lines of code.

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

The ViewComponent library is a powerful framework for developers looking to build reusable and customizable UI components in SwiftUI, all while maintaining best practices in architecture and testability. By enforcing the MVVM pattern with Combine, the library ensures clean separation of concerns, enhanced testability, and flexibility, making it a valuable tool for modern SwiftUI applications.

Whether you're building simple UIs or complex layouts, ViewComponent simplifies the development process and promotes maintainable, scalable, and easily testable code. With its modular approach, it's easy to extend, and its integration with SwiftUI ensures that you're working with the most modern and efficient design patterns available.

### Installation

To use the ViewComponent library, simply integrate into your Xcode project using Swift Package manager and import SwiftUIComponentComponentKit.
