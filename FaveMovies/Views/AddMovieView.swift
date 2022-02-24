//
//  AddMovieView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI

struct AddMovieView: View {
    static let defaultMovieTitle = "An untitled movie"
    
    let movieStore: MovieStore
    @Binding var showModal: Bool
    @State private var title = ""
    @State private var genre = Genre.action
    @State private var rating: Double = 0
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Rating")) {
                    Slider(value: $rating, in: 0...5, step: 0.5)
                    RatingView(rating: rating)
                }
                Section(header: Text("Genre")) {
                    GenrePickerView(genre: $genre)
                }
            }.onAppear {
                genre = userStore.currentUserInfo.favoriteGenre
            }
            .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: addMovie) {
                        Text("Add")
                    }
            )
        }
    }
    
    private func addMovie() {
        movieStore.addMovie(
            title: title.isEmpty ? AddMovieView.defaultMovieTitle : title,
            genre: genre,
            rating: rating)
        
        showModal.toggle()
    }
}
