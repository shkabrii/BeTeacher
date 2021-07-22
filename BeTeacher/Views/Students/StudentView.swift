//
//  StudentView.swift
//  BeTeacher
//
//  Created by MacBook on 22.07.2021.
//

import SwiftUI

struct StudentView: View {
    @State private var dragOffset = CGFloat.zero
    
    var studentViewModel: StudentViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.blue)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Text(studentViewModel.student.name)
                            Spacer()
                            Text("Totally Paid: " + String(studentViewModel.student.totalPaid) + "€")
                            Spacer()
                            Text("Current Balance: " + String(studentViewModel.student.currentBalance) + "€")
                        }
                        Spacer()
                    }
                }.padding()
            )
    }
}
