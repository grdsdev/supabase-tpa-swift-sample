import Auth0
import SwiftUI

struct AuthView: View {
  @State var isAuthenticated = false

  var body: some View {
    NavigationStack {
      if isAuthenticated {
        UploadFileView()
          .toolbar {
            ToolbarItem {
              Button("Sign out") {
                Auth0
                  .webAuth()
                  .clearSession { result in
                    switch result {
                    case .success:
                      self.isAuthenticated = false
                    case .failure(let error):
                      print("Failed with: \(error)")
                    }
                  }
              }
            }
          }
      } else {
        Button("Login") {
          Auth0
            .webAuth()
            .start { result in
              switch result {
              case .success(let credentials):
                _ = CredentialsManager.shared.store(credentials: credentials)
                isAuthenticated = true

              case .failure:
                isAuthenticated = false
              }
            }
        }
      }
    }
  }
}
