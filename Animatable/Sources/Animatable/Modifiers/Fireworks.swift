import SwiftUI

struct Fireworks: ViewModifier {
    
    let animate: Bool
    let color: Color
    let factor: CGFloat
    
    @State private var stretch: Bool = true
    @State private var compress: Bool = true

    @State private var id = UUID() // to reset animation
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            let width = reader.size.width * factor
            let height = reader.size.width * 0.2
            
            let startX = width * 0.8
            let endX = width
            
            content
                .frame(width: reader.size.width, height: reader.size.height)
                .covered {
                    ZStack {
                        ForEach(0..<12) { hour in
                            Drop(startX: stretch ? startX : endX,
                                 endX: compress ? startX : endX)
                            .fill(color)
                            .frame(width: width, height: height)
                            .rotationEffect(.radians(Double.pi * 2 / 12 * Double(hour)))
                        }
                    }
                    .id(id)
                    .frame(width: width, height: width)
                }
                .zIndex(1)
        }
        .valueChanged(of: animate) { value in
            if value {
                // start animation
                withAnimation(.linear(duration: 0.2)) {
                    stretch.toggle()
                }
                
                withAnimation(.linear(duration: 0.2).delay(0.4)) {
                    compress.toggle()
                }

                // reset animation:
                withAnimation(.linear(duration: 0.2).delay(0.6)) {
                    id = UUID()
                    stretch.toggle()
                    compress.toggle()
                }
            }
        }
    }
}

private struct Drop: SwiftUI.Animatable, Shape {
    
    var startX: CGFloat
    var endX: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(startX, endX)
        }
        set {
            startX = newValue.first
            endX = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {

        let midX = startX + ((endX - startX) / 2 )
        var path = Path()
        path.move(to: .init(x: startX, y: rect.midY))
        path.addQuadCurve(to: .init(x: endX, y: rect.midY), control: .init(x: midX, y: rect.minY))
        path.move(to: .init(x: endX, y: rect.midY))
        path.addQuadCurve(to: .init(x: startX, y: rect.midY), control: .init(x: midX, y: rect.maxY))

        return path
    }
}

struct Drop_PreviewProvider: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                Text("Frame width > endX")
                
                Drop(startX: 60, endX: 70)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 60, endX: 80)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 60, endX: 90)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 60, endX: 130)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 70, endX: 130)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 80, endX: 130)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 90, endX: 130)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 110, endX: 130)
                    .frame(width: 260, height: 10)
                
                Drop(startX: 120, endX: 130)
                    .frame(width: 260, height: 10)
            }
            Group {
                Text("Frame width = endX")
                
                Drop(startX: 0, endX: 10)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 0, endX: 30)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 0, endX: 60)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 0, endX: 120)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 60, endX: 120)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 90, endX: 120)
                    .frame(width: 120, height: 20)
                
                Drop(startX: 110, endX: 120)
                    .frame(width: 120, height: 20)
            }
        }
    }
}
