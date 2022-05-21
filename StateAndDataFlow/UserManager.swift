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
    
    @Published var text = "" {
        didSet{
            if text.count > 5 && oldValue.count <= 5 {
                text = oldValue
            }
        }
    }
}

