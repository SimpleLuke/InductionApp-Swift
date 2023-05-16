//
//  ContentView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI



struct LoginView: View {
    private let userRequest = UserRequest()
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State var fetchResult:User = User(id: 0, name: "", email: "", joined: "",completed:[])
    
    var body: some View {
        if fetchResult.id != 0 {
            MainView(onLogout: {
                        fetchResult = User(id: 0, name: "", email: "", joined: "",completed: [])
            },user:$fetchResult)
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
                    Text("Login")
                        .font(.title)
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
                        userRequest.loginUser(email:email, password:password) { user, error in
                            if let user = user {
                                fetchResult = user
                                print(user)
                                email = ""
                                password = ""
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
                            Text("Don't have an account, register")
                                .foregroundColor(.gray)
                            NavigationLink(destination: RegisterView()) {
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


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
