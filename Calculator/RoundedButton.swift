//
//  RoundedButton.swift
//  Calculator
//
//  Created by Mackenzie Kinzel on 5/14/18.
//  Copyright © 2018 Mackenzie Kinzel. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    func setupView() {
        self.layer.cornerRadius = 10.0
    }
    
    override func awakeFromNib() {
        setupView()
    }
}
