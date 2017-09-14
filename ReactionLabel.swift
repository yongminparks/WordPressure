//
//  ReactionLabel.swift
//  WordPressure
//
//  Created by YMP on 01/11/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class ReactionLabel: UILabel{
    //width = superview width
    //height = super
    var threadingMGR: ThreadingClass = ThreadingClass()
    var React_gameMGR: WordGameManager = WordGameManager()
    var timeDummy: UIView = UIView()
    
    func setSelf(){
        timeDummy.frame = CGRect(x: 1, y: 1, width: 1, height: 1)
        timeDummy.alpha = 0.0
        self.addSubview(timeDummy)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.alpha = 0.0
        self.textAlignment = .center
        self.font = UIFont(name: "Helvetica", size: 45)
        //self.font = UIFont(name: "HelveticaNeue-UltraLight", size: 45)
        self.textColor = UIColor.white
        self.adjustsFontSizeToFitWidth = true
    }
    
    func fadeInAndOut(){
        print("react.alpha before fadein: " + String(describing: self.alpha))
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = CGFloat(1.0)
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            }, completion: { _ in
                self.threadingMGR.runSleep(timeunit: 0.3, amount: 1)
                UIView.animate(withDuration: 0.3, animations: {
                    self.alpha = CGFloat(0.0)
                    }, completion: { _ in
            })
        })
        print("react.alpha after fadeout: " + String(describing: self.alpha))
    }
    
    func fadeInAndOutFast(){
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = CGFloat(1.0)
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.alpha = CGFloat(0.0)
                    self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
                    }, completion: { _ in
                        print("fast")
                })
        })
    }
    
    func reactToCorrect(){
        self.text = React_gameMGR.reactCorrect_arr.randomItem()
        fadeInAndOut()
    }
    func reactToWrong(){
        self.text = "Wrong"
        fadeInAndOut()
    }
    func reactToNotWord(){
//        for msg in React_gameMGR.reactNotWordFast_arr{
//            self.text = msg
//            fadeInAndOutFast()
//        }
        self.text = React_gameMGR.reactNotWord_arr.randomItem()
        fadeInAndOut()
    }
    func reactToRepeated(){
        self.text = React_gameMGR.reactRepeated_arr.randomItem()
        fadeInAndOut()
    }
    func reactToSourceWord(){
        self.text = React_gameMGR.reactSourceWord_arr.randomItem()
        fadeInAndOut()
    }
    func reactToLevelup(){
        self.text = React_gameMGR.reactLevelup_arr.randomItem()
        fadeInAndOut()
    }
    
    func sleepByDummy(time: Double){
        UIView.animate(withDuration: time, animations: {
            self.timeDummy.center.x = 100
            }, completion: { _ in
        })
        self.timeDummy.alpha = 0.0
    }
}
