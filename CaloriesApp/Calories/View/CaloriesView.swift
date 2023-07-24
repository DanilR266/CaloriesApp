//
//  CaloriesView.swift
//  CaloriesApp
//
//  Created by Данила on 29.06.2023.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var amount: Int
    var shared: CaloriesViewModel
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 300, height: 10)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                Rectangle()
                    .frame(width: shared.amountBar(amount: Int(amount), max: 3000)<=300 ? CGFloat(shared.amountBar(amount: Int(amount), max: 3000)) : 300, height: 10)
                    .foregroundColor(.black)
                    .cornerRadius(5)
            }
            HStack {
                Text("0")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Text("3000")
                    .font(.system(size: 18, weight: .bold))
            }.frame(width: 300)
        }
    }
}

struct MainCalories: View {
    var keyboardResponder: KeyboardResponder
    @StateObject var shared = CaloriesViewModel()
    
    var body: some View {
        ZStack {
            CaloriesBackSide(keyboardResponder: keyboardResponder, degree: $shared.backDegree, shared: shared).opacity(shared.isFlipped ? 0 : 1)
            CaloriesFrontSide(keyboardResponder: keyboardResponder, degree: $shared.frontDegree, shared: shared).opacity(!shared.isFlipped ? 0 : 1)
        }.onChange(of: shared.isFlipped) { newValue in
            print("flip")
//            shared.flipCard()
        }
    }
}

//struct CaloriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaloriesView()
//    }
//}
