//
//  Coffee.swift
//  CoffeeMaker
//
//  Created by Fatma Zehra Fadıl on 27.08.2024.
//

import Foundation

protocol CoffeeSpecials {
    
    func getPrice() -> Double
}

class Coffee : CoffeeSpecials {
    
    var price : Double = 0.0
    var name : String?
    
    func whichSize(size: Int) {
        switch size {
        case 1:
            return
        case 2:
            self.price = price * 2
        case 3:
            self.price = price * 3
        default:
            return
        }
    }
    
    func getPrice() -> Double {
        return self.price
    }
}

class HouseBlend : Coffee {
    
    override init() {
        super.init()
        self.price = 10.0
        self.name = "HouseBlend"
    }
}

class DarkRoast : Coffee {
    
    override init() {
        super.init()
        self.price = 20.0
        self.name = "DarkRoast"
    }
}

class Esspresso : Coffee {
  
    override init() {
        super.init()
        self.price = 30.0
        self.name = "Esspresso"
    }
}

