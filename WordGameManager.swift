//
//  wordGameManager.swift
//  WordPressure
//
//  Created by YMP on 30/10/2016.
//  Copyright © 2016 YMP. All rights reserved.
//

import Foundation

class WordGameManager{
    var FileWord_arr: [String]! = ["!no FileWordArray!"]
    var longWords_arr: [String] = []
    var givenWord: String = String()
    var givenWordChar_arr: Array! = []
    var shortWords_arr: [String] = []
    public var typedWords_arr: [String] = []
    public var rightWords_arr: [String] = []
    public var typedWord: String = "class.default"
    
    //forUI message
        //wrong
    var reactNotWord_arr: [String] = []
    var reactNotWordFast_arr: [String] = []
    var reactRepeated_arr: [String] = []
    var reactSourceWord_arr: [String] = []
        //correct
    public var reactCorrect_arr: [String] = []
    var reactLevelup_arr: [String] = []
        //gameover
    var gameoverMSG_arr: [String] = []
    
    //subject status
    public var targetFullHp: Int = 3
    public var targetHp: Int
    public var playerFullHp: Int = 4
    public var playerHp: Int
    
    public var level: Int = 1
    
    init(){
        targetHp = targetFullHp
        playerHp = playerFullHp
        
        reactCorrect_arr.append("Good 👍")
        reactCorrect_arr.append("Correct 👏")
        reactCorrect_arr.append("Nice 😂")
        reactCorrect_arr.append(" That was clever 🙂 ")
        reactCorrect_arr.append("Cool 😎")
        reactCorrect_arr.append("Neat 😊")
        
        reactNotWordFast_arr.append("IT'S")
        reactNotWordFast_arr.append("NOT")
        reactNotWordFast_arr.append("EVEN")
        reactNotWordFast_arr.append("A WORD")
        
        reactNotWord_arr.append("Not a word 😨")
        reactNotWord_arr.append("Nonsence 😰")
        reactNotWord_arr.append(" Are you drunk? 😵 ")
        reactNotWord_arr.append("Are you high? 😲")

        reactRepeated_arr.append("Don't repeat 😣")
        reactRepeated_arr.append(" Already did that 😖")
        reactRepeated_arr.append(" I already saw that 😫 ")
        reactRepeated_arr.append(" I've already seen that 😩")
        
        reactSourceWord_arr.append(" Are you a parrot? 😠 ")
        reactSourceWord_arr.append(" That's question, not an answer ☹️ ")
        
        gameoverMSG_arr.append("That's not your fault,😥\n" + "It's based on luck.")
        gameoverMSG_arr.append("Don't be to sad,😢\n" + "It's based on luck.")
        
        reactLevelup_arr.append("Level Up")
        reactLevelup_arr.append("Level++")
        reactLevelup_arr.append("Next Level")
    }
    
    func isProperWord(source_arr: [String], target: String) -> Bool{
        var flag = false
        if(source_arr.contains(target)){
            flag = true
        }
        return flag
    }
    func isIncluded(source: String, target: String) -> Bool{//need fixed
        //var target_arr = target.characters
        var flag = true
//        let source_index = source.characters.count - 1
//        let target_index = target.characters.count - 1
        let source_arr = Array(source.characters)
        var target_arr = Array(target.characters)

//        for s in 0...source_index{
//            for t in 0...target_index{
//                if(source_arr[s] == target_arr[t]){
//                    target_arr.remove(at: t)
//                    flag = true
//                }
//            }
//        }
        
        for s_letter in source_arr{
            for t_letter in target_arr{
                if(s_letter == t_letter){
                    target_arr.remove(object: t_letter)
                    flag = true
                }
                else{
                    flag = false
                    break
                }
            }
        }
        return flag
    }
    
    func isProperWord()-> Bool{
        var flag = false
        if(shortWords_arr.contains(typedWord)){
            flag = true
        }
        return flag
    }
    func isIncluded() -> Bool{//real one
        var flag = false
    
        let source_arr = Array(givenWord.characters)
        var target_arr = Array(typedWord.characters)
    
        for t_letter in target_arr{
            if(source_arr.contains(t_letter)){
                target_arr.remove(object: t_letter)
                flag = true
            }
            else{
                flag = false
                break
            }
        }
        return flag
    }
    func isntRepeated() -> Bool{
        if(!rightWords_arr.contains(typedWord)){
            return true
        }
        else{
            return false
        }
    }
    func isntSourceWord() -> Bool{
        if(typedWord == givenWord){
            return false
        }
        else{
            return true
        }
    }
    
    func isCorrect() -> Bool{
        if(isProperWord() && isIncluded() && isntRepeated() && isntSourceWord()){
            return true
        }
        else{
            return false
        }
    }
    
    func isGameover() -> Bool{
        if(playerHp <= 0){
            return true
        }
        else{
            return false
        }
    }
    //level
    func shouldLevelup() -> Bool{
        if(targetHp <= 0){
            return true
        }
        else{
            return false
        }
    }
    func levelup(){
        level += 1
        targetHp = targetFullHp
        givenWord = longWords_arr.randomItem()
        rightWords_arr.removeAll()
    }
    
    func CorrectProcess(){
        targetHp -= 1
        rightWords_arr.append(typedWord)
        print("correct!")
    }
    func WrongProcess(){
        playerHp -= 1
        print("p Hp: " + String(playerHp))
    }
    
    func appendNotwordReact(){
        self.reactNotWord_arr.append(self.typedWord + "? are you drunk?")
        self.reactNotWord_arr.append(self.typedWord + "? Are you high?")
    }
}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
