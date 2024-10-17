//
//  File.swift
//  TaskGit
//
//  Created by P K Gumbal on 17/10/24.

//

import Foundation

extension String {
    var toDouble : Double { Double(self) ?? 0.0 }
    func isBlank() -> Bool {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
}

