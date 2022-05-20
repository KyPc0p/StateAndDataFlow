//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @State private var name = ""
    @State private var counterColor: Color = .red
    @State private var isDisabled: Bool = true
    
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 1) {
            VStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        if name.count >= 3 {
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
