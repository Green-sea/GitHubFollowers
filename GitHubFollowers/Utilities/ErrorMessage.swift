//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Ya on 14.12.22.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername  = "This username created an invalid reauest. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse  = "Invalid response form the server. Please try again."
    case invalidData      = "The data received form the server was invalid. Please try again."
}
