//
//  Power.swift
//  MVVMAndFreeformInput
//
//  Created by Neil Shah on 2025-02-20.
//

import Foundation

struct Power: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    var base: Double
    var exponent: Int
    
    // MARK: Computed properties
    var result: Double {
        
        var solution = 1.0
        
        // Check for zero exponent
        if exponent == 0 {
            return solution
            
        } else {
            
            for _ in 1...abs(exponent) {
                solution *= base
            }
            
            return solution
        }
    }
}
