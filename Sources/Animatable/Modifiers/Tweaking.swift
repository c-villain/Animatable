import SwiftUI
 
struct Tweaking: GeometryEffect {
    let amount: CGFloat
    let shakesPerUnit: Int
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: 0,
                              y: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)))
        )
    }
}
