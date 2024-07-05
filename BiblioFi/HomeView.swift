//
//  HomeView.swift
//  BiblioFi
//
//  Created by Nikunj Tyagi on 05/07/24.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var author: String
}

struct HomeView: View {
    // Top picks Book array
    let books: [Book] = [
        Book(title: "Book Title 1", author: "Author 1"),
        Book(title: "Book Title 2", author: "Author 2"),
        Book(title: "Book Title 3", author: "Author 3"),
        Book(title: "Book Title 4", author: "Author 4"),
        Book(title: "Book Title 5", author: "Author 5"),
        Book(title: "Book Title 6", author: "Author 6"),
        Book(title: "Book Title 7", author: "Author 7")
    ]
    
    // Recommendation of book array
    let recommendations: [Book] = [
        Book(title: "R-Book 1", author: "Author A"),
        Book(title: "R-Book 2", author: "Author B"),
        Book(title: "R-Book3", author: "Author C"),
        Book(title: "R-Book 4", author: "Author D")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Author")
                        .font(.custom("Avenir Next Bold", size: 25))
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(books.prefix(4)) { book in
                                NavigationLink(destination: DetailView(book: book)) {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 75, height: 75)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Top Picks")
                        .font(.custom("Avenir Next Bold", size: 25))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(books) { book in
                                NavigationLink(destination: DetailView(book: book)) {
                                    VStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                        
                                        Text(book.title)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        Text(book.author)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 120)
                                    .padding(.horizontal, 4)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Recommendation")
                        .font(.custom("Avenir Next Bold", size: 25))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(recommendations) { book in
                                NavigationLink(destination: DetailView(book: book)) {
                                    VStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                        
                                        Text(book.title)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        
                                        Text(book.author)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 120)
                                    .padding(.horizontal, 4)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color(hex: "#f9edea").edgesIgnoringSafeArea(.all))
            .navigationBarItems(
                leading: HStack {
                    Image(systemName: "bag")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                },
                trailing: HStack {
                    Image(systemName: "barcode.viewfinder")
                        .font(.system(size: 22, weight: .regular))
                        
                    Image(systemName: "bell")
                        .font(.system(size: 22, weight: .regular))
                        
                }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct DetailView: View {
    var book: Book
    
    var body: some View {
        Text(book.title)
            .navigationBarTitle(book.title)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

