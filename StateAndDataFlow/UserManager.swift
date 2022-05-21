//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}

final class TextFieldManager: ObservableObject {
    let objectWillChange = PassthroughSubject<TextFieldManager, Never>()
    
    var userInput = "" {
        willSet {
            self.userInput = String(newValue.prefix(characterLimit))
            objectWillChange.send(self)
            print(userInput.count)
        }
    }
    
    let characterLimit = 5
}
