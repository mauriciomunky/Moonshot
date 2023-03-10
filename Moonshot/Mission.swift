//
//  Mission.swift
//  Moonshot
//
//  Created by Maurício Costa on 17/01/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "NA"
    }
    let crew: [CrewRole]
    let description: String
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
}
