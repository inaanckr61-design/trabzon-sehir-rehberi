import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetaySayfasi extends StatelessWidget {
  const DetaySayfasi({
    super.key,
    required this.baslik,
    required this.bolge,
    required this.kisaAciklama,
    required this.detayMetni,
    required this.resimAssetYolu,
  });

  final String baslik;
  final String bolge;
  final String kisaAciklama;
  final String detayMetni;
  final String resimAssetYolu;

  // Harita aramasını seçilen mekan adına göre otomatik oluşturuyorum.
  Uri get _haritaUri {
    final sorgu = Uri.encodeComponent('$baslik $bolge Trabzon');
    return Uri.parse('https://www.google.com/maps/search/?api=1&query=$sorgu');
  }

  Future<void> _yolTarifiAc(BuildContext context) async {
    // Yol tarifi butonunda haritayı direkt dış uygulamada açıyorum.
    final basarili = await launchUrl(
      _haritaUri,
      mode: LaunchMode.externalApplication,
    );

    if (!basarili && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harita bağlantısı açılamadı.')),
      );
    }
  }

  List<_MakaleBolumu> get _makaleBolumleri {
    // Hangi mekan açıldıysa ona özel başlık + metin + görsel seti döndürüyorum.
    if (baslik == 'Atatürk Köşkü') {
      return const [
        _MakaleBolumu(
          baslik: 'Tarihçe',
          gorselYolu: 'assets/ataturk 1.jpg',
          gorselSolda: false,
          paragraf:
              'Atatürk Köşkü, 20. yüzyılın başlarında Trabzon\'un Soğuksu '
              'yamaçlarında konut olarak inşa edilmiş; ilerleyen yıllarda '
              'Mustafa Kemal Atatürk\'ün Trabzon ziyaretleriyle birlikte ulusal '
              'hafızada özel bir yer edinmiştir. Cumhuriyet döneminde yapının '
              'korunması ve müze işleviyle yaşatılması, köşkü yalnızca bir konut '
              'örneği olmaktan çıkarıp tarihsel bir simgeye dönüştürmüştür. Bugün '
              'ziyaretçiler, bu yapıda erken Cumhuriyet atmosferini ve dönemin '
              'yaşam kültürünü bir arada hissetme imkanı bulur.',
        ),
        _MakaleBolumu(
          baslik: 'İç Mimari & Dekorasyon',
          gorselYolu: 'assets/ataturk 2.jpg',
          gorselSolda: true,
          paragraf:
              'Köşkün iç mekanlarında yüksek tavanlar, dengeli oda yerleşimi ve '
              'dönemin zevkini yansıtan mobilya düzeni öne çıkar. Ahşap detaylar, '
              'süsleme öğeleri ve tekstil kullanımı, yapının zarif fakat ölçülü bir '
              'dekorasyon anlayışı taşıdığını gösterir. Salon ve odalardaki yerleşim '
              'biçimi, dönemin misafir ağırlama kültürünü ve günlük yaşam alışkanlıklarını '
              'okumaya imkan tanır. Doğal ışığın pencerelerden mekana dağılımı, '
              'sergilenen eşyaların algısını güçlendirerek ziyaret deneyimine estetik '
              'bir derinlik kazandırır.',
        ),
        _MakaleBolumu(
          baslik: 'Turizm',
          gorselYolu: 'assets/ataturk 3.jpg',
          gorselSolda: false,
          paragraf:
              'Atatürk Köşkü, Trabzon merkezine yakınlığı sayesinde şehir içi kültür '
              'rotalarının en erişilebilir duraklarından biridir. Müze deneyimi, bahçe '
              'alanı ve çevredeki doğal doku birlikte değerlendirildiğinde ziyaret, '
              'kısa bir geziyi aşarak sakin ve nitelikli bir kültür molasına dönüşür. '
              'Fotoğraf meraklıları için köşkün dış cephesi ve peyzaj düzeni gün içinde '
              'farklı ışık koşullarında güçlü kareler sunar. Uygun bir planlamayla bu '
              'durak, Ayasofya ve şehir merkezindeki diğer tarihi noktalarla aynı gün '
              'içinde bütüncül bir gezi programına rahatlıkla eklenebilir.',
        ),
      ];
    }

    if (baslik == 'Ayasofya (Hagia Sophia) Müzesi') {
      return const [
        _MakaleBolumu(
          baslik: 'Tarihçe',
          gorselYolu: 'assets/ayasofya 1.jpg',
          gorselSolda: false,
          paragraf:
              'Trabzon Ayasofya\'nın inşa süreci 13. yüzyıla, Trabzon Komnenos '
              'Devleti dönemine uzanır. Yapı, ilk olarak kilise olarak tasarlanmış; '
              'bölgedeki siyasi ve toplumsal dönüşümlerle birlikte farklı dönemlerde '
              'farklı işlevler üstlenmiştir. Osmanlı döneminde cami olarak kullanılan '
              'Ayasofya, Cumhuriyet döneminde koruma ve sergileme anlayışının bir '
              'parçası haline gelerek yeniden değerlendirilmiştir. Bu çok katmanlı '
              'geçmiş sayesinde ziyaretçiler, tek bir mekanda Bizans, Osmanlı ve '
              'modern dönem izlerini bir arada okuyabilir.',
        ),
        _MakaleBolumu(
          baslik: 'Mimari',
          gorselYolu: 'assets/ayasofya 2.jpg',
          gorselSolda: true,
          paragraf:
              'Yapı, haç planlı şeması, taş işçiliği ve cephe düzeniyle geç Bizans '
              'mimarisinin Karadeniz\'deki önemli örneklerinden biri kabul edilir. '
              'Dış yüzeydeki geometrik düzen, kemerli açıklıklar ve kabartma detaylar '
              'dikkat çekerken; iç mekanda görülen fresk izleri yapının sanatsal '
              'değerini güçlendirir. Doğal ışığın gün içinde farklı açılardan içeri '
              'girmesi, mekan algısını sürekli değiştirir ve ziyaret deneyimine '
              'dinamik bir karakter kazandırır. Çevresindeki bahçe dokusu da anıtsal '
              'kütleyi yumuşatarak yapıyı kentle daha bütünlüklü hale getirir.',
        ),
        _MakaleBolumu(
          baslik: 'Turizm',
          gorselYolu: 'assets/ayasofya 3.jpg',
          gorselSolda: false,
          paragraf:
              'Ayasofya, Trabzon şehir merkezine yakın konumu sayesinde günübirlik '
              'rota planlarında kolayca yer bulur. Tarih ve mimari meraklıları için '
              'öğretici bir durak olmasının yanında, fotoğraf tutkunları için de '
              'özellikle sabah ve gün batımı saatlerinde estetik kareler sunar. '
              'Yakın çevredeki sahil hattı, yürüyüş alanları ve diğer kültürel '
              'noktalarla birlikte düşünüldüğünde ziyaret, tek bir yapı gezisinin '
              'ötesine geçerek bütüncül bir şehir deneyimine dönüşür. Dikkatli ve '
              'sakin bir geziyle hem tarihi atmosferi hissedebilir hem de yapının '
              'katmanlı kimliğini daha iyi fark edebilirsiniz.',
        ),
      ];
    }

    if (baslik == 'Uzungöl') {
      return const [
        _MakaleBolumu(
          baslik: 'Tarihçe',
          gorselYolu: 'assets/uzungol_1.jpg',
          gorselSolda: false,
          paragraf:
              'Uzungöl, Çaykara ilçesine bağlı Solaklı Vadisi içerisinde yer alan '
              've bugün Trabzon turizminin simge noktalarından biri haline gelmiş '
              'doğa alanıdır. Bölgenin yerleşim geçmişi eskiye dayansa da Uzungöl\'ün '
              'geniş kitleler tarafından tanınması özellikle 20. yüzyılın ikinci '
              'yarısından sonra hız kazanmıştır. Karadeniz\'in yayla kültürü, ahşap '
              'mimari geleneği ve bölge halkının doğayla iç içe yaşam tarzı, göl '
              'çevresindeki kimliği belirleyen başlıca unsurlardır. Zamanla ulaşım '
              'imkanlarının gelişmesiyle Uzungöl yalnızca yerel bir dinlenme alanı '
              'olmaktan çıkmış; fotoğraf, doğa yürüyüşü ve kültürel gezi rotalarının '
              'vazgeçilmez duraklarından biri haline gelmiştir.',
        ),
        _MakaleBolumu(
          baslik: 'Gölün Oluşumu',
          gorselYolu: 'assets/uzungol 2.jpg',
          gorselSolda: true,
          paragraf:
              'Uzungöl\'ün oluşumu, vadiden geçen Haldizen Deresi önünde meydana gelen '
              'doğal bir heyelan setiyle açıklanır. Yamaçlardan kopan kaya ve toprak '
              'kütlesi dere yatağını kısmen kapatarak suyun birikmesine neden olmuş, '
              'böylece bugün gördüğümüz göl yapısı ortaya çıkmıştır. Bu jeomorfolojik '
              'süreç, Uzungöl\'ü yalnızca görsel açıdan değil, doğal oluşum bakımından '
              'da özel bir örnek haline getirir. Göl çevresindeki eğimli arazi, yoğun '
              'orman dokusu ve yüksek nemli iklim birlikte değerlendirildiğinde bölgenin '
              'ekolojik dengesi oldukça hassastır. Bu nedenle ziyaret sırasında çevreye '
              'duyarlı davranmak, doğal alanın uzun vadede korunması açısından büyük '
              'önem taşır.',
        ),
        _MakaleBolumu(
          baslik: 'Turizm ve Yaşam',
          gorselYolu: 'assets/uzungol_3.jpg',
          gorselSolda: false,
          paragraf:
              'Uzungöl, yılın farklı dönemlerinde farklı bir turizm karakteri sunar. '
              'Yaz aylarında doğa yürüyüşleri, seyir noktaları ve göl çevresi gezileri '
              'öne çıkarken; sonbahar ve kış döneminde sisli atmosfer, serin hava ve '
              'mevsimsel renk değişimi ziyaretçilere bambaşka bir deneyim sağlar. Bölge '
              'ekonomisinde konaklama, yeme-içme ve yerel ürün satışı önemli bir yer '
              'tutar. Ahşap yapılar, yayla kültürüne yakın yaşam biçimi ve Karadeniz '
              'mutfağı, ziyaret deneyimini yalnızca manzara odaklı değil kültürel bir '
              'rotaya da dönüştürür. Planlı bir geziyle hem sakin saatlerde gölü '
              'keşfetmek hem de çevredeki köy ve yayla yaşamını gözlemlemek mümkündür.',
        ),
      ];
    }

    return const [
      _MakaleBolumu(
        baslik: 'Tarihçe',
        gorselYolu: 'assets/sumela_1.jpg',
        gorselSolda: false,
        paragraf:
            'Sümela Manastırı\'nın kuruluşu hakkında en yaygın kabul gören bilgi, '
            'yapının MS 4. yüzyılda Atinalı iki keşiş, Barnabas ve Sophronios '
            'tarafından Meryem Ana\'ya adanarak kurulduğu yönündedir. Günümüzde '
            'görülen yapı topluluğu ise tek bir döneme ait değildir; Bizans '
            'döneminden başlayarak özellikle 13. yüzyıldan sonra Komnenoslar '
            'devrinde genişletilmiş, sonraki yüzyıllarda farklı bölümlerle '
            'zenginleşmiştir. Osmanlı döneminde de varlığını sürdüren manastır, '
            'bölgenin dini ve kültürel tarihinde önemli bir merkez olmayı '
            'sürdürmüştür. Ziyaretçi açısından bakıldığında, bu çok katmanlı '
            'geçmiş, Sümela\'yı yalnızca bir manzara noktası değil; farklı '
            'medeniyetlerin izini aynı taş dokuda buluşturan yaşayan bir tarih '
            'alanına dönüştürür.',
      ),
      _MakaleBolumu(
        baslik: 'Mimari ve Konum',
        gorselYolu: 'assets/sumela_2.jpg',
        gorselSolda: true,
        paragraf:
            'Manastırın en çarpıcı yönü, Altındere Vadisi\'ne hakim sarp kayalık '
            'yüzeye adeta asılıymış gibi konumlandırılmış olmasıdır. Yapı; ana kaya '
            'kilisesi, şapel, öğrenci odaları, mutfak ve su yapıları gibi farklı '
            'birimleri birbirine bağlayan teraslı bir düzende gelişmiştir. Bu '
            'yerleşim planı hem savunma hem de ibadet yaşamı için işlevsel bir '
            'çözüm sunar. Vadi boyunca yükselen yoğun orman dokusu ve yüksek '
            'eğimli topografya, manastırın mimarisini doğayla yarışan değil, '
            'doğaya uyumlanan bir karaktere taşır. Ziyaret sırasında yalnızca '
            'binaya değil, manastırın çevreyle kurduğu bu güçlü ilişkiye dikkat '
            'etmek deneyimi çok daha anlamlı hale getirir.',
      ),
      _MakaleBolumu(
        baslik: 'Freskler ve Sanat',
        gorselYolu: 'assets/sumela_3.jpg',
        gorselSolda: false,
        paragraf:
            'Sümela\'nın iç mekanlarında yer alan freskler, manastırın en değerli '
            'sanatsal miraslarından biridir. Duvar resimlerinde İncil anlatıları, '
            'Hz. İsa\'nın yaşamından sahneler, Meryem Ana temsilleri ve aziz '
            'figürleri öne çıkar. Renk katmanları ve kompozisyon düzeni, farklı '
            'dönemlerde yapılan onarım ve eklemelerin izlerini de taşır; bu da '
            'freskleri yalnızca estetik açıdan değil, tarihsel okumalar açısından '
            'da önemli kılar. Gün ışığının iç mekana düşüşüyle birlikte figürlerin '
            'ifadesi ve yüzey dokusu farklı saatlerde farklı etkiler yaratır. Bu '
            'nedenle freskleri incelerken kısa bir bakıştan çok, detaylı ve sakin '
            'bir gözlem yapmak Sümela deneyiminin en etkileyici parçalarından '
            'birini oluşturur.',
      ),
    ];
  }

  List<String> get _kucukIpuclari {
    // Alt taraftaki ipuçlarını da mekan adına göre farklılaştırdım.
    if (baslik == 'Atatürk Köşkü') {
      return const [
        'Müze düzenini rahat gezebilmek için yoğun saatler yerine sabah erken veya öğleden sonra sakin saatleri tercih edin.',
        'İç mekan detaylarını incelerken sergilenen eşyalara temas etmeyin ve yönlendirme kurallarına uyun.',
        'Bahçe ve cephe fotoğrafları için bulutsuz günlerde yumuşak ışık veren saatler daha iyi sonuç verir.',
        'Güncel ziyaret saatleri ile bilet bilgisini gezi öncesinde resmi kaynaklardan kontrol ederek plan yapın.',
      ];
    }

    if (baslik == 'Ayasofya (Hagia Sophia) Müzesi') {
      return const [
        'Mimari detayları daha iyi görmek için yapıyı hem dış cepheden hem iç mekandan yavaşça gezmeye zaman ayırın.',
        'Fotoğraf çekimi için sabah erken saatler ve gün batımına yakın zamanlar daha dengeli doğal ışık sunar.',
        'Ziyaret öncesi güncel giriş, ibadet ve ziyaret saatlerini resmi kaynaklardan kontrol etmek planlamayı kolaylaştırır.',
        'Tarihi yapıya zarar vermemek için belirlenmiş alanların dışına çıkmayın ve çevre düzenine özen gösterin.',
      ];
    }

    if (baslik == 'Uzungöl') {
      return const [
        'Hafta sonu yoğunluğu yüksek olabildiği için mümkünse sabah erken saatlerde ziyaret planlayın.',
        'Hava hızlı değişebildiğinden yanınızda ince bir yağmurluk veya rüzgarlık bulundurun.',
        'Göl çevresinde yürürken belirlenmiş patikaları kullanın ve doğal alana çöp bırakmayın.',
        'Fotoğraf için en iyi ışık genellikle sabah erken ve gün batımına yakın saatlerde oluşur.',
      ];
    }

    return const [
      'Yürüyüş yolu eğimli olabilir; kaymayan tabanlı rahat ayakkabı tercih edin.',
      'Sabah erken saatlerde giderek hem kalabalıktan kaçınabilir hem de daha yumuşak ışıkta fotoğraf çekebilirsiniz.',
      'Hava durumunu kontrol edin; vadi içinde sis ve sıcaklık hızlı değişebilir.',
      'Ziyaret saatleri, bilet ve ulaşım bilgilerini resmi kaynaklardan güncel olarak doğrulayın.',
    ];
  }

  @override
  Widget build(BuildContext context) {
    final renk = Theme.of(context).colorScheme;
    final yaziStili = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 19,
          height: 1.6,
          color: renk.onSurface.withValues(alpha: 0.88),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mekan Detayı'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              baslik,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: renk.primary,
                    letterSpacing: -0.4,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 20, color: renk.secondary),
                const SizedBox(width: 6),
                Text(
                  bolge,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: renk.secondary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              kisaAciklama,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    color: renk.onSurface.withValues(alpha: 0.9),
                  ),
            ),
            const SizedBox(height: 20),
            // Burada makale bölümlerini mapleyip sırayla ekrana basıyorum.
            ..._makaleBolumleri.indexed.expand((entry) {
              final index = entry.$1;
              final bolum = entry.$2;
              return [
                _MakaleBlogu(
                  baslik: bolum.baslik,
                  gorselYolu: bolum.gorselYolu,
                  gorselSolda: bolum.gorselSolda,
                  paragraf: bolum.paragraf,
                  yaziStili: yaziStili,
                ),
                if (index != _makaleBolumleri.length - 1)
                  const SizedBox(height: 44),
              ];
            }),
            const SizedBox(height: 34),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: renk.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () => _yolTarifiAc(context),
                icon: const Icon(Icons.directions),
                label: const Text(
                  'Yol Tarifi Al',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Card(
              elevation: 0,
              color: renk.primary.withValues(alpha: 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  color: renk.primary.withValues(alpha: 0.14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Küçük İpuçları',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: renk.primary,
                          ),
                    ),
                    const SizedBox(height: 8),
                    ..._kucukIpuclari.map(
                      (ipucu) => _IpucuSatiri(
                        metin: ipucu,
                        renk: renk,
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

class _IpucuSatiri extends StatelessWidget {
  const _IpucuSatiri({
    required this.metin,
    required this.renk,
  });

  final String metin;
  final ColorScheme renk;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(
              Icons.circle,
              size: 8,
              color: renk.secondary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              metin,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15.5,
                    height: 1.45,
                    color: renk.onSurface.withValues(alpha: 0.86),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MakaleBolumu {
  const _MakaleBolumu({
    required this.baslik,
    required this.gorselYolu,
    required this.gorselSolda,
    required this.paragraf,
  });

  final String baslik;
  final String gorselYolu;
  final bool gorselSolda;
  final String paragraf;
}

class _MakaleBlogu extends StatelessWidget {
  const _MakaleBlogu({
    required this.baslik,
    required this.gorselYolu,
    required this.gorselSolda,
    required this.paragraf,
    required this.yaziStili,
  });

  final String baslik;
  final String gorselYolu;
  final bool gorselSolda;
  final String paragraf;
  final TextStyle? yaziStili;

  // Görselle metnin dengeli durması için metin yüksekliğini ölçüyorum.
  double _metinYuksekligiOlc({
    required BuildContext context,
    required String metin,
    required TextStyle stil,
    required double maxWidth,
    required TextAlign textAlign,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: metin, style: stil),
      textDirection: Directionality.of(context),
      textAlign: textAlign,
    )..layout(maxWidth: maxWidth);
    return painter.size.height;
  }

  @override
  Widget build(BuildContext context) {
    final renk = Theme.of(context).colorScheme;
    final baslikStili = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: renk.primary,
        );
    final govdeStili = yaziStili ?? Theme.of(context).textTheme.bodyLarge;

    return LayoutBuilder(
      builder: (context, constraints) {
        const yaziFlex = 5.0;
        const gorselFlex = 6.0;
        final tekKolonGenisligi =
            (constraints.maxWidth - 24) * (yaziFlex / (yaziFlex + gorselFlex));
        final baslikYuksekligi = _metinYuksekligiOlc(
          context: context,
          metin: baslik,
          stil: baslikStili ?? const TextStyle(fontSize: 24),
          maxWidth: tekKolonGenisligi,
          textAlign: TextAlign.start,
        );
        final paragrafYuksekligi = _metinYuksekligiOlc(
          context: context,
          metin: paragraf,
          stil: govdeStili ?? const TextStyle(fontSize: 18, height: 1.6),
          maxWidth: tekKolonGenisligi,
          textAlign: TextAlign.justify,
        );
        final toplamYukseklik = baslikYuksekligi + 10 + paragrafYuksekligi;
        final gorselYukseklik = toplamYukseklik * 1.3;

        Widget yaziAlani = Expanded(
          flex: yaziFlex.toInt(),
          child: SizedBox(
            height: toplamYukseklik,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(baslik, style: baslikStili),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    paragraf,
                    textAlign: TextAlign.justify,
                    style: govdeStili,
                  ),
                ),
              ],
            ),
          ),
        );

        Widget gorselAlani = Expanded(
          flex: gorselFlex.toInt(),
          child: SizedBox(
            height: gorselYukseklik,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                gorselYolu,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: renk.primary.withValues(alpha: 0.1),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Görsel bulunamadı:\n$gorselYolu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: renk.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: gorselSolda
              ? [gorselAlani, const SizedBox(width: 24), yaziAlani]
              : [yaziAlani, const SizedBox(width: 24), gorselAlani],
        );
      },
    );
  }
}
