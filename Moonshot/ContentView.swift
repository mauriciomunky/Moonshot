//
//  ContentView.swift
//  Moonshot
//
//  Created by Maurício Costa on 16/01/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        ScrollView{
            Text("Astronauts: \(astronauts.count)")
            Text("Missions: \(missions.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
