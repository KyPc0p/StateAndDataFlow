//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    @ObservedObject var tFManager = TextFieldManager()
    
    @State var name = ""
    @State var isDisabled = true
    @State private var counterColor: Color = .red
    
    @FocusState private var isActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    isActive = true
                }
            
        HStack(alignment: .firstTextBaseline) {
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

