//
//  ScoreHeader.swift
//  Millionaire
//
//  Created by Shisetsu on 31.08.2021.
//

import UIKit

class ScoreHeader: UIView {

    lazy var headerView: UIView = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let header = UIView(frame: CGRect(x: 30, y: 20, width: screenSize.width, height: 42))
        header.backgroundColor = UIColor.lightGray
        header.alpha = 0.5
        
        let label = UILabel(frame: CGRect(x: 4, y: 4, width: screenSize.width, height: 20))
        label.textColor = .black
        label.text = "Таблица рекордов"
        label.textAlignment = .center
        header.addSubview(label)
        
        return header
    }()

}
