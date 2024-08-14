import Foundation
import Supabase
import Auth0

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://PROJECT_ID.supabase.io")!,
  supabaseKey: "SUPABASE_ANON_KEY",
  options: SupabaseClientOptions(
    auth: SupabaseClientOptions.AuthOptions(
      accessToken: {
        try await CredentialsManager.shared.credentials().idToken
      }
    )
  )
)
