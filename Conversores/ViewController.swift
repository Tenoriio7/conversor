//
//  ViewController.swift
//  Conversores
//
//  Created by Vinicius Tenorio on 12/10/17.
//  Copyright © 2017 Vinicius Tenorio. All rights reserved.
//

import UIKit
// protocol é tipo  interface java
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfValue.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text!{
            case "Temperatura":
            lbUnit.text="Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
            lbUnit.text="Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
            case "Moeda":
            lbUnit.text="Distancia"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilometro", for: .normal)
            default:
            lbUnit.text="Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
        
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            }
            else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text!{
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        
        
    }
    
    func calcTemperature(){
        // guar let mantem variavel diferente do if let
        guard let temperature = Double (tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResultUnit.text = "Farenheint"
            labelResult.text = String(temperature * 1.8 + 32.0)
        } else {
            labelResultUnit.text = "Celsius"
            labelResult.text = String ((temperature - 32.0)/1.8)
        }
    }
    func calcWeight(){
        
        guard let weight = Double (tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResultUnit.text = "Libra"
            labelResult.text = String(weight  / 2.2046)
        } else {
            labelResultUnit.text = "Kilograma"
            labelResult.text = String (weight * 2.2046)
        }

    
    }
    func calcCurrency(){
        
        guard let currency = Double (tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResultUnit.text = "Dolar"
            labelResult.text = String(currency / 3.5)
        } else {
            labelResultUnit.text = "Real"
            labelResult.text = String (currency * 3.5)
        }
        
        
        
    }
    func calcDistance(){
        
        guard let distance = Double (tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResultUnit.text = "Kilometro"
            labelResult.text = String(distance  / 1000)
        } else {
            labelResultUnit.text = "Metros"
            labelResult.text = String (distance * 1000)
        }
        
    }


}

