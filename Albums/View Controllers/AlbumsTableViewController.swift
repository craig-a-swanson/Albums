//
//  AlbumsTableViewController.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    // MARK: - Properties
    var albumController: AlbumController? = AlbumController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let albumController = albumController else { return }
        albumController.getAlbums(completion: { (error) in
            guard error == nil else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let albumController = albumController else { return 0 }
        return albumController.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        guard let albumController = albumController else { return UITableViewCell() }

        cell.textLabel?.text = albumController.albums[indexPath.row].name
        cell.detailTextLabel?.text = albumController.albums[indexPath.row].artist

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NewAlbumSegue" {
            guard let newAlbumVC = segue.destination as? AlbumDetailTableViewController else { return }
            newAlbumVC.albumController = albumController
            
        } else {
            guard let albumDetailVC = segue.destination as? AlbumDetailTableViewController else { return }
            albumDetailVC.albumController = albumController
            if let indexPath = tableView.indexPathForSelectedRow {
                albumDetailVC.album = albumController?.albums[indexPath.row]
            }
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
