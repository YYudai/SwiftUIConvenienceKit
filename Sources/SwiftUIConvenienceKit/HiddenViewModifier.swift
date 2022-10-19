import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
/// Viewを非表示にすることができるViewModifier
struct HiddenViewModifier: ViewModifier {
    /// Viewを非表示にするかしないかを操作できる。
    let isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}

extension View {
    
    /// Viewを表示するかしないかを操作できるmodifier
    /// - Parameter isHidden: Viewを非表示にするかしないか
    /// - Returns: 表示ならそのままのView、非表示ならEmptyView()
    func hiddenViewModifier(isHidden: Bool) -> some View {
        modifier(HiddenViewModifier(isHidden: isHidden))
    }
}

struct HiddenViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("Hello, world!")
                .modifier(HiddenViewModifier(isHidden: true))
            
            Text("Hello, world!")
                .modifier(HiddenViewModifier(isHidden: false))
        }
    }
}
