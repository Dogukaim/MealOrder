//
//  String+Ext.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
