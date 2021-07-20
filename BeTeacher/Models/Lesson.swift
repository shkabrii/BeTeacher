//
//  Lesson.swift
//  BeTeacher
//
//  Created by MacBook on 20.07.2021.
//

import FirebaseFirestoreSwift

struct Lesson: Identifiable, Codable {
    @DocumentID var id: String?
    var duration: String
    var subject: String
    var student: String
    var date: String
    var price: String
    var finished: Bool
}
