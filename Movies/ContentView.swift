//
//  ContentView.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search..", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if viewModel.searchText.isEmpty {
                    List {
                        OptionViews(option: "Year", movies: viewModel.movies)
                        OptionViews(option: "Genre", movies: viewModel.movies)
                        OptionViews(option: "Director", movies: viewModel.movies)
                        OptionViews(option: "Actors", movies: viewModel.movies)
                        OptionViews(option: "All Movies", movies: viewModel.movies)
                    }
                    .listStyle(.inset)
                } else {
                    List(viewModel.filteredMovies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieRow(movie: movie)
                        }
                    }
                }
                
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    ContentView()
}
