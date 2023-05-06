//
//  Salary.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import Foundation

struct Salary: Codable {
    var salary: Double
    var dayJobMonth: Double
    var dayForWeek: Double
    var hourJobForDay: Double
}

extension Salary {
  static var sampleData = Salary(salary: 0, dayJobMonth: 0, dayForWeek: 0, hourJobForDay: 0)
}
