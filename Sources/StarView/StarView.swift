
import SwiftUI

public struct StarView: View {
    
    public var fillColor: Color = .yellow
    public var lineWidth: CGFloat = 4.0
    public var borderColor: Color = .yellow
    public var fillPercentage: CGFloat
        
    func needsToBeFilledWidth(totalWidth: CGFloat) -> CGFloat {
        return totalWidth * (100 - fillPercentage) / 100
    }
    
    public var body: some View {
        GeometryReader { geometry in
            StarShape()
                .stroke(self.borderColor, lineWidth: self.lineWidth)
                .overlay(
                    Rectangle()
                        .foregroundColor(self.fillColor)
                        .offset(x: -self.needsToBeFilledWidth(totalWidth: geometry.size.width))
                        .clipShape(StarShape(), style: .init())
                )
                
        }
    }
    
}
