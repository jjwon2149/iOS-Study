//
//  MenuRow.swift
//  Albertos
//
//  Created by 정종원 on 7/11/24.
//

import SwiftUI

struct MenuRow: View {
    let item: MenuItem
    var body: some View {
        Text(item.name)
    }
}

#Preview {
    MenuRow(item: menu[0])
}
