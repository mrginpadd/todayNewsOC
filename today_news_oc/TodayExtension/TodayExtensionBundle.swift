//
//  TodayExtensionBundle.swift
//  TodayExtension
//
//  Created by xushihao on 2024/1/13.
//

import WidgetKit
import SwiftUI

@main
struct TodayExtensionBundle: WidgetBundle {
    var body: some Widget {
        TodayExtension()
        TodayExtensionLiveActivity()
    }
}
