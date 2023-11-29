import Foundation
import UIKit
class Connectivity {

    static let shared: Connectivity = Connectivity()

    private var currentConnected: Bool = true

    public var isConnected: Bool {
        return currentConnected
    }

    private init() {

    }

    public func manageInternetConnectionState() {

        self.currentConnected = !(reachability.connection == .unavailable)
        Logger.log("manageInternetConnectionState:: ", self.currentConnected)

        // Start the notifier for the internet connections.
        do {
            try reachability.startNotifier()
        } catch {
            Logger.log("Unable to start notifier")
        }

        reachability.whenUnreachable = { _ in
            // Internet is NOT connected.
            Logger.log("Not reachable")
            self.currentConnected = false
            AlertMesage.showInternetNotConnected(message: "No interbet connection")
        }

        reachability.whenReachable = { _ in
            // Internet is connected.
            Logger.log("Internet Connected")
            self.currentConnected = true
        }

    }



}
