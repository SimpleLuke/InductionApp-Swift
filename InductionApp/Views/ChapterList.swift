//
//  ChapterList.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct ChapterList: View {
    var body: some View {
        List(chapters) { chapter in
                    ChapterRow(chapter: chapter)
                }
    }
}

struct ChapterList_Previews: PreviewProvider {
    static var previews: some View {
        ChapterList()
    }
}
