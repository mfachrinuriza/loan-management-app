//
//  DateTime.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Foundation

class DateTime: NSObject {
    static let DateFormatSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let DateFormat = "yyyy-MM-dd"
    
    class func getDateStringFromDashedDateString(string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: string)
        
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "dd MMM yyyy"
        return stringFormatter.string(from: date!)
    }
}
