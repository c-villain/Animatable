import SwiftUI

extension View {
    
    /// A backwards compatible wrapper for iOS 14 `overlay`
    @ViewBuilder
    func covered<Content: View>(alignment: Alignment = .center,
                                @ViewBuilder _ content: @escaping () -> Content ) -> some View {
        
        if #available(iOS 15.0, macOS 12.0, *) {
            self.overlay(alignment: alignment) {
                content()
            }
        } else {
            GeometryReader { reader in
                ZStack(alignment: alignment) {
                    self
                        .zIndex(1)
                    content()
                        .zIndex(2)
                }
                .frame(width: reader.size.width,
                       height: reader.size.height)
            }
        }
    }
}
