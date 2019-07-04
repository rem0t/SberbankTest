//
//  HistoryCell.swift
//  SberbankTest
//
//  Created by Влад Калаев on 05/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var leftText: UILabel!
    @IBOutlet weak var rightText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
