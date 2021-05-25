//
//  DialogStatus.swift
//  Kwartracker
//
//  Created by Veverly Mae Ricaza Veverly on 5/17/21.
//

import Foundation
import UIKit

enum DialogStatus {
    case success
    case deleted
    
    var title: String {
        switch self {
        case .success:
            return L10n.PopUpConfirmationModal.Title.success
        case .deleted:
            return L10n.PopUpConfirmationModal.Title.delete
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return L10n.PopUpConfirmationModal.Label.Message.success
        case .deleted:
            return L10n.PopUpConfirmationModal.Label.Message.delete
        }
    }
    
    var image: UIImage {
        switch self {
        case .success:
            return Asset.Images.checkIcon.image
        case .deleted:
            return Asset.Images.trashIcon2.image
        }
    }
}
