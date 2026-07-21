/// Hikaye icerigi — A1 seviyesi.
///
/// OLCEKLENEBILIRLIK: Yeni hikaye eklemek icin YALNIZCA bu listeye bir
/// [Hikaye] kaydi eklenir. Motor, veritabani, ekranlar ve testler DEGISMEZ.
/// Yuzlerce hikaye ayni bicimde eklenebilir.
///
/// Sablon icin bkz. HIKAYE_EKLEME_REHBERI.md
library;

import '../model/hikaye.dart';

class HikayeIcerik {
  const HikayeIcerik._();

  static const List<Hikaye> hikayeler = <Hikaye>[
    // ============================================================ 1
    Hikaye(
      kod: 'H-A1-001', baslik: 'A Normal Morning', seviye: 'A1',
      konuEtiketi: 'Gunluk yasam', kelimeSayisi: 309, tahminiDk: 4,
      ozetTr: 'Ali sabah erken kalkar, kahvalti eder ve ise gider.',
      anahtarKavramlar: <String>['morning', 'coffee', 'work', 'bus'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Ali wakes up early every morning. The house is quiet '
              'and the sun is not high yet. He opens the window and looks '
              'at the small garden. The air is cold but he likes it. '
              'He never uses an alarm clock because he always wakes up '
              'at the same time.',
          metinTr: 'Ali her sabah erken uyanir. Ev sessizdir ve gunes henuz '
              'yukselmemistir. Pencereyi acar ve kucuk bahceye bakar. Hava '
              'sogugtur ama bunu sever. Asla calar saat kullanmaz cunku her '
              'zaman ayni saatte uyanir.'),
        HikayeParagraf(sira: 2,
          metinEn: 'He goes to the kitchen and makes coffee. Breakfast is '
              'simple: bread, cheese and one tomato. He reads the newspaper '
              'for ten minutes. His wife is still asleep, so he is careful '
              'and quiet. He washes the cup and puts it back.',
          metinTr: 'Mutfaga gider ve kahve yapar. Kahvalti sadedir: ekmek, '
              'peynir ve bir domates. On dakika gazete okur. Esi hala uyuyor, '
              'bu yuzden dikkatli ve sessizdir. Fincani yikar ve yerine koyar.'),
        HikayeParagraf(sira: 3,
          metinEn: 'At half past seven he leaves the house. His neighbour is '
              'in the garden. They say good morning and talk about the '
              'weather for a minute. Then Ali walks to the bus stop. The '
              'street is not busy at this hour.',
          metinTr: 'Yedi bucukta evden cikar. Komsusu bahcededir. Gunaydin '
              'derler ve bir dakika hava hakkinda konusurlar. Sonra Ali '
              'otobus duragina yurur. Sokak bu saatte kalabalik degildir.'),
        HikayeParagraf(sira: 4,
          metinEn: 'The bus comes at eight. Ali finds a seat near the window '
              'and listens to music. The journey takes twenty minutes. He '
              'arrives at the office before nine and starts his work. '
              'He likes his quiet mornings very much.',
          metinTr: 'Otobus sekizde gelir. Ali pencere kenarinda bir yer bulur '
              've muzik dinler. Yolculuk yirmi dakika surer. Dokuzdan once '
              'ofise varir ve isine baslar. Sessiz sabahlarini cok sever.'),
        HikayeParagraf(sira: 5,
          metinEn: 'The office is on the third floor. Ali says good morning '
              'to everybody and opens his computer. There are always many '
              'emails on Monday, but today is Wednesday and the list is '
              'short. He answers the important ones first and puts the '
              'others in a folder. At eleven he drinks his second coffee '
              'with a colleague near the window. They talk about football '
              'for five minutes and then they go back to work.',
          metinTr: 'Ofis ucuncu kattadir. Ali herkese gunaydin der ve '
              'bilgisayarini acar. Pazartesi gunleri her zaman cok e-posta '
              'olur ama bugun carsamba ve liste kisadir. Once onemli olanlari '
              'cevaplar, digerlerini bir klasore koyar. Saat on birde bir is '
              'arkadasiyla pencere kenarinda ikinci kahvesini icer. Bes dakika '
              'futbol hakkinda konusurlar ve sonra ise donerler.'),
        HikayeParagraf(sira: 6,
          metinEn: 'In the evening Ali walks home from the bus stop. The '
              'street is busy now and the shops are open. He buys bread and '
              'a newspaper for tomorrow. At home his wife is in the kitchen '
              'and the radio is on. They eat dinner together and talk about '
              'the day. Ali goes to bed early because tomorrow morning '
              'starts in the same quiet way.',
          metinTr: 'Aksam Ali otobus duragindan eve yurur. Sokak artik '
              'kalabaliktir ve dukkanlar aciktir. Yarin icin ekmek ve gazete '
              'alir. Evde esi mutfaktadir ve radyo aciktir. Birlikte aksam '
              'yemegi yerler ve gunu konusurlar. Ali erken yatar cunku yarin '
              'sabah ayni sessiz sekilde baslar.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Ali uses an alarm clock every morning.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde "He never uses an alarm clock" yaziyor.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What does Ali eat for breakfast?',
          secenekler: <String>['Soup and rice', 'Bread, cheese and a tomato',
              'Only coffee', 'Eggs and milk'],
          kabulEdilenler: <String>['Bread, cheese and a tomato']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'Ali leaves the house at half past ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['seven', '7']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He makes coffee', 'He wakes up',
              'He takes the bus', 'He talks to his neighbour'],
          kabulEdilenler: <String>[
            'He wakes up, He makes coffee, He talks to his neighbour, '
                'He takes the bus'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'How long is the bus journey?',
          secenekler: <String>[],
          kabulEdilenler: <String>['twenty minutes', '20 minutes',
              'It takes twenty minutes.']),
      ],
    ),

    // ============================================================ 2
    Hikaye(
      kod: 'H-A1-002', baslik: 'Sunday at Home', seviye: 'A1',
      konuEtiketi: 'Aile', kelimeSayisi: 285, tahminiDk: 4,
      ozetTr: 'Aile pazar gunu evde birlikte vakit gecirir.',
      anahtarKavramlar: <String>['family', 'Sunday', 'garden', 'dinner'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Sunday is a slow day for the Yilmaz family. Nobody wakes '
              'up early. The children sleep until nine. The mother makes a '
              'big breakfast and the father cleans the kitchen after it. '
              'The house is warm and the radio plays old songs.',
          metinTr: 'Pazar, Yilmaz ailesi icin yavas bir gundur. Kimse erken '
              'kalkmaz. Cocuklar dokuza kadar uyur. Anne buyuk bir kahvalti '
              'yapar, baba sonrasinda mutfagi temizler. Ev sicaktir ve radyo '
              'eski sarkilar calar.'),
        HikayeParagraf(sira: 2,
          metinEn: 'In the afternoon the family works in the garden. The '
              'father cuts the grass. The mother plants new flowers. The '
              'children help a little, then they play with the neighbour\u2019s '
              'dog. The garden is small but everybody likes it.',
          metinTr: 'Ogleden sonra aile bahcede calisir. Baba cimleri keser. '
              'Anne yeni cicekler diker. Cocuklar biraz yardim eder, sonra '
              'komsunun kopegiyle oynar. Bahce kucuktur ama herkes onu sever.'),
        HikayeParagraf(sira: 3,
          metinEn: 'At five o\u2019clock the grandmother arrives. She always '
              'brings a cake. The children are very happy because her cake '
              'is famous in the family. They sit together and drink tea. '
              'The grandmother tells old stories about her village.',
          metinTr: 'Saat beste buyukanne gelir. Her zaman bir kek getirir. '
              'Cocuklar cok mutludur cunku onun keki ailede meshurdur. '
              'Birlikte otururlar ve cay icerler. Buyukanne koyu hakkinda '
              'eski hikayeler anlatir.'),
        HikayeParagraf(sira: 4,
          metinEn: 'Dinner is late on Sunday. They eat soup and rice '
              'together. After dinner the father reads a book and the '
              'mother writes a letter to her sister. The children go to bed '
              'at ten. Tomorrow is Monday and school starts again.',
          metinTr: 'Pazar gunu aksam yemegi gectir. Birlikte corba ve pilav '
              'yerler. Yemekten sonra baba kitap okur, anne kiz kardesine '
              'mektup yazar. Cocuklar saat onda yatar. Yarin pazartesi ve '
              'okul yeniden baslar.'),
        HikayeParagraf(sira: 5,
          metinEn: 'Before bed the mother looks at the school bags. One book '
              'is missing, so the youngest child looks for it in the garden. '
              'He finds it under the table with the dog. Everybody laughs. '
              'The father closes the windows and turns off the radio. The '
              'house is quiet again. Outside, the street lamps are on and a '
              'car passes slowly. Sunday is over but the family is together '
              'and the week can start.',
          metinTr: 'Yatmadan once anne okul cantalarina bakar. Bir kitap '
              'eksiktir, bu yuzden en kucuk cocuk onu bahcede arar. Onu '
              'masanin altinda kopekle birlikte bulur. Herkes guler. Baba '
              'pencereleri kapatir ve radyoyu kapatir. Ev yeniden sessizdir. '
              'Disarida sokak lambalari yanmistir ve bir araba yavasca gecer. '
              'Pazar bitmistir ama aile birliktedir ve hafta baslayabilir.'),
        HikayeParagraf(sira: 6,
          metinEn: 'On Monday morning the house is different. Everybody is '
              'fast and a little late. The children eat quickly and run to '
              'the bus. The mother finds a small piece of cake in the '
              'kitchen and smiles. Sunday is only one day, but it makes the '
              'other six days easier for this family.',
          metinTr: 'Pazartesi sabahi ev farklidir. Herkes hizlidir ve biraz '
              'gecikmistir. Cocuklar hizlica yer ve otobuse kosar. Anne '
              'mutfakta kucuk bir kek parcasi bulur ve gulumser. Pazar sadece '
              'bir gundur ama bu aile icin diger alti gunu kolaylastirir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The children wake up very early on Sunday.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What does the grandmother always bring?',
          secenekler: <String>['A book', 'Flowers', 'A cake', 'A letter'],
          kabulEdilenler: <String>['A cake']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The mother plants new ____ in the garden.',
          secenekler: <String>[],
          kabulEdilenler: <String>['flowers']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They work in the garden', 'They eat breakfast',
              'The grandmother arrives', 'They have dinner'],
          kabulEdilenler: <String>[
            'They eat breakfast, They work in the garden, '
                'The grandmother arrives, They have dinner'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What does the mother do after dinner?',
          secenekler: <String>[],
          kabulEdilenler: <String>['She writes a letter.',
              'writes a letter', 'She writes a letter to her sister.']),
      ],
    ),

    // ============================================================ 3
    Hikaye(
      kod: 'H-A1-003', baslik: 'The First Day at School', seviye: 'A1',
      konuEtiketi: 'Okul', kelimeSayisi: 292, tahminiDk: 4,
      ozetTr: 'Deniz yeni okulunda ilk gununu yasar ve arkadas edinir.',
      anahtarKavramlar: <String>['school', 'classroom', 'teacher', 'friend'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Deniz is nervous this morning. Today is her first day at '
              'the new school. Her bag is heavy because she has many new '
              'books. Her mother walks with her to the door and says, '
              '"Everything will be fine."',
          metinTr: 'Deniz bu sabah gergindir. Bugun yeni okulundaki ilk '
              'gunudur. Cantasi agirdir cunku bircok yeni kitabi vardir. '
              'Annesi onunla kapiya kadar yurur ve "Her sey yolunda gidecek" der.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The classroom is big and bright. There are twenty '
              'students. Deniz sits near the window. The teacher writes her '
              'name on the board and smiles. She speaks slowly and everybody '
              'understands her. The first lesson is English.',
          metinTr: 'Sinif buyuk ve aydinliktir. Yirmi ogrenci vardir. Deniz '
              'pencere kenarina oturur. Ogretmen adini tahtaya yazar ve '
              'gulumser. Yavas konusur ve herkes onu anlar. Ilk ders '
              'Ingilizcedir.'),
        HikayeParagraf(sira: 3,
          metinEn: 'At the break a girl comes to Deniz and says hello. Her '
              'name is Elif. They talk about music and films. Elif shows her '
              'the library and the garden. Deniz is not nervous any more. '
              'She has a new friend.',
          metinTr: 'Teneffuste bir kiz Deniz\u2019e gelir ve merhaba der. '
              'Adi Elif\u2019tir. Muzik ve filmler hakkinda konusurlar. Elif '
              'ona kutuphaneyi ve bahceyi gosterir. Deniz artik gergin '
              'degildir. Yeni bir arkadasi vardir.'),
        HikayeParagraf(sira: 4,
          metinEn: 'In the afternoon the teacher gives homework. It is not '
              'difficult. Deniz writes it in her notebook. At four o\u2019clock '
              'she goes home. Her mother asks about the day and Deniz says, '
              '"It was a good day."',
          metinTr: 'Ogleden sonra ogretmen odev verir. Zor degildir. Deniz '
              'bunu defterine yazar. Saat dortte eve gider. Annesi gunu sorar '
              've Deniz "Guzel bir gundu" der.'),
        HikayeParagraf(sira: 5,
          metinEn: 'The next morning Deniz is not nervous. She knows the way '
              'to the classroom and she knows one name. Elif waits for her '
              'near the door. They sit together in the second row. The '
              'teacher asks a question about the homework and Deniz answers '
              'it correctly. Her voice is small but the answer is right. '
              'After the lesson Elif says, "You are good at English." Deniz '
              'smiles and thinks that this school is not so difficult.',
          metinTr: 'Ertesi sabah Deniz gergin degildir. Sinifin yolunu bilir '
              've bir isim bilir. Elif kapinin yaninda onu bekler. Ikinci '
              'sirada birlikte otururlar. Ogretmen odev hakkinda bir soru '
              'sorar ve Deniz dogru cevaplar. Sesi kisiktir ama cevap '
              'dogrudur. Dersten sonra Elif "Ingilizcen iyi" der. Deniz '
              'gulumser ve bu okulun o kadar da zor olmadigini dusunur.'),
        HikayeParagraf(sira: 6,
          metinEn: 'At the end of the first week Deniz knows five names and '
              'the way to the library. She still does not like the long '
              'walk to school, but she likes her new classroom. On Friday '
              'evening she tells her mother about Elif, about the English '
              'teacher and about a boy who is always late. Her mother '
              'listens and says nothing about the first morning.',
          metinTr: 'Ilk haftanin sonunda Deniz bes isim ve kutuphanenin '
              'yolunu bilir. Okula giden uzun yurumeyi hala sevmez ama yeni '
              'sinifini sever. Cuma aksami annesine Elif’ten, Ingilizce '
              'ogretmeninden ve her zaman gec kalan bir cocuktan bahseder. '
              'Annesi dinler ve ilk sabah hakkinda hicbir sey soylemez.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Deniz sits near the door.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde pencere kenarina oturdugu yaziyor.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Who is Elif?',
          secenekler: <String>['The teacher', 'Deniz\u2019s mother',
              'A new friend', 'A neighbour'],
          kabulEdilenler: <String>['A new friend']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'There are ____ students in the classroom.',
          secenekler: <String>[],
          kabulEdilenler: <String>['twenty', '20']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She meets Elif', 'She goes to school',
              'She gets homework', 'She goes home'],
          kabulEdilenler: <String>[
            'She goes to school, She meets Elif, She gets homework, '
                'She goes home'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What is the first lesson?',
          secenekler: <String>[],
          kabulEdilenler: <String>['English', 'The first lesson is English.']),
      ],
    ),

    // ============================================================ 4
    Hikaye(
      kod: 'H-A1-004', baslik: 'The Train to Izmir', seviye: 'A1',
      konuEtiketi: 'Seyahat', kelimeSayisi: 286, tahminiDk: 4,
      ozetTr: 'Mert trenle Izmir\u2019e gider ve yolculukta yeni biriyle tanisir.',
      anahtarKavramlar: <String>['train', 'station', 'ticket', 'sea'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Mert goes to the station at seven in the morning. His '
              'suitcase is heavy because he takes many books. He buys a '
              'ticket and waits on the platform. The station is full of '
              'people. Some of them drink coffee and read the news.',
          metinTr: 'Mert sabah yedide istasyona gider. Bavulu agirdir cunku '
              'cok kitap alir. Bilet alir ve peronda bekler. Istasyon '
              'insanlarla doludur. Bazilari kahve icer ve haberleri okur.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The train arrives on time. Mert finds his seat near the '
              'window. An old man sits next to him. They say hello. The man '
              'is a teacher and he travels to Izmir every month. He talks '
              'about his students and his small garden.',
          metinTr: 'Tren zamaninda gelir. Mert pencere kenarindaki yerini '
              'bulur. Yasli bir adam yanina oturur. Selamlasirlar. Adam bir '
              'ogretmendir ve her ay Izmir\u2019e gider. Ogrencilerinden ve '
              'kucuk bahcesinden bahseder.'),
        HikayeParagraf(sira: 3,
          metinEn: 'The journey takes six hours. Mert reads for two hours, '
              'then he sleeps a little. In the afternoon he eats a sandwich '
              'and drinks tea. Outside the window he sees small villages, '
              'green fields and old houses.',
          metinTr: 'Yolculuk alti saat surer. Mert iki saat okur, sonra biraz '
              'uyur. Ogleden sonra sandvic yer ve cay icer. Pencerenin '
              'disinda kucuk koyler, yesil tarlalar ve eski evler gorur.'),
        HikayeParagraf(sira: 4,
          metinEn: 'At four o\u2019clock the train arrives in Izmir. The air is '
              'warm and Mert can smell the sea. His cousin waits for him at '
              'the exit. They take a bus to the city centre. Mert is tired '
              'but very happy.',
          metinTr: 'Saat dortte tren Izmir\u2019e varir. Hava sicaktir ve Mert '
              'denizin kokusunu alir. Kuzeni cikista onu bekler. Sehir '
              'merkezine otobusle giderler. Mert yorgundur ama cok mutludur.'),
        HikayeParagraf(sira: 5,
          metinEn: 'In the evening they walk near the sea. The water is dark '
              'and the lights of the city are on the other side. They eat '
              'fish in a small restaurant and Mert calls his mother. He tells '
              'her about the old teacher on the train and about the warm '
              'weather. His mother is happy. Later, in his room, Mert opens '
              'one of his books but he is too tired to read. He sleeps in '
              'ten minutes.',
          metinTr: 'Aksam deniz kenarinda yururler. Su karanliktir ve sehrin '
              'isiklari karsi taraftadir. Kucuk bir lokantada balik yerler ve '
              'Mert annesini arar. Ona trendeki yasli ogretmenden ve sicak '
              'havadan bahseder. Annesi mutludur. Sonra odasinda Mert '
              'kitaplarindan birini acar ama okumak icin cok yorgundur. On '
              'dakikada uyur.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Mert stays in Izmir for five days. He walks a lot, reads '
              'two of his books and eats fish four times. On the last '
              'morning he buys a small present for his mother. The train '
              'home is at eight and this time he knows where to sit.',
          metinTr: 'Mert Izmir’de bes gun kalir. Cok yurur, kitaplarindan '
              'ikisini okur ve dort kez balik yer. Son sabah annesine kucuk '
              'bir hediye alir. Eve donen tren sekizdedir ve bu kez nereye '
              'oturacagini bilir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The train arrives late.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Who sits next to Mert?',
          secenekler: <String>['His cousin', 'An old teacher', 'A student',
              'A doctor'],
          kabulEdilenler: <String>['An old teacher']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The journey takes ____ hours.',
          secenekler: <String>[],
          kabulEdilenler: <String>['six', '6']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He buys a ticket', 'He sleeps a little',
              'He meets his cousin', 'He finds his seat'],
          kabulEdilenler: <String>[
            'He buys a ticket, He finds his seat, He sleeps a little, '
                'He meets his cousin'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Why is Mert\u2019s suitcase heavy?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Because he takes many books.',
              'He takes many books.', 'many books']),
      ],
    ),

    // ============================================================ 5
    Hikaye(
      kod: 'H-A1-005', baslik: 'At the Market', seviye: 'A1',
      konuEtiketi: 'Alisveris', kelimeSayisi: 293, tahminiDk: 4,
      ozetTr: 'Ayse pazara gider, alisveris yapar ve bir arkadasiyla karsilasir.',
      anahtarKavramlar: <String>['market', 'tomato', 'price', 'cheese'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Every Tuesday Ayse goes to the market near her house. She '
              'takes a big bag and a small list. The market opens at eight '
              'and closes in the afternoon. She always goes early because '
              'the vegetables are fresh at that hour.',
          metinTr: 'Her sali Ayse evinin yakinindaki pazara gider. Buyuk bir '
              'canta ve kucuk bir liste alir. Pazar sekizde acilir ve ogleden '
              'sonra kapanir. Her zaman erken gider cunku sebzeler o saatte '
              'tazedir.'),
        HikayeParagraf(sira: 2,
          metinEn: 'First she buys tomatoes and green peppers. The price is '
              'good this week. Then she goes to the cheese shop. The man '
              'there knows her name. He gives her a small piece to try. '
              'The cheese is very good, so she buys half a kilo.',
          metinTr: 'Once domates ve yesil biber alir. Bu hafta fiyat iyidir. '
              'Sonra peynirciye gider. Oradaki adam onun adini bilir. Ona '
              'denemesi icin kucuk bir parca verir. Peynir cok iyidir, bu '
              'yuzden yarim kilo alir.'),
        HikayeParagraf(sira: 3,
          metinEn: 'At the end of the market she sees an old friend, Hatice. '
              'They do not meet often. They drink tea together and talk for '
              'twenty minutes. Hatice has a new job in a bookshop and she is '
              'very happy about it.',
          metinTr: 'Pazarin sonunda eski bir arkadasini, Hatice\u2019yi gorur. '
              'Sik gorusmezler. Birlikte cay icerler ve yirmi dakika '
              'konusurlar. Hatice\u2019nin bir kitapcida yeni bir isi vardir ve '
              'bundan cok mutludur.'),
        HikayeParagraf(sira: 4,
          metinEn: 'Ayse goes home at eleven. Her bag is heavy but she is '
              'happy. She cleans the vegetables and puts them in the '
              'kitchen. In the evening she makes soup with the new tomatoes. '
              'Her family says it is very good.',
          metinTr: 'Ayse saat on birde eve gider. Cantasi agirdir ama '
              'mutludur. Sebzeleri temizler ve mutfaga koyar. Aksam yeni '
              'domateslerle corba yapar. Ailesi cok guzel oldugunu soyler.'),
        HikayeParagraf(sira: 5,
          metinEn: 'The next Tuesday Ayse goes to the market again. This time '
              'she takes her daughter with her. The girl is seven and she '
              'asks about everything: the names of the vegetables, the '
              'prices, the man with the cheese. Ayse answers all the '
              'questions. At the end her daughter carries a small bag with '
              'two apples in it. She is very proud. They walk home together '
              'and talk about lunch.',
          metinTr: 'Ertesi sali Ayse yine pazara gider. Bu kez kizini da '
              'yanina alir. Kiz yedi yasindadir ve her seyi sorar: sebzelerin '
              'adlarini, fiyatlari, peynirci adami. Ayse butun sorulari '
              'cevaplar. Sonunda kizi icinde iki elma olan kucuk bir canta '
              'tasir. Cok gururludur. Birlikte eve yururler ve ogle yemegi '
              'hakkinda konusurlar.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Ayse likes these Tuesday mornings very much. The market '
              'is not only a place for food. It is a place for people. She '
              'knows the names of six sellers and they know her. In winter '
              'the market is cold and small, in summer it is big and full '
              'of colours. But it is always there, every Tuesday.',
          metinTr: 'Ayse bu sali sabahlarini cok sever. Pazar sadece yiyecek '
              'yeri degildir. Insan yeridir. Alti saticinin adini bilir ve '
              'onlar da onu bilir. Kisin pazar soguk ve kucuktur, yazin buyuk '
              've renklerle doludur. Ama her sali her zaman oradadir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Ayse goes to the market every Tuesday.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['True']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Where does Hatice work now?',
          secenekler: <String>['In a bookshop', 'At the market',
              'In a school', 'At home'],
          kabulEdilenler: <String>['In a bookshop']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'She buys half a ____ of cheese.',
          secenekler: <String>[],
          kabulEdilenler: <String>['kilo']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She buys cheese', 'She buys tomatoes',
              'She makes soup', 'She meets Hatice'],
          kabulEdilenler: <String>[
            'She buys tomatoes, She buys cheese, She meets Hatice, '
                'She makes soup'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Why does Ayse go to the market early?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Because the vegetables are fresh.',
              'The vegetables are fresh.', 'fresh vegetables']),
      ],
    ),

    // ============================================================ 6
    Hikaye(
      kod: 'H-A1-006', baslik: 'A Busy Day at Work', seviye: 'A1',
      konuEtiketi: 'Is', kelimeSayisi: 277, tahminiDk: 4,
      ozetTr: 'Selin ofiste yogun bir gun gecirir ve raporunu bitirir.',
      anahtarKavramlar: <String>['office', 'meeting', 'report', 'computer'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Selin works in a small office in the city centre. She '
              'arrives at nine and opens her computer. There are many new '
              'emails. She reads them and writes short answers. Her desk is '
              'near the window and she likes the light.',
          metinTr: 'Selin sehir merkezinde kucuk bir ofiste calisir. Dokuzda '
              'gelir ve bilgisayarini acar. Cok sayida yeni e-posta vardir. '
              'Onlari okur ve kisa cevaplar yazar. Masasi pencerenin '
              'yanindadir ve isigi sever.'),
        HikayeParagraf(sira: 2,
          metinEn: 'At ten there is a meeting. Six people sit around the '
              'table. They talk about a new project. Selin takes notes and '
              'asks two questions. The meeting is long but useful. It '
              'finishes at half past eleven.',
          metinTr: 'Saat onda bir toplanti vardir. Alti kisi masanin etrafina '
              'oturur. Yeni bir proje hakkinda konusurlar. Selin not alir ve '
              'iki soru sorar. Toplanti uzundur ama faydalidir. On bir '
              'bucukta biter.'),
        HikayeParagraf(sira: 3,
          metinEn: 'After lunch Selin writes a report. It is difficult '
              'because she needs many numbers. She works quietly for three '
              'hours. Her colleague brings her a cup of coffee and says, '
              '"You are almost finished."',
          metinTr: 'Ogle yemeginden sonra Selin bir rapor yazar. Zordur cunku '
              'cok sayida sayiya ihtiyaci vardir. Uc saat sessizce calisir. '
              'Is arkadasi ona bir fincan kahve getirir ve "Neredeyse bitti" der.'),
        HikayeParagraf(sira: 4,
          metinEn: 'At six o\u2019clock the report is ready. Selin sends it and '
              'closes her computer. She is tired but happy. On the way home '
              'she buys bread and a small cake. Tomorrow is Friday and the '
              'week is almost over.',
          metinTr: 'Saat altida rapor hazirdir. Selin onu gonderir ve '
              'bilgisayarini kapatir. Yorgundur ama mutludur. Eve giderken '
              'ekmek ve kucuk bir kek alir. Yarin cuma ve hafta neredeyse bitti.'),
        HikayeParagraf(sira: 5,
          metinEn: 'On Friday morning her manager reads the report. He calls '
              'Selin to his room and says, "This is clear and short. Thank '
              'you." Selin is surprised because he does not say this often. '
              'She goes back to her desk and opens a new file. The next '
              'project starts on Monday and this time she is not alone: two '
              'new people join her team. She writes their names in her '
              'notebook and plans the first meeting.',
          metinTr: 'Cuma sabahi mudurü raporu okur. Selin’i odasina cagirir '
              've "Bu acik ve kisa. Tesekkur ederim" der. Selin sasirir cunku '
              'bunu sik soylemez. Masasina doner ve yeni bir dosya acar. '
              'Sonraki proje pazartesi baslar ve bu kez yalniz degildir: '
              'ekibine iki yeni kisi katilir. Adlarini defterine yazar ve ilk '
              'toplantiyi planlar.'),
        HikayeParagraf(sira: 6,
          metinEn: 'On Saturday Selin does not open her computer. She goes to '
              'the park with a friend and they walk for two hours. They talk '
              'about work only for five minutes. In the evening she watches '
              'an old film at home. On Monday the new project starts, but '
              'today is not Monday.',
          metinTr: 'Cumartesi Selin bilgisayarini acmaz. Bir arkadasiyla '
              'parka gider ve iki saat yururler. Is hakkinda sadece bes '
              'dakika konusurlar. Aksam evde eski bir film izler. Pazartesi '
              'yeni proje baslar ama bugun pazartesi degil.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The meeting finishes at eleven o\u2019clock.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Toplanti on bir bucukta biter.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'How many people are at the meeting?',
          secenekler: <String>['Two', 'Four', 'Six', 'Ten'],
          kabulEdilenler: <String>['Six']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'Selin writes a ____ after lunch.',
          secenekler: <String>[],
          kabulEdilenler: <String>['report']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She writes the report', 'She reads emails',
              'She goes home', 'She joins the meeting'],
          kabulEdilenler: <String>[
            'She reads emails, She joins the meeting, She writes the report, '
                'She goes home'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What does Selin buy on the way home?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Bread and a small cake.',
              'bread and a cake', 'She buys bread and a small cake.']),
      ],
    ),

    // ============================================================ 7
    Hikaye(
      kod: 'H-A1-007', baslik: 'At the Doctor', seviye: 'A1',
      konuEtiketi: 'Saglik', kelimeSayisi: 282, tahminiDk: 4,
      ozetTr: 'Emre bas agrisi icin doktora gider ve tavsiye alir.',
      anahtarKavramlar: <String>['doctor', 'headache', 'medicine', 'sleep'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Emre has a headache for three days. He does not sleep '
              'well and he is always tired. On Thursday morning he calls '
              'the hospital and takes an appointment. The doctor can see him '
              'at two o\u2019clock.',
          metinTr: 'Emre\u2019nin uc gundur basi agriyor. Iyi uyuyamiyor ve '
              'surekli yorgun. Persembe sabahi hastaneyi arar ve randevu '
              'alir. Doktor onu saat ikide gorebilir.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The waiting room is quiet. Emre reads a magazine for ten '
              'minutes. Then a nurse says his name. The doctor is a young '
              'woman. She asks many questions: "Do you drink a lot of '
              'coffee? How many hours do you sleep?"',
          metinTr: 'Bekleme odasi sessizdir. Emre on dakika dergi okur. Sonra '
              'bir hemsire adini soyler. Doktor genc bir kadindir. Cok soru '
              'sorar: "Cok kahve iciyor musunuz? Kac saat uyuyorsunuz?"'),
        HikayeParagraf(sira: 3,
          metinEn: 'Emre says he drinks five cups of coffee every day and '
              'sleeps only five hours. The doctor smiles and says, "This is '
              'the problem." She gives him some medicine but she also gives '
              'advice: less coffee, more sleep and a short walk every '
              'evening.',
          metinTr: 'Emre her gun bes fincan kahve ictigini ve sadece bes saat '
              'uyudugunu soyler. Doktor gulumser ve "Sorun bu" der. Ona biraz '
              'ilac verir ama tavsiye de verir: daha az kahve, daha cok uyku '
              've her aksam kisa bir yuruyus.'),
        HikayeParagraf(sira: 4,
          metinEn: 'Emre goes home and starts the new plan the same evening. '
              'After one week the headache is gone. He drinks only two cups '
              'of coffee and walks in the park every day. He feels much '
              'better now.',
          metinTr: 'Emre eve gider ve yeni plana ayni aksam baslar. Bir hafta '
              'sonra bas agrisi gecer. Sadece iki fincan kahve icer ve her '
              'gun parkta yurur. Simdi cok daha iyi hissediyor.'),
        HikayeParagraf(sira: 5,
          metinEn: 'One month later Emre goes to the hospital again for a '
              'short control. The same doctor sees him. She asks the same '
              'questions and Emre answers with a smile: two cups of coffee, '
              'seven hours of sleep, a walk every evening. The doctor says, '
              '"You do not need the medicine any more." On the way home Emre '
              'buys a small notebook and writes his new plan on the first '
              'page. He wants to keep it.',
          metinTr: 'Bir ay sonra Emre kisa bir kontrol icin yine hastaneye '
              'gider. Ayni doktor onu goruur. Ayni sorulari sorar ve Emre '
              'gulumseyerek cevaplar: iki fincan kahve, yedi saat uyku, her '
              'aksam bir yuruyus. Doktor "Artik ilaca ihtiyacin yok" der. Eve '
              'giderken Emre kucuk bir defter alir ve yeni planini ilk sayfaya '
              'yazar. Onu surdurmek ister.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Emre tells his brother about the doctor and the advice. '
              'His brother also drinks too much coffee and sleeps too '
              'little. "Try it for two weeks," Emre says. His brother '
              'laughs but he tries it. After two weeks he calls Emre and '
              'says only three words: "You were right."',
          metinTr: 'Emre kardesine doktordan ve tavsiyeden bahseder. Kardesi '
              'de cok kahve icer ve az uyur. "Iki hafta dene" der Emre. '
              'Kardesi guler ama dener. Iki hafta sonra Emre’yi arar ve '
              'sadece uc kelime soyler: "Haklisin."'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The doctor gives only medicine and no advice.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'How many hours does Emre sleep before the visit?',
          secenekler: <String>['Five', 'Seven', 'Eight', 'Ten'],
          kabulEdilenler: <String>['Five']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'Emre has a ____ for three days.',
          secenekler: <String>[],
          kabulEdilenler: <String>['headache']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He sees the doctor', 'He calls the hospital',
              'The headache is gone', 'He starts the new plan'],
          kabulEdilenler: <String>[
            'He calls the hospital, He sees the doctor, He starts the new plan, '
                'The headache is gone'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What advice does the doctor give?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Less coffee, more sleep and a short walk.',
              'less coffee more sleep and a walk',
              'Less coffee, more sleep and a short walk every evening.']),
      ],
    ),

    // ============================================================ 8
    Hikaye(
      kod: 'H-A1-008', baslik: 'The Guitar Lesson', seviye: 'A1',
      konuEtiketi: 'Hobiler', kelimeSayisi: 282, tahminiDk: 4,
      ozetTr: 'Can gitar dersine baslar ve ilk sarkisini calar.',
      anahtarKavramlar: <String>['guitar', 'practice', 'song', 'teacher'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Can is thirty years old and he works in a bank. For many '
              'years he wants to play the guitar but he never starts. This '
              'September he finds a small music school near his office and '
              'he pays for ten lessons.',
          metinTr: 'Can otuz yasindadir ve bir bankada calisir. Yillardir '
              'gitar calmak ister ama hic baslamaz. Bu eylul ofisinin '
              'yakininda kucuk bir muzik okulu bulur ve on ders icin odeme yapar.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The first lesson is difficult. His fingers hurt and the '
              'sound is not beautiful. The teacher is patient. He says, '
              '"Everybody starts like this. Practice fifteen minutes every '
              'day, not three hours on Sunday."',
          metinTr: 'Ilk ders zordur. Parmaklari agrir ve ses guzel degildir. '
              'Ogretmen sabirlidir. "Herkes boyle baslar. Pazar gunu uc saat '
              'degil, her gun on bes dakika alistirma yapin" der.'),
        HikayeParagraf(sira: 3,
          metinEn: 'Can follows the advice. Every evening after dinner he '
              'takes the guitar for fifteen minutes. In the first week he '
              'learns three chords. In the third week the sound is much '
              'better and his fingers do not hurt.',
          metinTr: 'Can tavsiyeye uyar. Her aksam yemekten sonra on bes '
              'dakika gitari eline alir. Ilk hafta uc akor ogrenir. Ucuncu '
              'haftada ses cok daha iyidir ve parmaklari agrimaz.'),
        HikayeParagraf(sira: 4,
          metinEn: 'After two months Can plays a whole song. It is an old '
              'song and his mother knows it well. He plays it for his family '
              'on a Sunday evening. Nobody is a musician but everybody is '
              'very happy.',
          metinTr: 'Iki ay sonra Can tam bir sarki calar. Eski bir sarkidir ve '
              'annesi onu iyi bilir. Bir pazar aksami ailesine calar. Kimse '
              'muzisyen degildir ama herkes cok mutludur.'),
        HikayeParagraf(sira: 5,
          metinEn: 'In December the music school has a small concert. Six '
              'students play, and Can is the oldest one. He is nervous before '
              'his turn, but when he starts, his fingers know the way. He '
              'plays the same old song. It is not perfect: he makes two small '
              'mistakes. Nobody says anything about them. After the concert '
              'his teacher says, "Next year, a new song." Can already knows '
              'which one he wants.',
          metinTr: 'Aralikta muzik okulunda kucuk bir konser vardir. Alti '
              'ogrenci calar ve Can en yaslisidir. Sirasi gelmeden once '
              'gergindir ama basladiginda parmaklari yolu bilir. Ayni eski '
              'sarkiyi calar. Kusursuz degildir: iki kucuk hata yapar. Kimse '
              'onlar hakkinda bir sey soylemez. Konserden sonra ogretmeni '
              '"Gelecek yil yeni bir sarki" der. Can hangisini istedigini '
              'simdiden bilir.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Now Can plays every evening, even after long days at the '
              'bank. His guitar is next to his chair, not in a box under '
              'the bed. That is the real difference. His neighbour hears the '
              'music through the wall and one day she asks, "Can you teach '
              'my son?" Can says, "I am still a student." But he says yes.',
          metinTr: 'Simdi Can bankadaki uzun gunlerden sonra bile her aksam '
              'calar. Gitari yatagin altindaki kutuda degil, sandalyesinin '
              'yanindadir. Gercek fark budur. Komsusu muzigi duvardan duyar '
              've bir gun "Ogluma ders verebilir misin?" diye sorar. Can '
              '"Ben hala ogrenciyim" der. Ama evet der.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The teacher says: practice three hours on Sunday.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'How long does Can practice every day?',
          secenekler: <String>['Five minutes', 'Fifteen minutes',
              'One hour', 'Three hours'],
          kabulEdilenler: <String>['Fifteen minutes']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'In the first week he learns three ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['chords']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He learns three chords', 'He pays for lessons',
              'He plays a whole song', 'His fingers hurt'],
          kabulEdilenler: <String>[
            'He pays for lessons, His fingers hurt, He learns three chords, '
                'He plays a whole song'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Where does Can work?',
          secenekler: <String>[],
          kabulEdilenler: <String>['In a bank.', 'a bank',
              'He works in a bank.']),
      ],
    ),

    // ============================================================ 9
    Hikaye(
      kod: 'H-A1-009', baslik: 'Cooking with Grandmother', seviye: 'A1',
      konuEtiketi: 'Yemek', kelimeSayisi: 268, tahminiDk: 3,
      ozetTr: 'Zeynep buyukannesinden eski bir corba tarifini ogrenir.',
      anahtarKavramlar: <String>['grandmother', 'soup', 'recipe', 'kitchen'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Zeynep is eleven years old. Every Saturday she goes to '
              'her grandmother\u2019s house. The kitchen there is old and small '
              'but it always smells good. Today they cook together for the '
              'first time.',
          metinTr: 'Zeynep on bir yasindadir. Her cumartesi buyukannesinin '
              'evine gider. Oradaki mutfak eski ve kucuktur ama her zaman '
              'guzel kokar. Bugun ilk kez birlikte yemek yaparlar.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The grandmother takes an old notebook from the shelf. '
              'The recipe is inside and the paper is yellow. "My mother '
              'writes this," she says. "It is one hundred years old." Zeynep '
              'reads it slowly.',
          metinTr: 'Buyukanne raftan eski bir defter alir. Tarif icindedir ve '
              'kagit sararmistir. "Bunu annem yazar" der. "Yuz yillik." '
              'Zeynep onu yavasca okur.'),
        HikayeParagraf(sira: 3,
          metinEn: 'They wash the vegetables together. Zeynep cuts the '
              'tomatoes and her grandmother makes the soup. The kitchen is '
              'warm and they talk about the old days. The grandmother tells '
              'a story about her first house.',
          metinTr: 'Sebzeleri birlikte yikarlar. Zeynep domatesleri keser ve '
              'buyukannesi corbayi yapar. Mutfak sicaktir ve eski gunler '
              'hakkinda konusurlar. Buyukanne ilk evi hakkinda bir hikaye anlatir.'),
        HikayeParagraf(sira: 4,
          metinEn: 'At one o\u2019clock the soup is ready. It is hot and very '
              'good. Zeynep eats two plates. Before she goes home her '
              'grandmother gives her the old notebook. "Now it is yours," '
              'she says.',
          metinTr: 'Saat birde corba hazirdir. Sicak ve cok guzeldir. Zeynep '
              'iki tabak yer. Eve gitmeden once buyukannesi ona eski defteri '
              'verir. "Artik senin" der.'),
        HikayeParagraf(sira: 5,
          metinEn: 'At home Zeynep puts the notebook on her desk. She reads '
              'the other recipes: bread, cake, and a soup with rice. Some '
              'words are difficult and some pages are dirty from old '
              'kitchens. On Sunday she asks her mother for help and they '
              'make the cake together. It is not as good as her '
              'grandmother’s cake, but it is her first one. She writes the '
              'date on the last page: her first recipe.',
          metinTr: 'Evde Zeynep defteri masasina koyar. Diger tarifleri okur: '
              'ekmek, kek ve pirincli bir corba. Bazi kelimeler zordur ve bazi '
              'sayfalar eski mutfaklardan kirlidir. Pazar gunu annesinden '
              'yardim ister ve keki birlikte yaparlar. Buyukannesinin keki '
              'kadar guzel degildir ama ilkidir. Son sayfaya tarihi yazar: '
              'ilk tarifi.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Every Saturday Zeynep learns a new page. Some recipes '
              'are easy and some are very difficult. Her grandmother is '
              'always in the kitchen with her, on a chair near the window. '
              'She does not cook much now, but she watches and she talks. '
              'Zeynep listens to the stories more than the recipes. Both '
              'are in the same old notebook.',
          metinTr: 'Her cumartesi Zeynep yeni bir sayfa ogrenir. Bazi '
              'tarifler kolay, bazilari cok zordur. Buyukannesi her zaman '
              'onunla mutfaktadir, pencerenin yanindaki bir sandalyede. Artik '
              'cok yemek yapmaz ama izler ve konusur. Zeynep hikayeleri '
              'tariflerden cok dinler. Ikisi de ayni eski deftedir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The recipe is new.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Tarif yuz yillik.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What does the grandmother give to Zeynep?',
          secenekler: <String>['A plate', 'The old notebook', 'Some money',
              'A cake'],
          kabulEdilenler: <String>['The old notebook']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'Zeynep cuts the ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['tomatoes']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They wash the vegetables',
              'She reads the recipe', 'She eats two plates',
              'She takes the notebook home'],
          kabulEdilenler: <String>[
            'She reads the recipe, They wash the vegetables, '
                'She eats two plates, She takes the notebook home'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'How old is Zeynep?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Eleven', '11', 'She is eleven years old.']),
      ],
    ),

    // ============================================================ 10
    Hikaye(
      kod: 'H-A1-010', baslik: 'A Rainy Day', seviye: 'A1',
      konuEtiketi: 'Hava ve mevsimler', kelimeSayisi: 276, tahminiDk: 4,
      ozetTr: 'Yagmurlu bir gunde planlar degisir ama gun yine guzel geceer.',
      anahtarKavramlar: <String>['rain', 'umbrella', 'library', 'afternoon'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'On Saturday morning Burak and his sister want to go to '
              'the park. They have a new ball and they are ready. But when '
              'they open the door, the rain is heavy. The street is wet and '
              'grey.',
          metinTr: 'Cumartesi sabahi Burak ve kiz kardesi parka gitmek '
              'isterler. Yeni bir toplari vardir ve hazirdirlar. Ama kapiyi '
              'actiklarinda yagmur cok kuvvetlidir. Sokak islak ve gridir.'),
        HikayeParagraf(sira: 2,
          metinEn: 'Their mother says, "Take an umbrella and go to the '
              'library. It is only five minutes from here." The children are '
              'not happy at first. They want to play, not read.',
          metinTr: 'Anneleri "Bir semsiye alin ve kutuphaneye gidin. Buradan '
              'sadece bes dakika" der. Cocuklar once mutlu degildir. Okumak '
              'degil, oynamak isterler.'),
        HikayeParagraf(sira: 3,
          metinEn: 'The library is warm and quiet. There is a small room for '
              'children with big windows. Burak finds a book about trains. '
              'His sister finds a book about the sea. They read for two '
              'hours and nobody is bored.',
          metinTr: 'Kutuphane sicak ve sessizdir. Cocuklar icin buyuk '
              'pencereli kucuk bir oda vardir. Burak trenler hakkinda bir '
              'kitap bulur. Kiz kardesi deniz hakkinda bir kitap bulur. Iki '
              'saat okurlar ve kimse sikilmaz.'),
        HikayeParagraf(sira: 4,
          metinEn: 'In the afternoon the rain stops. The children go home '
              'with two books. The sun is low and the air is clean. "The '
              'park is tomorrow," Burak says. "Today was good too."',
          metinTr: 'Ogleden sonra yagmur durur. Cocuklar iki kitapla eve '
              'gider. Gunes alcaktir ve hava temizdir. "Park yarin" der '
              'Burak. "Bugun de guzeldi."'),
        HikayeParagraf(sira: 5,
          metinEn: 'On Sunday the weather is different. The sky is blue and '
              'the ground is dry. Burak and his sister take the ball and go '
              'to the park. They play for two hours with three other '
              'children. Later they sit on a bench and talk about the books '
              'from the library. Burak says he wants to see a real train '
              'station one day. His sister says she wants to see the sea. '
              'They walk home slowly.',
          metinTr: 'Pazar gunu hava farklidir. Gokyuzu mavidir ve yer kurudur. '
              'Burak ve kiz kardesi topu alir ve parka gider. Uc baska '
              'cocukla iki saat oynarlar. Sonra bir banka otururlar ve '
              'kutuphaneden aldiklari kitaplar hakkinda konusurlar. Burak bir '
              'gun gercek bir tren istasyonu gormek istedigini soyler. Kiz '
              'kardesi denizi gormek istedigini soyler. Yavasca eve yururler.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Two weeks later the family goes to the train station '
              'together. It is not a long journey, only one hour, but for '
              'Burak it is the first time. He looks at everything: the '
              'clock, the numbers, the big map on the wall. His sister '
              'reads her book about the sea and waits. Sometimes a rainy '
              'Saturday is the start of something.',
          metinTr: 'Iki hafta sonra aile birlikte tren istasyonuna gider. '
              'Uzun bir yolculuk degildir, sadece bir saat, ama Burak icin '
              'ilk kezdir. Her seye bakar: saate, numaralara, duvardaki '
              'buyuk haritaya. Kiz kardesi deniz hakkindaki kitabini okur ve '
              'bekler. Bazen yagmurlu bir cumartesi bir seyin baslangicidir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The children go to the park in the morning.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False']),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What book does Burak find?',
          secenekler: <String>['A book about the sea', 'A book about trains',
              'A book about animals', 'A book about food'],
          kabulEdilenler: <String>['A book about trains']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The library is only ____ minutes from the house.',
          secenekler: <String>[],
          kabulEdilenler: <String>['five', '5']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They read for two hours', 'The rain starts',
              'They go home', 'They go to the library'],
          kabulEdilenler: <String>[
            'The rain starts, They go to the library, They read for two hours, '
                'They go home'
          ]),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What does Burak say at the end?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Today was good too.',
              'The park is tomorrow. Today was good too.',
              'today was good too']),
      ],
    ),

    // ============================================================ 11
    Hikaye(
      kod: 'H-A2-001', baslik: 'The Missing Keys', seviye: 'A2',
      konuEtiketi: 'Gunluk sorun', kelimeSayisi: 512, tahminiDk: 7,
      ozetTr: 'Deniz anahtarlarini kaybeder ve butun evi arar. '
          'Sonunda beklenmedik bir yerde bulur.',
      anahtarKavramlar: <String>['keys', 'search', 'remember', 'pocket'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Last Tuesday was a difficult day for Deniz. She finished '
              'work at six and walked to her car. She put her hand in her bag '
              'and looked for her keys. They were not there. She looked again, '
              'but the bag was almost empty. Only her phone, a book and an old '
              'ticket were inside.',
          metinTr: 'Gecen sali Deniz icin zor bir gundu. Saat altida isi bitti '
              've arabasina dogru yurudu. Elini cantasina soktu ve anahtarlarini '
              'aradi. Orada degillerdi. Tekrar bakti ama canta neredeyse bostu. '
              'Icinde yalnizca telefonu, bir kitap ve eski bir bilet vardi.'),
        HikayeParagraf(sira: 2,
          metinEn: 'She went back to the office. The building was quiet because '
              'most people had left. She checked her desk, the drawers and the '
              'floor under the chair. Nothing. Her colleague Murat was still '
              'there and helped her. "Have you looked in the meeting room?" he '
              'asked. They went there together, but the room was empty.',
          metinTr: 'Ofise geri dondu. Cogu insan gittigi icin bina sessizdi. '
              'Masasini, cekmeceleri ve sandalyenin altindaki zemini kontrol '
              'etti. Hicbir sey. Meslektasi Murat hala oradaydi ve ona yardim '
              'etti. "Toplanti odasina baktin mi?" diye sordu. Birlikte oraya '
              'gittiler ama oda bostu.'),
        HikayeParagraf(sira: 3,
          metinEn: 'Deniz tried to remember her day. In the morning she had '
              'opened the door with her keys. Then she had put them somewhere. '
              'She thought about the kitchen, the coffee machine and the lift. '
              'She had used the lift four times, but you do not need keys in a '
              'lift.',
          metinTr: 'Deniz gununu hatirlamaya calisti. Sabah kapiyi anahtarlariyla '
              'acmisti. Sonra onlari bir yere koymustu. Mutfagi, kahve makinesini '
              've asansoru dusundu. Asansoru dort kez kullanmisti ama asansorde '
              'anahtara ihtiyaciniz yoktur.'),
        HikayeParagraf(sira: 4,
          metinEn: 'It was already dark outside. Deniz was tired and a little '
              'angry with herself. "I have never lost anything important," she '
              'said. Murat smiled. "That is not true. You lost your umbrella '
              'last month." They laughed for a moment and the day felt easier.',
          metinTr: 'Disarisi coktan kararmisti. Deniz yorgundu ve kendine biraz '
              'kizgindi. "Hic onemli bir sey kaybetmedim," dedi. Murat gulumsedi. '
              '"Bu dogru degil. Gecen ay semsiyeni kaybettin." Bir an guldeler '
              've gun daha kolay hissettirdi.'),
        HikayeParagraf(sira: 5,
          metinEn: 'Then Murat had an idea. "Which coat did you wear this '
              'morning?" Deniz looked down. She was wearing a light jacket, but '
              'in the morning the weather had been colder and she had worn a '
              'heavy coat. The coat was still on the hook near the entrance.',
          metinTr: 'Sonra Murat\u2019in aklina bir fikir geldi. "Bu sabah hangi '
              'montu giydin?" Deniz asagi bakti. Ince bir ceket giyiyordu ama '
              'sabah hava daha soguktu ve kalin bir mont giymisti. Mont hala '
              'girisin yanindaki askidaydi.'),
        HikayeParagraf(sira: 6,
          metinEn: 'She ran to the entrance and put her hand in the pocket of '
              'the heavy coat. The keys were there. They were cold and heavy in '
              'her hand. She felt happy and stupid at the same time. "Thank you," '
              'she said to Murat. "You are better at this than I am." Since that '
              'day, Deniz has always kept her keys in the same pocket.',
          metinTr: 'Girise kostu ve elini kalin montun cebine soktu. Anahtarlar '
              'oradaydi. Elinde soguk ve agirdilar. Ayni anda hem mutlu hem aptal '
              'hissetti. "Tesekkur ederim," dedi Murat\u2019a. "Bu konuda benden '
              'daha iyisin." O gunden beri Deniz anahtarlarini hep ayni cepte '
              'tutuyor.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Deniz found her keys in her bag.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Canta neredeyse bostu; anahtarlar montun cebindeydi.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Why was the building quiet?',
          secenekler: <String>['It was a holiday', 'Most people had left',
              'The lights were off', 'It was early morning'],
          kabulEdilenler: <String>['Most people had left']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The keys were in the pocket of the heavy ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['coat']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She went back to the office',
              'She looked in her bag', 'Murat asked about her coat',
              'She found the keys'],
          kabulEdilenler: <String>['She looked in her bag',
              'She went back to the office', 'Murat asked about her coat',
              'She found the keys']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What has Deniz done since that day?',
          secenekler: <String>[],
          kabulEdilenler: <String>['She has always kept her keys in the same pocket.',
              'She keeps her keys in the same pocket.']),
      ],
    ),

    // ============================================================ 12
    Hikaye(
      kod: 'H-A2-002', baslik: 'The Late Train', seviye: 'A2',
      konuEtiketi: 'Seyahat', kelimeSayisi: 534, tahminiDk: 7,
      ozetTr: 'Emre treni kacirir ama bu gecikme onu beklenmedik bir '
          'karsilasmaya goturur.',
      anahtarKavramlar: <String>['train', 'platform', 'late', 'decision'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Emre had to catch the eight o\u2019clock train to Izmir. He '
              'left home early, but the traffic was worse than usual. When he '
              'arrived at the station, the clock showed five past eight. The '
              'platform was empty. The train had gone.',
          metinTr: 'Emre\u2019nin sekiz treniyle Izmir\u2019e gitmesi gerekiyordu. '
              'Evden erken cikti ama trafik her zamankinden daha kotuydu. '
              'Istasyona vardiginda saat sekizi bes geciyordu. Peron bostu. '
              'Tren gitmisti.'),
        HikayeParagraf(sira: 2,
          metinEn: 'He went to the ticket office. "When is the next train?" he '
              'asked. The woman looked at her screen. "At half past eleven. '
              'There is nothing before that." Emre sighed. He had three hours '
              'and nothing to do.',
          metinTr: 'Bilet gisesine gitti. "Sonraki tren ne zaman?" diye sordu. '
              'Kadin ekranina bakti. "On bir bucukta. Ondan once bir sey yok." '
              'Emre ic cekti. Uc saati ve yapacak hicbir sey yoktu.'),
        HikayeParagraf(sira: 3,
          metinEn: 'He bought a coffee and sat on a bench. The station was busy. '
              'People were running, talking on the phone and looking at the '
              'boards. Emre opened his book but he could not read. He was still '
              'thinking about the meeting he was going to miss.',
          metinTr: 'Bir kahve aldi ve bir banka oturdu. Istasyon kalabaliktdi. '
              'Insanlar kosuyor, telefonda konusuyor ve panolara bakiyorlardi. '
              'Emre kitabini acti ama okuyamadi. Hala kacracagi toplantiyi '
              'dusunuyordu.'),
        HikayeParagraf(sira: 4,
          metinEn: 'After twenty minutes, a woman sat next to him. She was '
              'carrying a large bag and looked tired. "Is this seat free?" she '
              'asked. "Yes, of course," Emre said. They started talking. She '
              'had also missed the eight o\u2019clock train.',
          metinTr: 'Yirmi dakika sonra bir kadin yanina oturdu. Buyuk bir canta '
              'tasiyordu ve yorgun gorunuyordu. "Bu yer bos mu?" diye sordu. '
              '"Evet, tabii," dedi Emre. Konusmaya basladilar. O da sekiz '
              'trenini kacirmisti.'),
        HikayeParagraf(sira: 5,
          metinEn: 'Her name was Selin and she was an engineer. She was going to '
              'Izmir for a job interview. Emre told her about his company. They '
              'talked about work, about the city and about bad traffic. Three '
              'hours passed very quickly.',
          metinTr: 'Adi Selin\u2019di ve muhendisti. Is gorusmesi icin '
              'Izmir\u2019e gidiyordu. Emre ona sirketinden bahsetti. Is, sehir '
              've kotu trafik hakkinda konustular. Uc saat cok cabuk gecti.'),
        HikayeParagraf(sira: 6,
          metinEn: 'On the train they sat together. Before they arrived, Emre '
              'gave her his card. "We are looking for engineers," he said. '
              '"Send me your CV." Two months later, Selin started working in '
              'his team. She often says the late train was the best thing that '
              'has happened to her.',
          metinTr: 'Trende birlikte oturdular. Varmadan once Emre ona kartini '
              'verdi. "Muhendis ariyoruz," dedi. "Bana ozgecmisini gonder." Iki '
              'ay sonra Selin onun ekibinde calismaya basladi. Sik sik gec '
              'trenin basina gelen en iyi sey oldugunu soyler.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Emre caught the eight o\u2019clock train.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Istasyona vardiginda tren gitmisti.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Why was Emre late?',
          secenekler: <String>['He woke up late', 'The traffic was bad',
              'He lost his ticket', 'The train left early'],
          kabulEdilenler: <String>['The traffic was bad']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The next train was at half past ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['eleven', '11']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['Selin sat next to him', 'The train had gone',
              'Selin joined his team', 'He bought a coffee'],
          kabulEdilenler: <String>['The train had gone', 'He bought a coffee',
              'Selin sat next to him', 'Selin joined his team']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What does Selin say about the late train?',
          secenekler: <String>[],
          kabulEdilenler: <String>['It was the best thing that has happened to her.',
              'She says it was the best thing.']),
      ],
    ),

    // ============================================================ 13
    Hikaye(
      kod: 'H-A2-003', baslik: 'The New Neighbour', seviye: 'A2',
      konuEtiketi: 'Komsuluk', kelimeSayisi: 498, tahminiDk: 7,
      ozetTr: 'Yasli bir kadin yeni komsusundan rahatsiz olur, ama '
          'yanildigini anlar.',
      anahtarKavramlar: <String>['neighbour', 'noise', 'wrong', 'apologise'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Mrs Yildiz has lived in the same flat for thirty years. She '
              'is seventy-two and she likes quiet evenings. Last spring, a young '
              'man moved into the flat above her. His name was Kaan and he was '
              'a music student.',
          metinTr: 'Bayan Yildiz otuz yildir ayni dairede yasiyor. Yetmis iki '
              'yasinda ve sessiz aksamlari seviyor. Gecen ilkbaharda ust '
              'katindaki daireye genc bir adam tasindi. Adi Kaan\u2019di ve '
              'muzik ogrencisiydi.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The first week was fine. Then the noise started. Every '
              'evening between seven and nine, Mrs Yildiz heard a violin. '
              'Sometimes it was beautiful, but sometimes the same short part '
              'was repeated twenty or thirty times.',
          metinTr: 'Ilk hafta iyiydi. Sonra gurultu basladi. Her aksam yedi ile '
              'dokuz arasinda Bayan Yildiz bir keman duyuyordu. Bazen guzeldi '
              'ama bazen ayni kisa bolum yirmi ya da otuz kez tekrarlaniyordu.'),
        HikayeParagraf(sira: 3,
          metinEn: 'She did not complain for a month. She is a polite woman and '
              'she does not like problems. But she could not sleep well and she '
              'was more tired every day. In the end she decided to speak to him.',
          metinTr: 'Bir ay boyunca sikayet etmedi. Kibar bir kadindir ve sorun '
              'sevmez. Ama iyi uyuyamiyordu ve her gun daha yorgundu. Sonunda '
              'onunla konusmaya karar verdi.'),
        HikayeParagraf(sira: 4,
          metinEn: 'She went upstairs and knocked. Kaan opened the door. He was '
              'younger than she had thought, maybe twenty. "I am sorry to '
              'disturb you," she said, "but the violin is very loud in the '
              'evening." Kaan\u2019s face went red. "I did not know. Nobody has '
              'ever told me."',
          metinTr: 'Yukari cikti ve kapiyi caldi. Kaan kapiyi acti. Dusundugunden '
              'daha gencti, belki yirmi. "Rahatsiz ettigim icin ozur dilerim," '
              'dedi, "ama keman aksamlari cok yuksek geliyor." Kaan\u2019in yuzu '
              'kizardi. "Bilmiyordum. Kimse bana soylemedi."'),
        HikayeParagraf(sira: 5,
          metinEn: 'Then he explained. He had an important exam in June and he '
              'had to practise four hours a day. He did not have another place. '
              'Mrs Yildiz listened carefully. She remembered her own son, who '
              'had studied medicine and had worked until midnight for years.',
          metinTr: 'Sonra acikladi. Haziranda onemli bir sinavi vardi ve gunde '
              'dort saat calismak zorundaydi. Baska bir yeri yoktu. Bayan Yildiz '
              'dikkatle dinledi. Tip okumus ve yillarca gece yarisina kadar '
              'calismis olan kendi oglunu hatirladi.'),
        HikayeParagraf(sira: 6,
          metinEn: 'They found a solution together. Kaan practises in the '
              'afternoon now, and he has bought a special mat for the floor. '
              'Sometimes Mrs Yildiz invites him for tea. Last week he played a '
              'short piece for her. She said it was the most beautiful music '
              'she had heard for a long time.',
          metinTr: 'Birlikte bir cozum buldular. Kaan artik ogleden sonra calisiyor '
              've zemin icin ozel bir mat aldi. Bazen Bayan Yildiz onu caya davet '
              'ediyor. Gecen hafta ona kisa bir parca caldi. Uzun zamandir '
              'duydugu en guzel muzik oldugunu soyledi.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Mrs Yildiz complained on the first day.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Bir ay boyunca sikayet etmedi.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Why did Kaan practise so much?',
          secenekler: <String>['He liked the noise', 'He had an important exam',
              'He worked as a teacher', 'He had no television'],
          kabulEdilenler: <String>['He had an important exam']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'Kaan practises in the ____ now.',
          secenekler: <String>[],
          kabulEdilenler: <String>['afternoon']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She knocked on his door', 'Kaan moved in',
              'They found a solution', 'The noise started'],
          kabulEdilenler: <String>['Kaan moved in', 'The noise started',
              'She knocked on his door', 'They found a solution']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Who did Mrs Yildiz remember when Kaan explained?',
          secenekler: <String>[],
          kabulEdilenler: <String>['She remembered her own son.',
              'Her son.', 'She remembered her son.']),
      ],
    ),

    // ============================================================ 14
    Hikaye(
      kod: 'H-A1-011', baslik: 'The Lost Cat', seviye: 'A1',
      konuEtiketi: 'Komsuluk', kelimeSayisi: 296, tahminiDk: 4,
      ozetTr: 'Kucuk bir kiz kedisini kaybeder ve komsulari yardim eder.',
      anahtarKavramlar: <String>['cat', 'street', 'help', 'find'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Elif is eight years old. She has a small grey cat. The '
              'cat\u2019s name is Pamuk. Pamuk sleeps on Elif\u2019s bed every '
              'night. He is very quiet and he likes warm places.',
          metinTr: 'Elif sekiz yasinda. Kucuk gri bir kedisi var. Kedinin adi '
              'Pamuk. Pamuk her gece Elif\u2019in yataginda uyur. Cok sessizdir '
              've sicak yerleri sever.'),
        HikayeParagraf(sira: 2,
          metinEn: 'One morning Elif opens her eyes and looks at the bed. Pamuk '
              'is not there. She looks under the bed and behind the door. The '
              'cat is not in the room. Elif is worried.',
          metinTr: 'Bir sabah Elif gozlerini acar ve yataga bakar. Pamuk orada '
              'degildir. Yatagin altina ve kapinin arkasina bakar. Kedi odada '
              'degildir. Elif endiselenir.'),
        HikayeParagraf(sira: 3,
          metinEn: 'She goes to the kitchen. Her mother is making breakfast. '
              '"Where is Pamuk?" Elif asks. "I do not know," her mother says. '
              '"The window is open. Maybe he is in the garden."',
          metinTr: 'Mutfaga gider. Annesi kahvalti hazirliyor. "Pamuk nerede?" '
              'diye sorar Elif. "Bilmiyorum," der annesi. "Pencere acik. Belki '
              'bahcededir."'),
        HikayeParagraf(sira: 4,
          metinEn: 'Elif goes outside. The garden is empty. She walks to the '
              'street and calls her cat. An old man is sitting in front of his '
              'house. "Are you looking for a cat?" he asks. "Yes! A grey cat," '
              'Elif says.',
          metinTr: 'Elif disari cikar. Bahce bostur. Sokaga yurur ve kedisini '
              'cagirir. Yasli bir adam evinin onunde oturuyor. "Kedi mi '
              'ariyorsun?" diye sorar. "Evet! Gri bir kedi," der Elif.'),
        HikayeParagraf(sira: 5,
          metinEn: 'The man smiles. "There is a grey cat on my roof. He is '
              'sleeping in the sun." Elif looks up. Pamuk is there, between two '
              'chimneys. He opens one eye and looks at her.',
          metinTr: 'Adam gulumser. "Catimda gri bir kedi var. Gunesde uyuyor." '
              'Elif yukari bakar. Pamuk oradadir, iki baca arasinda. Bir gozunu '
              'acar ve ona bakar.'),
        HikayeParagraf(sira: 6,
          metinEn: 'The man brings a ladder. Elif\u2019s mother comes too. They '
              'take Pamuk down carefully. He is not afraid. Now Elif closes the '
              'window every night. Pamuk sleeps on the bed again.',
          metinTr: 'Adam bir merdiven getirir. Elif\u2019in annesi de gelir. '
              'Pamuk\u2019u dikkatlice asagi indirirler. Korkmus degildir. Artik '
              'Elif her gece pencereyi kapatir. Pamuk yine yatakta uyur.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Pamuk is a big black cat.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde "small grey cat" yaziyor.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Where is Pamuk?',
          secenekler: <String>['In the garden', 'On a roof', 'Under the bed',
              'In the kitchen'],
          kabulEdilenler: <String>['On a roof']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The old man brings a ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['ladder']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She goes to the street', 'Pamuk is not on the bed',
              'They take Pamuk down', 'The man sees the cat'],
          kabulEdilenler: <String>['Pamuk is not on the bed',
              'She goes to the street', 'The man sees the cat',
              'They take Pamuk down']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What does Elif do every night now?',
          secenekler: <String>[],
          kabulEdilenler: <String>['She closes the window.',
              'She closes the window every night.']),
      ],
    ),

    // ============================================================ 15
    Hikaye(
      kod: 'H-A1-012', baslik: 'Market Day', seviye: 'A1',
      konuEtiketi: 'Alisveris', kelimeSayisi: 288, tahminiDk: 4,
      ozetTr: 'Pazar gunu ailesiyle pazara giden bir cocugun alisverisi.',
      anahtarKavramlar: <String>['market', 'vegetables', 'money', 'bag'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Every Sunday morning we go to the market. My father takes '
              'two big bags. My mother takes the money. I take a small bag for '
              'the fruit. The market is near our house.',
          metinTr: 'Her pazar sabahi pazara gideriz. Babam iki buyuk canta alir. '
              'Annem parayi alir. Ben meyveler icin kucuk bir canta alirim. '
              'Pazar evimize yakindir.'),
        HikayeParagraf(sira: 2,
          metinEn: 'The market is very busy. There are many people and many '
              'colours. The tomatoes are red, the peppers are green and the '
              'lemons are yellow. I like the smell of the fresh bread.',
          metinTr: 'Pazar cok kalabaliktir. Cok insan ve cok renk vardir. '
              'Domatesler kirmizi, biberler yesil ve limonlar saridir. Taze '
              'ekmegin kokusunu severim.'),
        HikayeParagraf(sira: 3,
          metinEn: 'My mother buys vegetables first. She asks the price of '
              'everything. "How much are the tomatoes?" she says. The man tells '
              'her the price. Sometimes she does not buy; she goes to another '
              'seller.',
          metinTr: 'Annem once sebze alir. Her seyin fiyatini sorar. "Domatesler '
              'kac para?" der. Adam ona fiyati soyler. Bazen almaz; baska bir '
              'saticiya gider.'),
        HikayeParagraf(sira: 4,
          metinEn: 'I always go to the same fruit seller. He is an old man with '
              'a white beard. He gives me one apple every week. He never takes '
              'money for it. "This is for the young helper," he says.',
          metinTr: 'Ben her zaman ayni meyveciye giderim. Beyaz sakalli yasli '
              'bir adamdir. Her hafta bana bir elma verir. Bunun icin asla para '
              'almaz. "Bu genc yardimci icin," der.'),
        HikayeParagraf(sira: 5,
          metinEn: 'At the end we buy cheese and olives. The bags are heavy now. '
              'My father carries the two big bags. I carry my small bag. It is '
              'not heavy, but I walk slowly.',
          metinTr: 'Sonunda peynir ve zeytin aliriz. Cantalar artik agirdir. '
              'Babam iki buyuk cantayi tasir. Ben kucuk cantami tasirim. Agir '
              'degildir ama yavas yururum.'),
        HikayeParagraf(sira: 6,
          metinEn: 'We go home and put everything in the kitchen. My mother '
              'makes tea. We sit together and eat fresh bread with cheese. '
              'Sunday morning is my favourite time of the week.',
          metinTr: 'Eve gideriz ve her seyi mutfaga koyariz. Annem cay yapar. '
              'Birlikte oturur ve peynirle taze ekmek yeriz. Pazar sabahi '
              'haftanin en sevdigim zamanidir.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The family goes to the market on Saturday.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde "Every Sunday morning" yaziyor.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What does the fruit seller give the child?',
          secenekler: <String>['Money', 'An apple', 'A bag', 'Bread'],
          kabulEdilenler: <String>['An apple']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The father carries two big ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['bags']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They buy cheese and olives',
              'They go to the market', 'They drink tea at home',
              'The mother buys vegetables'],
          kabulEdilenler: <String>['They go to the market',
              'The mother buys vegetables', 'They buy cheese and olives',
              'They drink tea at home']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Why does the child like Sunday morning?',
          secenekler: <String>[],
          kabulEdilenler: <String>['It is his favourite time of the week.',
              'Because they go to the market and eat together.']),
      ],
    ),

    // ============================================================ 16
    Hikaye(
      kod: 'H-A2-004', baslik: 'The Job Interview', seviye: 'A2',
      konuEtiketi: 'Is hayati', kelimeSayisi: 521, tahminiDk: 7,
      ozetTr: 'Genc bir kadin ilk is gorusmesine gider ve beklenmedik bir '
          'soruyla karsilasir.',
      anahtarKavramlar: <String>['interview', 'nervous', 'question', 'honest'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Zeynep finished university in June. She sent her CV to '
              'fifteen companies and waited. For two months nothing happened. '
              'Then, on a Tuesday morning, her phone rang. A company wanted to '
              'meet her on Friday.',
          metinTr: 'Zeynep haziranda universiteyi bitirdi. Ozgecmisini on bes '
              'sirkete gonderdi ve bekledi. Iki ay boyunca hicbir sey olmadi. '
              'Sonra bir sali sabahi telefonu caldi. Bir sirket onunla cuma '
              'gunu gorusmek istiyordu.'),
        HikayeParagraf(sira: 2,
          metinEn: 'She was very nervous. She had never had a real interview '
              'before. On Thursday evening she prepared her answers. She wrote '
              'them on paper and read them many times. Her sister listened and '
              'asked questions.',
          metinTr: 'Cok gergindi. Daha once hic gercek bir is gorusmesi '
              'yapmamisti. Persembe aksami cevaplarini hazirladi. Onlari kagida '
              'yazdi ve defalarca okudu. Kiz kardesi dinledi ve sorular sordu.'),
        HikayeParagraf(sira: 3,
          metinEn: 'On Friday she arrived thirty minutes early. The office was '
              'on the sixth floor. She sat in the waiting room and looked at '
              'the other people. There were four of them and they all looked '
              'calm.',
          metinTr: 'Cuma gunu otuz dakika erken vardi. Ofis altinci kattaydi. '
              'Bekleme odasinda oturdu ve diger insanlara bakti. Dort kisiydiler '
              've hepsi sakin gorunuyordu.'),
        HikayeParagraf(sira: 4,
          metinEn: 'The manager was a woman of about fifty. She smiled and asked '
              'easy questions first. Zeynep answered well. Then the manager put '
              'down her pen. "One more question," she said. "What is the biggest '
              'mistake you have made?"',
          metinTr: 'Mudur elli yaslarinda bir kadindi. Gulumsedi ve once kolay '
              'sorular sordu. Zeynep iyi cevap verdi. Sonra mudur kalemini '
              'birakti. "Bir soru daha," dedi. "Yaptigin en buyuk hata nedir?"'),
        HikayeParagraf(sira: 5,
          metinEn: 'Zeynep had not prepared this answer. She thought for a '
              'moment. Then she told the truth. In her second year she had '
              'organised a student event and had forgotten to book the room. '
              'Sixty people had come and there had been no place for them.',
          metinTr: 'Zeynep bu cevabi hazirlamamisti. Bir an dusundu. Sonra '
              'dogruyu soyledi. Ikinci sinifta bir ogrenci etkinligi duzenlemis '
              've odayi ayirtmayi unutmustu. Altmis kisi gelmis ve onlara yer '
              'kalmamisti.'),
        HikayeParagraf(sira: 6,
          metinEn: '"What did you do?" the manager asked. "I apologised to '
              'everyone and we did it outside in the garden," Zeynep said. "It '
              'was actually better." The manager laughed. Two weeks later '
              'Zeynep started her first job. She has worked there since then.',
          metinTr: '"Ne yaptin?" diye sordu mudur. "Herkesten ozur diledim ve '
              'etkinligi disarida bahcede yaptik," dedi Zeynep. "Aslinda daha '
              'iyi oldu." Mudur guldu. Iki hafta sonra Zeynep ilk isine basladi. '
              'O zamandan beri orada calisiyor.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Zeynep had many interviews before this one.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde "She had never had a real interview before."'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'What was the difficult question?',
          secenekler: <String>['Her salary', 'Her biggest mistake',
              'Her university', 'Her family'],
          kabulEdilenler: <String>['Her biggest mistake']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'She arrived thirty minutes ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['early']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['She told the truth', 'She sent her CV',
              'She started the job', 'The phone rang'],
          kabulEdilenler: <String>['She sent her CV', 'The phone rang',
              'She told the truth', 'She started the job']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'How did Zeynep solve the room problem?',
          secenekler: <String>[],
          kabulEdilenler: <String>['They did the event outside in the garden.',
              'She apologised and they used the garden.']),
      ],
    ),

    // ============================================================ 17
    Hikaye(
      kod: 'H-A2-005', baslik: 'The Old Photograph', seviye: 'A2',
      konuEtiketi: 'Aile', kelimeSayisi: 507, tahminiDk: 7,
      ozetTr: 'Bir kutuda bulunan eski bir fotograf, aile hakkinda '
          'bilinmeyen bir seyi ortaya cikarir.',
      anahtarKavramlar: <String>['photograph', 'box', 'grandmother', 'secret'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Last winter my grandmother moved to a smaller flat. We had '
              'to empty her old house. It took three days. There were books, '
              'plates, letters and many boxes in the cupboards.',
          metinTr: 'Gecen kis buyukannem daha kucuk bir daireye tasindi. Eski '
              'evini bosaltmamiz gerekiyordu. Uc gun surdu. Dolaplarda kitaplar, '
              'tabaklar, mektuplar ve bir suru kutu vardi.'),
        HikayeParagraf(sira: 2,
          metinEn: 'On the second day I found a small metal box under the bed. '
              'It was locked, but the key was next to it. Inside there were old '
              'photographs. Most of them were of my grandfather, who died before '
              'I was born.',
          metinTr: 'Ikinci gun yatagin altinda kucuk metal bir kutu buldum. '
              'Kilitliydi ama anahtar yanindaydi. Icinde eski fotograflar vardi. '
              'Cogu, ben dogmadan once olen dedeme aitti.'),
        HikayeParagraf(sira: 3,
          metinEn: 'One photograph was different. It showed a young woman on a '
              'beach. She was laughing and holding a hat. She looked like my '
              'grandmother, but the hair and the dress were not the same. I '
              'took the photo to the kitchen.',
          metinTr: 'Bir fotograf farkliydi. Sahilde genc bir kadini gosteriyordu. '
              'Guluyor ve bir sapka tutuyordu. Buyukanneme benziyordu ama saci ve '
              'elbisesi ayni degildi. Fotografi mutfaga goturdum.'),
        HikayeParagraf(sira: 4,
          metinEn: '"Who is this?" I asked. My grandmother looked at the photo '
              'for a long time. She did not answer immediately. Then she said, '
              '"That is my sister. Her name was Sevim." I was surprised. I had '
              'never heard about a sister.',
          metinTr: '"Bu kim?" diye sordum. Buyukannem fotografa uzun sure bakti. '
              'Hemen cevap vermedi. Sonra "Bu benim kiz kardesim. Adi Sevim\u2019di" '
              'dedi. Sasirdim. Bir kiz kardesi oldugunu hic duymamistim.'),
        HikayeParagraf(sira: 5,
          metinEn: 'She told me the story. Sevim had gone to Germany in 1968 to '
              'work. She had written letters for a few years and then had '
              'stopped. Nobody knew why. My grandmother had waited, but no '
              'letter had come.',
          metinTr: 'Bana hikayeyi anlatti. Sevim 1968\u2019de calismak icin '
              'Almanya\u2019ya gitmisti. Birkac yil mektup yazmis, sonra kesmisti. '
              'Kimse nedenini bilmiyordu. Buyukannem beklemisti ama hicbir mektup '
              'gelmemisti.'),
        HikayeParagraf(sira: 6,
          metinEn: 'That evening I searched online with my cousin. It was not '
              'easy, but after two hours we found a name and a city. Last month '
              'my grandmother spoke to her sister on the phone for the first '
              'time in fifty-four years. They talked for two hours and both of '
              'them cried.',
          metinTr: 'O aksam kuzenimle internette aradim. Kolay degildi ama iki '
              'saat sonra bir isim ve bir sehir bulduk. Gecen ay buyukannem elli '
              'dort yil sonra ilk kez kiz kardesiyle telefonda konustu. Iki saat '
              'konustular ve ikisi de aglad.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The narrator knew about the sister before.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Metinde "I had never heard about a sister."'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Where did Sevim go in 1968?',
          secenekler: <String>['France', 'Germany', 'England', 'Italy'],
          kabulEdilenler: <String>['Germany']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The photograph showed a young woman on a ____.',
          secenekler: <String>[],
          kabulEdilenler: <String>['beach']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They found her online',
              'He found a metal box', 'The grandmother told the story',
              'They spoke on the phone'],
          kabulEdilenler: <String>['He found a metal box',
              'The grandmother told the story', 'They found her online',
              'They spoke on the phone']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'How long had the sisters not spoken?',
          secenekler: <String>[],
          kabulEdilenler: <String>['Fifty-four years.',
              'For fifty-four years.', '54 years']),
      ],
    ),

    // ============================================================ 18
    Hikaye(
      kod: 'H-A1-013', baslik: 'A Rainy Sunday', seviye: 'A1',
      konuEtiketi: 'Gunluk yasam', kelimeSayisi: 301, tahminiDk: 4,
      ozetTr: 'Yagmurlu bir pazar gunu evde gecen sicak bir gun.',
      anahtarKavramlar: <String>['rain', 'home', 'game', 'together'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'It is Sunday morning. I open the curtains and look outside. '
              'The sky is grey and it is raining. The street is wet and empty. '
              'Our plan for today was a picnic.',
          metinTr: 'Pazar sabahi. Perdeleri acip disari bakiyorum. Gokyuzu gri '
              've yagmur yagiyor. Sokak islak ve bos. Bugunku planimiz piknikti.'),
        HikayeParagraf(sira: 2,
          metinEn: 'My little brother is sad. "I want to go to the park," he '
              'says. My mother smiles. "We can have a picnic in the living '
              'room," she says. My brother looks at her. He does not understand.',
          metinTr: 'Kucuk kardesim uzgun. "Parka gitmek istiyorum," diyor. Annem '
              'gulumsuyor. "Oturma odasinda piknik yapabiliriz," diyor. Kardesim '
              'ona bakiyor. Anlamiyor.'),
        HikayeParagraf(sira: 3,
          metinEn: 'We put a big blanket on the floor. My father brings bread, '
              'cheese and tomatoes. My mother makes tea. We sit on the blanket '
              'and eat together. My brother is happy now.',
          metinTr: 'Yere buyuk bir battaniye seriyoruz. Babam ekmek, peynir ve '
              'domates getiriyor. Annem cay yapiyor. Battaniyenin ustune oturup '
              'birlikte yiyoruz. Kardesim artik mutlu.'),
        HikayeParagraf(sira: 4,
          metinEn: 'After lunch we play a card game. My father always wins, but '
              'today my brother wins two times. He is very proud. He tells the '
              'story again and again.',
          metinTr: 'Ogle yemeginden sonra kagit oyunu oynuyoruz. Babam her zaman '
              'kazanir ama bugun kardesim iki kez kazaniyor. Cok gururlu. '
              'Hikayeyi tekrar tekrar anlatiyor.'),
        HikayeParagraf(sira: 5,
          metinEn: 'In the afternoon the rain is heavy. We watch an old film '
              'together. My mother sleeps on the sofa. The house is warm and '
              'quiet. Outside the water runs down the window.',
          metinTr: 'Ogleden sonra yagmur siddetleniyor. Birlikte eski bir film '
              'izliyoruz. Annem kanepede uyuyor. Ev sicak ve sessiz. Disarida '
              'su pencereden asagi akiyor.'),
        HikayeParagraf(sira: 6,
          metinEn: 'In the evening the rain stops. We go outside for ten '
              'minutes. The air smells fresh. My brother jumps in a small pool '
              'of water. "This was a good day," he says.',
          metinTr: 'Aksam yagmur duruyor. On dakika disari cikiyoruz. Hava taze '
              'kokuyor. Kardesim kucuk bir su birikintisine atliyor. "Bu iyi bir '
              'gundu," diyor.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'The family went to the park.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Yagmur yagdigi icin evde kaldilar.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Where do they have the picnic?',
          secenekler: <String>['In the park', 'In the living room',
              'In the garden', 'At school'],
          kabulEdilenler: <String>['In the living room']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'They put a big ____ on the floor.',
          secenekler: <String>[],
          kabulEdilenler: <String>['blanket']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['They play a card game', 'It is raining',
              'The rain stops', 'They eat on the blanket'],
          kabulEdilenler: <String>['It is raining', 'They eat on the blanket',
              'They play a card game', 'The rain stops']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'Why is the brother proud?',
          secenekler: <String>[],
          kabulEdilenler: <String>['He wins the card game two times.',
              'Because he wins two times.']),
      ],
    ),

    // ============================================================ 19
    Hikaye(
      kod: 'H-A2-006', baslik: 'The Wrong Bus', seviye: 'A2',
      konuEtiketi: 'Seyahat', kelimeSayisi: 496, tahminiDk: 7,
      ozetTr: 'Yanlis otobuse binen bir ogrenci, hicbir zaman gormedigi '
          'bir koye varir.',
      anahtarKavramlar: <String>['bus', 'village', 'mistake', 'kindness'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Berk was a first-year student. He had lived in the city for '
              'only three weeks and he did not know the bus lines well. One '
              'Friday he finished his classes late and ran to the bus stop.',
          metinTr: 'Berk birinci sinif ogrencisiydi. Sehirde yalnizca uc haftadir '
              'yasiyordu ve otobus hatlarini iyi bilmiyordu. Bir cuma gunu '
              'derslerini gec bitirdi ve durak dogru kostu.'),
        HikayeParagraf(sira: 2,
          metinEn: 'A bus was waiting. He got on and sat near the window. He was '
              'tired, so he put on his headphones and closed his eyes. After '
              'forty minutes he looked outside. He did not recognise anything.',
          metinTr: 'Bir otobus bekliyordu. Bindi ve pencerenin yanina oturdu. '
              'Yorgundu, bu yuzden kulakliklarini takti ve gozlerini kapatti. '
              'Kirk dakika sonra disari bakti. Hicbir seyi tanimadi.'),
        HikayeParagraf(sira: 3,
          metinEn: 'The buildings had gone. There were fields, trees and a '
              'small river. He went to the driver. "Excuse me, is this the '
              'number twelve?" The driver shook his head. "No, this is the '
              'twenty-one. We are going to Karakoy village."',
          metinTr: 'Binalar kaybolmustu. Tarlalar, agaclar ve kucuk bir nehir '
              'vardi. Sofore gitti. "Affedersiniz, bu on iki numara mi?" Sofor '
              'basini salladi. "Hayir, bu yirmi bir. Karakoy koyune gidiyoruz."'),
        HikayeParagraf(sira: 4,
          metinEn: 'Berk felt stupid. The driver told him the last bus back had '
              'left twenty minutes ago. The next one was at seven the next '
              'morning. It was already dark and Berk had no money for a taxi.',
          metinTr: 'Berk aptal hissetti. Sofor ona son donus otobusunun yirmi '
              'dakika once kalktigini soyledi. Sonraki ertesi sabah yediydi. '
              'Hava coktan kararmisti ve Berk\u2019in taksi icin parasi yoktu.'),
        HikayeParagraf(sira: 5,
          metinEn: 'An old woman was sitting behind him. She had listened to '
              'everything. "Are you a student?" she asked. "Yes," Berk said. '
              '"My grandson studies in the city too. Come with me. You can eat '
              'and sleep at our house."',
          metinTr: 'Arkasinda yasli bir kadin oturuyordu. Her seyi dinlemisti. '
              '"Ogrenci misin?" diye sordu. "Evet," dedi Berk. "Benim torunum da '
              'sehirde okuyor. Benimle gel. Evimizde yiyip uyuyabilirsin."'),
        HikayeParagraf(sira: 6,
          metinEn: 'Berk ate soup with her family and slept in a small warm '
              'room. In the morning she gave him bread for the journey and would '
              'not take any money. Since that day Berk has always checked the '
              'number twice. He still visits the village every spring.',
          metinTr: 'Berk ailesiyle corba icti ve kucuk sicak bir odada uyudu. '
              'Sabah kadin ona yol icin ekmek verdi ve hic para almadi. O gunden '
              'beri Berk numarayi hep iki kez kontrol ediyor. Her ilkbahar hala '
              'koyu ziyaret ediyor.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Berk knew the bus lines very well.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Sehirde yalnizca uc haftadir yasiyordu.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Why did Berk not notice the mistake?',
          secenekler: <String>['He was reading', 'He closed his eyes and rested',
              'He was talking', 'The bus was dark'],
          kabulEdilenler: <String>['He closed his eyes and rested']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'The next bus back was at ____ the next morning.',
          secenekler: <String>[],
          kabulEdilenler: <String>['seven', '7']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He talked to the driver', 'He got on the bus',
              'He slept at her house', 'The woman offered help'],
          kabulEdilenler: <String>['He got on the bus', 'He talked to the driver',
              'The woman offered help', 'He slept at her house']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What has Berk always done since that day?',
          secenekler: <String>[],
          kabulEdilenler: <String>['He has always checked the number twice.',
              'He checks the number twice.']),
      ],
    ),

    // ============================================================ 20
    Hikaye(
      kod: 'H-A2-007', baslik: 'Learning to Swim', seviye: 'A2',
      konuEtiketi: 'Kisisel gelisim', kelimeSayisi: 489, tahminiDk: 7,
      ozetTr: 'Kirk yasinda yuzme ogrenmeye karar veren bir adamin hikayesi.',
      anahtarKavramlar: <String>['swim', 'afraid', 'practise', 'progress'],
      paragraflar: <HikayeParagraf>[
        HikayeParagraf(sira: 1,
          metinEn: 'Cem is forty years old and he could not swim. When he was a '
              'child, he fell into a river and someone pulled him out. After '
              'that day he was always afraid of deep water.',
          metinTr: 'Cem kirk yasinda ve yuzme bilmiyordu. Cocukken bir nehre '
              'dusmus ve biri onu cikarmisti. O gunden sonra derin sudan hep '
              'korktu.'),
        HikayeParagraf(sira: 2,
          metinEn: 'Last summer his daughter learned to swim in two weeks. She '
              'was seven. "Come in, Dad!" she shouted from the pool. Cem sat on '
              'a chair and said he was tired. He felt ashamed.',
          metinTr: 'Gecen yaz kizi iki haftada yuzmeyi ogrendi. Yedi yasindaydi. '
              '"Gel baba!" diye bagirdi havuzdan. Cem bir sandalyeye oturdu ve '
              'yorgun oldugunu soyledi. Utandi.'),
        HikayeParagraf(sira: 3,
          metinEn: 'In September he found a class for adults. There were six '
              'people and all of them were over thirty. The teacher was a quiet '
              'young woman. "Nobody here can swim," she said. "That is why we '
              'are all in the same place."',
          metinTr: 'Eylulde yetiskinler icin bir kurs buldu. Alti kisiydiler ve '
              'hepsi otuz yasin ustundeydi. Ogretmen sessiz genc bir kadindi. '
              '"Burada kimse yuzme bilmiyor," dedi. "Bu yuzden hepimiz ayni '
              'yerdeyiz."'),
        HikayeParagraf(sira: 4,
          metinEn: 'The first lessons were difficult. Cem could not put his '
              'face in the water. The teacher did not push him. "You do not '
              'have to hurry," she said. "We have time." Every week he stayed '
              'one minute longer.',
          metinTr: 'Ilk dersler zordu. Cem yuzunu suya sokamiyordu. Ogretmen onu '
              'zorlamadi. "Acele etmek zorunda degilsin," dedi. "Zamanimiz var." '
              'Her hafta bir dakika daha uzun kaldi.'),
        HikayeParagraf(sira: 5,
          metinEn: 'After two months he could float on his back. After four '
              'months he swam ten metres without stopping. It was slower than '
              'the others, but he did not care. He had never thought this was '
              'possible.',
          metinTr: 'Iki ay sonra sirtustu durabiliyordu. Dort ay sonra durmadan '
              'on metre yuzdu. Digerlerinden daha yavasti ama umursamadi. Bunun '
              'mumkun oldugunu hic dusunmemisti.'),
        HikayeParagraf(sira: 6,
          metinEn: 'Last month Cem and his daughter went to the sea together. '
              'They swam to a small rock and back. She was faster, of course. '
              '"You are better than last year, Dad," she said. It was the best '
              'thing he had heard for a long time.',
          metinTr: 'Gecen ay Cem ve kizi birlikte denize gittiler. Kucuk bir '
              'kayaya kadar yuzup dondular. Kizi tabii ki daha hizliydi. "Gecen '
              'yildan daha iyisin baba," dedi. Uzun zamandir duydugu en guzel '
              'seydi.'),
      ],
      sorular: <HikayeSorusu>[
        HikayeSorusu(sira: 1, tip: SoruTipi.dogruYanlis,
          soru: 'Cem learned to swim when he was a child.',
          secenekler: <String>['True', 'False'],
          kabulEdilenler: <String>['False'],
          aciklama: 'Cocukken nehre dusmus ve sudan korkmustu.'),
        HikayeSorusu(sira: 2, tip: SoruTipi.coktanSecmeli,
          soru: 'Who were the other people in the class?',
          secenekler: <String>['Children', 'Adults over thirty', 'Teachers',
              'His family'],
          kabulEdilenler: <String>['Adults over thirty']),
        HikayeSorusu(sira: 3, tip: SoruTipi.boslukDoldurma,
          soru: 'After four months he swam ten ____ without stopping.',
          secenekler: <String>[],
          kabulEdilenler: <String>['metres', 'meters']),
        HikayeSorusu(sira: 4, tip: SoruTipi.siralama,
          soru: 'Olaylari dogru siraya dizin.',
          secenekler: <String>['He found a class', 'His daughter learned to swim',
              'They swam in the sea', 'He floated on his back'],
          kabulEdilenler: <String>['His daughter learned to swim',
              'He found a class', 'He floated on his back',
              'They swam in the sea']),
        HikayeSorusu(sira: 5, tip: SoruTipi.yazili,
          soru: 'What did the teacher say about hurrying?',
          secenekler: <String>[],
          kabulEdilenler: <String>['You do not have to hurry.',
              'She said they had time.']),
      ],
    ),
  ];
}
