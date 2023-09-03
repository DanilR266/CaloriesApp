//
//  ProgressWeight.swift
//  CaloriesApp
//
//  Created by Данила on 30.07.2023.
//

import SwiftUI

struct ProgressWeight: View {
    @ObservedObject var shared = ProgressWeightViewModel()
    var size = Size()
    var body: some View {
        ScrollView(.vertical) {
//            GraphView()
//                .padding(.bottom, 40)
            StatView(shared: shared)
                .padding(.bottom, 40)
            Rectangle()
                .frame(width: size.screenWidth(), height: 1)
//            StatView2()
        }.onAppear { shared.getStoredData() }
    }
}


struct GraphView: View {
    var size = Size()
    @State var selectedButton = GraphPeriod.week.rawValue
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: size.screenWidth(), height: 1)
            Text("График")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .bold))
            HStack {
                Button {
                    withAnimation {
                        selectedButton = GraphPeriod.week.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedButton == GraphPeriod.week.rawValue ? .fieldCalories : .buttonColor)
                        Text(GraphPeriod.week.rawValue)
                            .foregroundColor(selectedButton == GraphPeriod.week.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                        
                    }
                }
                
                Button {
                    withAnimation {
                        selectedButton = GraphPeriod.month.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedButton == GraphPeriod.month.rawValue ? .fieldCalories : .buttonColor)
                        Text(GraphPeriod.month.rawValue)
                            .foregroundColor(selectedButton == GraphPeriod.month.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                        
                    }
                }
                
                Button {
                    withAnimation {
                        selectedButton = GraphPeriod.year.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedButton == GraphPeriod.year.rawValue ? .fieldCalories : .buttonColor)
                        Text(GraphPeriod.year.rawValue)
                            .foregroundColor(selectedButton == GraphPeriod.year.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                    }
                }
            }
            Image("graph")
                .resizable()
                .frame(width: 340, height: 200)
            Rectangle()
                .frame(width: size.screenWidth(), height: 1)
        }
    }
}

struct StatView: View {
    @ObservedObject var shared: ProgressWeightViewModel
    var size = Size()
    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 25) {
                VStack {
                    Text("Самый большой")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("\(shared.maxWeight)")
                            .font(.system(size: shared.maxWeight.count > 5 ? 25 : 30, weight: .bold))
                    }
                }
                VStack {
                    Text("Цель")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("\(shared.goalWeight)")
                            .font(.system(size: shared.goalWeight.count > 5 ? 25 : 30, weight: .bold))
                    }
                }
            }
            VStack(spacing: 25) {
                VStack {
                    Text("Самый маленький")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("\(shared.minWeight)")
                            .font(.system(size: shared.minWeight.count > 5 ? 25 : 30, weight: .bold))
                    }
                }
                VStack {
                    Text("Осталось")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("\(shared.weightRemainder())")
                            .font(.system(size: shared.weightRemainder().count > 5 ? 25 : 30, weight: .bold))
                    }
                }
            }
        }
    }
}

struct StatView2: View {
    var size = Size()
    var body: some View {
        HStack(spacing: 65) {
            VStack(spacing: 25) {
                VStack {
                    Text("За день")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("-0.3")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
                VStack {
                    Text("За месяц")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("-3")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
            }
            VStack(spacing: 25) {
                VStack {
                    Text("За неделю")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("-0.8")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
                VStack {
                    Text("За год")
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: size.scaleWidth(91))
                        Text("-10")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
            }
        }
    }
}


struct ProgressWeight_Previews: PreviewProvider {
    static var previews: some View {
        ProgressWeight()
    }
}
