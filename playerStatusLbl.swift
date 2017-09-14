//
//  playerStatusLbl.swift
//  WordPressure
//
//  Created by YMP on 01/11/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class playerStatusLbl: UILabel{
    
    func setView(){
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.0)
        self.textAlignment = .left
        self.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        self.textColor = UIColor(red: 252/255, green: 129/255, blue: 97/255, alpha: 1)//red from hu//to CGColor
        self.alpha = 1.0
        //❤️💔
    }
    
    func setHp(hp: Int){
        self.text = String("[ Chance: " + String(hp) + " ]")
    }
}
