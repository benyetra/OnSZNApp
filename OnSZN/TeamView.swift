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
    var icon: Image
}


struct TeamRow: View {
    var team: Team
    var body: some View {
        Text(team.name)
    }
}

struct ContentView: View {
    var body: some View {
        let raptors = Team(name: "Toronto Raptors", icon: Image("Raptors"))
        let celtics = Team(name: "Boston Celtics", icon: Image("Celtics"))
        let nets = Team(name: "Brooklyn Nets", icon: Image("Nets"))
        let knicks = Team(name: "New York Knicks", icon: Image("Knicks"))
        let sixers = Team(name: "Philadelphia 76ers", icon: Image("Sixers"))
        let bucks = Team(name: "Milwaukee Bucks", icon: Image("Bucks"))
        let pacers = Team(name: "Indiana Pacers", icon: Image("Pacers"))
        let bulls = Team(name: "Chicago Bulls", icon: Image("Bulls"))
        let pistons = Team(name: "Detroit Pistons", icon: Image("Pistons"))
        let cavaliers = Team(name: "Cleveland Cavaliers", icon: Image("Cavaliers"))
        let heat = Team(name: "Miami Heat", icon: Image("Heat"))
        let magic = Team(name: "Orlando Magic", icon: Image("Magic"))
        let hornets = Team(name: "Charlotte Hornets", icon: Image("Hornets"))
        let wizards = Team(name: "Washington Wizards", icon: Image("Wizards"))
        let hawks = Team(name: "Atlanta Hawks", icon: Image("Hawks"))
        let nuggets = Team(name: "Denver Nuggets", icon: Image("Nuggets"))
        let thunder = Team(name: "Oklahmoma City Thunder", icon: Image("Thunder"))
        let jazz = Team(name: "Utah Jazz", icon: Image("Jazz"))
        let blazers = Team(name: "Portland Trail Blazers", icon: Image("Blazers"))
        let timberwolves = Team(name: "Minnesota Timberwolves", icon: Image("Timberwolves"))
        let lakers = Team(name: "Los Angeles Lakers", icon: Image("Lakers"))
        let clippers = Team(name: "Los Angeles Clippers", icon: Image("Clippers"))
        let suns = Team(name: "Phoenix Suns", icon: Image("Suns"))
        let kings = Team(name: "Sacramento Kings", icon: Image("Kings"))
        let warriors = Team(name: "Golden State Warriors", icon: Image("Warriors"))
        let rockets = Team(name: "Houston Rockets", icon: Image("Rockets"))
        let mavericks = Team(name: "Dallas Mavericks", icon: Image("Mavericks"))
        let grizzlies = Team(name: "Memphis Grizzlies", icon: Image("Grizzlies"))
        let spurs = Team(name: "San Antonio Spurs", icon: Image("Spurs"))
        let pelicans = Team(name: "New Orleans Pelicans", icon: Image("Pelicans"))
        let teams = [raptors, celtics, nets, knicks, sixers, bucks, pacers, bulls, pistons, cavaliers, heat, magic, hornets, wizards, hawks, nuggets, thunder, jazz, blazers, timberwolves, lakers, clippers, suns, kings, warriors, rockets, mavericks, grizzlies, spurs, pelicans]

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
            TeamTwitterView.init()
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
