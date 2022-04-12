//
//  ContentView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FruitStore()
    private var juice: [[Juice]] = [[.strawberry, .strawberryBanana, .mangoKiwi], [.banana, .pineapple, .mango, .kiwi]]
    
    var body: some View {
        NavigationView {
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
                        .padding()
                    }
                }
            }
            .navigationTitle("맛있는 쥬스를 만들어 드려요!")
        }
        .navigationViewStyle(.stack)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
