//
//  ContentView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI



struct ContentView: View {
    private let userRequest = UserRequest()
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State var fetchResult = User(id: 0, name: "", email: "", joined: "")
    
    var body: some View {
        if fetchResult.id != 0 {
            LoginView(onLogout: {
                        fetchResult = User(id: 0, name: "", email: "", joined: "")
                    })
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
                        userRequest.loginUser(email: "marry@gmail.com", password: "1234") { user, error in
                            if let user = user {
                                fetchResult = user
                                print(user)
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
