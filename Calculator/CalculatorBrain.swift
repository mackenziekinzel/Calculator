//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mackenzie Kinzel on 11/7/17.
//  Copyright © 2017 Mackenzie Kinzel. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "+": Operation.binaryOperation({ $0 + $1}),
        "=": Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .binaryOperation(let function):
                if accumulator != nil {
                pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
                }
            }
        }

private mutating func performPendingBinaryOperation() {
    if pbo != nil && accumulator != nil {
    accumulator = pbo!.perform(with: accumulator!)
    pbo = nil
    }
}

private var pbo: PendingBinaryOperation?

private struct PendingBinaryOperation {
    let function: (Double,Double) -> Double
    let firstOperand: Double
    
    func perform(with secondOperand: Double) -> Double {
        return function(firstOperand, secondOperand)
    }
}
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
