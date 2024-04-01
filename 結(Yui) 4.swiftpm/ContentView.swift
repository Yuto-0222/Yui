import SwiftUI
import AVFoundation
let synthesizer = AVSpeechSynthesizer()

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    func playBGM() {
        if let audioURL = Bundle.main.url(forResource: "tam-y04", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print("再生できません")
            }
        }
    }
}

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer?
    @StateObject var audioManager = AudioManager()
    
    func playAudio(fileName: String, volume: Float, numberOfLoops: Int){
        if let audioURL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: audioURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
                audioPlayer?.volume = volume
            }catch {
                print("再生できません")
            }
        } else {
            print("オーディオファイルが見つかりません")
        }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        Text("伝統紋様")
                            .font(.system(size:80,design:.serif))
                            .bold() 
                        Text("Traditional Patterns")
                            .font(.system(size:30,design:.serif))
                            .bold()
                    }.offset(x: 0, y: -20)
                    
                    NavigationLink{
                        UrokoPatternView()
                    } label: {
                        VStack{
                            Text("Uroko")
                            .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("鱗")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: -80, y: 85)
                    
                    NavigationLink{
                        TripleGridPatternView(size: 30)
                    } label: {
                        VStack{
                            Text("Ichimatu")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("一松")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: -80, y: 65)
                    
                    NavigationLink{
                        HisimonView()
                    } label:{
                        VStack{
                            Text("Hishi mon")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("菱紋")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: -80, y: 45)
                    
                    NavigationLink{
                        AnimatedCirclesView()
                    } label:{
                        VStack{
                            Text("Shippo")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("七宝")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: -80, y: 25)
                }
                Spacer()
                VStack{
                    NavigationLink{
                        AsanohaView()
                    } label:{
                        VStack{
                            Text("Asanoha")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("麻の葉")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: 80, y: 151)
                    NavigationLink{
                        HexagonPatternView(sideLength:100)
                    } label:{
                        VStack{
                            Text("Koushi")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("格子")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: 80, y: 131)
                    NavigationLink{
                        TazunaView(sideLength:100)
                    } label:{
                        VStack{
                            Text("Tadzuna")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("手綱")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: 80, y: 111)
                    
                    NavigationLink{
                        KikkouPatternView()
                    } label:{
                        VStack{
                            Text("Kikko")
                                .font(.system(size:15,design:.serif))
                                .offset(x: 0, y: 75)
                            Text("亀甲")
                                .font(.system(size:30,design:.serif))
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                                .frame(width: 150, height: 70)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black,lineWidth: 3))
                        }
                    }.offset(x: 80, y: 91)
                }
                .padding()
            }
        }.accentColor(Color.black)
            .onAppear {
                playAudio(fileName: "tam-y04", volume: 0.1, numberOfLoops: -1)
            }
    }
}

