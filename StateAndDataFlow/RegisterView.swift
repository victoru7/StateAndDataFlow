//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var isVisibleButton: Bool {
      return name.count < 3
    }
    
    var body: some View {
        VStack {
            HStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                Text("\(name.count)").foregroundColor(isVisibleButton ? .red: .blue)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled((isVisibleButton))
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
