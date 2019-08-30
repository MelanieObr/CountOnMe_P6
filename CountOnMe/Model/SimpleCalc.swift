//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Mélanie Obringer on 12/08/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation


class SimpleCalc {
    
    // MARK: - // Error check computed methods
    func expressionIsCorrect(_ elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    func expressionHaveEnoughElement(_ elements: [String]) -> Bool {
        return elements.count >= 3
    }
    func canAddPoint(_ elements: [String]) -> Bool {
        if let lastElement = elements.last { return Int(lastElement) != nil }
        return false
    }
    // Method called when tapped equal button
    func didTappedEqualButton(_ elements: [String]) -> String? {
        
        // MARK: - Property
        var operationsToReduce = elements
        
        // Make sur expression is correct and exporession have enough element
        guard expressionHaveEnoughElement(elements) && expressionIsCorrect(elements) else {
            return nil
        }
        while operationsToReduce.count > 1 {
            // Allow priority of calculation (multiply and divide)
            while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
                if let index = operationsToReduce.firstIndex(where: {$0 == "x" || $0 == "/"}), let left = Double(operationsToReduce[index - 1]), let right = Double(operationsToReduce[index + 1]) {
                    var result: Double
                    let operand = operationsToReduce[index]
                    // Read the operator to choose the right calculation
                    switch operand {
                    case "x": result = Double(left * right)
                    case "/":
                        if right == 0 {
                            return nil
                        }
                        result = Double(left / right)
                    default: return nil
                    }
                    operationsToReduce[index - 1] = String(removeDotZero(result: result))
                    operationsToReduce.remove(at: index + 1)
                    operationsToReduce.remove(at: index)
                }
                
            }
            
            // MARK: - Property
            if let index = operationsToReduce.firstIndex(where: {$0 == "+" || $0 == "-"}), let left = Float(operationsToReduce[index - 1]), let right = Float(operationsToReduce[index + 1]) {
                let operand = operationsToReduce[index]
                var result: Double
                
                // Read the operator to choose the right calculation
                switch operand {
                    
                case "+": result = Double(left + right)
                case "-": result = Double(left - right)
                default: return nil
                }
                // Reduce each operations
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(removeDotZero(result: result))", at: 0)
            }
        }
        return operationsToReduce.first
    }
    // remove dot and zero to display an integer
    private func removeDotZero(result: Double) -> String {
        let doubleAsString = NumberFormatter.localizedString(from: (NSNumber(value: result)), number: .decimal)
        return doubleAsString
    }
}

