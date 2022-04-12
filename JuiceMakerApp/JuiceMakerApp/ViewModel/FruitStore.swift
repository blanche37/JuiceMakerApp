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
}
