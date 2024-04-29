//
//  Backpack.swift
//  ExpendingLists
//
//  Created by 정종원 on 4/25/24.
//

import Foundation

struct Backpack: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var content: [Backpack]?
}

let dollor = Backpack(name: "Dollar", icon: "dollarsign.circle")
let yen = Backpack(name: "Yen", icon: "yen.circle")
let currencies = Backpack(name: "Currencies", icon: "coloncurrencysign.circle", content: [dollor, yen])


let paperClip = Backpack(name: "PaperClip", icon: "paperclip")
let glass = Backpack(name: "Magnifying glass", icon: "magnifyingglass.circle")
let bin = Backpack(name: "Bin", icon: "arrow.up.bin", content: [paperClip, glass])

let pencil = Backpack(name: "Pencil", icon: "pencil.circle")
let hammer = Backpack(name: "Hammer", icon: "hammer")
let tools = Backpack(name: "Tools", icon: "folder", content: [pencil, hammer, bin])
