//
//  trainingButton.swift
//  StateAndDataFlow
//
//  Created by Артём Харченко on 21.05.2022.
//

import SwiftUI

struct CustomButtonView: View {
    var action: () -> Void
    var fetchText: String = "LogOut"
    var color: Color = .red
    
    var body: some View {
        Button(action: action) {
            Text(fetchText)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
}

struct trainingButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(action: {}, fetchText: "Example", color: .red)
    }
}
