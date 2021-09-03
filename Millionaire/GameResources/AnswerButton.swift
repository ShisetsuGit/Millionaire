//
//  AnswerButton.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import UIKit

class AnswerButton: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        self.layer.borderWidth = 2
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 35
    }
}
