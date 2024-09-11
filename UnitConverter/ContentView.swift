//
//  ContentView.swift
//  UnitConverter
//
//  Created by Kamil Porębski on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    let lengthTypes = ["mm", "cm", "dm", "m"]
    let lengthConverterInput = [1, 10, 100, 1000]
    let lengthConverterOutput = [1, 0.1, 0.01, 0.001]
    
    @State private var inputValue = 0.0
    @State private var inputUnit = "cm"
    @State private var outputUnit = "mm"
    
    var basicValue: Double {
        inputValue * Double(lengthConverterInput[lengthTypes.firstIndex(of: inputUnit)!])
        
    }
    
    var outputValue: Double {
        basicValue * Double(lengthConverterOutput[lengthTypes.firstIndex(of: outputUnit)!])
    }
    
    @FocusState private var isFocusedField: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($isFocusedField)
                }
                Section("Choose Units") {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(lengthTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(lengthTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("Output Value") {
                    Text("\(outputValue.formatted())")
                }
            }
            .navigationTitle("Length converter")
            .toolbar {
                if isFocusedField {
                    Button("Done") {
                        isFocusedField = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
