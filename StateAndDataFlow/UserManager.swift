//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    @Published var isRegister = false
    
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "username")
        }
    }
    
    init() {
         name = UserDefaults.standard.object(forKey: "username") as? String ?? ""
         isRegister = (name != "")
    }
    
    init(name: String) {
        self.name = name
    }
    
    func removeName() {
        isRegister = false
        UserDefaults.standard.removeObject(forKey: "username")
        name = ""
    }
}
