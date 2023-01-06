import SwiftUI

struct Rotating: ViewModifier {
    
    let animate: Bool
    let angle: Double = 360
    
    @State private var rotate: Bool = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotate ? angle : 0))
            .valueChanged(of: animate) { value in
                if value {
                    // start animation:
                    withAnimation(.linear(duration: 1.0)) {
                        rotate = true
                    }
                    // reset animation:
                    rotate = false
                }
            }
    }
}
