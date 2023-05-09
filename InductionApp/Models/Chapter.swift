//
//  Chapter.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import Foundation
import SwiftUI

struct Chapter: Hashable, Codable {
    var id: Int
    var name: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
