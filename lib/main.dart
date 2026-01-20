import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

// --- CORES DA IDENTIDADE VISUAL REFLETE ---
const Color kRefleteBlack = Color(0xFF000000); // Preto Absoluto
const Color kRefleteDarkGrey = Color(0xFF121212); // Fundo de Cards
const Color kRefleteGold = Color(0xFFD4AF37); // Dourado Premium
const Color kRefleteWhite = Color(0xFFEEEEEE); // Texto

void main() {
  runApp(const RefleteApp());
}

class RefleteApp extends StatelessWidget {
  const RefleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflete Prime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kRefleteBlack,
        primaryColor: kRefleteGold,
        cardColor: kRefleteDarkGrey,
        colorScheme: const ColorScheme.dark(
          primary: kRefleteGold,
          secondary: kRefleteGold,
          surface: kRefleteDarkGrey,
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: kRefleteWhite, displayColor: kRefleteGold),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Começa no Login simulado
    );
  }
}

// --- TELA DE LOGIN (SIMULAÇÃO DE SEGURANÇA) ---
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.grey.shade900],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.draftingCompass, size: 80, color: kRefleteGold),
              const SizedBox(height: 20),
              Text("REFLETE", style: GoogleFonts.cinzel(fontSize: 40, fontWeight: FontWeight.bold, color: kRefleteWhite)),
              Text("ENGENHARIA", style: GoogleFonts.cinzel(fontSize: 18, letterSpacing: 5, color: kRefleteGold)),
              const SizedBox(height: 60),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Acesso VIP (E-mail)",
                  prefixIcon: Icon(Icons.person, color: kRefleteGold),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kRefleteGold)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kRefleteGold,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Simula autenticação e vai para o App
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                },
                child: const Text("ENTRAR", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              const Text("Utilize FaceID para acesso rápido", style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 10),
              const Icon(Icons.face, color: Colors.grey, size: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// --- ESTRUTURA PRINCIPAL ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeDashboardTab(),
    TimelineTab(),
    MarketplaceTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRefleteBlack,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(FontAwesomeIcons.bars, color: kRefleteGold, size: 20),
        ),
        title: Text("REFLETE PRIME", style: GoogleFonts.cinzel(color: kRefleteGold, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavigationBar(
        backgroundColor: kRefleteDarkGrey,
        indicatorColor: kRefleteGold.withOpacity(0.2),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(FontAwesomeIcons.house, size: 20), label: 'Visão Geral'),
          NavigationDestination(icon: Icon(FontAwesomeIcons.timeline, size: 20), label: 'Cronograma'),
          NavigationDestination(icon: Icon(FontAwesomeIcons.bagShopping, size: 20), label: 'Shop'),
        ],
      ),
    );
  }
}

// --- ABA 1: DASHBOARD (VISÃO GERAL) ---
class HomeDashboardTab extends StatelessWidget {
  const HomeDashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Bem-vindo, Dr. André", style: TextStyle(color: Colors.grey)),
          const Text("Residencial Leblon - Cobertura", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 20),
          
          // CARD DE STATUS PRINCIPAL
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [Color(0xFF2C2C2C), kRefleteBlack]),
              border: Border.all(color: kRefleteGold.withOpacity(0.5)),
              boxShadow: [BoxShadow(color: kRefleteGold.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PROGRESSO GERAL", style: TextStyle(color: kRefleteGold, fontWeight: FontWeight.bold)),
                    Text("82%", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 15),
                LinearProgressIndicator(value: 0.82, color: kRefleteGold, backgroundColor: Colors.grey[800], minHeight: 10, borderRadius: BorderRadius.circular(5)),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Próxima Entrega:", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    Text("25/JAN - Automação", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          const Text("Acesso Rápido", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _QuickAction(icon: FontAwesomeIcons.whatsapp, label: "Engenheiro", onTap: () => launchUrl(Uri.parse("https://wa.me/"))),
              _QuickAction(icon: FontAwesomeIcons.video, label: "Câmera 24h", onTap: () {}),
              _QuickAction(icon: FontAwesomeIcons.fileContract, label: "Contratos", onTap: () {}),
              _QuickAction(icon: FontAwesomeIcons.helmetSafety, label: "Diário", onTap: () {}),
            ],
          ),

          const SizedBox(height: 30),
          // CARD FINANCEIRO
           Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: kRefleteDarkGrey, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Icon(FontAwesomeIcons.chartPie, color: kRefleteGold, size: 16), SizedBox(width: 10), Text("FINANCEIRO DA OBRA", style: TextStyle(fontWeight: FontWeight.bold))]),
                Divider(color: Colors.grey[800]),
                _FinanceRow(label: "Total Contratado", value: "R$ 450.000,00"),
                _FinanceRow(label: "Pago (80%)", value: "R$ 360.000,00", color: Colors.green),
                _FinanceRow(label: "Saldo Devedor", value: "R$ 90.000,00", color: Colors.redAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon; final String label; final VoidCallback onTap;
  const _QuickAction({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(onTap: onTap, child: CircleAvatar(radius: 28, backgroundColor: kRefleteGold.withOpacity(0.1), child: Icon(icon, color: kRefleteGold, size: 22))),
      SizedBox(height: 8), Text(label, style: TextStyle(fontSize: 11, color: Colors.grey))
    ]);
  }
}

class _FinanceRow extends StatelessWidget {
  final String label; final String value; final Color? color;
  const _FinanceRow({required this.label, required this.value, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: TextStyle(color: Colors.grey)), Text(value, style: TextStyle(color: color ?? Colors.white, fontWeight: FontWeight.bold))]));
  }
}

// --- ABA 2: CRONOGRAMA (TIMELINE) ---
class TimelineTab extends StatelessWidget {
  const TimelineTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Linha do Tempo", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: FixedTimeline.tileBuilder(
              theme: TimelineThemeData(nodePosition: 0, color: kRefleteGold, indicatorTheme: IndicatorThemeData(position: 0, size: 20.0)),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: 4,
                contentsBuilder: (context, index) {
                  final events = [
                    {"title": "Demolição & Infra", "date": "10 JAN - Concluído", "status": "Done"},
                    {"title": "Revestimentos", "date": "20 JAN - Em andamento", "status": "Active"},
                    {"title": "Marcenaria", "date": "05 FEV - Próximo", "status": "Future"},
                    {"title": "Entrega das Chaves", "date": "10 FEV - Previsto", "status": "Future"},
                  ];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(events[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: events[index]['status'] == "Active" ? kRefleteGold : Colors.white)),
                        Text(events[index]['date']!, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  if (index <= 0) return DotIndicator(color: Colors.green, child: Icon(Icons.check, size: 12, color: Colors.white));
                  if (index == 1) return DotIndicator(color: kRefleteGold, child: Icon(Icons.sync, size: 12, color: Colors.black));
                  return OutlinedDotIndicator(color: Colors.grey);
                },
                connectorBuilder: (_, index, ___) => SolidLineConnector(color: index <= 1 ? kRefleteGold : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- ABA 3: MARKETPLACE ---
class MarketplaceTab extends StatelessWidget {
  const MarketplaceTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text("Store Reflete", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text("Cashback exclusivo para sua obra", style: TextStyle(color: Colors.grey)),
        SizedBox(height: 20),
        _ProductCard(title: "Kit Automação Lutron", price: "R$ 14.500,00", cashback: "R$ 1.450 de volta"),
        _ProductCard(title: "Piso Portinari 120x120", price: "R$ 289,00 /m²", cashback: "5% OFF"),
        _ProductCard(title: "Consultoria de Interiores", price: "R$ 5.000,00", cashback: "Online"),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title; final String price; final String cashback;
  const _ProductCard({required this.title, required this.price, required this.cashback});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: kRefleteDarkGrey, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(height: 80, width: 80, color: Colors.white10, child: Icon(Icons.image, color: Colors.grey)),
          SizedBox(width: 15),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(price, style: TextStyle(color: kRefleteGold, fontWeight: FontWeight.bold)),
            Container(margin: EdgeInsets.only(top: 5), padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(5)), child: Text(cashback, style: TextStyle(fontSize: 10, color: Colors.green)))
          ])),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey)
        ],
      ),
    );
  }
}
