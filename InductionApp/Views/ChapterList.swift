//
//  ChapterList.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct ChapterList: View {
    @Binding var user:User
    private let chapterController = ChapterController()
    
    var body: some View {
        NavigationView{
            List(chapters) { chapter in
                NavigationLink{
                    ChapterDetailView(user:$user,chapter:chapter)
                } label: {
                    ChapterRow(chapter: chapter)
                }
            }
            .navigationTitle("Chapters")
        }

    }
}

struct ChapterList_Previews: PreviewProvider {
    static var previews: some View {
        ChapterList(user:.constant(User(id: 1, name: "John Doe", email: "johndoe@example.com", joined: "2023-05-01", completed: [])))
    }
}
