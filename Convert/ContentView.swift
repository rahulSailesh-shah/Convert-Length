//
//  ContentView.swift
//  Convert
//
//  Created by Rahul Shah on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputString: String = ""
    @State private var inputUnit: String = "Kilometers"
    @State private var outputUnit: String = "Meters"
    @FocusState private var inputField: Bool
    
    var result: Double {
        guard let input = Double(inputString) else { return 0 }
        if inputUnit == outputUnit {
            return input
        } else if inputUnit == "Kilometers" && outputUnit == "Meters" {
            return input * 1000
        } else {
            return input / 1000
        }
    }
    
    let units: [String] = ["Kilometers", "Meters"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("from") {
                    TextField("Enter your value", text: $inputString).keyboardType(.decimalPad)
                        .focused($inputField)
                    Picker("Select Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("To") {
                    Picker("Select Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text(String(format: "%.3f", result) + " \(outputUnit)")
                }
                
            }.navigationTitle("Convert")
                .toolbar {
                    if inputField {
                        Button("Done") {
                            inputField = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
