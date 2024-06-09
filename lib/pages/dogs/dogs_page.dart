import 'package:flutter/material.dart';
import 'package:flutter_custom_design/domain/data/loadjson.dart';
import 'package:flutter_custom_design/domain/model/animals.model.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    child: FlutterLogo(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location'),
                        Text(
                          'Frankfurt, Germany',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.search_rounded,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.notifications_none_rounded,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/animals/filter.png'),
                          width: 18,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/animals/dog.png'),
                          width: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Dogs',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/animals/cat.png'),
                          width: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Cats',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: FutureBuilder(
                future: loadAnimalsData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Animals> dogs = snapshot.data as List<Animals>;
                    return GridView.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final dog = dogs[index];
                        return Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            20,
                          )),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(dog.image!),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              dog.name!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                                dog.sex != 'female'
                                                    ? Icons.male
                                                    : Icons.female,
                                                color: dog.sex != 'female'
                                                    ? Colors.blue
                                                    : Colors.pink)
                                          ],
                                        ),
                                        Icon(Icons.favorite_border)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${dog.age} | ${dog.race}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.purple,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.track_changes,
                  color: Colors.purple.shade200,
                ),
                Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.purple.shade200,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.purple.shade200,
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.purple.shade200,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.purple.shade200,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.purple.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
