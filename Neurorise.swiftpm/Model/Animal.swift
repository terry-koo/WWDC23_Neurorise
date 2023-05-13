//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

enum Animal: String, CaseIterable {
    case elephant
    case monkey
    case zebra
    case raccoon
    case kangaroo
    case rhinoceros
    case lion
    case chameleon
    case deer
    
    var image: UIImage {
        switch self {
        case .elephant: return UIImage(named: "Elephant")!
        case .monkey: return UIImage(named: "Monkey")!
        case .zebra: return UIImage(named: "Zebra")!
        case .raccoon: return UIImage(named: "Raccoon")!
        case .kangaroo: return UIImage(named: "Kangaroo")!
        case .rhinoceros: return UIImage(named: "Rhinoceros")!
        case .lion: return UIImage(named: "Lion")!
        case .chameleon: return UIImage(named: "Chameleon")!
        case .deer: return UIImage(named: "Deer")!
        }
    }
    
    var name: String {
        switch self {
        case .elephant: return "Elephant"
        case .monkey: return "Monkey"
        case .zebra: return "Zebra"
        case .raccoon: return "Raccoon"
        case .kangaroo: return "Kangaroo"
        case .rhinoceros: return "Rhinoceros"
        case .lion: return "Lion"
        case .chameleon: return "Chameleon"
        case .deer: return "Deer"
        }
    }
}
