//
//  TeamView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/27/20.
//

import SwiftUI

struct Team: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
}


struct TeamRow: View {
    var team: Team
    var body: some View {
        Text(team.name)
    }
}

struct ContentView: View {
    var body: some View {
        let teams = [
        Team(name: "Toronto Raptors", icon: "Raptors"),
            Team(name: "Boston Celtics", icon: "Celtics"),
            Team(name: "Brooklyn Nets", icon: "Nets"),
            Team(name: "New York Knicks", icon: "Knicks"),
            Team(name: "Philadelphia 76ers", icon: "Sixers"),
            Team(name: "Milwaukee Bucks", icon: "Bucks"),
            Team(name: "Indiana Pacers", icon: "Pacers"),
            Team(name: "Chicago Bulls", icon: "Bulls"),
            Team(name: "Detroit Pistons", icon: "Pistons"),
            Team(name: "Cleveland Cavaliers", icon: "Cavaliers"),
            Team(name: "Miami Heat", icon: "Heat"),
            Team(name: "Orlando Magic", icon: "Magic"),
            Team(name: "Charlotte Hornets", icon: "Hornets"),
            Team(name: "Washington Wizards", icon: "Wizards"),
            Team(name: "Atlanta Hawks", icon: "Hawks"),
            Team(name: "Denver Nuggets", icon: "Nuggets"),
            Team(name: "Oklahmoma City Thunder", icon: "Thunder"),
            Team(name: "Utah Jazz", icon: "Jazz"),
            Team(name: "Portland Trail Blazers", icon: "Blazers"),
            Team(name: "Minnesota Timberwolves", icon: "Timberwolves"),
            Team(name: "Los Angeles Lakers", icon: "Lakers"),
            Team(name: "Los Angeles Clippers", icon: "Clippers"),
            Team(name: "Phoenix Suns", icon: "Suns"),
            Team(name: "Sacramento Kings", icon: "Kings"),
            Team(name: "Golden State Warriors", icon: "Warriors"),
            Team(name: "Houston Rockets", icon: "Rockets"),
            Team(name: "Dallas Mavericks", icon: "Mavericks"),
            Team(name: "Memphis Grizzlies", icon: "Grizzlies"),
            Team(name: "San Antonio Spurs", icon: "Spurs"),
            Team(name: "New Orleans Pelicans", icon: "Pelicans")]
        
        return NavigationView {
            List(teams) { team in
                NavigationLink(destination: TeamView(team: team)) {
                    TeamRow(team: team)
                }
            }.navigationBarTitle("NBA Teams")
        }
    }
}

struct TeamView: View {
    var team: Team
    var body: some View {
        VStack {
            Image("nbaicon").resizable().frame(width: 100, height: 65)
            Text("\(team.name) News").font(.title).fontWeight(.bold)
        }
        VStack {
            TeamTwitterView.init(team: team)
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
