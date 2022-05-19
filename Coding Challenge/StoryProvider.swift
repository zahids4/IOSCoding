//
//  File.swift
//
//
//  Created by Wattpad Cuong on 2022-05-19.
//

import Foundation
import DataLayer

protocol StoriesProviderInterface {
    func fetchStories() async
}

class MockStoriesProvider: StoriesProviderInterface {
    private let isSuccess: Bool

    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }


    func fetchStories() async {
        if isSuccess {
            print("I have fetched stories")

            // return mock stories
        } else {
            print("i failed :(((((")
            /// return generic error to assert againt
        }
    }
}

public class StoriesProvider: StoriesProviderInterface {
    private let apiProvider: APIProviderInterface

    init() {
        self.apiProvider = DataService.shared
    }
    
    func fetchStories() async {
        return await apiProvider.fetchStories()
    }
}
