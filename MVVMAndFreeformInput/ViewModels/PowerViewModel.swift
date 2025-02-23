//
//  PowerViewModel.swift
//  MVVMAndFreeformInput
//
//  Created by Neil Shah on 2025-02-20.
//

import Foundation

@Observable
class PowerViewModel {
    
    // MARK: Stored properties
    var providedBase: String
    var providedExponent: String
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    var power: Power? {
        
        // First check that the string in providedBase can
        // be converted into a number, then check that the
        // value is more than 0
        guard let base = Double(providedBase) else {
            recoverySuggestion = "Please provide a numerical value for the base of the power."
            
            return nil
        }
        
        // Now check that the string in providedExponent can be
        // converted into an integer, and that the value is
        // more than or equal to 0
        guard let exponent = Int(providedExponent), exponent >= 0 else {
            recoverySuggestion = "Please provide an integer value of 0 or greater for the exponent."
            
            return nil
        }
        
        // Now that we know the base and exponent have valid values, return the evaluated power
        recoverySuggestion = "" // No error message
        return Power(base: base, exponent: exponent)
    }

    // MARK: Initializer(s)
    init(
        providedBase: String = "",
        providedExponent: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedBase = providedBase
        self.providedExponent = providedExponent
        self.recoverySuggestion = recoverySuggestion
    }
}
