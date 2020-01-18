//
//  SongTableViewCell.swift
//  Albums
//
//  Created by Craig Swanson on 1/15/20.
//  Copyright © 2020 Craig Swanson. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var song: Song?
    var delegate: SongTableViewCellDelegate?
    
    
    // MARK: - Outlets
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songDurationTextField: UITextField!
    @IBOutlet weak var addSongButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    @IBAction func addSongButtonTapped(_ sender: UIButton) {
        guard let songTitle = songTitleTextField.text,
            let songDuration = songDurationTextField.text,
            !songTitle.isEmpty,
            !songDuration.isEmpty else { return }
        delegate?.addSong(with: songTitle, duration: songDuration)
    }
    
    func updateViews() {
        
        if let song = song {
            songTitleTextField.text = song.name
            songDurationTextField.text = song.duration
            addSongButton.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        songTitleTextField.text = ""
        songDurationTextField.text = ""
        addSongButton.isHidden = false
    }

}

protocol SongTableViewCellDelegate {
    func addSong(with title: String, duration: String)
}
