//
//  SettingsModel.swift
//  Spotify
//
//  Created by mert can çifter on 22.05.2022.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
