import SwiftUI

struct Explosion: ViewModifier {
    
    let animate: Bool
    let color: Color
    let factor: CGFloat
    
    @State private var explode: Bool = false
    @State private var scale: Bool = false
    @State private var rotate: Bool = false
    @State private var hide: Bool = false
    
    @State private var id = UUID() // to reset animation
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            let width = reader.size.width * factor
            let height = reader.size.width * 0.4
            
            content
                .frame(width: reader.size.width,
                       height: reader.size.height)
                .covered {
                    ZStack {
                        ForEach(0..<12) { hour in
                            HStack {
                                Circle()
                                    .fill(color)
                                    .frame(width: scale ? 0 : height,
                                           height: scale ? 0 : height)
                                Spacer()
                            }
                            .frame(width: explode ? width : 0,
                                   height: explode ? height : 0)
                            .rotationEffect(.radians(Double.pi * 2 / 12 * Double(hour)))
                        }
                    }
                    .opacity(hide ? 1.0 : 0.0)
                    .id(id)
                    .frame(width: explode ? width : 0,
                           height: explode ? width : 0)
                }
        }
        .valueChanged(of: animate) { value in
            if value {
                // start animation
                withAnimation(.linear(duration: 0.3)) {
                    hide.toggle()
                    explode.toggle()
                }
                
                withAnimation(.linear(duration: 0.5)) {
                    scale.toggle()
                }
                
                // reset animation:
                withAnimation(.linear(duration: 0.1).delay(0.6)) {
                    id = UUID()
                    hide.toggle()
                    explode.toggle()
                    scale.toggle()
                }
            }
        }
    }
}

struct Explode_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ZStack {
            ForEach(0..<12) { hour in
                HStack {
                    Circle()
                        .fill(.yellow)
                        .frame(width: 10, height: 10)
                    Spacer()
                }
                .frame(width: 100, height: 10)
                .rotationEffect(.radians(Double.pi * 2 / 12 * Double(hour)))
                
            }
        }
        .frame(width: 100, height: 100)
    }
}
