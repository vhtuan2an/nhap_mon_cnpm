import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 8.0,
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Profile Image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 200,
                  width: 350,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       SizedBox(height: 70),
                       Text('0931766479'),
                       Text('TP. Hồ Chí Minh'),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Võ Hoàng Tuấn',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               SizedBox(height: 4),
                               Text('Hạng: kim cương'),
                            ],
                          ),
                          SizedBox(width: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               Text(
                                'Khách hàng',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                               SizedBox(height: 4),
                               Text('ID: 123456789'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}