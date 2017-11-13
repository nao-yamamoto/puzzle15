//
//  MyButton.swift
//  Puzzle15
//
//  Created by Naoyuki YAMAMOTO on 2017/11/13.
//  Copyright © 2017年 山本尚幸. All rights reserved.
//

import UIKit

class MyButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
}
