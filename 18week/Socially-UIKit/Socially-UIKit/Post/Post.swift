//
//  Post.swift
//  Socially-UIKit
//
//  Created by 정종원 on 7/25/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct Post: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    var userId: String?
    var userName: String?
    var description: String?
    var imageURL: String?
    var path: String?
    @ServerTimestamp var datePublished: Date?
    
    init(id: String, description: String, imageURL: String, datePublished: Date) {
        self.id = id
        self.description = description
        self.imageURL = imageURL
        self.datePublished = datePublished
    }
    
    init?(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        self.description = document.data()["description"] as? String
        if let url = document.data()["imageURL"] as? String {
            self.imageURL = url
        }
        if let path = document.data()["path"] as? String {
            self.path = path
        }
        self.userName = document.data()["userName"] as? String
    }
    
    func checkImageURL(_ path: String) {
        let thumbRef = Storage.storage().reference().child("thumbs/\(path)_320x200")
        thumbRef.downloadURL { url, error in
            if error != nil {
                return
            }
            
            if let url = url,
               let docId = self.id {
                Firestore.firestore().collection("Posts")
                    .document(docId)
                    .setData([
                        "path": FieldValue.delete(),
                        "imageURL": url.absoluteString
                    ], merge: true)
            }
        }
        
    }
    
}

/*
rules_version = '2';

service cloud.firestore {
    match /databases/{database}/documents {
        match /{document=**} {
            allow read, write: if false;
        }
        // Post 하위 모든 도큐먼트의 읽기 쓰기를 허용
        match /Posts/{document=**} {
            allow read: if true
            allow create: if true
            // 도큐먼트의 userId 정보로 삭제 여부 판단
            allow delete: if request.auth.uid == resource.data.userId
        }
    }
}
 */
