import SwiftUI

struct LibraryTab: View {
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    SearchBar(text: $searchText)
                    Button(action: {
                        // Heart button action
                    }) {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                            .padding(.leading, 8)
                    }
                }
                .padding(.horizontal)

                HStack {
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // See all action
                    }) {
                        Text("See all")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)

                HStack {
                    CategoryLink(destination: FictionalView(), imageName: "Image", title: "Fictional")
                    CategoryLink(destination: NonFictionalView(), imageName: "Image 1", title: "Non Fictional")
                    CategoryLink(destination: HistoryView(), imageName: "Image 2", title: "History")
                    
                }
                .padding(.horizontal)

                HStack {
                    Text("Audiobook")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // See all action
                    }) {
                        Text("See all")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)

                VStack(spacing: 16) {
                    AudioBookLink(destination: AfricanEuropeanView(), imageName: "Image 3", title: "African European", author: "By Olivetti Tele")
                    AudioBookLink(destination: PencilView(), imageName: "Image 4", title: "Pencil", author: "By Olivetti Wilson")
                    AudioBookLink(destination: IntuitionView(), imageName: "Image 5", title: "Intuition", author: "By Roman Wilson")
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color(hex: "#f9edea").edgesIgnoringSafeArea(.all)) // Set the background color for the entire screen
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $text)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct CategoryLink<Destination: View>: View {
    let destination: Destination
    let imageName: String
    let title: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(title)
                .font(.caption)
                .frame(maxWidth: 100)
        }
    }
}

struct AudioBookLink<Destination: View>: View {
    let destination: Destination
    let imageName: String
    let title: String
    let author: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)

                Text(author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct FictionalView: View {
    var body: some View {
        VStack {
            Text("Fictional")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct NonFictionalView: View {
    var body: some View {
        VStack {
            Text("Non-Fictional")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}


struct AfricanEuropeanView: View {
    var body: some View {
        VStack {
            Text("African European")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct PencilView: View {
    var body: some View {
        VStack {
            Text("Pencil")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct IntuitionView: View {
    var body: some View {
        VStack {
            Text("Intuition")
                .font(.title)
                .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
