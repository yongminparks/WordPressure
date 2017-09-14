 //
//  gameSceneVC.swift
//  Static.txt
//
//  Created by YMP on 28/10/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation
import UIKit

class gameSceneVC: UIViewController, UITextFieldDelegate{
    //Manager
    var fileMGR: FileManager = FileManager()
    var gameMGR: WordGameManager = WordGameManager()
    var timeDummy: UIView = UIView()
    var threadingMGR: ThreadingClass = ThreadingClass()
    //var
    var goldenraito: CGFloat = (1 + sqrt(5))/2 // Golden Raito
    var goldenraito_inv: CGFloat = 1/( (1 + sqrt(5))/2) //inverse golden raito
    //var str_inputWord = ""
    //UI
    var inputTextField: wordTextField = wordTextField()
    var btn_inputText: UIButton = UIButton()
    var givenWord_btn: givenLabelBtn = givenLabelBtn()
    var nextWord_btn: givenLabelBtn = givenLabelBtn()
    var lbl_givenWordHP: UILabel = UILabel()
    var emptyspace: String = " "
    var lbl_reaction: ReactionLabel = ReactionLabel()
    var lbl_playerStat: playerStatusLbl = playerStatusLbl()
    var lbl_level: levelLbl = levelLbl()
    var gameover_VC: gameoverVC = gameoverVC()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(timeDummy)
        timeDummy.alpha = 0
        //Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 226/255, alpha: 1) //sand fron hu
        
        gameMGR.FileWord_arr = fileMGR.linesFromResource(fileName: "words.txt")
        gameMGR.longWords_arr = sortOutWordsByLength(from_arr: gameMGR.FileWord_arr, min: 8)
        gameMGR.shortWords_arr = sortOutWordsByLength(from_arr: gameMGR.FileWord_arr, min: 3)
        gameMGR.givenWord = gameMGR.longWords_arr.randomItem()
        print("::" + gameMGR.givenWord + ":length: " + String(gameMGR.givenWord.characters.count))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowPrint), name: .UIKeyboardWillShow, object: nil)//in viewDidLoad
        
        //inputTextField.frame(forDictationResultPlaceholder: str_inputWord)
        inputTextField.frame = CGRect(x: inputTextField.frame.minX, y: 1, width: inputTextField.width, height: inputTextField.height)
        inputTextField.center.x = self.view.center.x
        inputTextField.center.y = self.view.center.y + inputTextField.frame.height
        inputTextField.setSelf()
        inputTextField.delegate = self
        self.view.addSubview(inputTextField)
        btn_inputText =  inputTextField.setInputBtn()
        btn_inputText.addTarget(self, action: #selector(inputWord(_:)), for: .touchUpInside)
        self.view.addSubview(btn_inputText)
        
        givenWord_btn.frame = CGRect(x:1/*givenWord_btn.frame.minX*/, y:1, width: inputTextField.frame.width * goldenraito, height: inputTextField.frame.height * goldenraito)
        givenWord_btn.setTitle(gameMGR.givenWord.capitalized, for: .normal)
        givenWord_btn.setSelf()
        //givenWord_btn.sizeToFit()
        //givenWord_btn.titleLabel?.adjustsFontSizeToFitWidth = true
        givenWord_btn.center.y = self.view.center.y/2
        givenWord_btn.center.x = self.view.center.x
        self.view.addSubview(givenWord_btn)
        lbl_givenWordHP = givenWord_btn.setStatusLabel_num()
        setStatusText(lbl_status: lbl_givenWordHP, num: gameMGR.targetHp)
        lbl_givenWordHP.sizeToFit()
        lbl_givenWordHP.center.x = self.view.center.x
        self.view.addSubview(lbl_givenWordHP)
        setPlayerStatLBL()
        setLevelLbl()
    }
    
    func sortOutWordsByLength(from_arr: [String], min: Int) -> [String]{
        var sortedWords: [String] = []
        for word in from_arr{
            if(word.characters.count >= min){
                sortedWords.append(word.lowercased())
            }
        }
        return sortedWords
    }
    func sortOutWordsbyLength(from_arr: [String], min: Int, max:Int) -> [String]{
        var sortedWords: [String] = []
        for word in from_arr{
            if(word.characters.count >= min && word.characters.count <= max){
                sortedWords.append(word.lowercased())
            }
        }
        return sortedWords
    }
    
    func inputWord(_ sender: UIButton){
        if(inputTextField.text != ""){
            checkWordAndEtc()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField.text == nil){
            return false
        }
        else{
            if(inputTextField.text != ""){
                checkWordAndEtc()
            }
            return true;
        }
    }
    
    func setStatusText(lbl_status: UILabel, num: Int){//status text Set
        lbl_status.text = "⎯⎯⎯⎯⎯ " + String(num) + " words left ⎯⎯⎯⎯⎯"
    }
    
    func checkWordAndEtc(){
            gameMGR.typedWord = inputTextField.text!.lowercased()
            gameMGR.typedWords_arr.append(gameMGR.typedWord)
            //inputTextField.resignFirstResponder()
            inputTextField.text = ""
            print("GSVC.typed word: " + gameMGR.typedWord)
        if(gameMGR.isCorrect()){
        //if(gameMGR.isIncluded(source: gameMGR.typedWord, target: gameMGR.givenWord) && gameMGR.isProperWord(source_arr: gameMGR.shortWords_arr, target: gameMGR.typedWord)){
            gameMGR.CorrectProcess()
            self.reactToCurrect()
        }
        else{
            gameMGR.WrongProcess()
            self.reactToWrong()
        }
        if(gameMGR.isGameover()){
            pushToGameover()
        }
    }
    //set UI components
    func setReactionLBL(){
        lbl_reaction.frame = CGRect(x: 1, y: 1, width: self.view.frame.width, height: self.view.frame.height/4)
        lbl_reaction.center.x = self.view.center.x
        lbl_reaction.center.y = self.view.center.y/2
        self.view.addSubview(lbl_reaction)
        lbl_reaction.setSelf()
    }
    func setPlayerStatLBL(){
        lbl_playerStat.frame = CGRect(x: 11, y: 11, width: self.inputTextField.width, height: self.inputTextField.height)
        lbl_playerStat.center.x = self.view.center.x
        lbl_playerStat.center.y = inputTextField.center.y - self.inputTextField.frame.height
        lbl_playerStat.setView()
        lbl_playerStat.setHp(hp: gameMGR.playerHp)
        self.view.addSubview(lbl_playerStat)
    }
    func setLevelLbl(){
        lbl_level.frame = CGRect(x: 11, y: 11, width: self.inputTextField.width, height: self.inputTextField.height)
        lbl_level.center.x = self.view.center.x
        lbl_level.center.y = inputTextField.center.y - self.inputTextField.frame.height
        lbl_level.setView()
        lbl_level.setLevel(lvl: gameMGR.level)
        self.view.addSubview(lbl_level)
    }
    
    func setGameoverVC(){
        gameover_VC.view.frame = CGRect(x: 1, y: 1, width: self.view.frame.width - 40, height: self.view.frame.height - 40)
        gameover_VC.view.center = self.view.center
        gameover_VC.setMSG()
        self.view.addSubview(gameover_VC.view)
    }
    
    //push to other controller
    func pushToGameover(){
        gameover_VC.OVER_gameMGR = self.gameMGR
        self.navigationController?.pushViewController(gameover_VC, animated: true)
    }
    //react UI
    func reactToCurrect(){
        setStatusText(lbl_status: lbl_givenWordHP, num: gameMGR.targetHp)
        setReactionLBL()
        gameMGR.rightWords_arr.append(gameMGR.typedWord)
        
        if(gameMGR.shouldLevelup()){
            gameMGR.levelup()
            //threadingMGR.runSleep(timeunit: 0.7, amount: 1)
            LevelupProcess()
        }
        else{
            lbl_reaction.reactToCorrect()
        }
    }
    func reactToWrong(){
        setStatusText(lbl_status: lbl_givenWordHP, num: gameMGR.targetHp)
        setReactionLBL()
        lbl_playerStat.setHp(hp: gameMGR.playerHp)
        self.view.addSubview(self.lbl_reaction)
        if(!gameMGR.isProperWord()){
            gameMGR.appendNotwordReact()
            lbl_reaction.reactToNotWord()
            print("notword!")
        }
        else if(!gameMGR.isntSourceWord()){
            lbl_reaction.reactToSourceWord()
            print("sourceWord!")
        }
        else if(!gameMGR.isntRepeated()){
            lbl_reaction.reactToRepeated()
            print("repeated!")
        }
        else{
            lbl_reaction.reactToWrong()
        }
    }
    
    //level UI
    func LevelupProcess(){
        print("gamescene.lvlup")
        self.view.addSubview(givenWord_btn)
        setReactionLBL()
        givenWord_btn.goawayLeft()
        //givenWord_btn.removeFromSuperview()
        lbl_reaction.reactToLevelup()
        //bringToCenter
        givenWord_btn.setTitle(gameMGR.givenWord.capitalized, for: .normal)
        setStatusText(lbl_status: lbl_givenWordHP, num: gameMGR.targetHp)
        givenWord_btn.frame = CGRect(x:self.view.frame.maxX + 20, y:givenWord_btn.frame.minY, width: givenWord_btn.frame.width, height: givenWord_btn.frame.height)
        givenWord_btn.setSelf()
        bringToCenter(target: givenWord_btn)
        lbl_level.setLevel(lvl: gameMGR.level)
    }
    func bringToCenter(target: UIView){
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 20, initialSpringVelocity: 20, options: UIViewAnimationOptions.curveEaseOut, animations:{
            target.frame = CGRect(x:self.view.frame.midX - (target.frame.width/2), y:target.frame.minY, width: target.frame.width, height: target.frame.height)
        },completion: { _ in
        })
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

extension Array {
    //http://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension Array {
    //http://stackoverflow.com/questions/27259332/get-random-elements-from-array-in-swift
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        indices.dropLast().forEach { a in
            guard case let b = Int(arc4random_uniform(UInt32(count - a))) + a, b != a else { return }
            swap(&self[a], &self[b])
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
