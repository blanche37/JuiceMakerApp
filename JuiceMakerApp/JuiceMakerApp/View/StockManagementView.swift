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
                        .padding(.bottom, 10)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        HStack(spacing: 0) {
                            Button {
                                viewModel.addStock(fruit: fruit)
                            } label: {
                                Text("+")
                            }
                            .frame(width: 50, height: 30)
                            Button {
                                viewModel.minusStock(fruit: fruit)
                            } label: {
                                Text("-")
                            }
                            .frame(width: 50, height: 30)
                        }
                    }
                    .frame(width: 100, height: 30)
                }
            }
        }
        .onDisappear {
            for (fruit, count) in viewModel.fruitBag {
                viewModel.calculateStock(fruit: fruit, stock: count)
            }
            
            viewModel.resetStock()
        }
    }
}

struct StockManagementView_Previews: PreviewProvider {
    static var previews: some View {
        StockManagementView(viewModel: FruitStore(service: JuiceMakerService()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
