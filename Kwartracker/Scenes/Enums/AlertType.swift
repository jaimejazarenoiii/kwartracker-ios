//
//  AlertType.swift
//  Kwartracker
//
//  Created by Mickale Saturre on 5/20/21.
//

import UIKit

enum AlertType {
    case success
    case delete

    var title: String {
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
    
    var buttonTitle: String {
        switch self {
        case .success:
            return L10n.AlertSheet.Option.cool
        case .delete:
            return L10n.AlertSheet.Option.exit
        }
    }
}
