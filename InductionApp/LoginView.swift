//
//  LoginView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI

struct LoginView: View {
    var onLogout: () -> Void
    
    var body: some View {
        Text("This is the login view")
        Button("logout"){
            onLogout()
        }
        .foregroundColor(.white)
        .frame(width: 300,height: 50)
        .background(Color.blue)
        .cornerRadius(10)
    }
}
