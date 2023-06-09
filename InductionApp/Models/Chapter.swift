//
//  Chapter.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import Foundation
import SwiftUI

struct Chapter: Hashable, Codable,Identifiable {
    var id: Int
    var name: String
    var description: [ChapterDescriptionItem]

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

struct ChapterDescriptionItem: Codable,Hashable {
    var title: String
    var content: String
}
