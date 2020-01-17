//
//  AlbumController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation

class AlbumController {
            var decodedAlbum: Album?
    var encodedAlbum: Data?
    func testDecodingExampleAlbum() {
        
        if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
            
            do {
                let downloadedData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decodedAlbum = try! decoder.decode(Album.self, from: downloadedData)
                print(decodedAlbum)
            } catch {
                print("Error in decoding the json: \(error)")
            }
            
        }
    }
    
    func testEncodingExampleAlbum() {

        if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
            do {
                let downloadedData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decodedAlbum = try! decoder.decode(Album.self, from: downloadedData)
            } catch {
                print("Error in decoding the json: \(error)")
            }
         
            do {
                encodedAlbum = try JSONEncoder().encode(decodedAlbum)
                let encodedAlbumRep = String(data: encodedAlbum!, encoding: .utf8)
                print(encodedAlbumRep)
            } catch {
             print("Error in encoded the Album: \(error)")
            }
            
        }
    }
}
