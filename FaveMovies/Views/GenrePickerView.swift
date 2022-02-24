//
//  GenrePickerView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI

import SwiftUI

struct GenrePickerView: View {
  @Binding var genre: Genre

  var body: some View {
    Picker(selection: $genre, label: Spacer()) {
      ForEach(Genre.allCases, id: \.self) {
        Text($0.rawValue)
      }
    }
    .pickerStyle(WheelPickerStyle())
  }
}

struct GenrePickerView_Previews: PreviewProvider {
  static var previews: some View {
      GenrePickerView(genre: .constant(.action))
  }
}
