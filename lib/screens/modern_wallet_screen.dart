import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u_credit_card/u_credit_card.dart';
import '../models/transaction.dart';
import '../widgets/stat_card.dart';
import '../widgets/transaction_tile.dart';
import '../widgets/brand_bottom_sheet.dart';
import '../utils/icons.dart';

class ModernWalletScreen extends StatelessWidget {
  const ModernWalletScreen({super.key});

  List<TransactionModel> get _transactions => [
        TransactionModel("Amazon", "Received", 1600.0, "Sep 23", true),
        TransactionModel("Airbnb", "Sent", 600.0, "Sep 23", false),
        TransactionModel("Upwork", "Received", 1400.0, "Sep 22", true),
        TransactionModel("Electric Co.", "Bill", 500.0, "Sep 21", false),
      ];

  @override
  Widget build(BuildContext context) {
    final txs = _transactions;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Column(
          children: [
            // header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.indigo.shade700,
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Text('Ridoy Rock',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ]),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert,
                        size: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // reward banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.celebration,
                        color: Colors.orange, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text("You've unlocked a \$10 reward!",
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
            ),

            // credit card smaller
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CreditCardUi(
                width: MediaQuery.of(context).size.width - 40,
                cardHolderFullName: "Ridoy Rock",
                cardNumber: "**** **** **** 1234",
                validFrom: "01/22",
                validThru: "01/27",
                cardType: CardType.credit,
                creditCardType: CreditCardType.mastercard,
                doesSupportNfc: true,
                placeNfcIconAtTheEnd: true,
                topLeftColor: const Color(0xFF1E3C72),
                bottomRightColor: const Color(0xFF2A5298),
                enableFlipping: true,
                showBalance: true,
                balance: 1260.50,
                currencySymbol: r'$',
                shouldMaskCardNumber: true,
              ),
            ),

            // stats smaller
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: const [
                StatCard(
                    title: "Current Limit",
                    value: "\$1260.50",
                    color: Color(0xFFFF7A59)),
                SizedBox(width: 10),
                StatCard(
                    title: "Payment Due",
                    value: "\$320.50",
                    color: Color(0xFF5B6FF7)),
              ]),
            ),

            // transactions header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transactions",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list,
                          size: 18, color: Colors.black54)),
                ],
              ),
            ),

            // transactions list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: txs.length,
                itemBuilder: (context, i) {
                  final tx = txs[i];
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 350 + i * 120),
                    curve: Curves.easeOut,
                    builder: (context, v, child) {
                      return Transform.translate(
                        offset: Offset(0, (1 - v) * 10),
                        child: Opacity(opacity: v, child: child),
                      );
                    },
                    child: TransactionTile(
                      brand: tx.brand,
                      status: tx.status,
                      amount: tx.amount,
                      date: tx.date,
                      isPositive: tx.isPositive,
                      icon: getBrandIcon(tx.brand),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // bottom button with brand list
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -3),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: () => showBrandBottomSheet(context, _transactions),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Choose Brand',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
