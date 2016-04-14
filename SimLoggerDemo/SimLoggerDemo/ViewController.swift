//
//  ViewController.swift
//  SimLoggerDemo
//
//  Created by LouisHuang on 2016/4/13.
//  Copyright © 2016年 LouisHuang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Get static instance of Simlogger
    let log = SimLogger.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func actionPrintDebug(sender: UIButton) {
        log.debug("It's debug")
    }
    @IBAction func actionPrintInfo(sender: UIButton) {
        log.info("It's info")
    }
    @IBAction func actionPrintWarning(sender: UIButton) {
        log.warning("It's warning")
    }
    @IBAction func actionPrintError(sender: UIButton) {
        log.error("It's error")
    }
}

