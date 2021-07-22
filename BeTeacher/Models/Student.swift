//
//  Student.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import FirebaseFirestoreSwift

struct Student: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var totalPaid: Int
    var currentBalance: Int
}
