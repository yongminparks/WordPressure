//
//  wordTextFieldVC.swift
//  Static.txt
//
//  Created by YMP on 28/10/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class wordTextField: UITextField ,UITextFieldDelegate{
    var width: CGFloat = 200
    var height: CGFloat = 40
    
    //wrong init
//        self.frame = CGRect(x: super.frame.midX - (self.width/2), y: super.frame.maxY - self.height - 10, width: self.width, height: self.height)
    
//    init() {
//        self.layerconorRadious = 7
//    }
    
    func setSelf(){
        self.layer.cornerRadius = 7
        self.font = UIFont(name: "Menlo", size: 20)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 252/255, green: 129/255, blue: 97/255, alpha: 1).cgColor//red from hu//to CGColor
        self.backgroundColor = UIColor.white
        self.textAlignment = .center
    }
    
    func setInputBtn() -> UIButton{
        let btn_inputBtn: UIButton = UIButton()
        btn_inputBtn.center = self.center
        btn_inputBtn.frame = CGRect(x: self.frame.maxX - self.frame.height + 5, y: self.frame.minY + 5, width: self.height - 10, height: self.frame.height - 10)
        btn_inputBtn.backgroundColor = UIColor(red: 252/255, green: 129/255, blue: 97/255, alpha: 1)//red from hu//CGcolor
        btn_inputBtn.layer.cornerRadius = 5
        btn_inputBtn.setTitle("↵", for: .normal)
        btn_inputBtn.setTitleColor(UIColor.white, for: .normal)
        return btn_inputBtn
    }
}
