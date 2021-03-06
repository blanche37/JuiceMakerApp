//
//  ContentView.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: FruitStore
    
    init(service: Service) {
        _viewModel = StateObject(wrappedValue: FruitStore(service: service))
    }
    @State var isPresent = false
    private var juice: [[Juice]] = [[.strawberry, .strawberryBanana, .mangoKiwi], [.banana, .pineapple, .mango, .kiwi]]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    ForEach(Fruit.allCases) { fruit in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 120, height: 180)
                                .foregroundColor(.pink)
                            VStack(spacing: 0) {
                                FruitView(fruit: fruit)
                                CountView(dict: $viewModel.fruitStore, fruit: fruit)
                            }
                            .padding()
                        }
                    }
                }
                
                HStack {
                    VStack {
                        ForEach(juice, id: \.self) { juices in
                            HStack(spacing: 50) {
                                ForEach(juices) { juice in
                                    OrderButtonView(viewModel: viewModel, buttonName: "\(juice.rawValue) 주문", juice: juice)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("재고 수정") {
                        StockManagementView(viewModel: viewModel)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresent.toggle()
                    } label: {
                        Text("Recipe")
                    }

                }
            }
            .navigationTitle("맛있는 쥬스를 만들어 드려요!")
        }
        .sheet(isPresented: $isPresent, content: {
            RecipeView()
        })
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(service: JuiceMakerService())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
