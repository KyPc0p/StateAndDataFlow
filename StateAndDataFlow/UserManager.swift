//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation

final class UserManager: ObservableObject {
    
    static var shared = UserManager()
    
    @Published var isRegistered: Bool {
        didSet{
            UserDefaults.standard.set(isRegistered, forKey: "isRegistered")
        }
    }
    
    var name: String {
        didSet{
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    
    init() {
        isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
        name = UserDefaults.standard.string(forKey: "name") ?? ""
    }
}



