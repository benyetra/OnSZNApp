//
//  TeamSelectionView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 1/2/21.
//

import SwiftUI

struct TeamSelectionView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: UserInfo.entity(), sortDescriptors: []) var favTeams: FetchedResults<UserInfo>
    @State private var showingAlert = false
    
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

        let teamNames = teams
        
        func saveTeam() {
            try? self.moc.save()
            self.showingAlert = true
        }
        
        
        return NavigationView {
        List {
            ForEach(0..<teamNames.count) { index in
                VStack(spacing: 10) {
                ForEach(teamNames) { teams in
                    Button(action: { saveTeam() } ) {
                        Image(teams.icon).resizable().frame(width: 50.0, height: 50.0)
                        Text(teams.name).bold().font(.title).padding()
                    }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 3)).buttonStyle(PlainButtonStyle())
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Favorite Team"), message: Text("You have added: "), dismissButton: .default(Text("Okay")))
                    }
                }
            }
        }.edgesIgnoringSafeArea([.leading, .trailing]).padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
        }.navigationBarTitle(Text("Your Favorite Team"))
    }
}

struct TeamSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TeamSelectionView()
    }
}
