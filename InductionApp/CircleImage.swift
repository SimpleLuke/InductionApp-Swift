//
//  CircleImage.swift
//  InductionApp
//
//  Created by Luke Lai on 09/05/2023.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("5-key-values")
            .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
