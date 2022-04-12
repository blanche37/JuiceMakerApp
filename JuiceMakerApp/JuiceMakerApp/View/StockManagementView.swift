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
                FruitView(fruit: fruit)
                Spacer()
            }
        }
    }
}
