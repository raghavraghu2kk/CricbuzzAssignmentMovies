//
//  MovieViewModel.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import Foundation

// ViewModel Class for the Movie
class MovieViewModel: ObservableObject {
    @Published var movies : [Movie] = []
    @Published var searchText : String = ""
    @Published var selectedOption: String?
    @Published var selectedValue: String?
    
    init() {
        // Loading movies at the time of intiaization
        loadMovies()
    }
    
    //Function to load movies
    func loadMovies() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("Invalid file type")
            return
        }
        if let data = try? Data(contentsOf: url) {
            guard let movies = try? JSONDecoder().decode([Movie].self, from: data) else {
                print("Unable to fetch")
                return
            }
            self.movies = movies
        }
    }
    
    // Filtering movies based on Title, Genre, Director and Actors based on the search field
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { movie in
                movie.Title.lowercased().contains(searchText.lowercased()) ||
                movie.Genre.lowercased().contains(searchText.lowercased()) ||
                movie.Director.lowercased().contains(searchText.lowercased()) ||
                movie.Actors.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
}
