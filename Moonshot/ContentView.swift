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
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    @State private var showingGrid = false
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    MissionGridLayout()
                } else {
                    MissionListLayout()
                }
            }.navigationTitle("Moonshot").toolbar() {
                Button("Change Layout") {
                    showingGrid.toggle()
                }
            }
        }.background(.darkBackground).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
