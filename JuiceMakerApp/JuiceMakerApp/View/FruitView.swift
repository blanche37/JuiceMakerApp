//
//  FruitView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI

struct FruitView: View {
    let fruit: Fruit
    
    var body: some View {
        Text(fruit.rawValue)
            .font(.system(size: 100))
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        ForEach(Fruit.allCases) { fruit in
            FruitView(fruit: fruit)
                .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
        }
    }
}
