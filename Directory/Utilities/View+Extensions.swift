//
//  View+Extensions.swift
//  Directory
//
//  Created by ANSK Vivek on 05/09/23.
//

import SwiftUI

enum FrameAlignment {
    case top, bottom, leading, trailing, center
}

extension View {
    
    @ViewBuilder
    func alignment(_ alignment: FrameAlignment) -> some View {
        switch alignment {
        case .top:
            self.frame(maxHeight: .infinity, alignment: .top)
        case .bottom:
            self.frame(maxHeight: .infinity, alignment: .bottom)
        case .leading:
            self.frame(maxWidth: .infinity, alignment: .leading)
        case .trailing:
            self.frame(maxWidth: .infinity, alignment: .trailing)
        case .center:
            self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
