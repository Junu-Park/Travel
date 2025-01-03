//
//  Extension+String.swift
//  Travel
//
//  Created by 박준우 on 1/3/25.
//

import Foundation

extension String {
    
    func getDateFromyyMMddStringIndex() -> String {
        let yearStartIndex = self.startIndex
        let yearEndIndex = self.index(self.startIndex, offsetBy: 1)
        let monthStartIndex = self.index(self.startIndex, offsetBy: 2)
        let monthEndIndex = self.index(self.startIndex, offsetBy: 3)
        let dayStartIndex = self.index(self.startIndex, offsetBy: 4)
        let dayEndIndex = self.endIndex
        
        let year = self[yearStartIndex...yearEndIndex]
        let month = self[monthStartIndex...monthEndIndex]
        let day = self[dayStartIndex..<dayEndIndex]
        return "\(year)년 \(month)월 \(day)일"
    }
    
    func getDateFromyyMMddString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let date = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        return dateFormatter.string(from: date)
    }
}
