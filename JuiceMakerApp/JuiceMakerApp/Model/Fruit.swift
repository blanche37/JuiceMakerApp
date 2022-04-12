//
//  Fruit.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry = "🍓"
    case banana = "🍌"
    case pineapple = "🍍"
    case kiwi = "🥝"
    case mango = "🥭"
}

extension Fruit: Identifiable {
    var id: RawValue { rawValue }
}
