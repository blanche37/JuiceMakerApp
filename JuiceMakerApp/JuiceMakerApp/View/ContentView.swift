//
//  ContentView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(Fruit.allCases) { fruit in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 120, height: 180)
                        .foregroundColor(.pink)
                    FruitView(fruit: fruit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
