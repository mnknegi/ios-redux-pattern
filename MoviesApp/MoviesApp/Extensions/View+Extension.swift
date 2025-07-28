//
//  View+Extension.swift
//  MoviesApp
//
//  Created by Mayank Negi on 28/07/25.
//

import Foundation
import SwiftUI

extension View {

    func embededInNavigationStack() -> some View {
        NavigationStack { self }
    }
}
