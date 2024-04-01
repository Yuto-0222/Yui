import SwiftUI
import AVFoundation

struct AsanohaView: View {
@State private var value: Double = 1.0
@State private var selectedColor: Color = .black
@State private var selectedColor2: Color = .black
@State private var selectedBackColor: Color = .white
    struct ArrowheadShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            // 三角形の形状を定義
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
            
            //三角形の対角線を表示
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.closeSubpath()
            
            //三角形の重心に向かって線を描画
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: (rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: (rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            //path.closeSubpath()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: (-rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            path.closeSubpath()
            path.move(to: CGPoint(x: (-rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.closeSubpath()
            path.move(to: CGPoint(x: (-rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.closeSubpath()
            return path
        }
    }
    
    struct ArrowheadShape2: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            // 菱形の形状を定義
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY+rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX+rect.midX, y: rect.maxY))
            path.closeSubpath()
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY+rect.midY))
            path.closeSubpath()
            
            //三角形の重心に向かって線を描画
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: (rect.midX+rect.maxX+rect.maxX)/3, y: (rect.midY+rect.maxY+rect.maxY+rect.midY)/3))
            path.closeSubpath()
            path.move(to: CGPoint(x: (rect.midX+rect.maxX+rect.maxX)/3, y: (rect.midY+rect.maxY+rect.maxY+rect.midY)/3))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.closeSubpath()
            path.move(to: CGPoint(x: (rect.midX+rect.maxX+rect.maxX)/3, y: (rect.midY+rect.maxY+rect.maxY+rect.midY)/3))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY+rect.midY))
            
            path.closeSubpath()
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: (rect.maxX+rect.maxX+rect.maxX+rect.midX)/3, y: (rect.midY+rect.maxY+rect.midY+rect.maxY)/3))
            path.closeSubpath()
            path.move(to: CGPoint(x: (rect.maxX+rect.maxX+rect.maxX+rect.midX)/3, y: (rect.midY+rect.maxY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY+rect.midY))
            path.closeSubpath()
            
            path.move(to: CGPoint(x: (rect.maxX+rect.maxX+rect.maxX+rect.midX)/3, y: (rect.midY+rect.maxY+rect.midY+rect.maxY)/3))
            path.addLine(to: CGPoint(x: rect.maxX+rect.midX, y: rect.maxY))
            path.closeSubpath()
            // path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            //path.addLine(to: CGPoint(x: (-rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            //path.closeSubpath()
            //path.move(to: CGPoint(x: (-rect.midX+rect.maxX+rect.midX)/3, y: (rect.minY+rect.midY+rect.maxY)/3))
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            //path.closeSubpath()
            //path.move(to: CGPoint(x: (rect.midX+rect.maxX+rect.maxX)/3, y: (rect.midY+rect.maxY+rect.maxY+rect.midY)/3))
            // path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            //path.closeSubpath()
            //path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            return path
        }
    }
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            
            Text("Hemp Leaf")
                .font(.system(size:70,design:.serif))
                .bold()
                .offset(x: 0, y: -270)
            
            Group{
                VStack(spacing:0){
                    ForEach(0..<7, id: \.self) { index in
                        HStack(spacing:0){
                            ForEach(0..<13, id: \.self) { index in
                                ArrowheadShape()
                                    .stroke(selectedColor,lineWidth: value)
                                    .frame(width: 100, height: 50)
                            }
                        }
                    }
                }
                
                VStack(spacing:0){
                    ForEach(0..<7, id: \.self) { index in
                        HStack(spacing:0){
                            ForEach(0..<13, id: \.self) { index in
                                ArrowheadShape2()
                                    .stroke(selectedColor2,lineWidth: value)
                                    .frame(width: 100, height: 50)
                            }
                        }
                    }
                }
            }.offset(x: 0, y: -30)
            HStack{
                Text("Thin")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
                Text("Thick")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
            }.offset(x: 0, y: 260)
            Slider(value: $value, in: 1...15)
                .frame(width: 300, height: 100)
                .accentColor(.black)
                .offset(x: 0, y: 290)
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
                
            }.offset(x: 0, y: 210)
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"あさのは")
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}
