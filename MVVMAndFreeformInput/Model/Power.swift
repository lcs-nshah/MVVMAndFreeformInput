//
//  Power.swift
//  MVVMAndFreeformInput
//
//  Created by Neil Shah on 2025-02-20.
//

import Foundation

struct Power {
    
    // MARK: Stored properties
    var base: Double
    var exponent: Int
    
    // MARK: Computed properties
    var result: Double {
        
        var solution = 1.0
        
        if exponent == 0 {
            return solution
            
        } else {
            for _ in 1...exponent {
                solution *= base
            }
            
            return solution
        }
    }
}
