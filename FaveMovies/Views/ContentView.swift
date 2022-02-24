//
//  ContentView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MovieListView().environmentObject(UserStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
