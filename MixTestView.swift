import SwiftUI

struct MixTestView: View {
    
    @State private var progress: CGFloat = 0
    @State private var posx: CGFloat = 0
    @State private var posy: CGFloat = 0

    
    var body: some View {
        ZStack{
            Image("sample2")
                .resizable()
                .scaledToFill()
                .frame(width:360,height:360)
                .blur(radius: progress * 10)
                .layerEffect(ShaderLibrary.test(.boundingRect, .float(progress), .float(posx), .float(posy)), maxSampleOffset:CGSize(width:200,height:400))
            
            VStack{
                Spacer()
                HStack{
                    Text("p : \(progress, specifier: "%.2f")")
                        .foregroundStyle(.white)
                        .font(.system(size:14, design: .monospaced))
                    Slider(value:$progress, in:0...2)
                        .tint(.white)
                }
                HStack{
                    Text("x : \(posx, specifier: "%.2f")")
                        .foregroundStyle(.white)
                        .font(.system(size:14, design: .monospaced))
                    Slider(value:$posx, in:0...20)
                        .tint(.white)
                }

                HStack{
                    Text("y : \(posy, specifier: "%.2f")")
                        .foregroundStyle(.white)
                        .font(.system(size:14, design: .monospaced))
                    Slider(value:$posy, in:0...20)
                        .tint(.white)
                }

            }
            .padding()


        }
    }
}

#Preview {
    MixTestView()
}
