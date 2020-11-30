//
//  TeamTwitterView.swift
//  OnSZN
//
//  Created by Bennett Yetra on 11/29/20.
//

import SwiftUI


/// A twitter view which shows the nba twitter feed.
struct TeamTwitterView: View {
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ZStack {
                TeamTwitterWebView { loadingState in
                    switch loadingState {
                    case .idle:
                        isLoading = false
                    case .loading:
                        isLoading = true
                    }
                }
                if isLoading {
                    VStack {
                        Text("Loading News Feed...")
                        ProgressView()
                    }
                }
            }
            .edgesIgnoringSafeArea(.vertical)
            }
        }
    }
    
