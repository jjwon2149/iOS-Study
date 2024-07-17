//
//  Admin.swift
//
//
//  Created by 정종원 on 7/16/24.
//

import Vapor
import Fluent

final class Admin: Model, Content {
    static let schema = "admins"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String

    @Field(key: "password_hash")
    var passwordHash: String

    init() {}
    
    init(id: UUID? = nil, name: String, passwordHash: String) {
        self.id = id
        self.name = name
        self.passwordHash = passwordHash
    }
}

extension Admin: ModelSessionAuthenticatable {
    static let usernameKey = \Admin.$name
    static let passwordHashKey = \Admin.$passwordHash
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash) // 같은 해시함수로 비밀번호 비교
    }
}

extension Admin: @unchecked Sendable {}
