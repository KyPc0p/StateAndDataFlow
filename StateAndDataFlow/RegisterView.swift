//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI
import Combine

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    @ObservedObject var tFManager = TextFieldManager()
    
    @State private var name = ""
    @State private var counterColor: Color = .red
    @State private var isDisabled: Bool = true
    
    @FocusState private var isActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    isActive = false
                }
        HStack(alignment: .firstTextBaseline, spacing: 1) {
            VStack {
                TextField("Enter your name...", text: $tFManager.text)
                    .multilineTextAlignment(.center)
                    .onChange(of: tFManager.text) { newValue in
                        if tFManager.text.count >= 3 {
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
            Text(String(tFManager.text.count))
                .foregroundColor(counterColor)
                .padding(.leading, -40)
        }
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

