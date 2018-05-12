//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mackenzie Kinzel on 11/7/17.
//  Copyright © 2017 Mackenzie Kinzel. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double {
    return -operand
}

func multiply(operand: Double,Double) -> Double {
    
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private var pbo: PendingBinaryOperation?
    
    private enum Operation {
        case binaryOperation((Double,Double) -> Double)
        case unaryOperation((Double)-> Double)
        case constant(Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "⨉" : Operation.binaryOperation(multiply),
        "√" : Operation.unaryOperation (sqrt),
        "cos" : Operation.unaryOperation (cos),
        "±" : Operation.unaryOperation(changeSign),
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
