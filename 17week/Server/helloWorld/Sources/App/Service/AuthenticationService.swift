//
//  AuthenticationService.swift
//
//
//  Created by 정종원 on 7/17/24.
//

import Vapor
import JWT

struct AuthenticationService {
    let app: Application

    func createToken(for admin: Admin) throws -> String {
        let expirationDate = Date().addingTimeInterval(60 * 60 * 24) // 24 hours
        let payload = AdminPayload(id: admin.id!, name: admin.name, expiration: expirationDate)
        return try app.jwt.signers.get(kid: .none)!.sign(payload)
    }
}
