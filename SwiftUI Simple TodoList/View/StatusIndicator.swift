//
//  StatusIndicator.swift
//  SwiftUI Simple TodoList
//
//  Created by Rizal Hilman on 20/07/23.
//

import SwiftUI

struct StatusIndicator: View {
    var status: TodoStatus

    var body: some View {
        let backgroundColor: Color = {
                        switch status {
                        case .completed:
                            return Color.green
                        case .pending:
                            return Color.orange
                        }
                    }()

        Text(status == .completed ? "Completed" : "Pending")
            .font(.footnote)
            .foregroundColor(.white)
            .padding(8)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}
