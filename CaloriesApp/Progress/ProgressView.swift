//
//  ProgressView.swift
//  CaloriesApp
//
//  Created by Данила on 30.07.2023.
//

import SwiftUI

struct ProgressView: View {
    var size = Size()
    @State var selectedView = SelectedView.caloriesView.rawValue
//    @ObservedObject var viewModel = ProgressViewModel()
//    @ObservedObject var viewModelWeight = ProgressWeightViewModel()
    var body: some View {
        VStack {
            Text("Прогресс")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, size.scaleHeight(20))
            HStack {
                Button {
                    withAnimation {
                        selectedView = SelectedView.weightView.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedView == SelectedView.weightView.rawValue ? .fieldWeight : .buttonColor)
                        Text(SelectedView.weightView.rawValue)
                            .foregroundColor(selectedView == SelectedView.weightView.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                        
                    }
                }
                
                Button {
                    withAnimation {
                        selectedView = SelectedView.caloriesView.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedView == SelectedView.caloriesView.rawValue ? .fieldWeight : .buttonColor)
                        Text(SelectedView.caloriesView.rawValue)
                            .foregroundColor(selectedView == SelectedView.caloriesView.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                        
                    }
                }
                
                Button {
                    withAnimation {
                        selectedView = SelectedView.waterView.rawValue
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: size.scaleWidth(100), height: size.scaleHeight(30))
                            .cornerRadius(7)
                            .foregroundColor(selectedView == SelectedView.waterView.rawValue ? .fieldWeight : .buttonColor)
                        Text(SelectedView.waterView.rawValue)
                            .foregroundColor(selectedView == SelectedView.waterView.rawValue ? .buttonColor : .white)
                            .font(.system(size: 12, weight: .bold))
                    }
                }
            }.padding(.bottom, size.scaleHeight(20))
            if selectedView == SelectedView.weightView.rawValue {
                ProgressWeight()
            } else if selectedView == SelectedView.caloriesView.rawValue {
                ProgressCalories()
            }
        }.padding(.top, size.scaleHeight(30))
    }
}


