//
//  User.model.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import Foundation
struct User: Codable  {
    let id: Int
    let name: String
    let email: String
    let joined: String
    let completed: Array<String>
}

