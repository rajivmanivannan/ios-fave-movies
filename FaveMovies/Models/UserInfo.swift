//
//  UserInfo.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import Foundation

class UserStore : ObservableObject {
    @Published var currentUserInfo = UserInfo(userName: "Movie Lover", favoriteGenre: .action)
}

struct UserInfo {
  let userName: String
  let favoriteGenre: Genre
}
