//
//  MovieListView.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import SwiftUI

struct MovieListView: View {
    let option : String
    let value : String?
    let movies : [Movie]
    
    var filteredMovies: [Movie] {
        switch option {
        case "Year" : return movies.filter { $0.sanitizedYear == value }
        case "Genre" : return movies.filter { $0.Genre.contains(value ?? "") }
        case "Director" : return movies.filter { $0.Director.contains(value ?? "") }
        case "Actors" : return movies.filter { $0.Actors.contains(value ?? "") }
        case "All Movies" : return movies.filter { $0.Title == value }
        default: return []
        }
    }
    
    var body: some View {
        List(filteredMovies) { movie in
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                MovieRow(movie: movie)
            }
        }
        .navigationTitle(value ?? "Movies")
    }
}

#Preview {
    MovieListView(option: "Year", value: "2000", movies: Sample)
}
