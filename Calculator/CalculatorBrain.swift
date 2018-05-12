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
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private enum Operation {
        case binaryOperation((Double,Double) -> Double)
        case unaryOperation((Double)-> Double)
        case constant(Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "x" : Operation.binaryOperation({ $0 * $1 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "√" : Operation.unaryOperation (sqrt),
        "cos" : Operation.unaryOperation (cos),
        "±" : Operation.unaryOperation({ -$0 }),
        "π" : Operation.constant (Double.pi),
        "e" : Operation.constant (M_E),
        "=" : Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            
            switch operation {
                
            case .constant(let associatedConstantValue):
                accumulator = associatedConstantValue
                
            case .unaryOperation (let function):
                if accumulator != nil {
                accumulator = function(accumulator!)
                }
                
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
                
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
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
