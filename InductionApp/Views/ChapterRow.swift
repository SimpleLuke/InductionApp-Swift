//
//  ChaptersRow.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct ChapterRow: View {
    var chapter:Chapter
    
    var body: some View {
        HStack {
                chapter.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(chapter.name)

                Spacer()
        }
    }
}

struct ChapterRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ChapterRow(chapter: chapters[0])
            ChapterRow(chapter: chapters[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
