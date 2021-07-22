//
//  Lesson.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import FirebaseFirestoreSwift

struct Lesson: Identifiable, Codable {
    @DocumentID var id: String?
    var subject: String
    var student: String
    var date: Date
    var price: String
    var finished: Bool
}
