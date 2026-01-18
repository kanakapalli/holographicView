import 'package:flutter/material.dart';

void main() {
  runApp(const HolographicViewApp());
}

class HolographicViewApp extends StatelessWidget {
  const HolographicViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holographic View',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF22D3EE),
        ),
      ),
      home: const HolographicViewPage(),
    );
  }
}

class HolographicViewPage extends StatelessWidget {
  const HolographicViewPage({
    super.key,
    this.showLoadingOverlay = true,
    this.showPermissionOverlay = false,
    this.showControlsPanel = false,
  });

  final bool showLoadingOverlay;
  final bool showPermissionOverlay;
  final bool showControlsPanel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundLayer(),
          Positioned.fill(
            child: Center(
              child: Container(
                width: 420,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24, width: 2),
                  color: Colors.black.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text(
                    '3D Canvas Placeholder',
                    style: TextStyle(letterSpacing: 1.2),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            right: 20,
            child: _CameraPreview(),
          ),
          if (showControlsPanel)
            const Positioned(
              bottom: 180,
              right: 20,
              child: _ControlsPanelPlaceholder(),
            ),
          const Positioned(
            bottom: 50,
            left: 40,
            child: _VisitorCounter(),
          ),
          const Positioned(
            bottom: 10,
            left: 20,
            child: _RepoLink(),
          ),
          if (showLoadingOverlay) const _LoadingOverlay(),
          if (showPermissionOverlay) const _PermissionOverlay(),
        ],
      ),
    );
  }
}

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A0A0F), Color(0xFF1A1A2E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1.2,
                colors: [Color(0x266366F1), Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomRight,
                radius: 1.1,
                colors: [Color(0x1FA855F7), Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CameraPreview extends StatelessWidget {
  const _CameraPreview();

  static const String _fpsPlaceholder = '0 FPS';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(0.6),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.black.withOpacity(0.2),
            child: const Text(
              'Camera Preview',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Camera',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                _fpsPlaceholder,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF10B981),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsPanelPlaceholder extends StatelessWidget {
  const _ControlsPanelPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Controls Panel',
            style: TextStyle(fontSize: 12, letterSpacing: 1),
          ),
          const SizedBox(height: 8),
          const Text(
            'Placeholder for strength, smoothing, and size controls.',
            style: TextStyle(fontSize: 10, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VisitorCounter extends StatelessWidget {
  const _VisitorCounter();

  // Subtle perspective tilt to echo the web demo counter card styling.
  static const String _visitorPlaceholder = '...';
  static const double _perspective = 0.001;
  static const double _rotateY = 0.4;
  static const double _rotateX = 0.15;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, _perspective)
        ..rotateY(_rotateY)
        ..rotateX(_rotateX),
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF14141E).withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Visitors:',
              style: TextStyle(fontSize: 12, color: Colors.white60),
            ),
            const SizedBox(width: 8),
            const Text(
              _visitorPlaceholder,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFA855F7),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RepoLink extends StatelessWidget {
  const _RepoLink();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'https://github.com/ARDings/3DWindow',
      style: TextStyle(
        fontSize: 12,
        color: Colors.white54,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A0A0F).withOpacity(0.95),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Color(0xFF6366F1)),
                backgroundColor: Color(0x336366F1),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Initializing Camera...',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionOverlay extends StatelessWidget {
  const _PermissionOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A0A0F).withOpacity(0.98),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('📷', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 20),
              const Text(
                'Camera Access Required',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text(
                'This demo needs access to your webcam to track your head movements.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Camera permissions are not wired up yet.',
                      ),
                    ),
                  );
                  // TODO: Request permissions via permission_handler and init camera.
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color(0xFF6366F1),
                ),
                child: const Text('Start Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
