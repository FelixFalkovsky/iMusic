//
//  Library.swift
//  iMusic
//
//  Created by Felix Falkovsky on 30.11.2019.
//  Copyright © 2019 Felix Falkovsky. All rights reserved.
//

import SwiftUI

struct Library: View {
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
                List {
                    LibraryCell()
                    LibraryCell()
                    LibraryCell()
                }
            }
             .navigationBarTitle("Медиатека")
        }
    }
}

struct LibraryCell: View {
    var body: some View {
        HStack {
            Image("Image")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
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
