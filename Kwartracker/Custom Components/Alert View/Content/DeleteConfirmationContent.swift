//
//  DeleteConfirmationContent.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 4/20/21.
//

import SwiftUI

struct DeleteConfirmationContent: View {
    @Binding var showAlert: Bool
    
    private let topSpacing: CGFloat = 30
    private let shadowXaxis: CGFloat = 7
    private let shadowYaxis: CGFloat = 7
    private let shadowRadius: CGFloat = 8
    private let cornerRadius: CGFloat = 30
    private let rectangleWidth: CGFloat = 315
    private let rectangleHeight: CGFloat = 230
    private let horizontalMargin: CGFloat = 70
    private let shadowColorOpacity: Double = 0.3
        
    private var SNSActions: some View {
        Group {
            HStack {
                SNSButton(actionHandler: {}, actionLabel: .delete)
                SNSButton(actionHandler: {}, actionLabel: .cancel)
            }
            .padding(.horizontal, horizontalMargin)
            .padding(.top, topSpacing)
            
        }
    }

    var body: some View {
        VStack {
            Label(
                 title: {
                     Text(L10n.AlertSheet.Title.confirmation)
                        .font(.title)
                        .bold()
                 },
                 icon: {}
             )
    
            Label(
                 title: {
                    Text(L10n.AlertSheet.Body.areYouSureYouWantToDeleteThis)
                        .font(.headline)
                        .fontWeight(.ultraLight)
                 },
                 icon: {}
             )
            
            SNSActions
        }
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color(Asset.Colors.solitudeGrey.color))
                .frame(width: rectangleWidth, height: rectangleHeight, alignment: .center)
                .shadow(
                    color: Color.white.opacity(shadowColorOpacity),
                    radius: shadowRadius,
                    x: -shadowXaxis,
                    y: -shadowYaxis
                )
                .shadow(
                    color: Color.black.opacity(shadowColorOpacity),
                    radius: shadowRadius,
                    x: shadowXaxis,
                    y: shadowYaxis
                )
        )
    }
}
