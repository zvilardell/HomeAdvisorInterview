//
//  ProTableViewCell.swift
//  HomeAdvisorChallenge
//
//  Created by Zach Vilardell on 8/12/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class ProTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(pro: Pro) {
        //configure cell labels for the given pro
        nameLabel.text = pro.name
        if pro.ratingCount > 0 {
            ratingLabel.text = "Rating: \(pro.compositeRating) | \(pro.ratingCount) rating(s)"
            if pro.compositeRating >= 4.0 {
            	ratingLabel.textColor = UIColor.green
            } else if pro.compositeRating >= 3.0 && pro.compositeRating < 4.0 {
                ratingLabel.textColor = UIColor.orange
            } else {
            	//composite rating less than 3.0
                ratingLabel.textColor = UIColor.red
            }
        } else {
            ratingLabel.text = "References Available"
            ratingLabel.textColor = UIColor.black
        }
    }

}
