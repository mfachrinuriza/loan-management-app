//
//  WordingEnum.swift
//  loan-management-app
//
//  Created by Muhammad Fachri Nuriza on 07/02/24.
//

import Foundation

public enum ServiceError {
    public static let deleteFavoriteFailed = "Menghapus game favorit Gagal!"
    public static let createFavoriteFailed = "Menambahkan game favorit Gagal!"
    public static let pleaseCheckConnectionError = "Koneksi sedang bermasalah, silakan cek kembali koneksimu"
}

public enum WordingEnum {
    static var riskRating = { (rating: String) in
        "Risk Rating \(rating)"
    }
    static var borrowersTotal = { (total: Int) in
        "Total Borrowers: \(total)"
    }
}
