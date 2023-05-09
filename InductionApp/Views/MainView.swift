//
//  LoginView.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import SwiftUI

struct MainView: View {
    var onLogout: () -> Void
    
    var body: some View {
        VStack{
            ChapterList()
            Button("logout"){
                onLogout()
            }
            .foregroundColor(.white)
            .frame(width: 300,height: 50)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(onLogout: {})
    }
}
