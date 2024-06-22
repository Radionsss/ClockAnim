//
//  SharedPreferences.swift
//  ClassCheckMain
//
//  Created by Radion Kufeld on 13.06.2024.
//

import Foundation

class SharedPreferences {
    static let shared = SharedPreferences()
    
    private let defaults = UserDefaults.standard
    private let teacherKey = "teacher"
    
    private init() {}

    func saveTime(_ value: Int) {
           defaults.set(value, forKey: teacherKey)
       }
       
       func getTime() -> Int {
           return defaults.integer(forKey: teacherKey)
       }
}
