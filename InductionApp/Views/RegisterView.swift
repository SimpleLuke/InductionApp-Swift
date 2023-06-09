//
//  RegisterView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI

struct RegisterView: View {
    private let userRequest = UserRequest()
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var redirectLogin = false
    
    var body: some View {
        if redirectLogin {
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
                    Text("Hargreaves")
                        .font(.largeTitle)
                        .bold()
                    Text("Lansdown")
                        .font(.largeTitle)
                        .bold()
                    Text("Register")
                        .font(.title)
                        .bold()
                        .padding()
                    TextField("Email",text:$email)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    TextField("Name",text:$name)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Password",text:$password)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    Button("Register"){
                        userRequest.registerUser(email: email,name:name, password: password) { message, error in
                            if let message = message {
                                if message == "New user created"{
                                    print(message)
                                    redirectLogin = true
                                }
                            } else if let error = error {
                                // handle error here
                                print("Error: \(error.localizedDescription)")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    HStack {
                            Text("Already have an account? Sign in")
                                .foregroundColor(.gray)
                            NavigationLink(destination: LoginView()) {
                                Text("here")
                                    .underline()
                                    .foregroundColor(.blue)
                            }
                        }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

