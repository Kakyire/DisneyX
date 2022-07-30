//
//  CharactersResponse.swift
//  DisneyX
//
//  Created by Kakyire on 06/07/2022.
//

import Foundation

struct CharactersResponse: Codable {
    let data: [CharactersDTO]
    let count, totalPages: Int
    let nextPage: String

}
