//
//  CGSize+Ext.swift
//  CoverRemover
//
//  Created by Mohsen on 8/27/24.
//

import SwiftUI

extension CGSize {
    static func +(_ lhs: Self, _ rhs: Self) -> Self {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    static func -(_ lhs: Self, _ rhs: Self) -> Self {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
}
