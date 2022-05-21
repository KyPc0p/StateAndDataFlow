//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @State var name = ""
    @State var isDisabled = true
    @State private var counterColor: Color = .red
    
    @FocusState private var isActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .onTapGesture {
                    isActive = false
                }
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    TextField("Enter your name...", text: $name)
                        .padding([.trailing, .leading], 80)
                        .focused($isActive)
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
                    
                    Text(String(name.count))
                        .foregroundColor(counterColor)
                        .padding(.leading, -40)
                }
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(isDisabled)
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

