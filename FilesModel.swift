//
//  FilesModel.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 8.06.22.
//
import Foundation



struct FilesItem: Hashable {
    var title: String
    var date: String
    var url: URL
}

struct FilesSection: Hashable {
    var items: [FilesItem]
}
