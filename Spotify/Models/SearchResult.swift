//
//  SearchResult.swift
//  Spotify
//
//  Created by mert can çifter on 29.05.2022.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
