import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

const Color kGold = Color(0xFFD4AF37);
const Color kBlack = Color(0xFF000000);

void main() => runApp(const RefleteApp());

class RefleteApp extends StatelessWidget {
  const RefleteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBlack,
        primaryColor: kGold,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _idx = 0;
  final _tabs = [const HomeTab(), const TimelineTab(), const ShopTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        title: Text("REFLETE PRIME", style: GoogleFonts.cinzel(color: kGold, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _tabs[_idx],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF111111),
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: kGold), label: 'Obra'),
          NavigationDestination(icon: Icon(Icons.reorder, color: kGold), label: 'Prazos'),
          NavigationDestination(icon: Icon(Icons.shopping_cart, color: kGold), label: 'Shop'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _card("PROGRESSO DA OBRA", "82%", 0.82),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _btn(FontAwesomeIcons.whatsapp, "Engenheiro"),
              _btn(FontAwesomeIcons.video, "Câmeras"),
              _btn(FontAwesomeIcons.filePdf, "Docs"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(String t, String v, double p) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(15), border: Border.all(color: kGold.withOpacity(0.3))),
    child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(t, style: const TextStyle(color: kGold)), Text(v)]),
      const SizedBox(height: 10),
      LinearProgressIndicator(value: p, color: kGold, backgroundColor: Colors.white10),
    ]),
  );

  Widget _btn(IconData i, String l) => Column(children: [
    CircleAvatar(backgroundColor: kGold.withOpacity(0.1), child: Icon(i, color: kGold, size: 20)),
    const SizedBox(height: 5), Text(l, style: const TextStyle(fontSize: 10))
  ]);
}

class TimelineTab extends StatelessWidget {
  const TimelineTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(nodePosition: 0, color: kGold),
        builder: TimelineTileBuilder.connected(
          itemCount: 3,
          contentsBuilder: (_, i) => Padding(padding: const EdgeInsets.all(15), child: Text(["Estrutura - OK", "Acabamento - Em curso", "Entrega - Fev/26"][i])),
          indicatorBuilder: (_, i) => DotIndicator(color: i == 1 ? kGold : Colors.green),
          connectorBuilder: (_, i, __) => const SolidLineConnector(),
        ),
      ),
    );
  }
}

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Marketplace Reflete Exclusive", style: TextStyle(color: kGold)));
  }
}
