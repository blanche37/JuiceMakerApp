//
//  JuiceMakerService.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/13.
//

import Foundation

protocol Service {
    func substractStock(juice: Juice, fruitStore: [Fruit: Int], completion: @escaping ([Fruit: Int]) -> ())
    func calculateStock(fruit: Fruit, stock: Int, fruitStore: [Fruit: Int], completion: @escaping (Int) -> ())
    func addStock(fruit: Fruit, fruitBag: [Fruit: Int], completion: @escaping (Int) -> ())
    func minusStock(fruit: Fruit, fruitBag: [Fruit: Int], completion: @escaping (Int) -> ())
}

class JuiceMakerService: Service {
    private func readStock(fruit: Fruit, fruitStore: [Fruit: Int]) -> Int? {
        guard let stock = fruitStore[fruit] else {
            return nil
        }
        
        return stock
    }
    
    private func searchStock(juice: Juice, fruitStore: [Fruit: Int]) -> [Fruit: Int] {
        var dict = [Fruit: Int]()
        
        for (fruit, count) in juice.recipe {
            guard let stock = self.readStock(fruit: fruit, fruitStore: fruitStore) else {
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
    
    func substractStock(juice: Juice, fruitStore: [Fruit: Int], completion: @escaping ([Fruit: Int]) -> ()) {
        let temp = searchStock(juice: juice, fruitStore: fruitStore)
        
        completion(temp)
    }
    
    func calculateStock(fruit: Fruit, stock: Int, fruitStore: [Fruit: Int], completion: @escaping (Int) -> ()) {
        guard let currentStock = fruitStore[fruit] else {
            return
        }
        
        completion(currentStock)
    }
    
    func addStock(fruit: Fruit, fruitBag: [Fruit: Int], completion: @escaping (Int) -> ()) {
        guard let currentStock = fruitBag[fruit] else {
            return
        }
        
        completion(currentStock)
    }
    
    func minusStock(fruit: Fruit, fruitBag: [Fruit: Int], completion: @escaping (Int) -> ()) {
        guard let currentStock = fruitBag[fruit],
              currentStock > 0 else {
            return
        }
        completion(currentStock)
    }
}
