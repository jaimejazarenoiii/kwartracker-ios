//
//  MessageView.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 4/27/21.
//

import SwiftUI

struct MessageView: View {
    
    let messageType: MessageType
    
    var body: some View {
        VStack {
            Text(messageType.title).foregroundColor(Color(Asset.Colors.nightRider.color))
                .font(.system(size: 20))
                .fontWeight(.medium)
                .frame(width: 200, height: 30, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            Text(messageType.message).foregroundColor(Color(Asset.Colors.spindleGrey.color))
                .frame(width: 220, height: 30, alignment: .center)
                .font(.system(size: 10))
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    enum MessageType {
        case success
        case deleted
        case confirmation
        
        var title: String {
            switch self {
            case .success:
                return "Success"
            case .deleted:
                return "Confirmation"
            case .confirmation:
                return "Deleted"
            }
        }
        
        var message: String {
            switch self {
            case .success:
                return "New category has been added."
            case .deleted:
                return "It has been successfully deleted."
            case .confirmation:
                return "Are you sure you want to delete this?"
            }
        }
    }
}
