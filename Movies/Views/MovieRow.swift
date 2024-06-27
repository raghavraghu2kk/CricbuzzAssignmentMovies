//
//  MovieRow.swift
//  Movies
//
//  Created by Raghavendra Mirajkar on 28/06/24.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let url = URL(string: movie.Poster) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 75)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 50, height: 75)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "photo")
                            .frame(width: 50, height: 75)
                    @unknown default:
                        EmptyView()
                            .frame(width: 50, height: 75)
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(movie.Title)
                    .font(.headline)
                Text("\(movie.Language) | \(movie.sanitizedYear)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    MovieRow(movie: Sample.first!)
}
