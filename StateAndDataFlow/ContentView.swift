//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var user: UserManager
    
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(80)
            
            CustomButtonView(action: timer.startTimer, fetchText: timer.buttonTitle)
            
            Spacer()
            
            CustomButtonView(action: logOutUser, color: .blue)
        }
        .padding(.bottom, 20)
    }
    
    private func logOutUser() {
        user.name = ""
        user.isRegistered.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


