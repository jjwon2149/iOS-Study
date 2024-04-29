//
//  ListRow.swift
//  LazyStacks
//
//  Created by 정종원 on 4/24/24.
//

import SwiftUI

struct ListRow: View {
    
    let id: Int
    let type: String
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    
    var body: some View {
        Text("\(type) \(id)")
    }
}

//#Preview {
//    ListRow()
//}
