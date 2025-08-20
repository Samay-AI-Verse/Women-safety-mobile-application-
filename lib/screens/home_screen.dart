import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentNavIndex = 0;
  bool _isVoiceListening = false;
  AnimationController? _voiceButtonController;
  Animation<double>? _voiceButtonAnimation;
  AnimationController? _pulseController;
  Animation<double>? _pulseAnimation;

  // AI Agents for horizontal slider
  final List<Map<String, dynamic>> aiAgents = [
    {
      'name': 'Legal Expert',
      'subtitle': 'Women\'s Rights & Law',
      'icon': Icons.gavel,
      'gradient': [const Color(0xFF667EEA), const Color(0xFF764BA2)],
      'isActive': true,
    },
    {
      'name': 'Health Assistant',
      'subtitle': 'Medical & Wellness',
      'icon': Icons.local_hospital,
      'gradient': [const Color(0xFF11998E), const Color(0xFF38EF7D)],
      'isActive': false,
    },
    {
      'name': 'Safety Guide',
      'subtitle': 'Emergency & Protection',
      'icon': Icons.shield,
      'gradient': [const Color(0xFFFF6B6B), const Color(0xFFFF8E8E)],
      'isActive': false,
    },
    {
      'name': 'Mental Health',
      'subtitle': 'Emotional Support',
      'icon': Icons.psychology,
      'gradient': [const Color(0xFF9D50BB), const Color(0xFF6E48AA)],
      'isActive': false,
    },
    {
      'name': 'Career Advisor',
      'subtitle': 'Professional Growth',
      'icon': Icons.business_center,
      'gradient': [const Color(0xFFF093FB), const Color(0xFFF5576C)],
      'isActive': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _voiceButtonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _voiceButtonAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _voiceButtonController!,
      curve: Curves.elasticInOut,
    ));

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseController!,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _voiceButtonController?.dispose();
    _pulseController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildCreativeHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        _buildAIAgentsSlider(),
                        _buildQuickStats(),
                        _buildSafetyGrid(),
                        _buildRecentActivity(),
                        const SizedBox(height: 100), // Space for voice button
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buildFloatingVoiceButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildCreativeBottomNav(),
    );
  }

  Widget _buildCreativeHeader() {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -20,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Evening',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          'Sarah Williams',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3), width: 2),
                          ),
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Icon(Icons.person,
                                color: Colors.white, size: 28),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CAF50),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'All Systems Protected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIAgentsSlider() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'AI Assistants',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A202C),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: aiAgents.length,
              itemBuilder: (context, index) {
                return _buildAgentCard(aiAgents[index], index == 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgentCard(Map<String, dynamic> agent, bool isFirst) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(left: isFirst ? 4 : 12, right: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: agent['gradient'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: agent['gradient'][0].withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    agent['icon'],
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  agent['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  agent['subtitle'],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildStatItem('24/7', 'Protection', const Color(0xFF4CAF50)),
          _buildStatItem('5', 'Contacts', const Color(0xFF2196F3)),
          _buildStatItem('0', 'Threats', const Color(0xFFFF6B6B)),
          _buildStatItem('98%', 'Safety Score', const Color(0xFFFF9800)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyGrid() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: [
          _buildSafetyCard('Emergency\nSOS', Icons.emergency,
              const Color(0xFFFF4757), 'Instant alert'),
          _buildSafetyCard('Location\nSafety', Icons.location_on,
              const Color(0xFF2ED573), 'Area monitoring'),
          _buildSafetyCard('Voice\nProtection', Icons.record_voice_over,
              const Color(0xFF3742FA), 'AI listening'),
          _buildSafetyCard('Health\nTracking', Icons.favorite,
              const Color(0xFFFF6348), 'Wellness check'),
        ],
      ),
    );
  }

  Widget _buildSafetyCard(
      String title, IconData icon, Color color, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A202C),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A202C),
            ),
          ),
          const SizedBox(height: 16),
          _buildActivityItem(Icons.shield_outlined, 'Safety check completed',
              '2 min ago', const Color(0xFF4CAF50)),
          _buildActivityItem(Icons.location_on, 'Entered safe zone',
              '1 hour ago', const Color(0xFF2196F3)),
          _buildActivityItem(Icons.chat, 'Legal query resolved', '3 hours ago',
              const Color(0xFF9C27B0)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
      IconData icon, String title, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A202C),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingVoiceButton() {
    return Positioned(
      bottom: 90,
      right: 20,
      child: AnimatedBuilder(
        animation: _voiceButtonAnimation ?? const AlwaysStoppedAnimation(1.0),
        builder: (context, child) {
          return Transform.scale(
            scale: _isVoiceListening ? _voiceButtonAnimation!.value : 1.0,
            child: GestureDetector(
              onTap: _toggleVoiceListening,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  gradient: _isVoiceListening
                      ? const LinearGradient(
                          colors: [Color(0xFF4CAF50), Color(0xFF45A049)])
                      : const LinearGradient(
                          colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
                  borderRadius: BorderRadius.circular(32.5),
                  boxShadow: [
                    BoxShadow(
                      color: (_isVoiceListening
                              ? const Color(0xFF4CAF50)
                              : const Color(0xFF667EEA))
                          .withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        _isVoiceListening ? Icons.mic : Icons.mic_none,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    if (_isVoiceListening)
                      AnimatedBuilder(
                        animation: _pulseAnimation ??
                            const AlwaysStoppedAnimation(1.0),
                        builder: (context, child) {
                          return Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.5),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCreativeBottomNav() {
    return Container(
      height: 85,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF667EEA).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_rounded, 'Home', 0),
          _buildNavItem(Icons.map_rounded, 'Safety', 1),
          _buildNavItem(Icons.chat_rounded, 'AI Chat', 2),
          _buildNavItem(Icons.person_rounded, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _currentNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentNavIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
              size: isActive ? 26 : 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleVoiceListening() {
    setState(() {
      _isVoiceListening = !_isVoiceListening;
      if (_isVoiceListening) {
        _voiceButtonController!.repeat(reverse: true);
        _pulseController!.repeat(reverse: true);
      } else {
        _voiceButtonController!.stop();
        _voiceButtonController!.reset();
        _pulseController!.stop();
        _pulseController!.reset();
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isVoiceListening
              ? '🎤 Voice Assistant Activated - Listening for commands'
              : '🔇 Voice Assistant Deactivated',
        ),
        backgroundColor:
            _isVoiceListening ? const Color(0xFF4CAF50) : Colors.grey[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
