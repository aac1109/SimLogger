//
//  SimLogger.swift
//  SimLoggerDemo
//
//  Created by LouisHuang on 2016/4/14.
//  Copyright © 2016年 LouisHuang. All rights reserved.
//

import UIKit

enum LogLevel:Int {
    case Debug = 0
    case Info
    case Warning
    case Error
}

class SimLogger: NSObject {
    static let instance = SimLogger()
    var level:Int = LogLevel.Info.rawValue  // Default level: Info
    
    class func getInstance() -> SimLogger {
        return instance
    }
    
    func setLevel(logLevel: LogLevel) {
        self.level = logLevel.rawValue
    }
    
    func debug(@autoclosure closure: () -> String?, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        printLog(LogLevel.Debug, fileName: fileName, functionName: functionName, lineNumber: lineNumber, closure: closure)
    }
    
    func info(@autoclosure closure: () -> String?, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        printLog(LogLevel.Info, fileName: fileName, functionName: functionName, lineNumber: lineNumber, closure: closure)
    }
    
    func warning(@autoclosure closure: () -> String?, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        printLog(LogLevel.Warning, fileName: fileName, functionName: functionName, lineNumber: lineNumber, closure: closure)
    }
    
    func error(@autoclosure closure: () -> String?, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        printLog(LogLevel.Error, fileName: fileName, functionName: functionName, lineNumber: lineNumber, closure: closure)
    }
    
    private func getCurrentTime() -> String {
        let currentTimeInterval = NSDate().timeIntervalSince1970
        let currentDate = NSDate(timeIntervalSince1970: currentTimeInterval)
        let dateFormatterDate = NSDateFormatter()
        dateFormatterDate.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let time = dateFormatterDate.stringFromDate(currentDate)
        return time
    }
    
    private func printLog(logLevel: LogLevel, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line, @noescape closure: () -> String?) {
        if logLevel.rawValue >= self.level  {
            var icon:String
            var type:String
            switch logLevel {
            case LogLevel.Debug:
                icon = "🌀"
                type = "Debug"
            case LogLevel.Info:
                icon = "🍀"
                type = "Info"
            case LogLevel.Warning:
                icon = "⚠️"
                type = "Warning"
            case LogLevel.Error:
                icon = "❌"
                type = "Error"
            }
            
            // Get time stamp
            let time = getCurrentTime()
            
            // Remove parameter part of function name
            var finalFunctionName = functionName
            if let leftParenthesisPosition = functionName.characters.indexOf("(") {
                finalFunctionName = functionName.substringToIndex(leftParenthesisPosition)
            }
            
            if let logMessage = closure() {
                let filePath:NSURL = NSURL(string: fileName)!
                print("\(icon)\(time) [\(type)][\(filePath.lastPathComponent!)][\(finalFunctionName)-\(lineNumber)] \(logMessage)")
            }
        }
    }
}
