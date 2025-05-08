import Foundation
import Combine

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var userEmail: String = ""

    func login(email: String, password: String) -> Bool {
        if email.contains("@") && !password.isEmpty {
            self.userEmail = email
            self.isAuthenticated = true
            return true
        }
        return false
    }

    func signUp(email: String, password: String) -> Bool {
        // Simulate success
        self.userEmail = email
        self.isAuthenticated = true
        return true
    }

    func logout() {
        self.userEmail = ""
        self.isAuthenticated = false
    }
}
