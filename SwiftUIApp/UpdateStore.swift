//
//  UpdateStore.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/07.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
