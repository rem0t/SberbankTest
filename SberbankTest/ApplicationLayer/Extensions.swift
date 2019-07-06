//
//  Extensions.swift
//  SberbankTest
//
//  Created by Влад Калаев on 03/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import UIKit

enum LanguageCode: String, CaseIterable {
    case ru
    case en
    case be
}

extension LanguageCode {
    func getNameFor() -> String {
        switch self {
        case .ru:
            return "Русский"
        case .en:
            return "Aнглийский"
        case .be:
            return "Белорусский"
        }
    }
}
