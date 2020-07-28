//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            
            VStack {
                ButtonView(timer: timer, isLogOut: false)
            }
            Spacer()
            ButtonView(timer: timer, isLogOut: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserManager())
    }
}



struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    @EnvironmentObject var user: UserManager
    
    var isLogOut: Bool

    var body: some View {
        VStack {
            Button(action: { self.isLogOut ? self.user.removeName() : self.timer.startTemer()}) {
                Text(self.isLogOut ? "Log out" : "\(timer.buttonTitle)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 60)
            .background( self.isLogOut ? Color.blue : Color.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)

            )
        }

    }
}
