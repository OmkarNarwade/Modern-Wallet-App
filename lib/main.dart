import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/modern_wallet_screen.dart';

void main() => runApp(const RewardApp());

class RewardApp extends StatelessWidget {
  const RewardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const ModernWalletScreen(),
    );
  }
}
