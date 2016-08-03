# SimLogger
Simple iOS logger in Swift. Print log with time stamp, log level, file name, function name, and line number. Additionally, level icon is added at the head of the log to make you recognize level easily.

##Example
<img src="https://raw.githubusercontent.com/aac1109/SimLogger/master/SimLoggerExample.png" alt="Example" style="width: 690px;" />

##Usage
###Step 1
Drag Simlogger.swift into your project


###Step 2
In AppDelegate

* Get the static instance of SimLogger
```Swift
let log = SimLogger.getInstance()
```

* Set log level

There are four levels from low to high: ***Debug***, ***Info***, ***Warning***, ***Error***. Log will be printed with the log level higher or equal to the setting level.

In
```Swift 
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) 
```
Set log level with
```Swift
log.setLevel(LogLevel.Debug)
```


###Step 3
General use in any class

* Get the static instance of SimLogger
```Swift
let log = SimLogger.getInstance()
```
* There are four methods you can use
```Swift
log.debug("It's debug")
log.info("It's info")
log.warning("It's warning")
log.error("It's error”)
```
#####Enjoy it!

