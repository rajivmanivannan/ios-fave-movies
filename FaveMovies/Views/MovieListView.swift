//
//  MovieListView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var movieStore = MovieStore()
    @EnvironmentObject var userStore : UserStore
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movieStore.movies, id: \.title) {
                    MovieRowView(movie: $0)
                }
            }
            .sheet(isPresented: $isPresented) {
                AddMovieView(movieStore: movieStore, showModal: $isPresented)
            }
            .navigationBarTitle(Text("Fave Movies"))
            .navigationBarItems(
                leading:
                    NavigationLink(destination: UserView()) {
                        HStack {
                            Image(systemName: "person.fill")
                            Text(userStore.currentUserInfo.userName)
                        }
                    },
                trailing:
                    Button(action: { isPresented.toggle() }) {
                        Image(systemName: "plus")
                    }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieStore: MovieStore())
    }
}
