//
//  MainmenuVC.swift
//  WordPressure
//
//  Created by YMP on 27/11/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class MainMenuVC: UIViewController, UITextFieldDelegate{
    //Manager
    var fileMGR: FileManager = FileManager()
    var timeDummy: UIView = UIView()
    var threadingMGR: ThreadingClass = ThreadingClass()
    var inputTextField: wordTextField = wordTextField()
    //var
    var goldenraito: CGFloat = (1 + sqrt(5))/2 // Golden Raito
    var goldenraito_inv: CGFloat = 1/( (1 + sqrt(5))/2) //inverse golden raito
    //var str_inputWord = ""
    //UI
    var btn_Title: UIButton = UIButton()
    var btn_start: UIButton = UIButton()
    var btn_help: UIButton = UIButton()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(timeDummy)
        timeDummy.alpha = 0
        //Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 226/255, alpha: 1) //sand fron hu
        
        btn_Title.frame = CGRect(x: 1, y: 1, width: inputTextField.width*goldenraito, height: inputTextField.height*goldenraito)
        btn_Title.setTitle("WordPressure", for: .normal)
        btn_Title.titleLabel?.textAlignment = .center
        btn_Title.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 45)
        btn_Title.center.x = self.view.center.x
        btn_Title.center.y = self.view.center.y/2
        
        
        
    }
    

    ////////////////////////////////////
    func functionToPassAsAction(){
        //http://stackoverflow.com/questions/25369412/swift-pass-data-through-navigation-controller
        var controller: UINavigationController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "NavigationVCIdentifierFromStoryboard") as! UINavigationController
        //controller.yourTableViewArray = localArrayValue
        self.present(controller, animated: true, completion: nil)
    }
    
    func sleepByDummy(time: Double){
        UIView.animate(withDuration: time, animations: {
            self.timeDummy.alpha = 1
        }, completion: { _ in
        })
    }
    
    func keyboardWillShow(notification:NSNotification) -> CGFloat{
        //http://stackoverflow.com/questions/31774006/how-to-get-height-of-keyboard-swift
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)//in viewDidLoad
        
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        return keyboardHeight
    }
    
    func keyboardWillShowPrint(notification: NSNotification){
        //http://stackoverflow.com/questions/31774006/how-to-get-height-of-keyboard-swift
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
