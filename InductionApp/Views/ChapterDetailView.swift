//
//  ChapterDetailView.swift
//  InductionApp
//
//  Created by Luke Lai on 13/05/2023.
//

import SwiftUI

struct ChapterDetailView: View {
    private let chapterController = ChapterController()
    @Binding var user:User
    @State private var isCompleted = false;
    @State var completedChapters:CompletedChapter = CompletedChapter(completed: [])
    let chapter:Chapter
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: true){
                VStack {
                    CircleImage(image:chapter.image)
                    
                    VStack(alignment: .leading) {
                        Text(chapter.name)
                            .font(.title)
                        
                        Divider()
                        
                        ForEach(Array(chapter.description.enumerated()), id: \.1) { index,item in
                            VStack(alignment: .leading){
                                Text("\(index+1). \(item.title)")
                                    .font(.title2)
                                Text(item.content)
                            }
                            .padding()
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            Button(isCompleted ? "Completed" : "Mark as completed"){
                if(isCompleted){
                    chapterController.undoChapter(user_id: user.id,chapter_name: chapter.name) { message, error in
                                            if let message = message {
                                                if message == "Undone"{
                                                    isCompleted = false
                                                    print(message)
                                                }
                                            } else if let error = error {
                                                // handle error here
                                                print("Error: \(error.localizedDescription)")
                                            }
                                        }
                }else{
                    chapterController.completeChapter(user_id: user.id,chapter_name: chapter.name) { message, error in
                                            if let message = message {
                                                if message == "Completed"{
                                                    isCompleted = true
                                                    print(message)
                                                }
                                            } else if let error = error {
                                                // handle error here
                                                print("Error: \(error.localizedDescription)")
                                            }
                                        }
                }
            }
            .foregroundColor(.white)
            .frame(width: 300,height: 50)
            .background(isCompleted ? Color.gray : Color.blue)
            .cornerRadius(10)
        }
        .onAppear(){
            chapterController.getCompletedChapters(id: user.id) { chapters, error in
                if let chapters = chapters {
                    isCompleted = chapters.completed.contains(chapter.name)
                    print(chapters)
                } else if let error = error {
                    // handle error here
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

//struct ChapterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChapterDetailView(user: .constant(User(id: 1, name: "John Doe", email: "johndoe@example.com", joined: "2023-05-01", completed: [])),chapter: Chapter(name: "HL 5 Key Values",id: 1,description: [("title":"Put the client first","content":"From the day-to-day exceptional client experience, to the constant improvement of our services, we use client feedback to shape future development. It’s their future in our hands.")],imageName: "5-key-values")
//    }
//}
