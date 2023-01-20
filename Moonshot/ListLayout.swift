//
//  ListLayout.swift
//  Moonshot
//
//  Created by Maurício Costa on 19/01/23.
//

import SwiftUI

struct MissionListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image).resizable().scaledToFit().frame(width: 70)
                            VStack {
                                Text(mission.displayName).font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate).font(.caption).foregroundColor(.white.opacity(0.5))
                            }.padding(.vertical).frame(maxWidth: .infinity).background(.lightBackground)
                        }
                    }
                }.listRowBackground(Color.darkBackground)
            }.listStyle(.plain).background(.darkBackground).preferredColorScheme(.dark)
            
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        MissionListLayout()
    }
}
