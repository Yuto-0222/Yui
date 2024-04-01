import SwiftUI
import AVFoundation

struct HisimonView: View {
@State private var value: Double = 1.0
@State private var selectedColor: Color = .black
@State private var selectedColor2: Color = .black
@State private var selectedBackColor: Color = .white//背景色    
    struct HisigataShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            // 菱形の形状を定義
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
            
            return path
        }
    }
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            Text("Rhoumbus")
                .font(.system(size:70,design:.serif))
                .bold()
                .offset(x: 0, y: -285)
            VStack(spacing:0){
                ForEach(0..<4, id: \.self) { index in
                    HStack(spacing:0){
                        ForEach(0..<19, id: \.self) { index in
                            HisigataShape()
                                .stroke(selectedColor,lineWidth: value)
                                .frame(width: 90, height: 50)
                        }
                    }
                    HStack(spacing:0){
                        ForEach(0..<19, id: \.self) { index in
                            HisigataShape()
                                .stroke(selectedColor2,lineWidth: value)
                                .frame(width: 90, height: 50)
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
            }.offset(x: 0, y: 265)
           
            Slider(value: $value, in: 1...45)
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
                
            }.offset(x: 0, y: 220)
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"ひしもん" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}

