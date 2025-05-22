import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveFlagsApp());
}

class ResponsiveFlagsApp extends StatelessWidget {
  const ResponsiveFlagsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Flags Grid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlagsGridPage(),
    );
  }
}

class FlagsGridPage extends StatelessWidget {
  const FlagsGridPage({Key? key}) : super(key: key);

  final List<Map<String, String>> countries = const [
    {'name': 'Bangladesh', 'flag': 'https://flagcdn.com/w320/bd.png'},
    {'name': 'Canada',     'flag': 'https://flagcdn.com/w320/ca.png'},
    {'name': 'South Korea','flag': 'https://flagcdn.com/w320/kr.png'}, 
    {'name': 'Japan',      'flag': 'https://flagcdn.com/w320/jp.png'},
    {'name': 'France',     'flag': 'https://flagcdn.com/w320/fr.png'},
    {'name': 'USA',        'flag': 'https://flagcdn.com/w320/us.png'},
    {'name': 'Australia',  'flag': 'https://flagcdn.com/w320/au.png'},
    {'name': 'Kenya',      'flag': 'https://flagcdn.com/w320/ke.png'},
    {'name': 'Italy',      'flag': 'https://flagcdn.com/w320/it.png'},
    {'name': 'Germany',    'flag': 'https://flagcdn.com/w320/de.png'},
    {'name': 'China',      'flag': 'https://flagcdn.com/w320/cn.png'},
    {'name': 'Mexico',     'flag': 'https://flagcdn.com/w320/mx.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country Flags')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          int crossAxisCount;

          if (width > 1024) {
            crossAxisCount = 4;
          } else if (width > 768 && width <= 1024) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return FlagCard(
                  name: country['name']!,
                  flagUrl: country['flag']!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FlagCard extends StatelessWidget {
  final String name;
  final String flagUrl;

  const FlagCard({
    Key? key,
    required this.name,
    required this.flagUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                flagUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Center(child: Icon(Icons.flag)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
