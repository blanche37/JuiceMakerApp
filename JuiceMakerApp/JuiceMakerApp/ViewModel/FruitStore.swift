//
//  FruitStore.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI
import Combine

class FruitStore: ObservableObject {
    @Published var fruitStore = [Fruit: Int]()
    @Published var fruitBag = [Fruit: Int]()
    
    private var cancellables = [AnyCancellable]()
    
    init() {
        setValue()
    }
    
    private func setValue() {
        let publisher = Fruit.allCases.publisher
        
         publisher.sink(receiveValue: { [weak self] fruit in
            guard let self = self else {
                return
            }
            
            self.fruitStore.updateValue(10, forKey: fruit)
         }).store(in: &cancellables)
        
        publisher.sink(receiveValue: { [weak self] fruit in
            guard let self = self else {
                return
            }
            
            self.fruitBag.updateValue(0, forKey: fruit)
        }).store(in: &cancellables)
    }
    
    private func readStock(fruit: Fruit) -> Int? {
        guard let stock = fruitStore[fruit] else {
            return nil
        }
        
        return stock
    }
    
    private func searchStock(juice: Juice) -> [Fruit: Int] {
        var dict = [Fruit: Int]()
        
        for (fruit, count) in juice.recipe {
            guard let stock = self.readStock(fruit: fruit) else {
                dict.removeAll()
                break
            }
            
            if stock >= count {
                dict.updateValue(stock - count, forKey: fruit)
            } else {
                dict.removeAll()
                break
            }
        }
        
        return dict
    }
    
    func substractStock(juice: Juice) {
        let temp = searchStock(juice: juice)
        
        self.fruitStore.merge(temp) { _, new in
            return new
        }
    }
    
    func calculateStock(fruit: Fruit, stock: Int) {
        guard let currentStock = fruitStore[fruit] else {
            return
        }
        
        fruitStore.updateValue(currentStock + stock, forKey: fruit)
    }
    
    func addStock(fruit: Fruit) {
        guard let currentStock = fruitBag[fruit] else {
            return
        }
        
        fruitBag.updateValue(currentStock + 1, forKey: fruit)
    }
    
    func minusStock(fruit: Fruit) {
        guard let currentStock = fruitBag[fruit] else {
            return
        }
        
        fruitBag.updateValue(currentStock - 1, forKey: fruit)
    }
    
    func resetStock() {
        self.fruitBag.removeAll()
        
        let publisher = Fruit.allCases.publisher
        
        publisher.sink(receiveValue: { [weak self] fruit in
            guard let self = self else {
                return
            }
            
            self.fruitBag.updateValue(0, forKey: fruit)
        }).store(in: &cancellables)
    }
}
