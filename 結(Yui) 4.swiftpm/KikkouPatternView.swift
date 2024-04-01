import SwiftUI
import AVFoundation

struct KikkouPatternView: View {
    @State private var value: Double = 1.0
    @State private var selectedColor: Color = .black
    @State private var selectedColor2: Color = .black
    @State private var selectedBackColor: Color = .white
    struct Hexagon: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let sideLength = min(rect.width, rect.height) / 2
            let apothem = sideLength * CGFloat(sqrt(3)) / 2
            
            path.move(to: CGPoint(x: center.x + sideLength, y: center.y))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y + apothem))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y + apothem))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y - apothem))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y - apothem))
            path.closeSubpath()
            
            return path
        }
    }
    
    struct Hexagon2: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let sideLength = min(rect.width, rect.height) / 2
            let apothem = sideLength * CGFloat(sqrt(3)) / 2
            
            path.move(to: CGPoint(x: center.x + sideLength/2, y: center.y+apothem))
            path.addLine(to: CGPoint(x: center.x+sideLength , y: center.y + apothem*2))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y + apothem*3))
            path.addLine(to: CGPoint(x: center.x - sideLength+sideLength/2, y: center.y+apothem*3))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y + apothem*2))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y + apothem))
            path.closeSubpath()
            
            return path
        }
    }
    
    struct Hexagon3: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let sideLength = min(rect.width, rect.height) / 2
            let apothem = sideLength * CGFloat(sqrt(3)) / 2
            
            path.move(to: CGPoint(x: center.x + sideLength/2, y: center.y+apothem*3))
            path.addLine(to: CGPoint(x: center.x+sideLength , y: center.y + apothem*4))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y + apothem*5))
            path.addLine(to: CGPoint(x: center.x - sideLength/2, y: center.y+apothem*5))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y + apothem*4))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y + apothem*3))
            path.closeSubpath()
            
            return path
        }
    }
    
    struct Hexagon4: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let sideLength = min(rect.width, rect.height) / 2
            let apothem = sideLength * CGFloat(sqrt(3)) / 2
            
            path.move(to: CGPoint(x: center.x + sideLength/2, y: center.y+apothem*5))
            path.addLine(to: CGPoint(x: center.x+sideLength , y: center.y + apothem*6))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y + apothem*7))
            path.addLine(to: CGPoint(x: center.x - sideLength/2, y: center.y+apothem*7))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y + apothem*6))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y + apothem*5))
            path.closeSubpath()
            
            return path
        }
    }
    struct Hexagon5: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let sideLength = min(rect.width, rect.height) / 2
            let apothem = sideLength * CGFloat(sqrt(3)) / 2
            
            path.move(to: CGPoint(x: center.x + sideLength/2, y: center.y+apothem*7))
            path.addLine(to: CGPoint(x: center.x+sideLength , y: center.y + apothem*8))
            path.addLine(to: CGPoint(x: center.x + sideLength / 2, y: center.y + apothem*9))
            path.addLine(to: CGPoint(x: center.x - sideLength/2, y: center.y+apothem*9))
            path.addLine(to: CGPoint(x: center.x - sideLength, y: center.y + apothem*8))
            path.addLine(to: CGPoint(x: center.x - sideLength / 2, y: center.y + apothem*7))
            path.closeSubpath()
            
            return path
        }
    }
    @State private var volume: Float = 1.0
    var audioPlayer: AVAudioPlayer?
    var body: some View {
        ZStack{
            selectedBackColor
                .ignoresSafeArea()
            Text("Hexagonal")
                .font(.system(size:70,design:.serif))
                .bold()
                .offset(x: 0, y: -280)
            Group{
                HStack(spacing:0){
                    ForEach(0..<20, id: \.self) { index in
                        Hexagon()
                            .stroke(selectedColor, lineWidth: value)
                            .frame(width: 80, height: 80)
                    }
                }
                
                HStack(spacing:0){
                    ForEach(0..<20, id: \.self) { index in
                        Hexagon2()
                            .stroke(selectedColor2, lineWidth: value)
                            .frame(width: 80, height: 80)
                    }
                }
                
                HStack(spacing:0){
                    ForEach(0..<20, id: \.self) { index in
                        Hexagon3()
                            .stroke(selectedColor, lineWidth: value)
                            .frame(width: 80, height: 80)
                    }
                }
                
                HStack(spacing:0){
                    ForEach(0..<20, id: \.self) { index in
                        Hexagon4()
                            .stroke(selectedColor2, lineWidth: value)
                            .frame(width: 80, height: 80)
                    }
                }
                
                HStack(spacing:0){
                    ForEach(0..<20, id: \.self) { index in
                        Hexagon5()
                            .stroke(selectedColor, lineWidth: value)
                            .frame(width: 80, height: 80)
                    }
                }
            }.offset(x: 0, y: -165)
            
            HStack{
                Text("Thin")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
                Text("Thick")
                    .padding(.horizontal,100)
                    .font(.system(size:20,weight:.bold,design:.serif))
            }.offset(x: 0, y: 260)
            
            Slider(value: $value, in: 1...70)
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
                
            }.offset(x: 0, y: 215)
            //}
            //}
        }
        .onAppear{
            let utterance = AVSpeechUtterance(string:"きっこう" )
            utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            synthesizer.speak(utterance)
            audioPlayer?.volume = volume
        }
    }
}

