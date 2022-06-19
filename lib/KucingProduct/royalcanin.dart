import 'package:e19_meongguk/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class KucingRoyalCanin extends StatelessWidget {
  KucingRoyalCanin({Key? key}) : super(key: key);
  final CounterController cCount = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 370,
                  width: lebar,
                  decoration: const BoxDecoration(
                    color: Color(0xffC2DED1),
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(30),
                    //   bottomRight: Radius.circular(30),
                    // ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 30, bottom: 50),
                    child: Image.asset(
                      "assets/kucingRoyalCanin.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(61, 0, 0, 0),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 320),
                    height: tinggi,
                    width: lebar,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Royal Canin",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            "Royal Canin Hair & Skin Care 400gr",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          width: lebar,
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 10,
                            right: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            "Rp65.000",
                            style: GoogleFonts.notoSans(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                          width: lebar,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 223, 223, 223)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 20,
                          ),
                          child: Text(
                            "DETAIL : ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff354259),
                              ),
                            ),
                          ),
                        ),
                        ProductDetail(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: tinggi - 95,
                  left: lebar - 300,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xff354259),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () => cCount.incrementWhiskas(),
                              ),
                            ),
                            SizedBox(width: 5),
                            Obx(
                              () => Text(
                                "${cCount.whiskas.toString()}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xff354259),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () => cCount.decrementWhiskas(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff354259)),
                          ),
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  ProductDetail({
    Key? key,
  }) : super(key: key);

  String textcontent =
      "Royal Canin Hair and Skin 33 adalah produk makanan kering untuk kucing dewasa yang berguna menjaga dan mengembalikan kondisi bulu kucing sehabis sakit atau terkena jamur. Royal Canin Hair & Skin 33 diformulasikan khusus untuk kesehatan dan keindahan kulit dan bulu kucing usia 1 tahun ke-atas. Bulu akan terlihat signifikan mengkilap setelah 21 hari eksklusif mengkonsumsi Royal Canin Hair & Skin 33.\n\nUntuk Kulit Sensitif\nBeberapa kucing memiliki kulit yang sensitif yang mudah meninggalkan ketombe, bulu kusam maupun rusak dan reaksi yang merugikan lainnya. Royal Canin Hair & Skin 33 secara spesifik diformulasikan untuk mencegah terjadinya permasalahan kulit dan bulu.\n\nMelindungi Kulit dan Bulu\nKombinasi dari asam lemak esensial, vitamin dan mineral dapat membantu regenerasi sel kulit lebih cepat. Sedangkan antioksidan dari vitamin dan ekstrak tumbuh-tumbuhan dapat mendukung kesehatan kekebalan tubuh dengan mengurangi dampak radikal bebas pada kulit dan sel-sel rambut. Perpaduan dari asam amino, vitamin B, Omega 6, Omega 3 serta mineral bermanfaat untuk memelihara dan menjaga kemilau kulit dan bulu yang sehat.\n\nCara Pemakaian\nPemakaian Royal Canin Hair & Skin 33 sebaiknya tidak di campur dengan makanan lainnya dikarenakan hal ini dapat mengurangi manfaat dari kandungan Royal Canin Hair & Skin 33. Royal Canin Hair & Skin 33 dapat digunakan saat kucing Anda bermasalah dengan kulit atau bulu. Royal Canin Hair & Skin 33 juga dapat mengembalikan kondisi bulu kucing sehabis sakit atau terkena jamur.";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ReadMoreText(
          textcontent,
          trimLines: 5,
          textAlign: TextAlign.justify,
          trimMode: TrimMode.Line,
          trimCollapsedText: "\nShow More",
          trimExpandedText: "\nShow Less",
          lessStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff354259).withOpacity(0.5),
          ),
          moreStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff354259).withOpacity(0.5),
          ),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
