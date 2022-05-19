//
//  Utils.swift
//  HazParoAnahuac
//
//  Created by alumno on 12/05/22.
//

import Foundation
import SwiftUI

enum Page{
    case loginPage
    case regPage
    case mainPage
}

class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .loginPage
}
