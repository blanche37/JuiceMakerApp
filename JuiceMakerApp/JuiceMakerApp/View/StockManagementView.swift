//
//  StockManagementView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI

struct StockManagementView: View {
    @ObservedObject var viewModel: FruitStore
    
    var body: some View {
        HStack {
            ForEach(Fruit.allCases) { fruit in
                VStack(spacing: 0) {
                    FruitView(fruit: fruit)
                    CountView(dict: $viewModel.fruitBag, fruit: fruit)
                }
            }
        }
    }
}

struct StockManagementView_Previews: PreviewProvider {
    static var previews: some View {
        StockManagementView(viewModel: FruitStore())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
