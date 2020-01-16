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
        guard let filePath = Bundle.main.path(forResource: "exampleAlbum", ofType: "json") else {  print("Error HERE")
            return
        }
        let url = URL(string: filePath)
        
        do {
            guard let url = url else { return }
            let downloadedData = try Data(contentsOf: url)
            print(downloadedData)
        } catch {
            print("Error in decoding the json: \(error)")
        }
        
    }
    
}
