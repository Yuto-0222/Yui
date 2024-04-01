import SwiftUI
import AVFoundation

struct TazunaView: View {
    @State var value: Double = 1.0
    @State private var selectedColor: Color = .black
    @State private var selectedBackColor: Color = .white
    let sideLength: CGFloat
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            VStack(spacing:0){
                Spacer(minLength: 0)
                ForEach(0..<10, id: \.self) { _ in
                    Spacer(minLength: 0)
                    HStack(spacing:0){
                        ForEach(0..<10, id: \.self) { _ in
                            GeometryReader { geometry in
                                Path { path in
                                    let center = CGPoint(x: geometry.size.width/2, y: geometry.size.height/2)
                                    let radius = min(geometry.size.width, geometry.size.height) * 3.0
                                    let angle = CGFloat.pi / 2.0
                                    
                                    for i in 0..<6 {
                                        let x = center.x + radius * cos(CGFloat(i) * angle)
                                        let y = center.y + radius * cos(CGFloat(i) * angle)
                                        
                                        if i == 0 {
                                            path.move(to: CGPoint(x: x, y: y))
                                        } else {
                                            path.addLine(to: CGPoint(x: x, y: y))
                                        }
                                    }
                                    path.closeSubpath()
                                }
                                .stroke(selectedColor,lineWidth:value)
                                .rotationEffect(Angle(degrees: 90))
                            }
                            .frame(width: sideLength, height: sideLength)
                        }
                    }
                }
            }.padding(.all,0)
            Rectangle()
                .fill(.white)
                .frame(width: 400, height:200)
                .offset(x: 0, y: -300)
            Rectangle()
                .fill(.white)
                .frame(width: 400, height:200)
                .offset(x: 0, y: 260)
            Group{
                HStack{
                    Text("Thin")
                        .padding(.horizontal,100)
                        .font(.system(size:20,weight:.bold,design:.serif))
                    Text("Thick")
                        .padding(.horizontal,100)
                        .font(.system(size:20,weight:.bold,design:.serif))
                }.offset(x: 0, y: 250)
                
                Text("Reines")
                    .font(.system(size:80,design:.serif))
                    .bold()
                    .offset(x: 0, y: -280)
                
                HStack{
                    ColorPicker("Color", selection: $selectedColor)
                        .frame(width: 100, height: 100)
                        .font(Font.system(size: 20, weight: .bold, design: .serif)) // フォントを指定する
                        .padding(.horizontal,20)
                    ColorPicker("BackColor", selection: $selectedBackColor)
                        .frame(width: 149, height: 100)
                        .font(Font.system(size: 20, weight: .bold, design: .serif)) // フォントを指定する
                        .padding(.horizontal,20)
                }.offset(x: 0, y: 200)
                
                Slider(value: $value, in: 1...70)
                    .frame(width: 300, height: 100)
                    .accentColor(.black)
                    .offset(x: 0, y: 280)
                
            }.padding(.all,0)
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"たづな" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
        }
    }
}
