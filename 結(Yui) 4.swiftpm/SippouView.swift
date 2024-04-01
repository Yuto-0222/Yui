import SwiftUI
import AVFoundation

struct AnimatedCirclesView: View {
    
    let circleSize: CGFloat = 70
    let spacing: CGFloat = 10
    let circleCount: Int = 5
    let circleCount1: Int = 20
    @State private var selectedColor: Color = .black
    @State private var selectedColor2: Color = .black
    @State private var selectedBackColor: Color = .white//背景色    
    @State private var value: Double = 1.0
    
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            Text("Cloisonne")
                .font(.system(size:70,design:.serif))
                .bold()
                .offset(x: 0, y: -280)
            Group{
                VStack(spacing:0){
                    ForEach(0..<circleCount, id: \.self) { index in
                        HStack(spacing:0) {
                            ForEach(0..<circleCount1, id: \.self) { index in
                                Circle()
                                    .stroke(selectedColor,lineWidth:value)
                                    .frame(width: circleSize, height: circleSize)
                            }
                        }
                    }
                }
                
                VStack(spacing:0){
                    ForEach(0..<circleCount, id: \.self) { index in
                        HStack(spacing:0) {
                            ForEach(0..<circleCount1, id: \.self) { index in
                                Circle()
                                    .stroke(selectedColor2,lineWidth:value)
                                    .frame(width: circleSize, height: circleSize)
                            }
                        }
                    }.offset(x: circleSize/2, y: circleSize/2)
                }
            }.offset(x: -20, y: -40)
            
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
                
            }.offset(x: 0, y: 230)
            
            HStack{
                Text("Thin")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
                Text("Thick")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
            }.offset(x: 0, y: 265)
            
            Slider(value: $value, in: 1...70)
                .frame(width: 300, height: 100)
                .accentColor(.black)
                .offset(x: 0, y: 290)
            
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"しっぽう" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}
