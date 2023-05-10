//
//  ChapterView.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct FiveKeyValuesView: View {
    private let chapterController = ChapterController()
    @Binding var user:User
    @State private var isCompleted = false;
    @State var completedChapters:CompletedChapter = CompletedChapter(completed: [])
    let values = [(title: "Put the client first", text: "From the day-to-day exceptional client experience, to the constant improvement of our services, we use client feedback to shape future development. It’s their future in our hands."), (title: "Go the extra mile", text: "For our clients and for each other. We focus on what we need to do, then do it well, taking every opportunity to delight, inspire and reassure."),(title: "Do the right thing", text: "We’re fair, honest and upfront and do the best for our clients. We focus on the long-term. It’s why they trust us, and how we earn their loyalty."),(title: "Make it easy", text: "Savings and investments should be easy to access, understand and do. We make things simple which gives our clients confidence to make important decisions at the right time."),(title: "Do it better", text: "Energetically innovating and improving. When things aren’t working well, we fix them.")]
    var body: some View {
        VStack{
            ScrollView(showsIndicators: true){
                VStack {
                    CircleImage(image: Image("5-key-values"))
                    
                    VStack(alignment: .leading) {
                        Text("The HL way")
                            .font(.title)
                        
                        Divider()
                        
                        ForEach(0..<values.count, id: \.self) { index in
                            VStack(alignment: .leading){
                                Text("\(index+1). \(values[index].title)")
                                    .font(.title2)
                                Text(values[index].text)
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
                //                    userRequest.registerUser(email: email,name:name, password: password) { message, error in
                //                        if let message = message {
                //                            if message == "New user created"{
                //                                print(message)
                //                                redirectLogin = true
                //                            }
                //                        } else if let error = error {
                //                            // handle error here
                //                            print("Error: \(error.localizedDescription)")
                //                        }
                //                    }
            }
            .foregroundColor(.white)
            .frame(width: 300,height: 50)
            .background(isCompleted ? Color.gray : Color.blue)
            .cornerRadius(10)
        }
        .onAppear(){
            chapterController.getCompletedChapters(id: user.id) { chapters, error in
                if let chapters = chapters {
                    isCompleted = chapters.completed.contains("HL 5 Key Values")
                    print(chapters)
                } else if let error = error {
                    // handle error here
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct FiveKeyValuesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveKeyValuesView(user: .constant(User(id: 1, name: "John Doe", email: "johndoe@example.com", joined: "2023-05-01", completed: [])))
    }
}
