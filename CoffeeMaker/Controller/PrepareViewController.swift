//
//  ViewController.swift
//  CoffeeMaker
//
//  Created by Fatma Zehra Fadıl on 25.08.2024.
//

import UIKit

class PrepareViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var coffeePickerView: UIPickerView!
    @IBOutlet weak var caramelBtn: UIButton!
    @IBOutlet weak var mochaBtn: UIButton!
    @IBOutlet weak var milkBtn: UIButton!
    @IBOutlet weak var smallSizeBtn: UIButton!
    @IBOutlet weak var mediumSizeBtn: UIButton!
    @IBOutlet weak var largeSizeBtn: UIButton!
    
    var coffeeModel : CoffeeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeePickerView.delegate = self
        coffeePickerView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        coffeeModel = CoffeeModel()
        milkBtn.setTitle(coffeeModel!.condimentTypes[0].name, for: .normal)
        mochaBtn.setTitle(coffeeModel!.condimentTypes[1].name, for: .normal)
        caramelBtn.setTitle(coffeeModel!.condimentTypes[2].name, for: .normal)
        
        milkBtn.isSelected = false
        mochaBtn.isSelected = false
        caramelBtn.isSelected = false
        smallSizeBtn.isSelected = true
        mediumSizeBtn.isSelected = false
        largeSizeBtn.isSelected = false
        
        coffeePickerView.selectRow(0, inComponent: 0, animated: true)
        
    }
  
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coffeeModel!.coffeeTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let coffee = coffeeModel!.coffeeTypes[row].name
        return coffee
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coffeeModel!.currentCoffeeType = coffeeModel!.coffeeTypes[row]
    }
    
    @IBAction func sizeButtonSelected(_ sender: UIButton) {
      
        smallSizeBtn.isSelected = false
        mediumSizeBtn.isSelected = false
        largeSizeBtn.isSelected = false
        
        sender.isSelected = true
        
        if sender.isSelected {
            coffeeModel!.currentCoffeeSize = sender.tag
        }
      
    }
    
    @IBAction func condimentSelected(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        if sender.isSelected {
            coffeeModel!.currentCondiments.append(coffeeModel!.condimentTypes[sender.tag])
        } else {
            if let index =  coffeeModel!.currentCondiments.firstIndex(where: { $0.name == coffeeModel!.condimentTypes[sender.tag].name }) {
                coffeeModel!.currentCondiments.remove(at: index)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let price = coffeeModel!.calculatePrice()
        print(price)
        let vc = segue.destination as! ResultViewController
        vc.currentCondiments = coffeeModel!.currentCondiments
        vc.currentCoffeeType = coffeeModel!.currentCoffeeType
        vc.currentCoffeeSize = coffeeModel!.currentCoffeeSize
        vc.totalPrice = price
    }
}

