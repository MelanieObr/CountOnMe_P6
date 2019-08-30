//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Properties
    var model = SimpleCalc()
    var alertMessage = AlertMessage()
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionHaveResultOrZero: Bool {
        return textView.text.firstIndex(of: "=") != nil || textView.text == "0"
    }
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let numberText = sender.title(for: .normal) {
            if expressionHaveResultOrZero {
                textView.text = ""
            }
            textView.text.append(numberText)
        }
    }
    
    @IBAction func tappedPointButton(_ sender: UIButton) {
        if model.canAddPoint(elements) {
            textView.text.append(".")
        } else {
            alertMessage.alertExpressionCorrect(controller: self)
        }
    }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if model.expressionIsCorrect(elements) {
            textView.text.append(" + ")
        } else {
            alertMessage.alertCanAddOperator(controller: self)
            removeCalcul()
        }
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if model.expressionIsCorrect(elements) {
            textView.text.append(" - ")
        } else {
            alertMessage.alertCanAddOperator(controller: self)
            removeCalcul()
        }
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if model.expressionIsCorrect(elements) {
            textView.text.append(" x ")
        } else {
            alertMessage.alertCanAddOperator(controller: self)
            removeCalcul()
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if model.expressionIsCorrect(elements) {
            textView.text.append(" / ")
        } else {
            alertMessage.alertCanAddOperator(controller: self)
            removeCalcul()
        }
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        removeCalcul()
    }
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard model.expressionIsCorrect(elements) else {
            return alertMessage.alertExpressionCorrect(controller: self)
        }
        guard model.expressionHaveEnoughElement(elements) else {
            return alertMessage.alertExpressionCorrect(controller: self)
        }
        if let result = model.didTappedEqualButton(elements) {
         textView.text.append(" = \(result)")
        }
    }
    func removeCalcul() {
        textView.text.removeAll()
        textView.text.append("0")
    }
}



