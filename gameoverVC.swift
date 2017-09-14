//  gameoverVC.swift
//  WordPressure
//
//  Created by YMP on 02/11/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class gameoverVC: UIViewController{
    //var
    var goldenraito: CGFloat = (1 + sqrt(5))/2// Golden Raito
    var goldenraito_inv: CGFloat = 1/( (1 + sqrt(5))/2 )//inverse golden raito

    var TF_width: CGFloat = 200
    var TF_height: CGFloat = 40
    //
    public var OVER_gameMGR: WordGameManager = WordGameManager()
    var threadingMGR: ThreadingClass = ThreadingClass()
    //var myGameScene: gameSceneVC
    
    //UI
    var btn_gameoverTitle: givenLabelBtn = givenLabelBtn()
    var lbl_gameoverMSG: UILabel = UILabel()
    var lbl_result: UILabel = UILabel()
    var lbl_border: UILabel = UILabel()
    var inputTextField: wordTextField = wordTextField()// for var
//    func setGameScene(scene: gameSceneVC){
//        self.myGameScene = scene
//    }
    override func viewDidLoad(){
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)//sand fron hu

        btn_gameoverTitle.setSelf()
        btn_gameoverTitle.frame = CGRect(x:self.view.frame.maxX + 20, y:25, width: inputTextField.width * goldenraito, height: inputTextField.height * goldenraito)
//        btn_gameoverTitle.frame = CGRect(x:self.view.frame.maxX + 20, y:25, width: inputTextField.width * goldenraito, height: inputTextField.height * goldenraito)
        btn_gameoverTitle.center.y = self.view.center.y/2
        btn_gameoverTitle.setTitle("GAME OVER", for: .normal)
        btn_gameoverTitle.titleLabel?.font = UIFont(name: "Helvetica", size: 35)
        btn_gameoverTitle.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(btn_gameoverTitle)
        //bring btn()

        lbl_gameoverMSG.numberOfLines = 0
//        lbl_gameoverMSG.center = self.view.center
//        lbl_gameoverMSG.center.x = self.view.center.x
//        lbl_gameoverMSG.center.y = self.view.center.y
        lbl_gameoverMSG.textColor = UIColor.white
        lbl_gameoverMSG.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40)
        lbl_gameoverMSG.text = OVER_gameMGR.gameoverMSG_arr.randomItem()
        lbl_gameoverMSG.sizeToFit()
        lbl_gameoverMSG.textAlignment = .left
        lbl_gameoverMSG.frame = CGRect(x: 20, y: self.view.frame.midY - lbl_gameoverMSG.frame.height/2, width: self.view.frame.width - 30, height: lbl_gameoverMSG.frame.height)
        lbl_gameoverMSG.adjustsFontSizeToFitWidth = true
        self.view.addSubview(lbl_gameoverMSG)
        
        lbl_result.frame = CGRect(x: 20, y: 20, width: self.view.frame.width * goldenraito_inv * goldenraito_inv, height: self.view.frame.height * goldenraito_inv * goldenraito_inv)
        lbl_result.center.x = self.view.center.x
        lbl_result.center.y = self.view.center.y / 4
        lbl_result.textColor = UIColor.white
        self.view.addSubview(lbl_result)
        
        //bringGameoverBtn()
    }
    override func viewDidAppear(_ animated: Bool) {
        threadingMGR.runSleep(timeunit: 0.5, amount: 1)
        bringGameoverBtn()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        UIApplication.shared.statusBarStyle = .default
//        
//    }
    
    func setMSG(msg: String){
        lbl_gameoverMSG.text = msg
    }
    func setMSG(){
        lbl_gameoverMSG.text = OVER_gameMGR.gameoverMSG_arr.randomItem()
    }
    func setResult(lvl: String){
        lbl_result.text = lvl
    }
    
    func setReault(){
        lbl_result.text = String(OVER_gameMGR.level)
    }
    
    func bringGameoverBtn(){
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 20, initialSpringVelocity: 20, options: UIViewAnimationOptions.curveEaseOut, animations:{
            print("gmover:bringBTN()")
            self.btn_gameoverTitle.frame = CGRect(x:self.view.frame.midX - (self.btn_gameoverTitle.frame.width/2), y:self.btn_gameoverTitle.frame.minY, width: self.inputTextField.width * self.goldenraito, height: self.inputTextField.height * self.goldenraito)  //            self.btn_Quiz.frame = CGRect(x: self.view.frame.midX - (modeBtn_width/2), y: btn_Quiz_minY, width: modeBtn_width, height: modeBtn_height)
        },completion: { _ in
        })
//        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 20, initialSpringVelocity: 20, options: UIViewAnimationOptions.curveEaseOut, animations:{
//            self.btn_Quiz.frame = CGRect(x: self.view.frame.midX - (modeBtn_width/2), y: btn_Quiz_minY, width: modeBtn_width, height: modeBtn_height)
//        },completion: { _ in
//            self.btn_Quiz.addTarget(self, action: #selector(self.pushToQuizVC(_:)), for: .touchUpInside)
//        })
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
