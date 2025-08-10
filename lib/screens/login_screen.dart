import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to make layout responsive
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02), // Reduced top space
                _buildHeader(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.06),
                _buildLoginSection(),
                SizedBox(height: screenHeight * 0.05),
                _buildSecurityMessage(),
                SizedBox(height: screenHeight * 0.05),
                _buildFooter(),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Column(
      children: [
        // Simplified App Logo
        Image.asset(
          'assets/logo.png',
          width: screenWidth * 0.35, // Responsive width
          height: screenWidth * 0.35, // Responsive height
          // IMPORTANT: Make sure you have a 'logo.png' file in an 'assets' directory
          // at the root of your project, and that you have declared it in your
          // pubspec.yaml file like this:
          //
          // flutter:
          //   assets:
          //     - assets/logo.png
        ),

        const SizedBox(height: 16), // Reduced space

        // Static Main Title with gradient
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9D21B9),
              Color(0xFFF956A7),
              Color(0xFF58127B),
              Color(0xFFE91E63),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ).createShader(bounds),
          child: Text(
            'VanNari',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.11, // Responsive font size
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -2.0,
              height: 1.0,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Simplified subtitle
        const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.security,
              color: Color(0xFF9D21B9),
              size: 18,
            ),
            SizedBox(width: 12),
            Text(
              'Your Safety, Our Priority',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF58127B),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginSection() {
    return Column(
      children: [
        const Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF58127B),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose your preferred sign-in method',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF7E22CE).withOpacity(0.8),
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 32),

        // Enhanced Google Login Button
        _buildEnhancedGoogleLoginButton(),

        const SizedBox(height: 16),

        // Enhanced Apple Login Button
        _buildEnhancedAppleLoginButton(),

        const SizedBox(height: 24),

        // Divider with text
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Secure & Private',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF7E22CE).withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEnhancedGoogleLoginButton() {
    return Container(
      width: double.infinity,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            _showComingSoonSnackBar('Google login coming soon!');
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Enhanced Google Logo
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'G',
                      style: TextStyle(
                        color: Color(0xFF4285F4),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Continue with Google',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF333333),
                    letterSpacing: 0.3,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedAppleLoginButton() {
    return Container(
      width: double.infinity,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF000000),
            Color(0xFF1a1a1a),
            Color(0xFF000000),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            _showComingSoonSnackBar('Apple login coming soon!');
          },
          borderRadius: BorderRadius.circular(20),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apple,
                  size: 32,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Text(
                  'Continue with Apple',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityMessage() {
    return const Row(
      children: [
        Icon(
          Icons.verified_user_rounded,
          color: Color(0xFF9D21B9),
          size: 40,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bank-Level Security',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF58127B),
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Your privacy and safety data are encrypted and protected.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7E22CE),
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        // Trust indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTrustIndicator(Icons.security, 'Secure'),
            const SizedBox(width: 32),
            _buildTrustIndicator(Icons.verified, 'Verified'),
            const SizedBox(width: 32),
            _buildTrustIndicator(Icons.shield, 'Protected'),
          ],
        ),

        const SizedBox(height: 32),

        // Terms and Privacy
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF7E22CE),
              height: 1.5,
              letterSpacing: 0.2,
              fontFamily: 'Inter', // Ensure consistent font
            ),
            children: [
              TextSpan(
                text: 'By continuing, you accept our ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: Color(0xFF9D21B9),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Color(0xFF9D21B9),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrustIndicator(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF9D21B9),
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF7E22CE),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showComingSoonSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF9D21B9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}
