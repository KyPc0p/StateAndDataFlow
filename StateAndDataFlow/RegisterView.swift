//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @EnvironmentObject private var textFieldManager: TextFieldManager
    
    @State private var name = ""
    @State private var counterColor: Color = .red
    @State private var isDisabled: Bool = true
    
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 1) {
            VStack {
                TextField("Enter your name...", text: $textFieldManager.userInput)
                    .multilineTextAlignment(.center)
                    .onChange(of: textFieldManager.userInput) { newValue in
                        if textFieldManager.userInput.count >= 3 {
                            counterColor = .green
                            isDisabled = false
                        } else {
                            counterColor = .red
                            isDisabled = true
                        }
                    }
                
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }.disabled(isDisabled)
            }
            Text(String(name.count))
                .foregroundColor(counterColor)
                .padding(.leading, -40)
        }
    }
    
    
    private func registerUser() {
        if !name.isEmpty {
            userManger.name = name
            userManger.isRegistered.toggle()
        }
    }
    
    func textLimit(_ upper: Int) {
        if name.count > upper {
            name = String(name.prefix(upper))
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
