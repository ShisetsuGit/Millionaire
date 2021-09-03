//
//  ScoreCell.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import UIKit

class ScoreCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        
        self.textLabel?.numberOfLines = 0
        self.textLabel?.lineBreakMode = .byWordWrapping
        self.layer.borderWidth = 1
        self.backgroundColor = .lightGray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
    }

}
