//
//  VideoDetailView.swift
//  SwiftUI-List-Starter
//
//  Created by John Hur on 2022/04/16.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                // height을 맞추면 자동 비율로 따라옴
                .frame(height: 150)
                .cornerRadius(12)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                // 글 줄 2줄 제한
                .lineLimit(2)
                // 글자 배열 중간으로
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40) {
                // 아이콘과 String 형태가 같이 쓰일때, Label 사용
                Label("\(video.viewCount)", systemImage: "eye.fill" )
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text(video.description)
                .font(.body)
                // 제약 조건 아래와 같음 윗, 아래쪽 10 왼, 오쪽 20
                .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
            
            Spacer()
            
            Link(destination: video.url) {
                Text("Watch now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280, height: 50, alignment: .center)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }

    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen.first!)
    }
}
