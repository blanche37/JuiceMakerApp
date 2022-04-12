//
//  OrderButtonView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI

struct OrderButtonView: View {
    @ObservedObject var viewModel: FruitStore
    let buttonName: String
    let juice: Juice
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 140, height: 40)
                .foregroundColor(.pink)
            Button {
                viewModel.substractStock(juice: juice)
            } label: {
                Text(buttonName)
                    .foregroundColor(.white)
            }
        }
    }
}
