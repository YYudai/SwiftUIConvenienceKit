import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
struct HiddenViewModifier: ViewModifier {
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
