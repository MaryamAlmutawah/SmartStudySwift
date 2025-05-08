import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    @State private var navigateToSignUp = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("smart_study_logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.top, 40)

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Button(action: login) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // NavigationLink to SignUpView
                NavigationLink(destination: SignUpView(), isActive: $navigateToSignUp) {
                    Button("Don’t have an account? Sign Up") {
                        navigateToSignUp = true
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func login() {
        guard !email.isEmpty, email.contains("@") else {
            alertMessage = "Insert a valid email"
            showAlert = true
            return
        }
        guard !password.isEmpty else {
            alertMessage = "Insert a valid password"
            showAlert = true
            return
        }

        let userExists = true
        if userExists {
            print("✅ Logged in as \(email)")
            isLoggedIn = true
        } else {
            alertMessage = "User does not exist, create a new account"
            showAlert = true
        }
    }
}
