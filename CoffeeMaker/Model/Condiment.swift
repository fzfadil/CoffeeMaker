//
//  CondimentModel.swift
//  CoffeeMaker
//
//  Created by Fatma Zehra Fadıl on 26.08.2024.
//

import Foundation

class Condiment: CoffeeSpecials {
    
    var coffeeType : CoffeeSpecials
    var price : Double = 0.0
    var name : String?
    
    init(coffee : CoffeeSpecials) {
        coffeeType = coffee
    }
    
    func getPrice() -> Double {
        return price + (coffeeType.getPrice())
    }
}

class Milk: Condiment {
    
    override init(coffee : CoffeeSpecials) {
        super.init(coffee: coffee)
        self.price = 11
        self.name = "Sütlü"
    }
}

class Mocha: Condiment {
    override init(coffee : CoffeeSpecials) {
        super.init(coffee: coffee)
        self.price = 12
        self.name = "Mocha"
    }
}

class Caramel: Condiment {
    override init(coffee : CoffeeSpecials) {
        super.init(coffee: coffee)
        self.price = 13
        self.name = "Karamel"
    }
   
}


