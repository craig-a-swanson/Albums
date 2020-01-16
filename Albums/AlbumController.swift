//
//  AlbumController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation

class AlbumController {
    
    func testDecodingExampleAlbum() {
        let url = URL(string: "/Users/craig/Development/iOS PT 3/ios-albums/Albums/Albums/AlbumController.swift")
        
        do {
            guard let url = url else {
                print("Bad URL giving for decoding")
                return
            }
            let downloadedData = try Data(contentsOf: url)
            print(downloadedData)
        } catch {
            print("Error in decoding the json: \(error)")
        }
        
    }
    
}
