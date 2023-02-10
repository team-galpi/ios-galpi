//
//  Color+Extension.swift
//  galpi
//
//  Created by Ellen J on 2023/02/09.
//

import SwiftUI

extension Color {
    
    init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, opacity: a)
    }
    
}
