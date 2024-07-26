import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tip_detail_screen.dart'; // Import the TipDetailScreen

class TipsScreen extends StatelessWidget {
  final List<Map<String, String>> tips = [
  {
    "title": "Reduce, Reuse, Recycle",
    "details": "Minimizing waste by reducing, reusing, and recycling helps conserve resources and reduces pollution. The average American generates about 4.5 pounds of waste per day. By recycling, we can reduce the amount of waste that ends up in landfills and incinerators. Recycling one ton of paper can save 17 trees and 7,000 gallons of water. Reducing waste helps lower greenhouse gas emissions from waste management processes, contributing to climate change mitigation."
  },
  {
    "title": "Conserve Water",
    "details": "Using water efficiently helps ensure a sustainable water supply for future generations and reduces the energy required for water treatment. The average American uses about 82 gallons of water per day. Simple actions like fixing leaks and installing water-saving fixtures can significantly reduce water usage. Conserving water also reduces the energy needed to pump, heat, and treat water, which in turn lowers greenhouse gas emissions."
  },
  {
    "title": "Choose Sustainable",
    "details": "Opting for sustainable products helps support environmentally-friendly practices and reduces your carbon footprint. Sustainable products are often made from renewable resources and have a lower environmental impact. For example, choosing products with minimal packaging reduces waste, and buying locally-produced goods reduces the carbon emissions associated with transportation. Supporting sustainable practices helps promote a circular economy and reduces the overall demand for non-renewable resources."
  },
  {
    "title": "Shop Wisely",
    "details": "Making informed purchases by choosing products with minimal packaging and those that are environmentally friendly helps reduce waste. Packaging accounts for about 30% of municipal solid waste in the United States. By choosing products with less packaging or opting for reusable options, you can help reduce the amount of waste that ends up in landfills. Additionally, buying products made from recycled materials supports the recycling industry and helps conserve natural resources."
  },
  {
    "title": "Use Long-lasting Light Bulbs",
    "details": "Switching to energy-efficient light bulbs, such as LEDs, reduces energy consumption and lowers your electricity bills. Traditional incandescent bulbs convert only about 10% of the energy they use into light, while LEDs are much more efficient. Switching to LEDs can save approximately 75% of the energy used by incandescent bulbs and can last 25 times longer. This reduction in energy use decreases the demand for power production, reducing greenhouse gas emissions and helping combat climate change."
  },
  {
    "title": "Plant a Tree",
    "details": "Planting trees helps combat climate change by absorbing carbon dioxide, providing oxygen, and supporting wildlife. A single mature tree can absorb approximately 48 pounds of CO2 annually. Trees also provide habitat for numerous species, help prevent soil erosion, and improve air quality by filtering pollutants. Urban areas with more trees experience lower temperatures, reducing the urban heat island effect and decreasing the need for air conditioning, which in turn lowers energy consumption."
  },
  {
    "title": "Educate Others",
    "details": "Sharing knowledge about environmental issues and solutions encourages more people to take action to protect the planet. Education and awareness are critical in driving collective action towards sustainability. By informing others about the impacts of climate change and the steps they can take to reduce their carbon footprint, you help build a more environmentally conscious society. This collective effort can lead to significant reductions in greenhouse gas emissions and greater support for environmental policies."
  },
  {
    "title": "Use Energy-Efficient Appliances",
    "details": "Using appliances that consume less energy helps reduce greenhouse gas emissions and lowers your energy bills. Energy-efficient appliances, such as those with the ENERGY STAR label, use 10-50% less energy and water than their conventional counterparts. For example, an ENERGY STAR-rated refrigerator uses 15% less energy than a non-rated model. Reducing energy consumption decreases the demand for electricity, which is often generated from fossil fuels, thus lowering greenhouse gas emissions."
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practical Tips', style: GoogleFonts.lato(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips to Help the Environment:',
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        tips[index]['title']!,
                        style: GoogleFonts.lato(fontSize: 20, color: Colors.green[900]),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TipDetailScreen(
                              title: tips[index]['title']!,
                              details: tips[index]['details']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder action for sharing achievements
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Share your achievements with the community!')),
                  );
                },
                child: Text(
                  'Share Achievements',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
