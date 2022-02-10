//
//  ContentView.swift
//  Matrix Animation
//
//  Created by Дмитрий Антонов on 10.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.black
            
            MatrixView()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
