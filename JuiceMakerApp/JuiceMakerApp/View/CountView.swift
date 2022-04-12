//
//  CountView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI

struct CountView: View {
    @Binding var dict: [Fruit: Int]
    let fruit: Fruit
    
    var body: some View {
        ZStack {
            Color.gray
            Text("\(dict[fruit]!)")
        }
        .frame(width: 100, height: 30)
        .cornerRadius(10)
    }
}
