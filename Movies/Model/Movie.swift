//
//  Movie.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import Foundation

struct Movie : Identifiable, Codable, Hashable {
    
    //Created the Model for JSON File
    let id = UUID()
    let Title: String
    let Year: String
    let Genre: String
    let Director: String
    let Actors: String
    let Plot: String
    let Language: String
    let Poster: String
    let Ratings: [Rating]
    let Released: String
    
    enum CodingKeys: String, CodingKey {
        case Title, Year, Genre, Director, Actors, Plot, Language, Poster, Ratings, Released
    }
    
    var sanitizedYear: String {
            let components = Year.split(separator: "-")
            return components.first.map(String.init) ?? Year
        }
}

struct Rating: Codable, Hashable {
    let Source: String
    let Value: String
}
