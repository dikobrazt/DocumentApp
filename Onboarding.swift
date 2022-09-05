//
// Onboarding.swift
//

import RxCocoa
import RxSwift
import Lottie
import UIKit

enum Onboarding: Int, CaseIterable {
    case first = 1
    case second
    case third
    
    var animation: Animation? {
        return .named("onboarding_\(rawValue)")
    }
    
    var attibutedTitle: NSMutableAttributedString? {
        switch self {
        case .first:
            return nil //attributedTitleString(string: L10n.Onboarding.Other.manager)
        case .second:
            return nil //attributedTitleString(string: L10n.Onboarding.Other.archives)
        case .third:
            return nil //attributedTitleString(string: L10n.Onboarding.Other.pro)
        }
    }
    
    var subtitle: String {
        switch self {
        case .first:
            return "" //L10n.Onboarding.First.subtitle
        case .second:
            return "" //L10n.Onboarding.Second.subtitle
        case .third:
            return "" //L10n.Onboarding.Third.subtitle
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .first:
            return "" //L10n.Button.go
        case .second:
            return "" //L10n.Button.next
        case .third:
            return "" //L10n.Button.startToContinue
        }
    }
    
    var subtitleFont: UIFont? {
        switch self {
        case .first, .second:
            return nil //FontFamily.Avenir.medium.font(size: 14)
        case .third:
            return nil //FontFamily.Avenir.medium.font(size: 14)
        }
    }
}
