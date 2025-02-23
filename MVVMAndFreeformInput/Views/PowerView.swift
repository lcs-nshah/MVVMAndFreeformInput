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
                        
                        Text("(\(power.base.formatted()))")
                            .font(.system(size: 96))
                        
                        Text("\(power.exponent)")
                            .font(.system(size: 44))
                    }
                    
                    HStack {
                        
                        Text("=")
                            .font(.system(size: 96))
                        
                        Text("\(power.result.formatted())")
                            .font(.system(size: 96))
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
