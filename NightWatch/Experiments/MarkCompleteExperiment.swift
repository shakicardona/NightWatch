import SwiftUI

@Observable
class NightWatchTaskExperiment {
    
    internal init(name: String, isComplete: Bool, lastCompleted: Date? = nil) {
        self.name = name
        self.isComplete = isComplete
        self.lastCompleted = lastCompleted
    }
    
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}

struct MarkCompleteExperiment: View {
    @State private var theTask = NightWatchTaskExperiment(name: "Check all windows", isComplete: false)
    
    var body: some View {
        HStack {
            Image(systemName: theTask.isComplete ? "checkmark.square" : "square")
            Text(theTask.name)
        }
        IntermediateSubview1(theTask: self.theTask)
    }
}

struct IntermediateSubview1: View {
    var theTask: NightWatchTaskExperiment
    var body: some View {
        IntermediateSubview2(theTask: theTask)
    }
}

struct IntermediateSubview2: View {
    var theTask: NightWatchTaskExperiment
    var body: some View {
        IntermediateSubview3(theTask: theTask)
    }
}
struct IntermediateSubview3: View {
    var theTask: NightWatchTaskExperiment
    var body: some View {
        IntermediateSubview4(theTask: theTask)
    }
}

struct IntermediateSubview4: View {
    var theTask: NightWatchTaskExperiment
    var body: some View {
        IntermediateSubview5(theTask: theTask)
    }
}

struct IntermediateSubview5: View {
    var theTask: NightWatchTaskExperiment
    var body: some View {
        ControlPanel()
    }
}

#Preview {
    MarkCompleteExperiment()
        .environment(NightWatchTaskExperiment(name: "Check all windows 2", isComplete: false))
}


struct ControlPanel: View {
    @Environment(NightWatchTaskExperiment.self) var theTask
    
    var body: some View {
        @Bindable var theTask: NightWatchTaskExperiment = self.theTask
        HStack {
            if !theTask.isComplete {
                Button("Mark Complete") {
                    theTask.isComplete = true
                }
            } else {
                Button("Reset") {
                    theTask.isComplete = false
                }
            }
        }
    }
}
