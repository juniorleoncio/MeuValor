//
//  EditHomeViewModel.swift
//  Meu Valor
//
//  Created by junior leoncio on 06/05/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

@MainActor
class EditHomeViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var currentSalary: Salary?
    @Published var isUpdate = false

    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
            await fetchSalary()
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }


    func fetchSalary() async {
        guard let userID = userSession?.uid else { return }
        let salaryDocumentRef = Firestore.firestore().collection("salarios").document(userID)
        guard let snapshot = try? await salaryDocumentRef.getDocument() else { return }
        self.currentSalary = try? snapshot.data(as: Salary.self)
    }

    func updateSalary(salary: Double, dayJobMonth: Double, dayForWeek: Double, hourJobForDay: Double) async throws {
        guard let userID = userSession?.uid else { return }
        let salaryDocumentRef = Firestore.firestore().collection("salarios").document(userID)
        let novoSalario = Salary(salary: salary, dayJobMonth: dayJobMonth, dayForWeek: dayForWeek, hourJobForDay: hourJobForDay)
        let encodeSalario = try Firestore.Encoder().encode(novoSalario)
        try await salaryDocumentRef.setData(encodeSalario, merge: true)
        self.currentSalary = novoSalario
    }
    
}
