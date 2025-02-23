//
//  PowerView.swift
//  MVVMAndFreeformInput
//
//  Created by Neil Shah on 2025-02-20.
//

import SwiftUI

struct PowerView: View {
    
    // MARK: Stored properties
    @State var viewModel = PowerViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            Spacer()
            
            // OUTPUT
            // When the power can be unwrapped, show the result
            if let power = viewModel.power {
                
                // Show the provided base, exponent, and result
                HStack(alignment: .center) {
                    HStack(alignment: .top) {
                        
                        // Display brackets for negative bases
                        if power.base < 0 {
                            Text("(\(power.base.formatted()))")
                                .font(.system(size: 96))
                        } else {
                            Text("\(power.base.formatted())")
                                .font(.system(size: 96))
                        }
                        
                        Text("\(power.exponent)")
                            .font(.system(size: 44))
                    }
                    
                    HStack {
                        
                        Text("=")
                            .font(.system(size: 96))
                        
                        // View for negative exponents
                        if power.exponent < 0 {
                            VStack (spacing: 0) {
                                Text("1")
                                    .font(.system(size: 96))
                                
                                Rectangle()
                                    .frame(height: 3)
                                
                                Text("\(power.result.formatted())")
                                    .font(.system(size: 96))
                            }
                            
                        } else {
                            
                            // View for positive or zero exponents
                            Text("\(power.result.formatted())")
                                .font(.system(size: 96))
                        }
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .frame(height: 300)
                
            } else {
                
                // Show a message indicating that we are
                // awaiting reasonable input
                ContentUnavailableView(
                    "Unable to evaluate power",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 300)
            }
            
            // INPUT
            TextField("Base", text: $viewModel.providedBase)
                .textFieldStyle(.roundedBorder)
            
            TextField("Exponent", text: $viewModel.providedExponent)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PowerView()
}
