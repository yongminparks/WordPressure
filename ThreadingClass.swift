//
//  ThreadingClass.swift
//  Single_UIStudy
//
//  Created by YMP on 2016. 7. 27..
//  Copyright © 2016년 YMP. All rights reserved.
//

import Foundation
import UIKit

class ThreadingClass: NSObject{
    
    var thread: Thread!
    var thisThread: Thread!
    var eventCnt: Int!
    var scroll: UIScrollView!
    
    func runLoop(){
        while Thread.current.isCancelled == false {
            Thread.sleep(forTimeInterval: 0.1)
            // print("scroll")
        }
    }
    
    func runSleep(interval: Double){
        while Thread.current.isCancelled == false {
            Thread.sleep(forTimeInterval: TimeInterval(interval))
            print("sleeping:")
        }
    }
    
    func runSleep(timeunit: Double, amount: Int){
        for _ in 1...amount {
            Thread.sleep(forTimeInterval: TimeInterval(timeunit))
            print(":::sleeping:::::")
        }
    }

    override init(){
        super.init()
        self.thread = Thread(target: self, selector: #selector(ThreadingClass.runLoop), object: nil)
        self.thisThread = Thread.current
        
        self.thread.start()
    }

    
}
