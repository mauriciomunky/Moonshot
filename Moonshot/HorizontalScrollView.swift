//
//  HorizontalScrollView.swift
//  Moonshot
//
//  Created by Maurício Costa on 18/01/23.
//

import SwiftUI

struct HorizontalScrollView: View {
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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id).resizable().frame(width:104,height:72).clipShape(Capsule()).overlay(Capsule().strokeBorder((crewMember.role == "Command Pilot" || crewMember.role == "Commander") ? .blue : .white, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name).foregroundColor(.white).font(.headline)
                                (crewMember.role == "Command Pilot" || crewMember.role == "Commander") ? Text(crewMember.role).foregroundColor(.white).font(.headline.bold()) :
                                Text(crewMember.role).foregroundColor(.secondary)
                            }
                        }
                    }.padding(.horizontal)
                }
            }
        }
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        HorizontalScrollView(mission: missions[0], astronauts: astronauts)
    }
}
