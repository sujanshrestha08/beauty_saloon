import 'package:flutter/material.dart';

class FAQS extends StatelessWidget {
  const FAQS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage('assets/faqs.jpg'), fit: BoxFit.fill),
                  color: Colors.amber,
                ),
              ),
            ),
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            elevation: 40,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text(
                    'FAQs',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('1. How can I book for services?'),
                    subtitle: Text(
                        'You can book by downloading the app through app store. Likewise you shall first login and choose ur preferred service and confirm booking. You can also book your appointment by calling our service line at 9847846626.'),
                  ),
                  SizedBox(height: 3),
                  ListTile(
                    title: Text('2. What are the service timings?'),
                    subtitle: Text('We are open from 10:00 am till 8:00pm'),
                  ),
                  SizedBox(height: 3),
                  ListTile(
                    title: Text(
                        '3. How many hours before my preferred time of service, can I book for services?'),
                    subtitle: Text(
                        'You can book your appointment at least 2 hours prior to your preferred tim of service. For your conveinence, you can place order starting from week prior to your service date and time'),
                  ),
                  SizedBox(height: 5),
                  ListTile(
                    title: Text('4. How can I pay for the service?'),
                    subtitle: Text(
                        'You can always pay for at the saloon after geeting your service'),
                  ),
                  SizedBox(height: 5),
                  ListTile(
                    title: Text(
                        '5. Do I need to show my booking confirmation before getting the service?'),
                    subtitle: Text(
                        'You can get the service by just saying ur name. We will check your data in our system'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
