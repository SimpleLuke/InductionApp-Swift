//
//  ChapterController.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import Foundation
import SwiftUI

class ChapterController {
//    func selectChapter(name:String,user:User) -> some View {
//        switch name {
//            case "HL 5 Key Values":
//            return AnyView(FiveKeyValuesView(user:$user))
//            case "The HL Way":
//               return AnyView(HLWayView())
//            default:
//               return AnyView(ChapterNotFoundView())
//        }
//    }
    
    func getCompletedChapters(id:Int, completion: @escaping (CompletedChapter?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:5000/chapters/completed/\(id)") else {
            print("Invalid URL")
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        let request = URLRequest(url: url)


        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let chapters = try JSONDecoder().decode(CompletedChapter.self, from: data)
                    completion(chapters, nil)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
            task.resume()
    }
    
}
