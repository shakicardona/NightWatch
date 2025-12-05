import Foundation

struct NightWatchTask: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
