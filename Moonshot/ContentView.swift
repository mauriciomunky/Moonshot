//
//  ContentView.swift
//  Moonshot
//
//  Created by Maurício Costa on 16/01/23.
//

import SwiftUI

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}



struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
