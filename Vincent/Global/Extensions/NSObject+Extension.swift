//
//  NSObject+Extension.swift
//  Vincent
//
//  Created by COBY_PRO on 2022/10/06.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
