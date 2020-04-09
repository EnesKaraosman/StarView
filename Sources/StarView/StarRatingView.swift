//
//  StarRatingView.swift
//  
//
//  Created by Enes Karaosman on 9.04.2020.
//

import SwiftUI

public struct StarRatingView: View {
    
    public let starCount: Int
    public let totalPercentage: CGFloat
    
    private var percantageList: [CGFloat] = []
    
    public init(starCount: Int = 5, totalPercentage: CGFloat) {
        self.starCount = starCount
        self.totalPercentage = totalPercentage
        self.percantageList = self.calculatePercantageList(
            starCount: starCount,
            totalPercentage: totalPercentage
        )
    }
    
    private func calculatePercantageList(starCount: Int, totalPercentage: CGFloat) -> [CGFloat] {
        
        var result: [CGFloat] = []
        
        let total = totalPercentage * CGFloat(starCount)
        
        let fullStarCount = Int(total / 100)
        for _ in 0..<fullStarCount {
            result.append(100)
        }
        
        if result.count == starCount { return result }
        
        let remaining = total.truncatingRemainder(dividingBy: 100)
        result.append(remaining)
        
        while result.count != starCount {
            result.append(0)
        }
        
        return result
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<starCount) { idx in
                StarView(
                    fillPercentage: self.percantageList[idx]
                )
            }
        }
    }
    
}
