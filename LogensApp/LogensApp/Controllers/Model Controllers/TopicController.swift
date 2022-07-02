//
//  PersonController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import Foundation

class TopicController {
    
    static let topics =
    [
        Topic(
            name: "Steering Techniques",
            bio: "5 Videos",
            videos: [
                Video(
                    videoName: "Example 1",
                    videoDescription: "earth"
                ),
                Video(
                    videoName: "Example 2",
                    videoDescription: "production ID_3750624"
                ),
                Video(
                    videoName: "Example 3",
                    videoDescription: "earth"
                ),
                Video(
                    videoName: "Example 4",
                    videoDescription: "production ID_3750624"
                ),
                Video(
                    videoName: "Example 5",
                    videoDescription: "production ID_3750624"
                )
            ]
        ),
        
        Topic(name: "Braking Techniques", bio: "3 Videos", videos: [Video(videoName: "Larisssa", videoDescription: "Larissa")]),
        
        Topic(name: "Conering Techniques", bio: "5 Videos", videos: [Video(videoName: "Debbie", videoDescription: "Cat")]),
        
        Topic(name: "Defensive Driving", bio: "6 Videos ", videos: [Video(videoName: "Boys", videoDescription: "Fish")])]
    
}




