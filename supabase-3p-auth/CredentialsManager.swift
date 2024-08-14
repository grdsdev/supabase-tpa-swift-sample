//
//  CredentialsManager.swift
//  supabase-3p-auth
//
//  Created by Guilherme Souza on 06/08/24.
//

import Auth0

extension CredentialsManager {
  static let shared = Auth0.CredentialsManager(authentication: Auth0.authentication())
}
