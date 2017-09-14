//
//  levelLbl.swift
//  WordPressure
//
//  Created by YMP on 10/11/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class levelLbl: UILabel{
    
    func setView(){
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)
        self.textAlignment = .right
        self.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        self.textColor = UIColor.black//red from hu//to CGColor
        self.alpha = 1.0
    }
    
    func setLevel(lvl: Int){
        self.text = String("Lv: " + String(lvl) + " ")
    }
}

