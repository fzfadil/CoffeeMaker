//
//  ResultViewController.swift
//  CoffeeMaker
//
//  Created by Fatma Zehra Fadıl on 27.08.2024.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var readyInfoLabel: UILabel!
    var currentCoffeeType : Coffee?
    var currentCoffeeSize : Int?
    var currentCondiments : [Condiment]?
    var totalPrice : Double?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var size = ""
        switch currentCoffeeSize {
            case 1:
                size = "Küçük boy"
            case 2:
                size = "Orta boy"
            case 3:
                size = "Büyük boy"
            case .none:
                return
            case .some(_):
                return
        }
        
        if currentCondiments != nil {
            
            var condimentNames = ""
            for condiment in currentCondiments! {
                let condimentClass = condiment as Condiment
                condimentNames += " " + condimentClass.name!
            }
            let price = String(format: "%.0f", totalPrice!)
            readyInfoLabel.text = size + condimentNames + " " + (currentCoffeeType?.name ?? "") + " kahveniz hazırlanıyor. Ücretiniz " + price + " liradır."
        }
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    

}
