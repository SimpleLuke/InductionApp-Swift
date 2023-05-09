//
//  ChapterList.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct ChapterList: View {
    private let chapterController = ChapterController()
    
    var body: some View {
        NavigationView{
            List(chapters) { chapter in
                NavigationLink{
                    chapterController.selectChapter(name: chapter.name)
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
        ChapterList()
    }
}
