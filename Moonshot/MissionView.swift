//
//  MissionView.swift
//  Moonshot
//
//  Created by Maurício Costa on 18/01/23.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let crew: [CrewMember]
    let mission: Mission
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                VStack {
                    Image(mission.image).resizable().scaledToFit().frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top).accessibilityLabel(mission.image)
                    Text(mission.formattedLaunchDate != "NA" ? mission.formattedLaunchDate : "").padding(.bottom)
                    VStack(alignment: .leading) {
                        Text("Mission Highlights").font(.title.bold()).padding(.bottom, 5)
                        Divider()
                        Text(mission.description)
                        Divider()
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    HorizontalScrollView(mission: mission, astronauts: astronauts)
                }
                .padding(.bottom)
                
            }
        }
        .navigationTitle(mission.displayName).navigationBarTitleDisplayMode(.inline).background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts).preferredColorScheme(.dark)
    }
}
