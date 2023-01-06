import SwiftUI

struct Scaling: ViewModifier {
    
    let animate: Bool
    let scaling: CGFloat
    
    @State private var scale: Bool = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale ? scaling : 1)
            .valueChanged(of: animate) { value in
                if value {
                    withAnimation(.linear(duration: 0.2)) {
                        scale.toggle()
                    }
                    
                    withAnimation(.linear(duration: 0.2).delay(0.4)) {
                        scale.toggle()
                    }
                    
                }
            }
    }
}
