//
//  Sample.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 27/06/24.
//

import Foundation

var Sample: [Movie] {
        let jsonString = """
        [
            {
                "Title": "Meet the Parents",
                "Year": "2000",
                "Genre": "Comedy, Romance",
                "Director": "Jay Roach",
                "Actors": "Robert De Niro, Ben Stiller, Teri Polo, Blythe Danner",
                "Plot": "A Jewish male nurse plans to ask his live-in girl friend to marry him. However, he learns that her strict father expects to be asked for his daughter's hand before she can accept. Thus begins the visit from Hell as the two travel to meet Mom and Dad, who turns out to be former CIA with a lie detector in the basement. Coincidentally, a sister also has announced her wedding to a young doctor. Of course everything that can go wrong, does, including the disappearance of Dad's beloved Himalayan cat, Jinxie.",
                "Language": "English, Thai, Spanish, Hebrew, French",
                "Poster": "https://m.media-amazon.com/images/M/MV5BMGNlMGZiMmUtZjU0NC00MWU4LWI0YTgtYzdlNGVhZGU4NWZlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
                "Ratings": [{"Source": "Internet Movie Database","Value": "7.0/10" }, {"Source": "Rotten Tomatoes","Value": "84%"}, {"Source": "Metacritic","Value": "73/100"}]
        
            }
        ]
        """
        let data = Data(jsonString.utf8)
        return try! JSONDecoder().decode([Movie].self, from: data)
}
