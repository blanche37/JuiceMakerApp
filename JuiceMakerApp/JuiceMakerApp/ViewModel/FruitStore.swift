//
//  FruitStore.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/12.
//

import SwiftUI
import Combine

protocol ViewModel {
    func substractStock(juice: Juice)
    func calculateStock(fruit: Fruit, stock: Int)
    func addStock(fruit: Fruit)
    func minusStock(fruit: Fruit)
    func resetStock()
}

class FruitStore: ObservableObject, ViewModel {
    @Published var fruitStore = [Fruit: Int]()
    @Published var fruitBag = [Fruit: Int]()
    @Published var recipe = [Juice: String]()
    
    private var cancellables = [AnyCancellable]()
    private var service: Service = JuiceMakerService()
    
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
    
    func substractStock(juice: Juice) {
        service.substractStock(juice: juice, fruitStore: fruitStore) { temp in
            self.fruitStore.merge(temp) { _, new in
                return new
            }
        }
    }
    
    func calculateStock(fruit: Fruit, stock: Int) {
        service.calculateStock(fruit: fruit, stock: stock, fruitStore: fruitStore) { [weak self] currentStock in
            guard let self = self else {
                return
            }
            
            self.fruitStore.updateValue(currentStock + stock, forKey: fruit)
        }
    }
    
    func addStock(fruit: Fruit) {
        service.addStock(fruit: fruit, fruitBag: fruitBag) { [weak self] currentStock in
            guard let self = self else {
                return
            }
            
            self.fruitBag.updateValue(currentStock + 1, forKey: fruit)
        }
    }
    
    func minusStock(fruit: Fruit) {
        service.minusStock(fruit: fruit, fruitBag: fruitBag) { [weak self] currentStock in
            guard let self = self else {
                return
            }
            
            self.fruitBag.updateValue(currentStock - 1, forKey: fruit)
        }
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
