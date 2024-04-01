import SwiftUI
import AVFoundation

struct UrokoPatternView: View {
    let numTriangles = 4// 縦に描画する正三角形の数
    let numTriangles2 = 25// 横に描画する正三角形の数
    let triangleSize: CGFloat = 50 // 正三角形のサイズ
    let spacing: CGFloat = 0// 正三角形の間隔
    @State private var selectedColor: Color = .black//正三角形の色
    @State private var selectedColor2: Color = .black//正三角形の色
    @State private var selectedBackColor: Color = .white//背景色
    
    struct Triangle: Shape {

        func path(in rect: CGRect) -> Path {
            var path = Path()
            let size = min(rect.size.width, rect.size.height)
            let xOffset = rect.midX - size / 2
            let yOffset = rect.maxY - size
            
            // 正三角形のパスを作成
            path.move(to: CGPoint(x: xOffset + size / 2, y: yOffset))
            path.addLine(to: CGPoint(x: xOffset+size, y: yOffset + size))
            path.addLine(to: CGPoint(x: xOffset, y: yOffset + size))
            path.closeSubpath()
            return path
        }
    }
    
    struct Triangle2: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let size = min(rect.size.width, rect.size.height)
            let xOffset = rect.midX - size / 2
            let yOffset = rect.maxY - size
            
            // 正三角形のパスを作成
            path.move(to: CGPoint(x: xOffset+size, y: yOffset+size))
            path.addLine(to: CGPoint(x: xOffset+size+size/2, y: yOffset + size+size))
            path.addLine(to: CGPoint(x: xOffset+size/2, y: yOffset + size+size))
            path.closeSubpath()
            return path
        }
    }
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            
            Text("Scale")
                .font(.system(size:70,design:.serif))
                .bold()
                .offset(x: 0, y: -250)
            
            VStack(spacing:triangleSize){
                ForEach(0..<numTriangles, id: \.self) { index in
                    HStack(spacing:0) {
                        ForEach(0..<numTriangles2, id: \.self) { index in
                            Triangle()
                                .fill(selectedColor)
                                // 正三角形の塗りつぶしの色を設定
                                .frame(width: triangleSize, height: triangleSize) // 正三角形のサイズを設定

                        }
                    }
                }
            }

                VStack(spacing:triangleSize){
                    ForEach(0..<numTriangles, id: \.self) { index in
                        HStack(spacing:0) {
                            ForEach(0..<numTriangles2, id: \.self) { index in
                                Triangle2()
                                    .fill(selectedColor2) // 正三角形の塗りつぶしの色を設定
                                    .frame(width: triangleSize, height: triangleSize)
                            }
                        }
                    }
                }
                HStack{
                    ColorPicker("Color #1", selection: $selectedColor)
                        .frame(width: 100, height: 100)
                        .font(Font.system(size: 20, weight: .bold, design: .serif)) 
                        .padding(.horizontal,10)
                    ColorPicker("Color #2", selection: $selectedColor2)
                        .frame(width: 100, height: 100)
                        .font(Font.system(size: 20, weight: .bold, design: .serif))
                        .padding(.horizontal,10)
                    
                    ColorPicker("BackColor", selection: $selectedBackColor)
                        .frame(width: 100, height: 100)
                        .font(Font.system(size: 20, weight: .bold, design: .serif))
                        .padding(.horizontal,10)
                    
                }.offset(x: 0, y: 270)
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"うろこ" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}
