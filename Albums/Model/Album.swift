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
    var genre: String
    var id: String
    var name: String
    var songs: [Song]
}



extension Album: Codable {
    
}
