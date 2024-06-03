import SwiftUI

public struct BlinkConfiguration {
    
    public let duration: TimeInterval
    public let opacity: Double
    
    public static let `default` = BlinkConfiguration(
        duration: 1.0,
        opacity: 0.2
    )
}

struct BlinkingView<Content: View>: View {
    
    private let content: () -> Content
    private let configuration: BlinkConfiguration
    
    @State private var blink: Bool = false
    
    init(
        configuration: BlinkConfiguration,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.configuration = configuration
        self.content = content
    }
    
    var body: some View {
        content()
            .opacity(blink ? configuration.opacity : 1.0)
            .onAppear {
                withAnimation(.easeOut(duration: configuration.duration).repeatForever(autoreverses: true)) {
                    blink.toggle()
                }
            }
    }
}

public struct BlinkingModifier: ViewModifier {
    let configuration: BlinkConfiguration
    public func body(content: Content) -> some View {
        BlinkingView(configuration: configuration) { content }
    }
}


public extension View {
    func blinking(configuration: BlinkConfiguration = .default) -> some View {
        modifier(BlinkingModifier(configuration: configuration))
    }
}

#Preview {
    Rectangle()
        .fill(Color.blue.opacity(0.2))
        .frame(height: 100)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .blinking()
        .padding(20)
}
