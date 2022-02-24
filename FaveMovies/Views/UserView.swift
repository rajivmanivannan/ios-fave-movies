//
//  UserView.swift
//  FaveMovies
//
//  Created by rajivmanivannan on 23/02/22.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var userStore: UserStore
    @State private var userName = ""
    @State private var favoriteGenre = Genre.action
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User")) {
                    TextField("User Name", text: $userName)
                }
                Section(header: Text("Favorite Genre")) {
                    GenrePickerView(genre: $favoriteGenre)
                }
            }.onAppear{
                userName = userStore.currentUserInfo.userName
                favoriteGenre = userStore.currentUserInfo.favoriteGenre
            }
        }
        .navigationBarTitle(Text("Info"), displayMode: .inline)
        .navigationBarItems(
            trailing:
                Button(action: {
                    updateUserInfo()
                    self.presentation.wrappedValue.dismiss()
                } ) {
                    Text("Update")
                }
        )
    }
    
    func updateUserInfo() {
        let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
        userStore.currentUserInfo = newUserInfo
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
