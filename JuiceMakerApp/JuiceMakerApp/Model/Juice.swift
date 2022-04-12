//
//  Juice.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import Foundation

enum Juice: String, CaseIterable {
    case strawberry = "딸기쥬스"
    case strawberryBanana = "딸기바나나쥬스"
    case banana = "바나나쥬스"
    case pineapple = "파인애플쥬스"
    case mango = "망고쥬스"
    case kiwi = "키위쥬스"
    case mangoKiwi = "망고키위쥬스"
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var recipeDetail: String {
        switch self {
        case .strawberry:
            return "딸기쥬스: 🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓"
        case .banana:
            return "바나나쥬스: 🍌🍌"
        case .kiwi:
            return "키위쥬스: 🥝🥝🥝"
        case .pineapple:
            return "파인애플쥬스: 🍍🍍"
        case .strawberryBanana:
            return "딸바쥬스: 🍓🍓🍓🍓🍓🍓🍓🍓🍓🍓 + 🍌"
        case .mango:
            return "망고쥬스: 🥭🥭🥭"
        case .mangoKiwi:
            return "망고키위쥬스: 🥭🥭 + 🥝"
        }
    }
}

extension Juice: Identifiable {
    var id: RawValue { rawValue }
}
