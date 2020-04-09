//
//  StarShape.swift
//  
//
//  Created by Enes Karaosman on 9.04.2020.
//

import SwiftUI

public struct StarShape: Shape {
    
    public func path(in rect: CGRect) -> Path {
        
        let quarter: CGFloat = rect.midX * 0.5 // 1/4
        let bit: CGFloat = quarter * 0.5  // 1/8

        var path = Path()
        
        path.move(to: .init(x: rect.midX, y: rect.minY)) // Top Center
        path.addLine(to: .init(x: rect.midX + bit, y: quarter))
        path.addLine(to: .init(x: rect.maxX, y: quarter))
        path.addLine(to: .init(x: rect.midX + quarter, y: 2 * quarter))
        path.addLine(to: .init(x: rect.maxX - bit, y: rect.maxY)) // Bottom Right
        path.addLine(to: .init(x: rect.midX, y: rect.midY + bit)) // Bottom Center
        path.addLine(to: .init(x: rect.minX + bit, y: rect.maxY)) // Bottom Left
        path.addLine(to: .init(x: rect.midX - quarter, y: 2 * quarter))
        path.addLine(to: .init(x: rect.minX, y: quarter))
        path.addLine(to: .init(x: rect.midX - bit, y: quarter))
        path.closeSubpath()

        return path
    }
    
}

//struct StarShape_Preview: PreviewProvider {
//    static var previews: some View {
//        StarShape()
//            .stroke(Color.red, style: .init())
//            .frame(width: 50, height: 50)
//    }
//}
