//
//  SearchResultResponse.swift
//  Spotify
//
//  Created by mert can çifter on 29.05.2022.
//

import Foundation

struct SearchResultsResponse: Codable {
    let albums: SearchAlbumResponse
    let artists: SearchArtistResponse
    let playlists: SearchPlaylistsResponse
    let tracks: SearchTrackssResponse
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
}

struct SearchArtistResponse: Codable {
    let items: [Artist]
}

struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
}

struct SearchTrackssResponse: Codable {
    let items: [AudioTrack]
}
