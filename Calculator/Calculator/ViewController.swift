//
//  ViewController.swift
//  Calculator
//
//  Created by Pietro Rischi Nunes on 03/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumberInput: UITextField!
    @IBOutlet weak var secondNumberInput: UITextField!
    @IBOutlet weak var resultInput: UILabel!
    
    private func setupConfigs() {
        resultInput.text = ""
        firstNumberInput.keyboardType = .decimalPad
        secondNumberInput.keyboardType = .decimalPad
    }
    
    private func convertInputToNumber(input: String) -> Double? {
        Double(input.replacingOccurrences(of: ",", with: "."))
    }
    
    private func renderError() {
        resultInput.text = "Digite um valor válido."
    }
    
    private func renderResult(type: String, result: Double) {
        resultInput.text = "O resultado da \(type) é \(String(format: "%.2f", result))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigs()
    }
    
    @IBAction func sum(_ sender: Any) {
        guard let firstNumber = convertInputToNumber(input: firstNumberInput.text ?? ""),
              let secondNumber = convertInputToNumber(input: secondNumberInput.text ?? "") else {
            renderError()
            return
        }
        
        renderResult(type: "soma", result: firstNumber + secondNumber)
    }
    
    @IBAction func sub(_ sender: Any) {
        guard let firstNumber = convertInputToNumber(input: firstNumberInput.text ?? ""),
              let secondNumber = convertInputToNumber(input: secondNumberInput.text ?? "") else {
            renderError()
            return
        }
        
        renderResult(type: "subtração", result: firstNumber - secondNumber)
    }
    
    @IBAction func mult(_ sender: Any) {
        guard let firstNumber = convertInputToNumber(input: firstNumberInput.text ?? ""),
              let secondNumber = convertInputToNumber(input: secondNumberInput.text ?? "") else {
            renderError()
            return
        }
        
        renderResult(type: "multiplicação", result: firstNumber * secondNumber)
    }
    
    @IBAction func div(_ sender: Any) {
        guard let firstNumber = convertInputToNumber(input: firstNumberInput.text ?? ""),
              let secondNumber = convertInputToNumber(input: secondNumberInput.text ?? "") else {
            renderError()
            return
        }
        
        renderResult(type: "divisão", result: firstNumber / secondNumber)
    }
}
