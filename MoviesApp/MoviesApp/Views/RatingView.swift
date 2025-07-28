//
//  RatingView.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import SwiftUI

struct RatingView: View {

    @Binding var rating: Int?

    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }

    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundStyle(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(5))
}
