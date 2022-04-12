//
//  RecipeView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/13.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Juice.allCases) { juice in
                Text(juice.recipeDetail)
            }
            .padding()
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
