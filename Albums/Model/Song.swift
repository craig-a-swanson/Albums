//
//  Song.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation
import UIKit

struct Song {
    var duration: String
    var id: String
    var title: String
    
    enum SongKeys: String, CodingKey {
        case duration
        case id
        case name
        
        enum durationKeys: String, CodingKey {
            case duration
        }
        
        enum nameKeys: String, CodingKey {
            case title
        }
    }
}


extension Song: Codable {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: SongKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        
        
    }
}
