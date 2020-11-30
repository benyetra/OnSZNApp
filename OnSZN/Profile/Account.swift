//
//  Account.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/23/20.
//

import SwiftUI

struct Account: View {
    let profileLinkNames: [String] = ["Favorite Team", "Your Chats", "Change Username", "Log Out"]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ForEach(profileLinkNames, id: \.self) { profileLinkName in
                    ProfileLink(profileLinkName: profileLinkName)
                }
                Spacer()
                }
            }
            .navigationBarTitle("Bennett Yetra")
            .navigationBarItems(
                leading:
                Text("#BleedGreen")
                    .font(.body)
                    .foregroundColor(Color(.systemGray)),
                trailing:
                    Image("Celtics")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())) // Clip the image to a circle
        }
    }

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}

struct ProfileLink: View {
    let profileLinkName: String
    
    var body: some View {
        NavigationLink(destination: Text("")) {
            VStack(spacing: 0) {
                HStack {
                    Text(profileLinkName)
                        .font(.body)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(.systemGray3))
                        .font(.system(size: 20))
                }
                .contentShape(Rectangle()) // Defining the shape of the HStack
                .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
                Divider()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
