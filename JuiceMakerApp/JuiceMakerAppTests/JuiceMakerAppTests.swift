//
//  JuiceMakerAppTests.swift
//  JuiceMakerAppTests
//
//  Created by yun on 2022/04/13.
//

import XCTest
@testable import JuiceMakerApp

class JuiceMakerAppTests: XCTestCase {
    private var sut: FruitStoreMock = FruitStoreMock()
    
    override func setUp() {
        sut.setValue()
    }
    
    func test_InitialKeyAndValueAreExist() {
        // given
        let fruitStore = sut.fruitStore
        let fruitBag = sut.fruitBag
        
        // when
        
        // then
        XCTAssertNotEqual(fruitStore.isEmpty, true)
        XCTAssertNotEqual(fruitBag.isEmpty, true)
    }
    
    func test_CanMakeJuiceSuccessfully() {
        // given
        for fruit in Fruit.allCases {
            sut.fruitStore.updateValue(100, forKey: fruit)
        }
        
        // Case 1: strawberryJuice 🍓 * 16 -----------------
        // when
        sut.substractStock(juice: .strawberry)
        
        // then
        XCTAssertEqual(sut.fruitStore[.strawberry]!, 84)
        // -------------------------------------------------
        
        sleep(1)
        
        // Case 2: bananaJuice 🍌 * 2 ----------------------
        // when
        sut.substractStock(juice: .banana)
        
        // then
        XCTAssertEqual(sut.fruitStore[.banana]!, 98)
        
        sleep(1)
        
        // Case 3: strawberryBananaJuice 🍓 * 10 + 🍌 * 1 --
        // when
        sut.substractStock(juice: .strawberryBanana)
        
        // then
        XCTAssertEqual(sut.fruitStore[.strawberry]!, 74)
        XCTAssertEqual(sut.fruitStore[.banana]!, 97)
        
        sleep(1)
        
        // Case 4: pineappleJuice 🍍 * 2 -------------------
        // when
        sut.substractStock(juice: .pineapple)
        
        // then
        XCTAssertEqual(sut.fruitStore[.pineapple]!, 98)
        
        sleep(1)
        
        // Case 5: kiwiJuice 🥝 * 3 ------------------------
        // when
        sut.substractStock(juice: .kiwi)
        
        // then
        XCTAssertEqual(sut.fruitStore[.kiwi]!, 97)
        
        sleep(1)
        
        // Case 6: mangoJuice 🥭 * 3 -----------------------
        // when
        sut.substractStock(juice: .mango)
        
        // then
        XCTAssertEqual(sut.fruitStore[.mango]!, 97)
        
        sleep(1)
        
        // Case 3: mangoKiwiJuice 🥭 * 2 + 🥝 * 1 ---------------------
        // when
        sut.substractStock(juice: .mangoKiwi)
        
        // then
        XCTAssertEqual(sut.fruitStore[.mango]!, 95)
        XCTAssertEqual(sut.fruitStore[.kiwi]!, 96)
        
        sleep(1)
    }
    
    func test_WhenStockManagementViewisDismissed_FruitBagsStockisAddedSuccessfully() {
        // given
        let stock = 3
        
        // when
        sut.calculateStock(fruit: .strawberry, stock: stock)
        
        // then
        XCTAssertEqual(sut.fruitStore[.strawberry]!, 13)
    }
    
    func test_FruitCanPutInTheBag() {
        // given
        
        // when
        sut.addStock(fruit: .banana)
        
        // then
        XCTAssertEqual(sut.fruitBag[.banana]!, 1)
    }
    
    func test_FruitCanTakeOutOfTheBag() {
        // given
        sut.fruitBag.updateValue(10, forKey: .kiwi)
        
        // when
        sut.minusStock(fruit: .kiwi)
        sut.minusStock(fruit: .mango)
        
        // then
        XCTAssertEqual(sut.fruitBag[.kiwi]!, 9)
        XCTAssertEqual(sut.fruitBag[.mango]!, 0)
    }
    
    func test_BagIsEmpty() {
        // given
        for fruit in Fruit.allCases {
            sut.fruitBag.updateValue(13, forKey: fruit)
        }
        
        // when
        sut.resetStock()
        
        // then
        for fruit in Fruit.allCases {
            XCTAssertEqual(sut.fruitBag[fruit]!, 0)
        }
    }
    
}
