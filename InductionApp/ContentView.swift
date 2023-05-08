//
//  ContentView.swift
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

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State var fetchResult = User(id: 0, name: "", email: "", joined: "")
    
    var body: some View {
        if fetchResult.email == "marry@gmail.com" {
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
                        loadUser()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
    
    func loadUser(){
        guard let url = URL(string: "http://localhost:5000/users/signin") else {
                    print("Invalid URL")
                    return
                }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = ["email":email,"password":password]
        let jsonData = try! JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request){ data,response,error in
            if let data = data{
                do{
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print(jsonString)
                    }
                    let user = try JSONDecoder().decode(User.self, from: data)
                    print(user)
                    DispatchQueue.main.async {
                        fetchResult = user
                    }
                }catch{
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
