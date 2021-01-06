//
//  ContentView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/23/20.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \UserInfo.favoriteTeam, ascending: true)],
        animation: .default)
    private var items: FetchedResults<UserInfo>

    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Image("nbaicon").resizable().frame(width: 150, height: 75)
                    TwitterView.init()
                    Text("News")
                        .navigationBarTitle("News")
                    }
            }
            .tabItem {
                Image(systemName: "flame.fill")
                Text("News")
            }
            NavigationView {
                QandA.init()
                Text("Q&A")
                    .navigationBarTitle("Q&A")
            }
            .tabItem {
                Image(systemName: "questionmark.circle")
                Text("Q&A")
            }
            NavigationView {
                ContentView.init()
                Text("Teams")
                    .navigationBarTitle("Teams")
            }
            .tabItem {
                Image(systemName: "rosette")
                Text("Teams")
            }
            NavigationView {
                Account.init()
                Text("Account")
                    .navigationBarTitle("Account")
            }
            .tabItem {
                Image(systemName: "person.circle")
                Text("Account")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
