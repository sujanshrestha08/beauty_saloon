import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: SafeArea(
          child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/blowdry.jpg'),
                      fit: BoxFit.fill),
                  color: Colors.amber,
                ),
              ),
            ),
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 40,
          child: Column(
            children: const [
              Text('About Us',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 15),
              Text(
                  'Touch of beauty was established in 2016 with an aim to cater premium saloon services around Kathmandu valley.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Text(
                  'We take pride in being able to provide quality service. On top of that we are now here with our mobile app so that you will be able to book your appointment in your preffered date and time and avoid the long queue and hastle.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Text(
                  'Our dedicated and highly professional beauticians are very well equipped with necessary skillsets to help our customers experience a premium service. All our services are facilitated by the use of reputed and established brands of professional ranges under the technical guidance provided by technicians of associated brands.',
                  style: TextStyle(fontSize: 14)),
              SizedBox(height: 10),
              Text(
                  'Our core value lies in satisying our customer base by overcoming their expectations in terms of quality of services within a reasonable price range.',
                  style: TextStyle(fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
