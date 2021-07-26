//
//  MenuCell.swift
//  TMREIS
//
//  Created by Haritej on 02/05/21.
//

import UIKit

class MenuCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

