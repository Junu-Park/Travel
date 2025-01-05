//
//  ShoppingList.swift
//  Travel
//
//  Created by 박준우 on 1/4/25.
//

import Foundation

struct Shopping {
    let title: String
    var isCheck: Bool = false
    var isStar: Bool = false
}

struct ShoppingList {
    var list: [Shopping] =
    [
        .init(title: "그립톡 구매하기", isCheck: true, isStar: true),
        .init(title: "사이다 구매"),
        .init(title: "아이패드 케이스 최저가 알아보기", isCheck: false, isStar: true),
        .init(title: "양말", isCheck: false, isStar: true)
    ]
}
