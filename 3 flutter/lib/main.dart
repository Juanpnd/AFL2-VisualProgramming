import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marchelino Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Marchelino',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'Front-End Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            // Contact Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.phone),
                Text('+087654321'),
                Icon(Icons.email),
                Text('Marchelino@gmail.com'),
              ],
            ),
            SizedBox(height: 20),
            // Skills Section
            Text(
              'Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SkillBar('Flutter', 0.95),
            SkillBar('ReactJS', 0.85),
            SkillBar('Node.js', 0.80),
            SkillBar('MongoDB', 0.75),
            SkillBar('Python', 0.70),
            SizedBox(height: 30),
            // Next button
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkExperiencePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Work Experience',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Work experience details
            WorkItem(
              title: 'Front -End Developer at Gereja Kristen',
              duration: '2012-2014',
              description:
                  'Telah membuat 10+aplikasi dengan tampilan front-end yang menarik jemaat jemaat baru ke gereja',
            ),
            WorkItem(
              title: 'Junior Developer at Rusunawa',
              duration: '2018 - Present',
              description:
                  'Telah menganggur selama 8 tahun dan sudah berlumut dalam kamar rusun.',
            ),
            SizedBox(height: 30),
            // Next button to Projects page
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectsPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Projects',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Project details
            ProjectItem(
              title: 'Jadi BOB Kwamki Lama',
              description:
                  'Telah banyak bikin orang mabuk karena karya ciptanya adalah pesta',
            ),
            ProjectItem(
              title: 'Personal Finance Tracker',
              description:
                  'A cross-platform mobile app developed with Flutter to help users manage budgets and track expenses. Featured on GitHub and has over 1,000 stars.',
            ),
            SizedBox(height: 30),
            // Next button to Contact Form page
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Contact Me',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Contact form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your name';
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your email';
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Message'),
                    maxLines: 5,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please enter your message';
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Message Sent!')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SkillBar widget for the skills progress bars
class SkillBar extends StatelessWidget {
  final String skill;
  final double proficiency;

  SkillBar(this.skill, this.proficiency);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            skill,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        LinearProgressIndicator(
          value: proficiency,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

// WorkItem widget for work experience entries
class WorkItem extends StatelessWidget {
  final String title;
  final String duration;
  final String description;

  WorkItem(
      {required this.title, required this.duration, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(duration, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 5),
        Text(description),
        SizedBox(height: 20),
      ],
    );
  }
}

// ProjectItem widget for project entries
class ProjectItem extends StatelessWidget {
  final String title;
  final String description;

  ProjectItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(description),
        SizedBox(height: 20),
      ],
    );
  }
}
