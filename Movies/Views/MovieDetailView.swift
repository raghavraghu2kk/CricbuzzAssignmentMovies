//
//  MovieDetailView.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 28/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie : Movie
    @State private var selectedRatingSource = "Internet Movie Database"
    
    var body: some View {
        ScrollView {
            if let url = URL(string: movie.Poster) {
                // Async Image to fetch image from URL Poster
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 300)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 200, height: 300)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 200, height: 300)
                    @unknown default:
                        EmptyView()
                            .frame(width: 200, height: 300)
                    }
                }
            }
            // Display the details of Movie Detail Screen
            Text(movie.Title)
                .font(.largeTitle)
                .padding(.top)
            
            Text(movie.Plot)
            
            Text("Cast & Crew").font(.title2)
            Text("Actors: \(movie.Actors)")
            Text("Director: \(movie.Director)")
            
            Text("Released on: \(movie.Released)")
            
            Text("Genre : \(movie.Genre)")
            
            // Creting thr Picker for the Rating Source
            Picker("Rating Source", selection: $selectedRatingSource) {
                ForEach(movie.Ratings.map { $0.Source }, id: \.self) { source in
                    Text(source).tag(source)
                }
            }
            
            
            if let rating = movie.Ratings.first(where: { $0.Source == selectedRatingSource }) {
                Text("Rating: \(rating.Value)")
                    .font(.caption)
            }
            
            Spacer()
        }
        .navigationTitle(movie.Title)
        .padding()
    }
}

#Preview {
    MovieDetailView(movie: Sample.first!)
}
