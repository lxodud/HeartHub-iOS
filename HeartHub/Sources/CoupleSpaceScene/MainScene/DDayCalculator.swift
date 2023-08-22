//
//  DDayCalculator.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/14.
//

import Foundation

final class DDayCalculator {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private func calculateDDay(startDate: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        let startDateComponents = calendar.dateComponents([.year, .month, .day], from: startDate)
        let currentDateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        
        guard let startDate = calendar.date(from: startDateComponents),
              let endDate = calendar.date(from: currentDateComponents)
        else {
            return 0
        }
        
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
    
    func calculateDDay(startDate: String) -> String? {
        guard let startDate = dateFormatter.date(from: startDate) else {
            return nil
        }
        
        let dDay = calculateDDay(startDate: startDate)
        return "D + \(dDay)"
    }
}
