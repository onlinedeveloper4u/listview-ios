//
//  ContentView.swift
//  listview
//
//  Created by Muhammad Aqib on 06/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavbarHidden = true
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
//                ScrollViewOffset(onOffsetChange: { offsetChanged($0) }) {
                    VStack(alignment: .leading, spacing: nil) {
                        HStack {
                            Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(.gray)
                        }
                        Spacer().frame(height: 50)
                        Text("Search through our")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Text("Active Listeners")
                            .fontWeight(.bold)
                            .font(.title2)
                            .background(GeometryReader { geometryProxy -> Color in
                                DispatchQueue.main.async {
                                    isNavbarHidden = geometryProxy.frame(in: .named("scrollSpace")).minY >= 50
                                }
                                return Color.clear
                            })
                        Spacer().frame(height: 10)
                        SearchBarView()
                        Spacer().frame(height: 20)
                        ForEach(0..<10) { _ in
                            CardView(geometry: geometry)
                            Spacer().frame(height: 20)
                        }
                    }
//                }
            }
                .padding(.top, geometry.safeAreaInsets.top) // Top padding equal to top safe area
                .padding(.horizontal,12)
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitle("Active Listeners")
                .navigationBarHidden(isNavbarHidden)
            }
        }
    }
    
    private func offsetChanged(_ offset: CGFloat) {
        if offset < -75 {
            withAnimation { isNavbarHidden = false }
        }
        else {
            withAnimation {
                isNavbarHidden = true
            }
        }
    }
}

struct SearchBarView: View {
    @State private var searchText: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.2))
                .frame(width: searchBarWidth, height: searchBarHeight)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
            }
            .padding(.horizontal,10)
            .frame(width: searchBarWidth, height: searchBarHeight)
        }
    }
    
    private let searchBarHeight: CGFloat = 30
    private let searchBarWidth: CGFloat = 170
}
