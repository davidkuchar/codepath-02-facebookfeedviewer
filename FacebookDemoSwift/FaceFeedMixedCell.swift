//
//  FaceFeedMixedCell.swift
//  FacebookDemoSwift
//
//  Created by David Kuchar on 5/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FaceFeedMixedCell: UITableViewCell {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedMessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
