//
//  PathTest.swift
//  CaloriesApp
//
//  Created by Данила on 19.07.2023.
//

import SwiftUI

struct LineShape: Shape {
    var yValues: [Double]
    
    func path(in rect: CGRect) -> Path {
        let xIncrement = (rect.width / (CGFloat(yValues.count) - 1))
        var path = Path()
        path.move(to: CGPoint(x: 0.0,
                              y: yValues[0] * Double(rect.height)))
        for i in 1..<yValues.count {
            let pt = CGPoint(x: (Double(i) * Double(xIncrement)),
                             y: (yValues[i] * Double(rect.height)))
            path.addLine(to: pt)
        }
        return path
    }
}

struct PathTest: View {
    var body: some View {
        VStack {
                     Text("Line Chart")
         
                     ZStack {
                         Rectangle()
                             .stroke(Color.gray, lineWidth: 3.0)
                             .frame(width: 300, height: 300, alignment: .center)
        
                        LineShape(yValues: [0.2, 0.4, 0.3, 0.8, 0.5])
                            .stroke(Color.red, lineWidth: 2.0)
                            .frame(width: 300, height: 300, alignment: .center)
                    }
        
                    Spacer()
                }
    }
}

struct PathTest_Previews: PreviewProvider {
    static var previews: some View {
        PathTest()
    }
}
