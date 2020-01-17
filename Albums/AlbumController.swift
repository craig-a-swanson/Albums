//
//  AlbumController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import Foundation

class AlbumController {
    
    // MARK: - Properties
    var albums: [Album] = []
    private let baseURL: URL = URL(string: "https://mymovies-1962c.firebaseio.com/")!
    
    
    // MARK: - Read/fetch from server
    func getAlbums(completion: @escaping (Error?) -> () = {_ in }) {
        let requestURL = baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            guard error == nil else {
                print("Error fetching albums from server: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                print("No data was returned by data task")
                completion(NSError())
                return
            }
            
            do {
                self.albums = Array(try JSONDecoder().decode([String : Album].self, from: data).values)
                completion(nil)
            } catch {
                print("Error decoding albums from json: \(error)")
                completion(error)
                return
            }
        }.resume()
    }
    
    // MARK: - Put to server
    func put(album: Album, completion: @escaping (Error?) -> () = {_ in }) {
        let identifier = album.id
        let requestURL = baseURL.appendingPathComponent(identifier).appendingPathExtension("json")
        var request = URLRequest(url: requestURL)
        request.httpMethod = "PUT"
        
        do {
            request.httpBody = try JSONEncoder().encode(album)
        } catch {
            print("Error encoding album: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                print("Error PUTing movie to server: \(error!)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
}





//            var decodedAlbum: Album?
//    var encodedAlbum: Data?
//    func testDecodingExampleAlbum() {
//
//        if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
//            
//            do {
//                let downloadedData = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                decodedAlbum = try! decoder.decode(Album.self, from: downloadedData)
//                print(decodedAlbum)
//            } catch {
//                print("Error in decoding the json: \(error)")
//            }
//        }
//    }
//
//    func testEncodingExampleAlbum() {
//
//        if let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json") {
//            do {
//                let downloadedData = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                decodedAlbum = try! decoder.decode(Album.self, from: downloadedData)
//            } catch {
//                print("Error in decoding the json: \(error)")
//            }
//
//            do {
//                encodedAlbum = try JSONEncoder().encode(decodedAlbum)
//                let encodedAlbumRep = String(data: encodedAlbum!, encoding: .utf8)
//                print(encodedAlbumRep)
//            } catch {
//             print("Error in encoded the Album: \(error)")
//            }
//
//        }
//    }
