//
//  CharactersTableViewCell.swift
//  DisneyX
//
//  Created by Kakyire on 05/07/2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
