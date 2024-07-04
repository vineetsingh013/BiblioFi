//
//  ContentView.swift
//  BiblioFi
//
//  Created by Vineet Chaudhary on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
            Text("Please login or create an account to continue")
                .font(.subheadline)
                .padding(.bottom, 40)
            Image("Boarding")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.top, 100)
            
            
            NavigationLink(destination: SignUpView()) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#945200"))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            NavigationLink(destination: LoginPage()) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#945200"))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

