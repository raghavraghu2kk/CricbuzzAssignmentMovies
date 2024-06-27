//
//  OptionViews.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import SwiftUI

struct OptionViews: View {
    let option: String
    let movies: [Movie]
    
    @State private var isTapped = false
    
    var body: some View {
        
        Section(header: Text(option).onTapGesture {
            withAnimation {
                isTapped.toggle()
            }})
        {
            if isTapped && option != "All Movies"{
                ForEach(getValues(for: option), id: \.self) { value in
                    NavigationLink(destination: MovieListView(option: option, value: value, movies: movies)) {
                        Text(value)
                    }
                }
            }
            else if isTapped && option == "All Movies" {
                ForEach(movies, id: \.self) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRow(movie: movie)
                    }
                }
            }
        }
        
    }
    
}

extension OptionViews {
    private func getValues(for option: String) -> [String] {
        var values: Set<String> = []
        for movie in movies {
            switch option {
            case "Year":
                values.insert(movie.sanitizedYear)
            case "Genre":
                movie.Genre.split(separator: ",").forEach { values.insert($0.trimmingCharacters(in: .whitespaces)) }
            case "Director":
                if movie.Director != "N/A" {
                    movie.Director.split(separator: ",").forEach { values.insert($0.trimmingCharacters(in: .whitespaces)) }
                }
            case "Actors":
                if movie.Actors != "N/A" {
                    movie.Actors.split(separator: ",").forEach { values.insert($0.trimmingCharacters(in: .whitespaces)) }
                }
            default:
                break
            }
        }
        return Array(values).sorted()
    }
}


#Preview {
    OptionViews(option: "Year", movies: Sample)
}
