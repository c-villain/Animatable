import SwiftUI

public struct ShimmerConfiguration {
    
    public let gradient: Gradient
    public let initialLocation: (start: UnitPoint, end: UnitPoint)
    public let finalLocation: (start: UnitPoint, end: UnitPoint)
    public let duration: TimeInterval
    public let opacity: Double
    
    public static let `default` = ShimmerConfiguration(
        gradient: Gradient(stops: [
            .init(color: .clear, location: 0),
            .init(color: .black, location: 0.2),
            .init(color: .black, location: 0.7),
            .init(color: .clear, location: 1),
        ]),
        initialLocation: (start: UnitPoint(x: -1, y: 0.5), end: .leading),
        finalLocation: (start: .trailing, end: UnitPoint(x: 2, y: 0.5)),
        duration: 1,
        opacity: 1.0
    )
}

struct ShimmeringView<Content: View>: View {
    private let content: () -> Content
    private let configuration: ShimmerConfiguration
    @State private var startPoint: UnitPoint
    @State private var endPoint: UnitPoint
    init(configuration: ShimmerConfiguration, @ViewBuilder content: @escaping () -> Content) {
        self.configuration = configuration
        self.content = content
        _startPoint = .init(wrappedValue: configuration.initialLocation.start)
        _endPoint = .init(wrappedValue: configuration.initialLocation.end)
    }
    
    var body: some View {
        if #available(iOS 15, *) {
            content()
                .overlay { shimmer }
        } else {
            content()
                .overlay( 
                    shimmer,
                    alignment: .center
                )
        }
    }
    
    var shimmer: some View {
        LinearGradient(
            gradient: configuration.gradient,
            startPoint: startPoint,
            endPoint: endPoint
        )
        .opacity(configuration.opacity)
        .blendMode(.overlay)
        .onAppear {
            withAnimation(.easeOut(duration: configuration.duration).repeatForever(autoreverses: false)) {
                startPoint = configuration.finalLocation.start
                endPoint = configuration.finalLocation.end
            }
        }
    }
}

public struct ShimmerModifier: ViewModifier {
    let configuration: ShimmerConfiguration
    public func body(content: Content) -> some View {
        ShimmeringView(configuration: configuration) { content }
    }
}


public extension View {
    func shimmerable(configuration: ShimmerConfiguration = .default) -> some View {
        modifier(ShimmerModifier(configuration: configuration))
    }
}


#Preview {
    Rectangle()
        .fill(Color.blue.opacity(0.2))
        .frame(height: 100)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .shimmerable()
        .padding(20)
}

