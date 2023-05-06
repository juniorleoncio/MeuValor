//
//  CreateUserViewModel.swift
//  Meu Valor
//
//  Created by junior leoncio on 05/05/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class CreateUserViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var currentSalary: Salary?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
            await fetchSalary()
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodeUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
            
        }catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    func updateSalary(salary: Double, dayJobMonth: Double, dayForWeek: Double, hourJobForDay: Double) async throws {
        guard let userID = userSession?.uid else { return }
        let salarioDocumentRef = Firestore.firestore().collection("salarios").document(userID)
        let novoSalario = Salary(salary: salary, dayJobMonth: dayJobMonth, dayForWeek: dayForWeek, hourJobForDay: hourJobForDay)
        let encodeSalario = try Firestore.Encoder().encode(novoSalario)
        try await salarioDocumentRef.setData(encodeSalario)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
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
 
}



