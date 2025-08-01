# Video Template Usage Guide

## Overview
The video template system allows you to easily embed YouTube videos into the educational app with a consistent, responsive design.

## How to Use

### 1. Basic Usage
Replace the placeholder video ID in the video lecture pages:

```dart
// In video_lecture_page.dart
const videoId = 'YOUR_YOUTUBE_VIDEO_ID_HERE'; // Replace with actual video ID
```

### 2. Using YouTube URLs
You can also create video pages directly from YouTube URLs:

```dart
VideoLectureFactory.fromYouTubeUrl(
  youtubeUrl: 'https://www.youtube.com/watch?v=YOUR_VIDEO_ID',
  title: 'Your Video Title',
  description: 'Your video description',
  colorScheme: AppTheme.pageColorSchemes[1],
);
```

### 3. Supported YouTube URL Formats
- `https://www.youtube.com/watch?v=VIDEO_ID`
- `https://youtu.be/VIDEO_ID`
- `https://www.youtube.com/embed/VIDEO_ID`
- Direct video ID: `VIDEO_ID`

### 4. Creating New Video Pages

#### Option A: Use the Factory
```dart
Widget myVideoPage = VideoLectureFactory.fromYouTubeUrl(
  youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
  title: 'My Educational Video',
  description: 'This video covers important topics...',
);
```

#### Option B: Direct VideoPage Usage
```dart
VideoPage(
  videoId: 'dQw4w9WgXcQ',
  title: 'My Educational Video',
  description: 'This video covers important topics...',
  colorScheme: AppTheme.pageColorSchemes[1],
)
```

## Features

### Responsive Design
- **Mobile**: Optimized for small screens with touch-friendly controls
- **Tablet**: Medium-sized video player with balanced layout
- **Desktop**: Large video player with full feature set

### Video Player Features
- **Embedded YouTube Player**: Full YouTube player embedded in the website
- **Thumbnail Preview**: Shows video thumbnail before playing
- **Play Controls**: In-app play button and external YouTube link
- **Responsive Sizing**: Maintains 16:9 aspect ratio across devices
- **Error Handling**: Graceful fallback for invalid video IDs
- **Full Screen Support**: YouTube player supports fullscreen mode

### Educational Context
- Video information section
- Learning tips
- Consistent app theming
- Navigation integration

## Customization

### Color Schemes
Choose from available app color schemes:
- `AppTheme.pageColorSchemes[0]` - Blue
- `AppTheme.pageColorSchemes[1]` - Yellow/Gold
- `AppTheme.pageColorSchemes[2]` - Red
- `AppTheme.pageColorSchemes[3]` - Green
- `AppTheme.pageColorSchemes[4]` - Purple

### Adding to Navigation
To add a new video to the app navigation:

1. Add route to `main.dart`:
```dart
'/my-video': (context) => const MyVideoView(),
```

2. Create view wrapper:
```dart
class MyVideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'My Video',
        icon: Icons.play_circle,
        colorScheme: AppTheme.pageColorSchemes[1],
        currentRoute: '/my-video',
      ),
      drawer: const GlobalDrawer(currentRoute: '/my-video'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: VideoLectureFactory.fromYouTubeUrl(
          youtubeUrl: 'YOUR_YOUTUBE_URL',
          title: 'My Video Title',
          description: 'My video description',
        ),
      ),
    );
  }
}
```

3. Add to content registry:
```dart
LearningResource(
  id: 'my-video',
  title: 'My Video',
  description: 'My video description',
  icon: Icons.play_circle,
  route: '/my-video',
  isSubItem: true, // if it's part of a lesson
),
```

## Example Implementation

Here's a complete example of adding a new educational video:

```dart
// 1. Create the video page
class NutritionVideoPage extends StatelessWidget {
  const NutritionVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoPage.fromUrl(
      youtubeUrl: 'https://www.youtube.com/watch?v=NUTRITION_VIDEO_ID',
      title: 'Nutrition Fundamentals',
      description: 'Learn the basics of nutrition for weight management...',
      colorScheme: AppTheme.pageColorSchemes[1],
    );
  }
}

// 2. Add route in main.dart
'/nutrition-video': (context) => const NutritionVideoView(),

// 3. Create view wrapper
class NutritionVideoView extends StatelessWidget {
  const NutritionVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: 'Nutrition Video',
        icon: Icons.play_circle,
        colorScheme: AppTheme.pageColorSchemes[1],
        currentRoute: '/nutrition-video',
      ),
      drawer: const GlobalDrawer(currentRoute: '/nutrition-video'),
      body: Container(
        color: AppTheme.surfaceColor,
        child: const NutritionVideoPage(),
      ),
    );
  }
}
```

## Notes

- **Embedded Player**: Videos now play directly within the website using YouTube's iframe embed
- **Thumbnail Preview**: Shows YouTube thumbnail before user clicks play
- **Dual Options**: Users can play in-app or open in YouTube directly
- **Web Optimized**: Uses HTML iframe for seamless web integration
- **Responsive**: Automatically adjusts video size based on screen dimensions
- **Educational Focus**: Maintains app's design consistency and navigation structure

## How Video Playback Works

1. **Initial State**: Shows video thumbnail with play button overlay
2. **Click to Play**: Clicking play button embeds the full YouTube player
3. **Full Features**: Embedded player includes all YouTube controls (play, pause, fullscreen, etc.)
4. **Alternative**: "Open in YouTube" button provides external viewing option

## Troubleshooting

- **Video Not Loading**: Check that the video ID is correct and the video is publicly available
- **Thumbnail Missing**: Some videos may not have high-resolution thumbnails available
- **Playback Issues**: Ensure the video allows embedding (some videos restrict iframe embedding)