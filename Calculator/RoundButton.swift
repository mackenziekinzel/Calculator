//
//  RoundButton.swift
//  Calculator
//
//  Created by Mackenzie Kinzel on 5/14/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    func setupView() {
            self.layer.cornerRadius = 15.0
    }
    
    override func awakeFromNib() {
        setupView()
    }
}
