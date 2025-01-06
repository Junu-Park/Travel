//
//  TravelEnum.swift
//  Travel
//
//  Created by 박준우 on 1/7/25.
//

import Foundation

enum TravelEnum {
    case magazine
    case travel
    case shopping
    case search
    
    var naviTitle: String {
        switch self {
        case .magazine: return "SeSAC TRAVEL"
        case .travel: return "도시 상세 정보"
        case .shopping: return "쇼핑"
        case .search: return "인기 도시"
        }
    }
    
    var barTitle: String {
        switch self {
        case .magazine: return "잡지"
        case .travel: return "관광지 정보"
        case .shopping: return "쇼핑"
        case .search: return "국가 탐색"
        }
    }
    var barImage: String {
        switch self {
        case .magazine: return "magazine"
        case .travel: return "info.circle"
        case .shopping: return "cart"
        case .search: return "location.viewfinder"
        }
    }
}
