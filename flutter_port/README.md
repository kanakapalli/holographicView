# Flutter Port Scaffold

This folder mirrors the layout of the existing web demo (`index.html`) using standard Flutter widgets. It includes the background gradient, full-screen 3D canvas placeholder, camera preview card with FPS label, loading/permission overlays, a controls panel placeholder, the visitor counter, and the repository link.

## Layout mapping
- Background gradient → `_BackgroundLayer`
- Camera preview + FPS → `_CameraPreview`
- Three.js canvas → centered placeholder in `HolographicViewPage`
- Loading/permission overlays → `_LoadingOverlay` and `_PermissionOverlay`
- Controls panel → `_ControlsPanelPlaceholder` (toggle with `showControlsPanel`)
- Visitor counter → `_VisitorCounter`
- Repo link → `_RepoLink`

## What is still needed
To make this fully functional, you would add Flutter plugins such as:
- Camera access: `camera` with `camera_web` for web support
- Permissions: `permission_handler`
- Face detection: `google_mlkit_face_detection`, MediaPipe via `tflite_flutter`, or a custom native bridge
- 3D rendering: `flutter_gl` + `three_dart`, `flutter_cube`, or a custom renderer

## Running
With the Flutter SDK installed, run `flutter run` from `flutter_port`.
