//
//  MovieRowView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI


struct MovieRowView: View {
  let movie: Movie

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.title2)
          .fontWeight(.light)
        Text(movie.genre.rawValue)
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      
      VStack(alignment: .trailing) {
        RatingView(rating: movie.rating)
      }
    }
  }
}
