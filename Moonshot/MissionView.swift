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
                        .padding(.top)
                    VStack(alignment: .leading) {
                        Text("Mission Highlights").font(.title.bold()).padding(.bottom, 5)
                        Rectangle().frame(height:2).foregroundColor(.lightBackground).padding(.vertical)
                        Text(mission.description)
                        Rectangle().frame(height:2).foregroundColor(.lightBackground).padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    Text("Astronaut details")
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
