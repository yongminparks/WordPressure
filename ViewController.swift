//
//  ViewController.swift
//  WordPressure
//
//  Created by YMP on 25/10/2016.
//  Copyright © 2016 YMP. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //button value
    var bootBtn: UIButton = UIButton()
    var bootBtn_shad: UIView = UIView()
    let bootBtnRadi: CGFloat = 150
    //bv--------
    
    //guitar size value-----
    let topMargin: CGFloat = 20
    let bottomMargin: CGFloat = 20
    let stringGap: CGFloat = (414 - 20 - 20)/5
    //let stringGap: CGFloat = (414 - topMargin - bottomMargin)/5 // why don't you work?
    //let fretWidth: CGFloat =
    //gsv-----------------
    
    var Yongmin: UILabel = UILabel()
    var timeDummy:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //start scene
        
        print("width: \(self.view.frame.width)")
        print("height: \(self.view.frame.height)\n")
        
        print(UIFont.familyNames)
        
        //self.view.backgroundColor = UIColor(red: 245/255, green: 165/255, blue: 3/255, alpha: 1)//orange fron callme
        //self.view.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 226/255, alpha: 1)//sand fron hu
        
        self.view.backgroundColor = UIColor.white
        
        Yongmin.text = "Yongmin.Park"
        Yongmin.sizeToFit()
        Yongmin.textAlignment = .center
        //Yongmin.font = UIFont.systemFont(ofSize: 35)
        Yongmin.font = UIFont(name: "HelveticaNeue-Ultralight", size: 45)
        Yongmin.frame = CGRect(x: self.view.frame.midX - 200, y: self.view.frame.midY - 50, width: 400, height: 100)
        Yongmin.center = self.view.center
        Yongmin.textColor = UIColor.black
        Yongmin.alpha = 0
        self.view.addSubview(Yongmin)
        self.view.addSubview(timeDummy)
        timeDummy.alpha = 0
        
        //1초 안에 animations: 안에 있는 것들을 완료하겠다는 뜻
        UIView.animate(withDuration: 1.5, animations: {
            self.Yongmin.alpha = CGFloat(1);
        })
        
        UIView.animate(withDuration: 0.01, animations: {
            self.timeDummy.alpha = 1
            }, completion: { _ in
                print("::push << game scene\n")
                self.navigationController?.pushViewController(gameSceneVC(), animated: true)//Start Title push
                //let fileMGR: FileManager = FileManager()
                //let wordArray: [String] = fileMGR.linesFromResource(fileName: "words.txt")
        })
        //Do any additional setup after loading the view, typically from a nib.
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //
    //    var myStartTitleVC: StartTitleVC = StartTitleVC()
    //
    //    var startTitleLabel: UILabel = UILabel()
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        //start scene
    //
    //        self.view.backgroundColor = UIColor(red: 245/255, green: 165/255, blue: 3/255, alpha: 1)//orange fron callme
    //        //self.navigationController?.pushViewController(StartTitleVC(), animated: false)
    //
    //        // Do any additional setup after loading the view, typically from a nib.
    //
    //    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //
    //    }
    //
    //    func buttonClick(sender:UIButton) {
    //        let vc = ViewController()
    //        self.presentViewController(vc, animated: true, completion: {(_) -> Void in//뷰전환이 일어나면 뭐할지(이 예시는 제목 설정)
    //            vc.title = "ababab"
    //        })
    //        self.navigationController?.pushViewController(vc, animated: true)//설정같은 스택 구조 푸시, 팝 가능
    //    }
    //
    //    override func viewDidAppear(animated: Bool) {
    //
    //    }
    
}

