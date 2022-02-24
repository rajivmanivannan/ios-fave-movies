//
//  MovieStore.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import Foundation

class MovieStore: ObservableObject {
  static let moviesKey = "Movies"
  static let defaultMovies = [
    Movie(title: "Rio", genre: .comedy, rating: 4.5),
    Movie(title: "I, Robot", genre: .scifi, rating: 5),
    Movie(title: "Wall-E", genre: .family, rating: 4)
  ]

  static func loadMovies() -> [Movie] {
    let savedMovies = UserDefaults.standard.object(forKey: MovieStore.moviesKey)
    if let savedMovies = savedMovies as? Data {
      let decoder = JSONDecoder()
      return (try? decoder.decode([Movie].self, from: savedMovies))
        ?? MovieStore.defaultMovies
    }
    return MovieStore.defaultMovies
  }

  @Published var movies = loadMovies() {
    didSet {
      persistMovies()
    }
  }

  func addMovie(title: String, genre: Genre, rating: Double) {
    let newMovie = Movie(title: title, genre: genre, rating: rating)
    movies.append(newMovie)
  }

  func deleteMovie(at offsets: IndexSet) {
    movies.remove(atOffsets: offsets)
  }

  private func persistMovies() {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(movies) {
      UserDefaults.standard.set(encoded, forKey: MovieStore.moviesKey)
    }
  }
}
