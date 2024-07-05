//
//  NewSwift.swift
//  BiblioFi
//
//  Created by Nikunj Tyagi on 04/07/24.
//


import SwiftUI

struct NewSwift: View {
    var body: some View {
        TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                           
                        }
            
                    
                    LibraryView()
                        .tabItem {
                            Image(systemName: "books.vertical")
                            Text("Library")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct NewScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewSwift()
    }
}
