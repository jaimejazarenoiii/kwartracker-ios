//
//  PopupContentView.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/3/21.
//

import SwiftUI

struct PopupContentView: View {
    @Binding var showAlert: Bool
    @State var bodyText: String = ""
    @State var button: SNSButton.Action
    let alertType: AlertType
    
    private let shadowXaxis: CGFloat = 7
    private let shadowYaxis: CGFloat = 7
    private let shadowRadius: CGFloat = 8
    private let cornerRadius: CGFloat = 45
    private let verticalSpacing: CGFloat = 30
    private let horizontalMargin: CGFloat = 70
    private let shadowColorOpacity: Double = 0.3

    var body: some View {
        VStack {
            if let image = alertType.image {
                Image(uiImage: image)
            }
            
            VStack {
                Text(alertType.text)
                    .font(.title)
                    .bold()
                
                Text(bodyText)
                    .font(.headline)
                    .fontWeight(.light)
            }
            .padding(.vertical)
            
            SNSButton(actionHandler: {
                showAlert.toggle()
            }, actionLabel: button)
            .padding(.horizontal, horizontalMargin)
        }
        .padding(.vertical, verticalSpacing)
        .background(
            RoundedCornerRectangle(radius: cornerRadius, corner: .allCorners)
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
    
    enum AlertType {
        case success
        case delete
        
        var text: String {
            switch self {
            case .success:
                return L10n.AlertSheet.Title.success
            case .delete:
                return L10n.AlertSheet.Title.deleted
            }
        }
        
        var image: UIImage? {
            switch self {
            case .success:
                return Asset.Images.checkIcon.image
            case .delete:
                return Asset.Images.trashIcon2.image
            }
        }
    }
}
