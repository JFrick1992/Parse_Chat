//
//  ChatCell.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bubbleView.layer.cornerRadius=12
        bubbleView.clipsToBounds=true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
