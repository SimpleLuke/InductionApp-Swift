//
//  ChapterView.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct FiveKeyValuesView: View {
    var body: some View {
        ScrollView(showsIndicators: true){
            VStack {
                    CircleImage(image: Image("5-key-values"))

                    VStack(alignment: .leading) {
                        Text("HL 5 Key Values")
                            .font(.title)

                        Divider()
                        VStack(alignment: .leading){
                            Text("1. Put the client first")
                                .font(.title2)
                            Text("From the day-to-day exceptional client experience, to the constant improvement of our services, we use client feedback to shape future development. It’s their future in our hands.")
                        }
                        .padding()
                        VStack(alignment: .leading){
                            Text("2. Go the extra mile")
                                .font(.title2)
                            Text("For our clients and for each other. We focus on what we need to do, then do it well, taking every opportunity to delight, inspire and reassure.")
                        }
                        .padding()
                        VStack(alignment: .leading){
                            Text("3. Do the right thing")
                                .font(.title2)
                            Text("We’re fair, honest and upfront and do the best for our clients. We focus on the long-term. It’s why they trust us, and how we earn their loyalty.")
                        }
                        .padding()
                        
                        VStack(alignment: .leading){
                            Text("4. Make it easy")
                                .font(.title2)
                            Text("Savings and investments should be easy to access, understand and do. We make things simple which gives our clients confidence to make important decisions at the right time.")
                        }
                        .padding()
                        VStack(alignment: .leading){
                            Text("5. Do it better")
                                .font(.title2)
                            Text("Energetically innovating and improving. When things aren’t working well, we fix them.")
                        }
                        .padding()
                    }
                    .padding()

                    Spacer()
            }.frame(width: UIScreen.main.bounds.width)
        }
        
        
  
    }
}

struct FiveKeyValuesView_Previews: PreviewProvider {
    static var previews: some View {
        FiveKeyValuesView()
    }
}
