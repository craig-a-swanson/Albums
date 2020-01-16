//
//  Album.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation
import UIKit

struct Album {
    var artist: String
    var coverArt: URL
    var genre: [String]
    var id: String
    var name: String
    var songs: [Song]
    
    enum AlbumKeys: String, CodingKey {
        case artist
        case id
        case name
        case coverArt
        case genres
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
}



extension Album: Codable {
    
    init(decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        
        artist = try container.decode(String.self, forKey: .artist)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        let coverArtContainer = try container.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self, forKey: .coverArt)
        let coverArtString = try coverArtContainer.decode(String.self, forKey: .url)
        coverArt = URL(string: coverArtString)!
        
        var genreContainer = try container.nestedUnkeyedContainer(forKey: .genres)
        var decodedGenre = [String]()
        while !genreContainer.isAtEnd {
            
            let genreName = try genreContainer.decode(String.self)
            decodedGenre.append(genreName)
        }
        genre = decodedGenre
        
        songs = [Song]()
    }
    
}
