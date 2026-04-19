import 'package:flutter/material.dart';

import 'detay_sayfasi.dart';

/// Liste ekranında gösterilecek mekan verisi (model).
class TrabzonMekani {
  const TrabzonMekani({
    required this.baslik,
    required this.kisaAciklama,
    required this.detayMetni,
    required this.bolge,
    required this.resimAssetYolu,
  });

  final String baslik;
  final String kisaAciklama;
  final String detayMetni;
  final String bolge;
  /// `pubspec.yaml` ile tanımlı dosya yolu, örn. assets/trabzon_uzungol.jpg
  final String resimAssetYolu;
}

class ListeSayfasi extends StatelessWidget {
  const ListeSayfasi({super.key});

  // Liste kartlarını sabit bir veri listesi üzerinden dolduruyorum.
  static final List<TrabzonMekani> _mekanlar = [
    TrabzonMekani(
      baslik: 'Sümela Manastırı',
      bolge: 'Maçka',
      kisaAciklama:
          'Altındere Vadisi\'nde sarp kayalıkların üzerine kurulu, Trabzon\'un en etkileyici tarihi duraklarından biri.',
      detayMetni:
          'Sümela Manastırı, Maçka ilçesindeki Altındere Vadisi Milli Parkı içinde '
          'yer alır ve yamaçtaki konumuyla ilk bakışta bile unutulmaz bir manzara '
          'sunar. Yapının içindeki freskler, taş işçiliği ve manastır bölümleri '
          'tarih meraklıları için oldukça zengindir. Bölgeye giden yürüyüş güzergahı '
          'yer yer eğimli olduğu için rahat ayakkabı tercih etmeniz gezi konforunu '
          'artırır. Sabah saatlerinde hem daha sakin bir atmosfer yakalayabilir hem '
          'de vadinin sisli-doğal görüntüsünü fotoğraflamak için daha iyi ışık '
          'bulabilirsiniz.',
      resimAssetYolu: 'assets/sumela_1.jpg',
    ),
    TrabzonMekani(
      baslik: 'Uzungöl',
      bolge: 'Çaykara',
      kisaAciklama:
          'Dağlar ve ormanlarla çevrili göl manzarasıyla, doğa yürüyüşü ve sakinlik arayanlar için ideal bir rota.',
      detayMetni:
          'Çaykara\'daki Uzungöl, yılın her döneminde farklı bir karakter sunar; '
          'ilkbaharda canlı yeşiller, sonbaharda sıcak tonlar, kışın ise sisli ve '
          'kartpostallık bir görüntü öne çıkar. Göl çevresinde yürüyüş yapabilir, '
          'seyir noktalarında fotoğraf molası verebilir ve çevredeki işletmelerde '
          'Karadeniz mutfağını deneyebilirsiniz. Bölgede hava hızlı değişebildiği '
          'için ince bir mont ve yağmura dayanıklı ekipman taşımak iyi bir fikir olur. '
          'Gün doğumu ve gün batımı saatleri, Uzungöl\'ün en etkileyici manzarasını '
          'yakalamak isteyen ziyaretçiler için özellikle önerilir.',
      resimAssetYolu: 'assets/uzungol_1.jpg',
    ),
    TrabzonMekani(
      baslik: 'Atatürk Köşkü',
      bolge: 'Ortahisar / Soğuksu',
      kisaAciklama:
          'Çam ormanları içinde konumlanan, Cumhuriyet döneminin izlerini taşıyan tarihi köşk ve müze alanı.',
      detayMetni:
          'Atatürk Köşkü, Trabzon\'un Soğuksu semtinde yer alan ve mimarisiyle '
          'erken 20. yüzyıl kent kültürünü yansıtan seçkin yapılardan biridir. '
          'Cumhuriyet tarihindeki simgesel değeri, özenli iç mekan düzeni ve '
          'çevresindeki peyzaj dokusuyla birlikte ziyaretçilere hem tarihsel '
          'hem estetik açıdan zengin bir deneyim sunar. Şehir merkezine yakın '
          'konumu sayesinde kültür rotalarına kolayca dahil edilir ve özellikle '
          'sakin saatlerde daha etkileyici bir gezi atmosferi sağlar.',
      resimAssetYolu: 'assets/ataturk 1.jpg',
    ),
    TrabzonMekani(
      baslik: 'Ayasofya (Hagia Sophia) Müzesi',
      bolge: 'Ortahisar',
      kisaAciklama:
          '13. yüzyıldan günümüze uzanan çok katmanlı geçmişi, fresk izleri ve denize yakın konumuyla öne çıkan tarihi bir durak.',
      detayMetni:
          'Trabzon Ayasofya, Komnenos döneminden Osmanlı\'ya ve Cumhuriyet dönemine '
          'uzanan tarihsel geçişleri tek bir yapı üzerinde okuyabileceğiniz özel bir '
          'miras alanıdır. Taş cephedeki süslemeler, iç mekandaki fresk kalıntıları '
          've çevresindeki yeşil doku, hem mimari hem de kültürel açıdan zengin bir '
          'ziyaret deneyimi sunar. Şehir merkezine ve sahil aksına yakınlığı sayesinde '
          'kısa süreli gezi planlarına kolayca dahil edilebilir; özellikle gün batımı '
          'saatlerinde çevredeki atmosferle birlikte etkileyici bir durak haline gelir.',
      resimAssetYolu: 'assets/ayasofya 1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final renk = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Önemli mekanlar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: renk.surface,
        child: ListView.separated(
          // Kartları dinamik göstermek için ListView.separated kullandım.
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: _mekanlar.length,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final mekan = _mekanlar[index];
            return Card(
              elevation: 2,
              shadowColor: renk.primary.withValues(alpha: 0.18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Kart seçilince o mekana ait bilgilerle detay sayfasına gidiyorum.
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => DetaySayfasi(
                        baslik: mekan.baslik,
                        bolge: mekan.bolge,
                        kisaAciklama: mekan.kisaAciklama,
                        detayMetni: mekan.detayMetni,
                        resimAssetYolu: mekan.resimAssetYolu,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 110,
                          height: 110,
                          color: renk.primary.withValues(alpha: 0.04),
                          child: Image.asset(
                            mekan.resimAssetYolu,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            gaplessPlayback: true,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              // Görsel yolu yanlış olursa uygulama çökmesin diye yedek ikon gösteriyorum.
                              color: renk.primary.withValues(alpha: 0.08),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: renk.primary,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mekan.baslik,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: renk.primary,
                                    fontSize: 19,
                                    height: 1.25,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              mekan.bolge,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: renk.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              mekan.kisaAciklama,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: renk.onSurface
                                        .withValues(alpha: 0.78),
                                    fontSize: 15,
                                    height: 1.45,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: renk.secondary.withValues(alpha: 0.85),
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
