//
//  LoginView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI

struct MainView: View {
    var onLogout: () -> Void
    @Binding var user:User
    
    var body: some View {
        NavigationStack{
            VStack{
                ChapterList(user:$user)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                Button("Logout"){
                    onLogout()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(onLogout: {},user:.constant(User(id: 1, name: "John Doe", email: "johndoe@example.com", joined: "2023-05-01", completed: [])))
    }
}
