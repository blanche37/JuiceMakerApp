//
//  FruitStore.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI
import Combine

class FruitStore: ObservableObject {
    var fruitStore = [Fruit: Int]()
    
    private var cancellable: AnyCancellable? = nil
    
    init() {
        setValue()
    }
    
    private func setValue() {
        let publisher = Fruit.allCases.publisher
        
        self.cancellable = publisher.sink(receiveValue: { [weak self] fruit in
            guard let self = self else {
                return
            }
            
            self.fruitStore.updateValue(10, forKey: fruit)
        })
    }
    
    func substractStock(juice: Juice, dict: inout [Fruit: Int]) {
        var temp = [Fruit: Int]()
        
        for (fruit, count) in juice.recipe {
            guard let stock = self.readStock(dict: dict, fruit: fruit) else {
                temp.removeAll()
                break
            }
            
            if stock >= count {
                temp.updateValue(stock - count, forKey: fruit)
            } else {
                temp.removeAll()
                break
            }
        }
        
        self.dict.merge(temp) { _, new in
            return new
        }
    }
    
    private func readStock(dict: [Fruit: Int], fruit: Fruit) -> Int? {
        guard let stock = dict[fruit] else {
            return nil
        }
        
        return stock
    }
}
