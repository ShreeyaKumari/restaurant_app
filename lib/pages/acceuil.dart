import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/colors.dart';
import 'package:restaurant_app/utils/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class Acceuil extends StatelessWidget {
  final String name;
  final String desc;
  final String telephone;
  final String addresse;
  const Acceuil({super.key, required this.name, required this.desc, required this.telephone, required this.addresse});

  // Open the phone app with a given number
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Unable to call this number: $phoneNumber';
    }
  }

  // Open Google Maps with an address or coordinates
  Future<void> _launchMaps(String query) async {
    final Uri googleMapsUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/',
      queryParameters: {'api': '1', 'query': query},
    );

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    } else {
      throw 'Unable to open Google Maps for: $query';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("Golden Fork",
              style: Theme.of(context).textTheme.bodyLarge),
          actions: [
            Switch.adaptive(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ]
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),

            const SizedBox(height: 15),

            // Centered slogan under logo
            Text(
              "The restaurant that puts little dishes in the big ones.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 20),

            // Row with 2 centered buttons (Maps & Phone)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 32,
                  color: AppColors.green,
                  icon: const Icon(Icons.place),
                  onPressed: () {
                    _launchMaps("Faculty of Sciences Meknes");
                  },
                ),
                const SizedBox(width: 40),
                IconButton(
                  iconSize: 32,
                  style: ButtonStyle(),
                  color: AppColors.yellow,
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    _launchPhone(this.telephone);
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Card with description, address and phone
            Card(
              shadowColor: AppColors.primary,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      this.desc,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Address:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      this.addresse,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Phone:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      this.telephone,
                      style: Theme.of(context).textTheme.bodySmall,
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
