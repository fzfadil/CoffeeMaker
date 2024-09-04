//
//  CoffeeModel.swift
//  CoffeeMaker
//
//  Created by Fatma Zehra Fadıl on 25.08.2024.
//

import Foundation

struct CoffeeModel {
  
    let coffee = Coffee()
    let coffeeTypes = [HouseBlend(), Esspresso(), DarkRoast()]
    let condimentTypes = [Milk(coffee: Coffee()), Caramel(coffee: Coffee()), Mocha(coffee: Coffee())]
    
    var currentCoffeeType : Coffee = HouseBlend()
    var currentCoffeeSize : Int = 1
    var currentCondiments : [Condiment] = []
    
    func calculatePrice() -> Double {
        
        var currentPrice = 0.0
        
        let currentCoffeeType = currentCoffeeType
        currentCoffeeType.whichSize(size: currentCoffeeSize)
       
        if currentCondiments.isEmpty == false {
            
            var returnCondiment : CoffeeSpecials  = currentCoffeeType
            
            for condiment in currentCondiments {
                
                if condiment is Milk {
                    returnCondiment = Milk(coffee: returnCondiment)
                } else if condiment is Mocha {
                    returnCondiment = Mocha(coffee: returnCondiment)
                } else if condiment is Caramel {
                    returnCondiment = Caramel(coffee: returnCondiment)
                }
            }
            currentPrice = returnCondiment.getPrice()
        } else {
            currentPrice = currentCoffeeType.getPrice()
        }
    
        return currentPrice
    }
   
}
