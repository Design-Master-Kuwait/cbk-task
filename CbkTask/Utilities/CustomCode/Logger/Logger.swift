import Foundation

// let log = SwiftyBeaver.self

/// Manage to log of task with debug and staging 
class Logger {

    class func log(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function: String = #function, line: Int = #line) {

        #if DEBUG || STAGING

        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        //        let queue = Thread.isMainThread ? "UI" : "BG"
        let gFormatter = DateFormatter()
        gFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS Z"
        let timestamp = gFormatter.string(from: Date())

        items.forEach { item in
            //            Swift.print(">>> \(timestamp) {\(queue)} \(fileURL) > \(function)[\(line)]: \(item)", separator: separator, terminator: terminator)
            Swift.print("\(timestamp) | \(fileURL) > \(function)[\(line)] : \(item)", separator: separator, terminator: terminator)
        }

        #endif

    }

}
