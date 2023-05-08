//
//  ContentView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        Text("This is the login view")
    }
}

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        if showingLoginScreen {
            LoginView()
        }else{
            content
        }
    }
    
    var content: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email",text:$email)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongEmail))
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    Button("Login"){
                        showingLoginScreen.toggle()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
