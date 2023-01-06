import SwiftUI

struct LiveComments: ViewModifier {
    
    let animate: Bool
    let stamps: Int
    
    @State private var fly: Bool = false
    @State private var hide: Bool = false
    @State private var opacity: Bool = false
    @State private var id = UUID()
    
    func body(content: Content) -> some View {
        content
            .covered {
                if animate {
                    ForEach(0...stamps - 1, id: \.self) { num in
                        content
                            .offset(x: fly ? CGFloat.random(in: -10...10) : 0,
                                    y: fly ? CGFloat.random(in: -100 ... -70) : 0)
                            .animation(.linear(duration: 0.8)
                                .delay(stamps > 1 ? Double(num)/Double(stamps - 1) : 0),
                                       value: fly)
                            .opacity(hide ? 0 : 1.0)
                            .animation(.linear(duration: 0.2)
                                .delay(0.6 + (stamps > 1 ? Double(num)/Double(stamps - 1) : 0)),
                                       value: hide)
                    }
                    .id(id)
                }
            }
            .valueChanged(of: animate) { value in
                if value {
                    // start animation:
                    fly.toggle()
                    hide.toggle()
                    
                    // reset animation:
                    withAnimation(.linear(duration: 0.1).delay(stamps > 1 ? 1.9 : 0.9)) {
                        id = UUID()
                        fly.toggle()
                        hide.toggle()
                    }
                }
            }
    }
}
