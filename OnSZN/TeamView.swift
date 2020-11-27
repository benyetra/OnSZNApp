//
//  TeamView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/27/20.
//

import SwiftUI

struct NBATeam: Identifiable {
    var id = UUID()
    
    var name: String
    var icon: Image
}

struct TeamRow: View {
    var team: NBATeam
    
    var body: some View {
        Text(team.name)
    }
    
}
struct TeamView: View {
        let atlanticDivision = ["Toronto Raptors","Boston Celtics","Brooklyn Nets","New York Knicks","Philadelphia 76ers"]
    
        let centralDivision = ["Milwaukee Bucks", "Indiana Pacers", "Chicago Bulls", "Detroit Pistons", "Cleveland Cavaliers"]
        
        let southEastDivision = ["Miami Heat","Orlando Magic","Charlotte Hornets","Washington Wizards","Atlanta Hawks"]
        
        let northWestDivision = ["Denver Nuggets","Oklahoma City Thunder","Utah Jazz","Portland Trail Blazers","Minnesota Timberwolves"]
        
        let pacificDivision = ["Los Angeles Lakers","Los Angeles Clippers","Phoenix Suns","Sacramento Kings","Golden State Warriors"]
        
        let southWestDivision = ["Houston Rockets","Dallas Mavericks","Memphis Grizzlies","San Antonio Spurs","New Orleans Pelicans"]
    
    var body: some View {
        NavigationView {
                    List {
                        Section(header:
                            Text("Atlantic Division")) {
                                ForEach(0 ..< atlanticDivision.count) {
                                    Text(self.atlanticDivision[$0])
                                }
                        }
                        Section(header:
                            Text("Central Division")) {
                                ForEach(0 ..< centralDivision.count) {
                                    Text(self.centralDivision[$0])
                                }
                        }
                        Section(header:
                            Text("South East Division")) {
                                ForEach(0 ..< southEastDivision.count) {
                                    Text(self.southEastDivision[$0])
                                }
                        }
                        Section(header:
                            Text("North West Division")) {
                                ForEach(0 ..< northWestDivision.count) {
                                    Text(self.northWestDivision[$0])
                                }
                        }
                        Section(header:
                            Text("Pacific Division")) {
                                ForEach(0 ..< pacificDivision.count) {
                                    Text(self.pacificDivision[$0])
                                }
                        }
                        Section(header:
                            Text("South West Division")) {
                                ForEach(0 ..< southWestDivision.count) {
                                    Text(self.southWestDivision[$0])
                                }
                        }
                    }.navigationBarTitle("Teams")
            }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
