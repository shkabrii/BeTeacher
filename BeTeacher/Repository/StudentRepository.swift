//
//  StudentRepository.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class StudentRepository: ObservableObject {
    private let path = "students"
    private let store = Firestore.firestore()
    @Published var students: [Student] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.students = snapshot?.documents.compactMap {
                try? $0.data(as: Student.self)
            } ?? []
            self.students = self.students.sorted(by: { $0.name < $1.name })
        }
    }
    
    func add(_ student: Student) {
        do {
           _ = try store.collection(path).addDocument(from: student)
        } catch {
            fatalError("Was not able to add a student")
        }
    }
    
    
    func remove(_ student: Student) {
        guard let documentId = student.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the student: \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ student: Student) {
        guard let documentId = student.id else { return }
        do {
            try store.collection(path).document(documentId).setData(from: student)
        } catch {
            fatalError("Was not able to add a student")
        }
    }
}
