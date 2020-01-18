//
//  AlbumDetailTableViewController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import UIKit

class AlbumDetailTableViewController: UITableViewController {

    // MARK: - Properties
    var albumController: AlbumController?
    var album: Album? {
        didSet {
            updateViews()
        }
    }
    var tempSongs: [Song] = []
    
    
    // MARK: - Outlets
    @IBOutlet weak var albumNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var coverArtTextField: UITextField!
    
    
    // MARK: - Table View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func saveAlbumButtonTapped(_ sender: UIBarButtonItem) {
        if let album = album {
            // pass the updated album to the update(album: ) method
            let id = album.id
            guard let artist = artistNameTextField.text,
                let albumName = albumNameTextField.text,
                let genre = genreTextField.text,
                let coverArtString = coverArtTextField.text,
                let coverArtURL = URL(string: coverArtString) else { return }
            let songs = tempSongs
            let updatedAlbum = Album(artist: artist, coverArt: [coverArtURL], genre: [genre], id: id, name: albumName, songs: songs)
            albumController?.update(for: updatedAlbum)
        } else {
            // create a new album and pass it to the createAlbum method
            let id = UUID().uuidString
                      guard let artist = artistNameTextField.text,
                          let albumName = albumNameTextField.text,
                          let genre = genreTextField.text,
                          let coverArtString = coverArtTextField.text,
                          let coverArtURL = URL(string: coverArtString) else { return }
                      let songs = tempSongs
                      let newAlbum = Album(artist: artist, coverArt: [coverArtURL], genre: [genre], id: id, name: albumName, songs: songs)
                      albumController?.createAlbum(for: newAlbum)
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard isViewLoaded else { return }
        if let album = album {
            self.title = album.name
            albumNameTextField.text = album.name
            artistNameTextField.text = album.artist
            genreTextField.text = album.genre.joined(separator: ", ")
            let coverArtString = "\(album.coverArt)"
            coverArtTextField.text = coverArtString
            tempSongs = album.songs
        } else {
            self.title = "New Album"
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tempSongs.count + 1)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AlbumDetailTableViewController: SongTableViewCellDelegate {
    func addSong(with title: String, duration: String) {
        let songID = UUID()
        let newSong = albumController?.createSong(duration: title, id: songID.uuidString, name: duration)
        if let newSong = newSong {
        tempSongs.append(newSong)
        }
        
        tableView.scrollToRow(at: IndexPath(row: tempSongs.count, section: 0), at: UITableView.ScrollPosition(rawValue: 1)!, animated: true)
    }
    
    
}
