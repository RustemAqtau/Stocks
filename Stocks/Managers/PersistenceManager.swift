//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Main User on 02.07.2021.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        static let onboardedKey = "hasOnboarded"
        static let watchlistKey = "watchlist"
    }
    
    private init() {}
    
    //MARK: - Public
    
   public var watchlist: [String] {
    if !hasOnboarded {
        userDefaults.setValue(true, forKey: Constants.onboardedKey)
        setupDefaults()
    }
    return userDefaults.stringArray(forKey: Constants.watchlistKey) ?? []
    }
    
    public func addToWatchlist() {
        
    }
    
    public func removeFromWatchlist() {
        
    }
    //MARK: - Private
    
    private var hasOnboarded: Bool {
        return userDefaults.bool(forKey: Constants.onboardedKey)
    }
    
    private func setupDefaults() {
        let map: [String: String] = [
            "AAPL": "Apple Inc",
            "MSFT": "Microsoft Corporation",
            "SNAP": "Snap Inc",
            "GOOG": " Alphabet"
        ]
        let symbols = map.keys.map{ $0 }
        userDefaults.set(symbols, forKey: "watchlist")
        
        for(symbol, name) in map {
            userDefaults.set(name, forKey: symbol)
        }
    }
}
