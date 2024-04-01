import SwiftUI
import AVFoundation

struct TripleGridPatternView: View {
@State private var selectedColor: Color = .white
@State private var selectedColor2: Color = .black
@State private var selectedBackColor: Color = .white//背景色
let size: Int
    var body: some View {
        ZStack{
            selectedBackColor.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Checkered")
                    .font(.system(size:70,design:.serif))
                    .bold()
                    .offset(x: 0, y: -10)
                ForEach(0..<11, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<size, id: \.self) { col in
                            Rectangle()
                                .fill((row + col) % 2 == 0 ? selectedColor : selectedColor2) // 色を交互に設定
                                .frame(width: UIScreen.main.bounds.width / CGFloat(size),
                                       height: UIScreen.main.bounds.width / CGFloat(size)) // ボードのサイズに合わせてフレームを設定
                                .offset(x: 0, y: 20)
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
                    
                }.offset(x: 0, y: 10)
            }
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"いちまつ" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}
