//
//  Language.swift
//  SberbankTest
//
//  Created by Влад Калаев on 04/07/2019.
//  Copyright © 2019 Влад Калаев. All rights reserved.
//

import Foundation

struct TranslateEtities: Codable {
    var name: String
    var translation: String
    var lang: String
}

enum LanguageCode: String,CaseIterable {
    case ru
    case en
    case be
}


