//
//  givenLabel.swift
//  WordPressure
//
//  Created by YMP on 30/10/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class givenLabelBtn: UIButton{
    
    func setSelf(){
        self.backgroundColor = UIColor(red: 255/255, green: 253/255, blue: 246/255, alpha:1)//H button color
        self.layer.cornerRadius = 10
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont(name: "Helvetica", size: 30)
        self.setTitleColor(UIColor.black, for: .normal)
        //self.sizeToFit()//fit size by text
        //givenWord_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setShadow()
    }
    func setShadow(){//from web
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 0.0
        self.layer.shadowOpacity = 1.0
    }
    func setStatusLabel_num() -> UILabel{
        let lbl_status: UILabel = UILabel()
        lbl_status.frame = CGRect(x:1, y:1, width: self.frame.width, height:self.frame.height)
        lbl_status.center.x = self.center.x
        lbl_status.center.y = self.center.y + self.frame.height + 10
        lbl_status.font = UIFont(name: "Arial Rounded MT Bold", size: 18)
        lbl_status.textAlignment = .center
        return lbl_status
    }
    func setStatusText(lbl_status: UILabel, num: Int){
        lbl_status.text = "⎯⎯⎯⎯ " + String(num) + " words left ⎯⎯⎯⎯"
    }
    
    //level
    func goawayLeft(){
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 20, initialSpringVelocity: 20, options: UIViewAnimationOptions.curveEaseOut, animations:{
            self.frame = CGRect(x:self.frame.minX - (self.frame.width * 2.0), y:self.frame.minY, width: self.frame.width, height: self.frame.height)  // self.btn_Quiz.frame = CGRect(x: self.view.frame.midX - (modeBtn_width/2), y: btn_Quiz_minY, width: modeBtn_width, height: modeBtn_height)
        },completion: { _ in
        })
    }
    func bringToCenter(){
    }
}
