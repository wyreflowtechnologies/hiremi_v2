import 'package:flutter/material.dart';

class JobsForYouSection extends StatelessWidget {
  final List<Map<String, dynamic>> jobs = [
    {
      "title": "Motion Designer",
      "location": "Bangalore",
      "tags": ["Senior", "Fulltime", "Remote"],
      "company": "Pinterest, Inc.",
      "salary": "70K/Month",
    },
    {
      "title": "Flutter Developer",
      "location": "Mumbai",
      "tags": ["Junior", "Fulltime", "Onsite"],
      "company": "Tech Solutions",
      "salary": "50K/Month",
    },
    {
      "title": "Data Scientist",
      "location": "Delhi",
      "tags": ["Mid-level", "Contract", "Remote"],
      "company": "DataWorks",
      "salary": "90K/Month",
    },
    {
      "title": "UI/UX Designer",
      "location": "Hyderabad",
      "tags": ["Senior", "Part-time", "Remote"],
      "company": "Design Hub",
      "salary": "60K/Month",
    },
    {
      "title": "Backend Engineer",
      "location": "Pune",
      "tags": ["Senior", "Fulltime", "Onsite"],
      "company": "CodeFactory",
      "salary": "80K/Month",
    },
  ];

  JobsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Text(
            'Jobs for you',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.04),
                child: Container(
                  width: screenWidth * 0.68,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job['title'],
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: screenWidth * 0.04, color: Colors.grey),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            job['location'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: job['tags']
                            .map<Widget>(
                              (tag) => _buildTag(tag, screenWidth),
                            )
                            .toList(),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        job['company'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                             
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                                vertical: screenHeight * 0.01,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.02),
                              ),
                            ),
                            child: Text(
                              'Apply Now',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            job['salary'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String text, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenWidth * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontSize: screenWidth * 0.035,
        ),
      ),
    );
  }
}
