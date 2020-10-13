//
//  String.swift
//  Podtube
//
//  Created by Corey Burgin on 10/12/20.
//

import Foundation


extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
