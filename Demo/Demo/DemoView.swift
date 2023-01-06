import SwiftUI
import Animatable

struct DemoView: View {
    
    // States for single animations examples:
    @State var fireworks: Bool = false
    @State var explosive: Bool = false
    @State var tweak: Bool = false
    @State var scale: Bool = false
    @State var rotate: Bool = false
    @State var liveComments: Bool = false
    
    // States for combined animations examples:
    @State var liveCommentsAndScale: Bool = false
    @State var doubleExplosive: Bool = false
    @State var tweakAndScale: Bool = false
    @State var scaleAndExplode: Bool = false
    @State var multiple: Bool = false
    
    var body: some View {
    
        ZStack {
            Color.green.opacity(0.2)
                .zIndex(1)
            
            VStack {
                Group {
                    Text("Single animations ⬇️")
                        .font(.title)
                    
                    Button {
                        liveComments.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: liveComments ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .animate(.liveComments(stamps: 4),
                                         animate: liveComments)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Like")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.pink.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        explosive.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: explosive ? "power" : "poweroff")
                                .resizable()
                                .scaledToFit()
                                .animate(.explosive(color: .white),
                                         animate: explosive)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text(explosive ? "On" : "Off")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.gray.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        tweak.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: tweak ? "hand.thumbsup.fill" : "hand.thumbsup")
                                .resizable()
                                .scaledToFit()
                                .animate(.tweaking(),
                                         animate: tweak)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Like")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.blue.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        scale.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: scale ? "plus.app.fill" : "plus.app")
                                .resizable()
                                .scaledToFit()
                                .animate(.scaling(),
                                         animate: scale)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Add")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.yellow.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        rotate.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: rotate ? "arrow.triangle.2.circlepath.circle.fill" : "arrow.triangle.2.circlepath.circle")
                                .resizable()
                                .scaledToFit()
                                .animate(.rotating,
                                         animate: rotate)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Sync")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.red.opacity(0.6))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        fireworks.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: fireworks ? "sun.max.fill" : "sun.max")
                                .resizable()
                                .scaledToFit()
                                .animate(.fireworks(color: .white),
                                         animate: fireworks)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Weather")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.orange.opacity(0.6))
                                .cornerRadius(12)
                        )
                    }
                    
                }
                
                Group {
                    Text("Combined animations ⬇️")
                        .font(.title)
                    
                    Button {
                        liveCommentsAndScale.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: liveCommentsAndScale ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .animate(.scaling(1.5),
                                         animate: liveCommentsAndScale)
                                .animate(.liveComments(stamps: 4),
                                         animate: liveCommentsAndScale)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Like")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.pink.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        doubleExplosive.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: doubleExplosive ? "power" : "poweroff")
                                .resizable()
                                .scaledToFit()
                                .animate(.explosive(color: .red.opacity(0.9),
                                                    factor: 2.5),
                                         animate: doubleExplosive)
                                .animate(.explosive(color: .blue,
                                                    factor: 1.8),
                                         animate: doubleExplosive)
                                .animate(.explosive(color: .blue.opacity(0.5),
                                                    factor: 1.4),
                                         animate: doubleExplosive)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text(doubleExplosive ? "On" : "Off")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.gray.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        tweakAndScale.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: tweakAndScale ? "hand.thumbsup.fill" : "hand.thumbsup")
                                .resizable()
                                .scaledToFit()
                                .animate(.scaling(1.2),
                                         animate: tweakAndScale)
                                .animate(.tweaking(),
                                         animate: tweakAndScale)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Like")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.blue.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        scaleAndExplode.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: scaleAndExplode ? "plus.app.fill" : "plus.app")
                                .resizable()
                                .scaledToFit()
                                .animate(.scaling(),
                                         animate: scaleAndExplode)
                                .animate(.explosive(color: .white,
                                                    factor: 2.5),
                                         animate: scaleAndExplode)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Add")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.yellow.opacity(0.8))
                                .cornerRadius(12)
                        )
                    }
                    
                    Button {
                        multiple.toggle()
                    } label: {
                        HStack(spacing: 8)  {
                            Image(systemName: multiple ? "sun.max.fill" : "sun.max")
                                .resizable()
                                .scaledToFit()
                                .animate(.rotating,
                                         animate: multiple)
                                .animate(.explosive(color: .red, factor: 2.0),
                                         animate: multiple)
                                .animate(.explosive(color: .blue, factor: 1.4),
                                         animate: multiple)
                                .animate(.fireworks(color: .yellow, factor: 3.0),
                                         animate: multiple)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Weather")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(
                            Rectangle()
                                .fill(.orange.opacity(0.6))
                                .cornerRadius(12)
                        )
                    }
                    
                }
            }
            .zIndex(2)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DemoView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
