//
//  ChapterController.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import Foundation
import SwiftUI

class ChapterController {
    func selectChapter(name:String) -> some View {
        switch name {
            case "HL 5 Key Values":
               return AnyView(FiveKeyValuesView())
            case "The HL Way":
               return AnyView(HLWayView())
            default:
               return AnyView(ChapterNotFoundView())
        }
    }
    
}
