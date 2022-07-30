//
//  CharactersModel.swift
//  DisneyX
//
//  Created by Kakyire on 05/07/2022.
//

import Foundation



struct CharactersDTO: Codable {
    let films, shortFilms, tvShows, videoGames: [String]
    let parkAttractions: [String]
    let allies, enemies: [String]
    let id: Int
    let name: String
    let imageURL: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case films, shortFilms, tvShows, videoGames, parkAttractions, allies, enemies
        case id = "_id"
        case name
        case imageURL = "imageUrl"
        case url
    }
}
