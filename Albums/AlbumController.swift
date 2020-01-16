//
//  AlbumController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation

class AlbumController {
    
    func testDecodingExampleAlbum() -> Album {
  
            if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
            
        do {
            let downloadedData = try Data(contentsOf: url)
            print(downloadedData)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Album.self, from: downloadedData)
            return jsonData
        } catch {
            print("Error in decoding the json: \(error)")
        }
        
            } else {
                print("Error printing contents")
        }
        return Album(artist: "sdf", coverArt: [URL(string: "http://me.com")!], genre: ["Alternative"], id: "34", name: "asdf", songs: [Song(duration: "4:45", id: "23452", title: "bam")])
        }
    

}
