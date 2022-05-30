//
//  Artist.swift
//  Spotify
//
//  Created by mert can çifter on 21.05.2022.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
