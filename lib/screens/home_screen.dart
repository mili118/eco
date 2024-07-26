import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'task_detail_screen.dart';
import 'tips_screen.dart';
import 'public_page.dart'; // Import the PublicPage
import 'post_model.dart'; // Import the Post model

class HomeScreen extends StatefulWidget {
  final double busynessLevel;

  HomeScreen({required this.busynessLevel});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> tasks = [
    {
      "task": "Pick up trash in your neighborhood",
      "difficulty": 2,
      "explanation": "Picking up trash helps keep the environment clean and prevents pollution of natural habitats. Every year, millions of tons of trash end up in the oceans, harming marine life and ecosystems. By collecting trash in your neighborhood, you prevent it from entering waterways, which protects aquatic life and maintains the health of ecosystems. Additionally, cleaner neighborhoods enhance community well-being and reduce the risk of health hazards associated with litter.",
      "image": "lib/assets/images/pick_up_trash.png"
    },
    {
      "task": "Ride your bike to work instead of driving",
      "difficulty": 9,
      "explanation": "Riding a bike instead of driving significantly reduces carbon emissions. The transportation sector is responsible for nearly 30% of greenhouse gas emissions in the United States. By choosing to bike, you help decrease air pollution and lower your carbon footprint. Biking also reduces traffic congestion, leading to lower emissions overall. Moreover, regular cycling promotes cardiovascular health and reduces the risk of chronic diseases.",
      "image": "lib/assets/images/ride_bike.png"
    },
    {
      "task": "Plant a tree",
      "difficulty": 1,
      "explanation": "Planting trees is one of the most effective ways to combat climate change. Trees absorb carbon dioxide, a major greenhouse gas, and release oxygen. A single mature tree can absorb approximately 48 pounds of CO2 annually. Additionally, trees provide habitat for wildlife, help prevent soil erosion, and improve air quality by filtering pollutants. Urban areas with more trees also experience lower temperatures, reducing the urban heat island effect.",
      "image": "lib/assets/images/plant_tree.png"
    },
    {
      "task": "Use a reusable water bottle",
      "difficulty": 10,
      "explanation": "Using a reusable water bottle reduces plastic waste and its detrimental effects on the environment. Approximately 1 million plastic bottles are purchased every minute worldwide, and less than half are recycled. The rest end up in landfills or the ocean, where they can take hundreds of years to decompose. By switching to reusable bottles, you decrease the demand for single-use plastics, lower pollution, and save resources used in the production and disposal of plastic bottles.",
      "image": "lib/assets/images/reusable_bottle.png"
    },
    {
      "task": "Recycle household waste",
      "difficulty": 5,
      "explanation": "Recycling reduces the amount of waste in landfills and conserves natural resources. The average American generates about 4.5 pounds of trash per day, and much of this waste can be recycled. Recycling saves energy and reduces greenhouse gas emissions associated with producing new materials. For example, recycling aluminum saves 95% of the energy required to produce new aluminum from raw materials. Effective recycling programs can significantly lower environmental impact and promote sustainability.",
      "image": "lib/assets/images/recycle.png"
    },
    {
      "task": "Compost food scraps",
      "difficulty": 4,
      "explanation": "Composting food scraps reduces the amount of waste sent to landfills, where organic waste produces methane, a potent greenhouse gas. Approximately 30-40% of the food supply in the United States is wasted, contributing to substantial methane emissions. Composting not only mitigates this impact but also produces nutrient-rich soil that enhances plant growth and soil health. Using compost reduces the need for chemical fertilizers, further benefiting the environment.",
      "image": "lib/assets/images/compost.png"
    },
    {
      "task": "Use energy-efficient light bulbs",
      "difficulty": 3,
      "explanation": "Using energy-efficient light bulbs, such as LEDs, reduces energy consumption and lowers electricity bills. Traditional incandescent bulbs convert only 10% of the energy they use into light, while LEDs are much more efficient. Switching to LEDs can save approximately 75% of the energy used by incandescent bulbs and last 25 times longer. This reduction in energy use decreases the demand for power production, thus reducing greenhouse gas emissions and helping combat climate change.",
      "image": "lib/assets/images/energy_efficient_bulbs.png"
    },
    {
      "task": "Reduce water usage",
      "difficulty": 7,
      "explanation": "Reducing water usage helps conserve a vital natural resource and decreases the energy required for water treatment and distribution. On average, an American family uses more than 300 gallons of water per day at home. Simple actions like fixing leaks, installing water-saving fixtures, and using water-efficient appliances can significantly reduce water consumption. Conserving water also protects freshwater ecosystems and reduces the strain on local water supplies, especially in drought-prone areas.",
      "image": "lib/assets/images/reduce_water.png"
    },
    {
      "task": "Support local farmers",
      "difficulty": 8,
      "explanation": "Supporting local farmers by buying locally grown produce reduces the carbon footprint associated with transporting food over long distances. The average meal in the United States travels about 1,500 miles from farm to plate. Local farming practices often use fewer chemicals and promote biodiversity, which benefits the environment. Additionally, purchasing from local farmers strengthens the local economy and encourages sustainable agriculture practices that prioritize environmental health.",
      "image": "lib/assets/images/local_farmers.png"
    },
    {
      "task": "Avoid single-use plastics",
      "difficulty": 6,
      "explanation": "Avoiding single-use plastics, such as straws, bags, and utensils, reduces plastic pollution and its harmful effects on wildlife and ecosystems. Every year, about 8 million metric tons of plastic waste enter the oceans, endangering marine life and ecosystems. By using reusable alternatives, you help decrease the demand for plastic production and waste. Reducing single-use plastics also conserves the fossil fuels used in their manufacture and helps mitigate climate change.",
      "image": "lib/assets/images/avoid_plastics.png"
    },
  ];

  int completedTasks = 0;

  List<Post> posts = []; // List to store posts

  void _markTaskComplete(String task) {
    setState(() {
      completedTasks++;
      posts.add(Post(user: "User", task: task, timestamp: DateTime.now())); // Add post to the list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Good job! Keep up the great work!'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

    // Sort tasks based on difficulty level
    tasks.sort((a, b) => (a['difficulty'] as int).compareTo(b['difficulty'] as int));

    // Find the task that best matches the busyness level
    Map<String, dynamic> suggestedTask = tasks.firstWhere(
      (task) => task['difficulty'] >= widget.busynessLevel,
      orElse: () => tasks.last,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Climate Tasks',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TipsScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.public, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PublicPage()), // Navigate to PublicPage
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: GoogleFonts.lato(fontSize: 20, color: Colors.green[900]),
            ),
            SizedBox(height: 20),
            Text(
              'Your Task for Today:',
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Column(
                children: [
                  Image.asset(suggestedTask['image']),
                  ListTile(
                    title: Text(
                      suggestedTask['task'],
                      style: GoogleFonts.lato(fontSize: 20, color: Colors.green[900]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailScreen(
                            task: suggestedTask['task'],
                            explanation: suggestedTask['explanation'],
                            image: suggestedTask['image'],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _markTaskComplete(suggestedTask['task']),
              child: Text('Mark as Complete', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Tasks Completed: $completedTasks',
              style: GoogleFonts.lato(fontSize: 20, color: Colors.green[900]),
            ),
            LinearProgressIndicator(
              value: completedTasks / tasks.length,
              backgroundColor: Colors.green[100],
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
