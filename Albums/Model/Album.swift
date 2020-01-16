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
    var coverArt: [URL]
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
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        
        artist = try container.decode(String.self, forKey: .artist)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var decodedCoverArt = [URL]()
        while !coverArtContainer.isAtEnd {
            
            let coverArtKeyedContainer = try coverArtContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
            
            let coverArtString = try coverArtKeyedContainer.decode(URL.self, forKey: AlbumKeys.CoverArtKeys.url)
//            let coverArtUrl = URL(string: coverArtString)
            decodedCoverArt.append(coverArtString)
        }
        coverArt = decodedCoverArt
        
        
        
        var genreContainer = try container.nestedUnkeyedContainer(forKey: .genres)
        var decodedGenre = [String]()
        while !genreContainer.isAtEnd {
            
            let genreName = try genreContainer.decode(String.self)
            decodedGenre.append(genreName)
        }
        genre = decodedGenre
        
        songs = [Song]()
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: AlbumKeys.self)
        
        try container.encode(artist, forKey: .artist)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        
        var coverArtContainer = container.nestedUnkeyedContainer(forKey: .coverArt)
        for coverArtURL in coverArt {
            var coverArtStringContainer = coverArtContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
            try coverArtStringContainer.encode(coverArtURL.absoluteString, forKey: .url)
        }
        
        
    }
    
}
