//
//  CardView.swift
//  listview
//
//  Created by Muhammad Aqib on 06/07/2021.
//

import SwiftUI

struct CardView: View {
    private let cardAndImageWidth: CGFloat
    private let cardAndImageHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: cardAndImageWidth, height: cardAndImageHeight)
                .cornerRadius(10)
                .clipped()
            VStack(alignment: .leading, spacing: 0) {
                Text("Thomas G.")
                    .fontWeight(.black)
                    .font(.custom("default", size: 15))
                    .foregroundColor(.white)
                HStack(spacing: 5) {
                    Text("Relationships | Mindfullness | Anxiety")
                        .font(.custom("default", size: 10))
                        .foregroundColor(.white)
                    Spacer()
                    Text("20")
                        .font(.custom("default", size: 12))
                        .foregroundColor(.white)
                    ZStack(alignment: .trailing) {
                        Image(systemName: "face.smiling")
                        Circle()
                            .frame(width: 5, height: 5)
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding([.horizontal,.bottom],12)
        }
        .frame(width: cardAndImageWidth, height: cardAndImageHeight)
        .shadow(radius: 5)
    }
    
    init(geometry: GeometryProxy) {
        let widthHeight = geometry.size.width - 24
        self.cardAndImageWidth = widthHeight
        self.cardAndImageHeight = widthHeight * 0.8
    }
}
