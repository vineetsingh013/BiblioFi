//
//  NewSwift.swift
//  BiblioFi
//
//  Created by Nikunj Tyagi on 04/07/24.
//


import SwiftUI

struct NewSwift: View {
    var body: some View {
        VStack {
            Text("Welcome to the new screen!")
                .font(.largeTitle)
                .padding()
            // Add more UI elements as needed
            Spacer()
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
