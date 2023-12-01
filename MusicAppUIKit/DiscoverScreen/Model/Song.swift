import Foundation
import UIKit
//  Song.swift


class Song: Hashable {
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
    static func == (lhs: Song, rhs: Song) -> Bool {
      lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var artist: String
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    func makeDataSource() {}
}
