//
//  HomeViewModel.swift
//  Meu Valor
//
//  Created by junior leoncio on 06/05/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class HomeViewModel: ObservableObject {
        
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var currentSalary: Salary?
    @Published var isUpdate = false
    @Published var isPresentig = false 
    
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
    
    func calculateHourlySalary() -> Double? {
        guard let salary = currentSalary?.salary, let hourJobForDay = currentSalary?.hourJobForDay, let dayJobMonth = currentSalary?.dayJobMonth else {
            return nil
        }
        let hoursPerMonth = hourJobForDay * dayJobMonth
        return salary / hoursPerMonth
    }
    
    func calculateDaySalary() -> Double? {
        guard let salary = currentSalary?.salary, let dayJobMonth = currentSalary?.dayJobMonth else {
            return nil
        }
        return salary / dayJobMonth
    }
    
    func calculateWeekSalary() -> Double? {
        guard let salary = currentSalary?.salary, let dayJobMonth = currentSalary?.dayJobMonth, let dayForWeed = currentSalary?.dayForWeek else {
            return nil
        }
        let hourMonth = salary / dayJobMonth
        return hourMonth * dayForWeed
    }

}
