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
        NavigationStack{
            VStack{
                ChapterList()
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
        MainView(onLogout: {})
    }
}
