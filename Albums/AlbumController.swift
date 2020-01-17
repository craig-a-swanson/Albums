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
  
            if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
            
        do {
            let downloadedData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedAlbum = try! decoder.decode(Album.self, from: downloadedData)
        } catch {
            print("Error in decoding the json: \(error)")
        }
        
            }
    
    }
}
