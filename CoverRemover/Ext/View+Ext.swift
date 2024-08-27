//
//  View+Ext.swift
//  CoverRemover
//
//  Created by Mohsen on 8/27/24.
//

import SwiftUI
import Combine

extension View {
    func vAlign(_ alignment: Alignment) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment)
    }

    func hAlign(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
