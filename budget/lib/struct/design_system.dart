import 'package:flutter/material.dart';
import 'dart:ui';

/// The **Flagship Design System** for Splice.
///
/// This class acts as the "Law" for the app's visual language.
/// It provides the "Ingredients of Cool" needed to build both
/// standard utility screens and "Flagship" art-project screens.
///
/// Usage:
/// ```dart
/// Container(
///   color: DesignSystem.colors.surfaceGlass,
///   decoration: DesignSystem.effects.glassMorphism,
///   child: Text("Hello", style: DesignSystem.typography.header1),
/// )
/// ```
class DesignSystem {
  // Private constructor to prevent instantiation
  DesignSystem._();

  static const colors = _Colors();
  static const typography = _Typography();
  static const dimensions = _Dimensions();
  static const effects = _Effects();
  static const animations = _Animations();
}

class _Colors {
  const _Colors();

  // --- Core Palette ---
  
  /// The main brand color (Splice Green-Gold), updated to be more vibrant
  Color get primary => const Color(0xFFD4E157); // Lime 400
  
  /// Darker variant for contrast
  Color get primaryDark => const Color(0xFFAFB42B); 

  /// A nice neon accent for "Wow" moments
  Color get accentNeon => const Color(0xFFCCFF00); 
  
  /// Alias for primary neon glow effects (used in group cards)
  Color get primaryNeon => const Color(0xFFCCFF00); 

  // --- Semantic Colors ---

  Color get income => const Color(0xFF00E676); // Green A400
  Color get expense => const Color(0xFFFF1744); // Red A400
  Color get warning => const Color(0xFFFFC400); // Amber A400
  Color get info => const Color(0xFF2979FF); // Blue A400

  // --- Surface Colors (Dark Mode First) ---

  /// The deep void background for the "Mesh Gradient" to sit on
  Color get background => const Color(0xFF050505);

  /// Standard card surface
  Color get surface => const Color(0xFF121212);

  /// High-level surface (popups, bottom sheets)
  Color get surfaceHighlight => const Color(0xFF1E1E1E);

  /// The magic "Glass" color - partially transparent white/black
  Color get glassClear => const Color(0x1FFFFFFF);
  Color get glassHeavy => const Color(0x24000000);

  // --- Text Colors ---
  
  Color get textPrimary => const Color(0xFFFFFFFF);
  Color get textSecondary => const Color(0xFFB3B3B3); // ~70% White
  Color get textTertiary => const Color(0xFF656565); // ~40% White
}

class _Typography {
  const _Typography();

  // Using standard Flutter fonts but with "Premium" tuning
  // In a real scenario, we would load 'Inter' or 'Manrope' here.
  final String _fontFamily = 'Inter'; 

  TextStyle get headerHero => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.5,
    height: 1.1,
    color: const Color(0xFFFFFFFF),
  );

  TextStyle get header1 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.0,
    height: 1.2,
    color: const Color(0xFFFFFFFF),
  );

  TextStyle get header2 => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.3,
    color: const Color(0xFFFFFFFF),
  );

  TextStyle get title => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: const Color(0xFFFFFFFF),
  );

  TextStyle get body => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.1,
    color: const Color(0xFFE0E0E0),
  );

  TextStyle get label => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: const Color(0xFFB3B3B3),
  );
  
  TextStyle get labelSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: const Color(0xFF656565),
  );
}

class _Dimensions {
  const _Dimensions();

  // Spacing
  double get xs => 4.0;
  double get s => 8.0;
  double get m => 16.0;
  double get l => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;

  // Radii
  Radius get radiusS => const Radius.circular(8);
  Radius get radiusM => const Radius.circular(16);
  Radius get radiusL => const Radius.circular(24);
  Radius get radiusXL => const Radius.circular(32);
  
  BorderRadius get borderRadiusM => const BorderRadius.all(Radius.circular(16));
}

class _Effects {
  const _Effects();

  /// The essential "Frosted Glass" effect.
  /// Apply this to a [BackdropFilter] or use it in a Container's decoration safely?
  /// Actually, standard usage is `BoxDecoration` + `BackdropFilter` widget.
  /// This returns a `BoxDecoration` that *simulates* glass with borders and gradients.
  BoxDecoration get glassCard => BoxDecoration(
    color: const Color(0x1AFFFFFF), // 10% White
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    border: Border.all(
      color: const Color(0x33FFFFFF), // 20% White border
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: const Color(0x1A000000), // 10% Black shadow
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  /// A stronger, darker glass for modals/popups
  BoxDecoration get glassModal => BoxDecoration(
    color: const Color(0xCC121212), // 80% Black
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    border: Border.all(
      color: const Color(0x1FFFFFFF), // Slight rim
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: const Color(0x80000000),
        blurRadius: 40,
        spreadRadius: 0,
        offset: const Offset(0, 20),
      ),
    ],
  );

  /// The "Neon Glow" shadow for primary actions
  List<BoxShadow> get neonGlow => [
    BoxShadow(
      color: const Color(0xFFCCFF00).withOpacity(0.4),
      blurRadius: 20,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    ),
    BoxShadow(
      color: const Color(0xFFCCFF00).withOpacity(0.2),
      blurRadius: 40,
      offset: const Offset(0, 0),
      spreadRadius: 10,
    ),
  ];

  /// The subtle "Alive" mesh gradient background
  BoxDecoration get meshGradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF0F2027), // Deep Blue/Black
        const Color(0xFF203A43), // Tealish
        const Color(0xFF2C5364), // Lighter Teal
      ],
      // We can make this more complex later with a ShaderMask
    ),
  );
}

class _Animations {
  const _Animations();

  /// A snappy, elastic curve for "Pop" interactions (liking, adding)
  Curve get elasticOut => const ElasticOutCurve(0.8);

  /// A smooth, premium curve for page transitions and sheets
  Curve get iosResponse => const Cubic(0.19, 1.0, 0.22, 1.0); // Apple-like spring

  /// Duration for micro-interactions
  Duration get fast => const Duration(milliseconds: 200);
  
  /// Duration for layout changes
  Duration get medium => const Duration(milliseconds: 400);
}
