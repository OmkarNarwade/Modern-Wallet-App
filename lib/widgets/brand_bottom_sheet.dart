import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/transaction.dart';
import '../utils/icons.dart';

void showBrandBottomSheet(BuildContext context, List<TransactionModel> txs) {
  final brands = txs.map((tx) => tx.brand).toSet().toList();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose a Brand",
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            ...brands.map((brand) => ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.shade200,
                    child: FaIcon(
                      getBrandIcon(brand),
                      size: 16,
                      color: Colors.black87,
                    ),
                  ),
                  title: Text(
                    brand,
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: $brand')),
                    );
                  },
                )),
          ],
        ),
      );
    },
  );
}
