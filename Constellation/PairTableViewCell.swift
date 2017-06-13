//
//  PairTableViewCell.swift
//  Constellation
//
//  Created by miss on 16/12/15.
//  Copyright © 2016年 mukr. All rights reserved.
//

import UIKit

class PairTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
