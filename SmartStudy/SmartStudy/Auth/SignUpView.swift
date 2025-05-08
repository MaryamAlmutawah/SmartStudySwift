import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("smart_study_logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.top, 40)

                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 10)

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

                Button(action: signUp) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // NavigationLink back to LoginView
                NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                    Button("Already have an account? Log In") {
                        navigateToLogin = true
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func signUp() {
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

        let userExists = false
        if userExists {
            alertMessage = "User already exists, try to login"
            showAlert = true
        } else {
            print("✅ User registered: \(email)")
        }
    }
}
