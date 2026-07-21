import 'package:flutter/material.dart';

/// Tek secimlik secenek satiri.
///
/// RadioListTile yerine kullanilir: Flutter 3.32 sonrasi RadioListTile'in
/// `groupValue` ve `onChanged` parametreleri kullanimdan kaldirilmistir
/// (RadioGroup ancestor'i gerektirir). Bu widget yalnizca yillardir
/// kararli olan ilkellerden (InkWell, Icon, Text) olusur; surum
/// bagimliligi yoktur.
class SecenekSatiri extends StatelessWidget {
  final String metin;
  final bool secili;
  final VoidCallback onSecildi;

  const SecenekSatiri({
    super.key,
    required this.metin,
    required this.secili,
    required this.onSecildi,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData t = Theme.of(context);
    return InkWell(
      onTap: onSecildi,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: <Widget>[
            Icon(
              secili
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              size: 20,
              color: secili ? t.colorScheme.primary : t.hintColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                metin,
                style: secili
                    ? TextStyle(
                        color: t.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
