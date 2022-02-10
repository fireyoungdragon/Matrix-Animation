//
//  MatrixView.swift
//  Matrix Animation
//
//  Created by Дмитрий Антонов on 10.02.2022.
//

import SwiftUI

struct MatrixView: View {
    
    @State var startAnim: Bool = false
    var body: some View {
        
        GeometryReader {proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
                ForEach(1...Int(size.width / 25), id: \.self) { _ in
                    MatrixRainEffect(size: size)
                    
                }
            }
            .padding(.horizontal)
        }

    }
    
struct MatrixRainEffect: View {
        var size: CGSize
        
        @State var startAnim: Bool = false
        
        @State var random: Int = 0
        
        var body: some View {
            
            let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
            
            VStack {
                

                
                ForEach(0..<constantChar.count,id: \.self){index in
                    
                    let char = Array(constantChar)[getRandomIndex(index: index )]
                    
                    Text(String(char))
                        .font(.custom("matrixcodenfi", size: 25))
                        .foregroundColor(Color("Green"))
                }
            }
            .mask(alignment: .top){
                Rectangle()
                    .fill(
                        
                        LinearGradient(colors: [
                            
                            .clear,
                            .black.opacity(0.1),
                            .black.opacity(0.2),
                            .black.opacity(0.3),
                            .black.opacity(0.4),
                            .black.opacity(0.5),
                            .black
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: size.height / 2)
                    .offset(y: startAnim ? size.height: -randomHeight)
            }
            .onAppear {
                withAnimation(.linear(duration: 10).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                    startAnim = true
                }
            }
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
              
                random = Int.random(in: 0..<constantChar.count)
        }
    }
    func getRandomIndex(index: Int) -> Int {
        let max = constantChar.count - 1
        
        if (index + random) > max {
            if (index - random) < 0 {
                return index
            }
            return (index - random)
        } else {
            return (index + random)
        }
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
//MARK: - random chars
let constantChar = "abcdefghijklmnopqrstuvwxyzfskjvbslv711fvjskv90"

