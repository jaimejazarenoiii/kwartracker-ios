//
//  UIApplication+Extension.swift
//  Kwartracker
//
//  Created by Leah Joy Ylaya on 7/15/21.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
