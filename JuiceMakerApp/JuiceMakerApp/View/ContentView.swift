//
//  ContentView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FruitStore()
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(Fruit.allCases) { fruit in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 120, height: 180)
                        .foregroundColor(.pink)
                    VStack(spacing: 0) {
                        FruitView(fruit: fruit)
                        CountView(dict: $viewModel.fruitStore, fruit: fruit)
                    }
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
