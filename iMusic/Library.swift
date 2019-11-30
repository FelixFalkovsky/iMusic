//
//  Library.swift
//  iMusic
//
//  Created by Felix Falkovsky on 30.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import SwiftUI
import URLImage

struct Library: View {
    var tracks = UserDefaults.standard.savedTracks()
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack {
                        Button(action: {
                            print("Play")
                        }, label: {
                            Image(systemName: "play.rectangle")
                                .frame(width: geometry.size.width / 2 - 10)
                                .accentColor(Color.init("myColor"))
                        })
                        Button(action: {
                            print("Play")
                        }, label: {
                            Image(systemName: "goforward.plus")
                                .frame(width: geometry.size.width / 2 - 10)
                                .accentColor(Color.init("myColor"))
                        })
                    }
                }
                .padding()
                .frame(height: 50)
                Divider()
                    .padding(.leading)
                    .padding(.trailing)
                List(tracks) { track in
                    LibraryCell(cell: track)
                }
            }
             .navigationBarTitle("Медиатека")
        }
    }
}

struct LibraryCell: View {
    var cell: SearchViewModel.Cell
    var body: some View {
        ScrollView {
            HStack {
                URLImage(URL(string: cell.iconUrlString ?? "")!)
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("\(cell.trackName)")
                    Text("\(cell.artistName)")
                }
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
            .previewDevice("iPhone XR")
    }
}
