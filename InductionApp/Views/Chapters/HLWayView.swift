//
//  HLWayView.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct HLWayView: View {
    private let chapterController = ChapterController()
    @Binding var user:User
    @State private var isCompleted = false;
    @State var completedChapters:CompletedChapter = CompletedChapter(completed: [])
    let values = [(title: "We achieve good outcomes for our clients", text: "We give our clients confidence to make important decisions by continually trying to develop the best products, services, information, and support for them."), (title: "We do business responsibly", text: "We recognise that our market position creates an opportunity to impact wider society, and we take this responsibility seriously."),(title: "We protect and respect confidentiality of information", text: "It is our responsibility under Data Protection law to process and handle personal data in a fair and responsible manner, respecting every individual’s right to privacy."),(title: "We act ethically and with integrity", text: "We do business the right way. We maintain independence and objectivity, we prevent or mitigate any conflicts of interest or undue influence, and we will not tolerate any form of bribery or corruption."),(title: "We work to high professional standards", text: "The FCA’s Conduct Rules are enforceable, which means there are consequences when the Rules are breached, and we each take them very seriously."),(title: "We care about our community and the environment", text: "We are committed to being a sustainable business, enabling clients and society to build their financial resilience with clear actions and priorities across the full ESG spectrum."),(title: "We are respectful and fair", text: "Each of us are responsible for treating each other with respect, upholding our values and contributing to a culture where colleagues feel safe and valued."),(title: "We stay safe and consider wellbeing", text: "We are committed to providing a safe working environment, ensuring we support each other’s health and wellbeing."),(title:"We embrace diversity",text:"We are committed to building an inclusive and diverse workforce, not simply because it is the right thing to do but because we believe it will lead to better outcomes for clients, colleagues, communities and our business."),(title:"We speak up",text:"We each take personal responsibility to understand what these standards look like, do everything we can to achieve them, and importantly, to speak-up when we see actions and behaviours that fall short.")     ]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: true){
                VStack {
                    CircleImage(image: Image("the-hl-way"))
                    
                    VStack(alignment: .leading) {
                        Text("The HL Way")
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
                if(isCompleted){
                    chapterController.undoChapter(id: user.id,chapter_name: "The HL Way") { message, error in
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
                    chapterController.completeChapter(id: user.id,chapter_name: "The HL Way") { message, error in
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
                    isCompleted = chapters.completed.contains("The HL Way")
                    print(chapters)
                } else if let error = error {
                    // handle error here
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}


struct HLWayView_Previews: PreviewProvider {
    static var previews: some View {
        HLWayView(user: .constant(User(id: 1, name: "John Doe", email: "johndoe@example.com", joined: "2023-05-01", completed: [])))
    }
}
