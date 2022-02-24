//
//  Movies.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import Foundation

struct Movie: Codable {
  let title: String
  let genre: Genre
  let rating: Double
}

enum Genre: String, Codable, CaseIterable {
  case action = "Action"
  case adventure = "Adventure"
  case animation = "Animation"
  case crime = "Crime"
  case comedy = "Comedy"
  case drama = "Drama"
  case family = "Family"
  case fantasy = "Fantasy"
  case horror = "Horror"
  case mystery = "Mystery"
  case romance = "Romance"
  case scifi = "Sci-Fi"
  case thriller = "Thriller"
}
