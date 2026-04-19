import 'package:flutter/material.dart';

import 'liste_sayfasi.dart';

/// Minimal ve etkileyici giriş ekranı.
class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  static const String _heroAsset = 'assets/trabzon_anasayfa.jpg';
  // Mouse hareketine göre arka planı hafif kaydırmak için bu değerleri tutuyorum.
  double _yatayKaymaCarpani = 0;
  double _dikeyKaymaCarpani = 0;
  // Başlık ve butonda hover efekti için basit durum değişkenleri.
  bool _baslikHover = false;
  bool _butonHover = false;

  @override
  Widget build(BuildContext context) {
    final ekranBoyutu = MediaQuery.sizeOf(context);
    const maxYatayKayma = 18.0;
    const maxDikeyKayma = 12.0;
    const yatayTasirma = 80.0;
    const dikeyTasirma = 56.0;

    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          // Ekranın sağına/soluna ve üstüne/altına göre -1..1 arası oran üretiyorum.
          final yatayOran = ((event.position.dx / ekranBoyutu.width) * 2 - 1)
              .clamp(-1.0, 1.0)
              .toDouble();
          final dikeyOran = ((event.position.dy / ekranBoyutu.height) * 2 - 1)
              .clamp(-1.0, 1.0)
              .toDouble();
          setState(() {
            _yatayKaymaCarpani = yatayOran;
            _dikeyKaymaCarpani = dikeyOran;
          });
        },
        onExit: (_) => setState(() {
          // Mouse alandan çıkınca görsel eski konumuna dönsün istedim.
          _yatayKaymaCarpani = 0;
          _dikeyKaymaCarpani = 0;
        }),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(
                _yatayKaymaCarpani * maxYatayKayma,
                _dikeyKaymaCarpani * maxDikeyKayma,
                0,
              ),
              child: OverflowBox(
                // Kaydırma sırasında beyaz boşluk çıkmaması için görseli biraz büyük çiziyorum.
                minWidth: ekranBoyutu.width + yatayTasirma,
                maxWidth: ekranBoyutu.width + yatayTasirma,
                minHeight: ekranBoyutu.height + dikeyTasirma,
                maxHeight: ekranBoyutu.height + dikeyTasirma,
                alignment: Alignment.center,
                child: Image.asset(
                  _heroAsset,
                  width: ekranBoyutu.width + yatayTasirma,
                  height: ekranBoyutu.height + dikeyTasirma,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.black87,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Arka plan görseli bulunamadı.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  // Yazılar arka planda daha rahat okunsun diye karartma katmanı.
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _baslikHover = true),
                      onExit: (_) => setState(() => _baslikHover = false),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        scale: _baslikHover ? 1.03 : 1,
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 180),
                          style: TextStyle(
                            color: _baslikHover
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.95),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          child: const Text(
                            'Gezilecek Mekanları Keşfet',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    MouseRegion(
                      onEnter: (_) => setState(() => _butonHover = true),
                      onExit: (_) => setState(() => _butonHover = false),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        scale: _butonHover ? 1.04 : 1,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Butona basınca mekan listesi ekranına geçiyorum.
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const ListeSayfasi(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.explore),
                          label: const Text(
                            'Mekanları Gör',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            elevation: _butonHover ? 10 : 5,
                            shadowColor: Colors.black.withValues(alpha: 0.35),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
