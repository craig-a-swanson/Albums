//
//  Song.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation
import UIKit
//
//struct Song {
//    var duration: String
//    var id: String
//    var title: String
//    
//    enum SongKeys: String, CodingKey {
//        case duration
//        case id
//        case name
//        
//        enum durationKeys: String, CodingKey {
//            case duration
//        }
//        
//        enum nameKeys: String, CodingKey {
//            case title
//        }
//    }
//}
//
//
//extension Song: Codable {
//    
//    init(from decoder: Decoder) throws {
//        
//        var songUnkeyedContainer = try decoder.unkeyedContainer()
//        var songList: [Song] = []
//        while !songUnkeyedContainer.isAtEnd {
//            
//            // make keyed container inside the unkeyed array
//            let songKeyedContainer = try songUnkeyedContainer.nestedContainer(keyedBy: SongKeys.self)
//            // make duration keyed container
//            let durationKeyedContainer = try songKeyedContainer.nestedContainer(keyedBy: SongKeys.durationKeys.self, forKey: .duration)
//            let duration = try durationKeyedContainer.decode(String.self, forKey: .duration)
//            
//            // decode id
//            let id = try songKeyedContainer.decode(String.self, forKey: .id)
//            
//            // make name keyed container
//            let songNameKeyedContainer = try songKeyedContainer.nestedContainer(keyedBy: SongKeys.nameKeys.self, forKey: .name)
//            let title = try songNameKeyedContainer.decode(String.self, forKey: .title)
//            let newSong = Song(duration: duration, id: id, title: title)
//            songList.append(newSong)
//        }
//        
//        for song in songList {
//            self.duration = song.duration
//            self.id = song.id
//            self.title = song.title
//        }
//    }
//}
