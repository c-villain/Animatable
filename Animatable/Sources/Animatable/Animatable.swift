import SwiftUI

public enum AnimatableType {
    case fireworks(color: Color,
                   factor: CGFloat = 2.5)
    
    case explosive(color: Color,
                   factor: CGFloat = 2.5)
    
    case liveComments(stamps: Int)
    
    case rotating
    
    case scaling(_ scaling: CGFloat = 1.3)
    
    case tweaking(amount: CGFloat = 8,
                  shakesPerUnit: Int = 2)
}

public extension View {
    
    @ViewBuilder
    func animate(_ type: AnimatableType,
                 animate: Bool) -> some View {
        switch type {
        case .fireworks(let color, let factor):
            self.modifier(Fireworks(animate: animate,
                                    color: color,
                                    factor: factor))
        case .explosive(let color,
                        let factor):
            self.modifier(Explosion(animate: animate,
                                    color: color,
                                    factor: factor))
        case .liveComments(let stamps):
            self.modifier(LiveComments(animate: animate,
                                       stamps: stamps))
        case .rotating:
            self.modifier(Rotating(animate: animate))
        case .scaling(let scaling):
            self.modifier(Scaling(animate: animate,
                                  scaling: scaling))
        case .tweaking(let amount,
                       let shakesPerUnit):
            self.modifier(Tweaking(amount: amount,
                                   shakesPerUnit: animate ? shakesPerUnit : 0,
                                   animatableData: CGFloat(animate ? 1 : 0)))
            .animation(.linear(duration: 0.4), value: animate)
        }
    }
    
}

