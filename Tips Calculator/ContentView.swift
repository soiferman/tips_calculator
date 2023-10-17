//
//  ContentView.swift
//  Tips Calculator
//
//  Created by Max Soiferman on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredAmount = ""
    @State private var tipAmount = 0.0
    @State private var totalAmount = 0.0
    @State private var tipSlider = 15.0
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Enter Bill Amount")
                    .foregroundStyle(.secondary)
                
                TextField("0.00", text: $enteredAmount)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }
            
            Text("Tip \(tipSlider, specifier: "%.0f")%")
            
            Slider(value: $tipSlider, in: 0...100, step: 1)
                .onChange(of: tipSlider) { _, _ in
                    guard let amount = Double(enteredAmount) else {
                        print("Invalid Entry")
                        return
                    }
                    
                    guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else {
                        print("Bill amount or tip cannot be negative")
                        return
                    }
                    
                    tipAmount = 1.0
                    totalAmount = amount + tipAmount
                }

            VStack {
                Text(tipAmount, format: .currency(code: "USD"))
                    .font(.title.bold())
                
                Text("Tip")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)
            
            VStack {
                Text(totalAmount, format: .currency(code: "USD"))
                    .font(.title.bold())
                
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(.top, 20)
        }
        .padding(40)
        
    }
}

#Preview {
    ContentView()
}

struct Calculation {
    
    func calculateTip(of enteredAmount: Double, with tip: Double) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 else { return nil }
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
    }
    
}
