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
    @State var tracks = UserDefaults.standard.savedTracks()
    @State private var showingAlert = false
    @State private var track: SearchViewModel.Cell!
    var tabBarDelegate: MainTabBarControllerDelegate?
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack {
                        Button(action: {
                            self.track = self.tracks[0]
                            self.tabBarDelegate?.maximizeTrackDetailController(viewModel: self.track)
                        }, label: {
                            Image(systemName: "play.rectangle")
                                .frame(width: geometry.size.width / 2 - 10)
                                .accentColor(Color.init("myColor"))
                        })
                        Button(action: {
                            self.tracks = UserDefaults.standard.savedTracks()
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
                        ForEach(tracks) { track in
                            LibraryCell(cell: track).gesture(
                                LongPressGesture()
                                    .onEnded { _ in
                                        print("Pressed!")
                                        self.track = track
                                        self.showingAlert = true
                                }
                                .simultaneously(with: TapGesture().onEnded { _ in
//                                    let keyWindow = UIApplication.shared.connectedScenes.filter({
//                                        $0.activationState == .foregroundActive
//                                    }).map({
//                                        $0 as? UIWindowScene
//                                    }).compactMap({
//                                        $0
//                                    }).first?.windows.filter({$0.isKeyWindow}).first
                                    let keyWindow = UIApplication.shared.connectedScenes
                                        .filter({$0.activationState == .foregroundActive})
                                        .map({$0 as? UIWindowScene})
                                        .compactMap({$0})
                                        .first?.windows
                                        .filter({$0.isKeyWindow}).first
                                    let tabBarVC = keyWindow?.rootViewController as? MainTabBarController
                                    tabBarVC?.trackDetailView.delegate = self
                                    self.track = track
                                    self.tabBarDelegate?
                                        .maximizeTrackDetailController(viewModel: self.track)
                                }))
                        }
                        .onDelete(perform: delete)
                    }
            }
            .actionSheet(isPresented: $showingAlert, content: {
                ActionSheet(title: Text("Выбранный трек будет удален!"), buttons: [.destructive(Text("Удалить?"), action: {
                    print("Удалино: \(self.track.trackName)")
                    self.delete(track: self.track)
                }), .cancel()
                ])
            })
                .navigationBarTitle("Медиатека")
        }
    }
    func delete (at offsets: IndexSet) {
        tracks.remove(atOffsets: offsets)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    func delete (track: SearchViewModel.Cell) {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return }
        tracks.remove(at: myIndex)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
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
                        .font(.headline)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                    Text("\(cell.artistName)")
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
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

extension Library: TrackMovingDelegate {
    func moveBackForPreviousTrack() -> SearchViewModel.Cell? {
         let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return nil }
               var nextTrack: SearchViewModel.Cell
               if myIndex - 1 == -1 {
                nextTrack = tracks[tracks.count - 1]
               } else {
                   nextTrack = tracks[myIndex - 1]
               }
               self.track = nextTrack
               return nextTrack
    }
    
    func moveForwardForPreviousTrack() -> SearchViewModel.Cell? {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return nil }
        var nextTrack: SearchViewModel.Cell
        if myIndex + 1 == tracks.count {
            nextTrack = tracks[0]
        } else {
            nextTrack = tracks[myIndex + 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    
}
