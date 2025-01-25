import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InteractiveProfile extends StatefulWidget {
  @override
  _InteractiveProfileState createState() => _InteractiveProfileState();
  static const id = 'interactive_profile';
}
 
final String userName = "John Doe";

class _InteractiveProfileState extends State<InteractiveProfile> {
  bool _isHovered = true;
  double _profileProgress = 0.75;
  bool _showNotificationBadge = true;

  

  @override
  Widget build(BuildContext context) { 
  return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add the top app bar with back and menu icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.grey[700],
                onPressed: () {
                  // Add navigation back functionality
                  Navigator.maybePop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.grey[700],
                onPressed: () {
                  // Add menu functionality
                  null;
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              // Animated Profile Avatar with tap interaction
              GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  _showImageSourceDialog(context);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isHovered ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                  ),
               
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          
                          backgroundImage: null,
                          child: Icon(Icons.person, size: 40),
                          
                        ),
                   
            ],),
                  ),
                ),
              
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá'+ userName + '!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                //   Animated progress indicator
                  
        //           SizedBox(height: 8),
                  
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end, // Align row children to right
        // mainAxisSize: MainAxisSize.min,
        //             children: [
        //               // Animated Search Button
        //               AnimatedIconButton(
        //                 icon: Icons.search,
        //                 onPressed: () => _showSearch(context),
        //               ),
        //               SizedBox(width: 10),
        //               Notification Button with Badge
        //               Stack(
        //                 children: [
        //                   AnimatedIconButton(
        //                     icon: Icons.notifications,
        //                     onPressed: () {
        //                       setState(() => _showNotificationBadge = false);
        //                       _showNotifications(context);
        //                     },
        //                   ),
        //                   if (_showNotificationBadge)
        //                     Positioned(
        //                       right: 0,
        //                       child: Container(
        //                         padding: EdgeInsets.all(4),
        //                         decoration: BoxDecoration(
        //                           color: Colors.red,
        //                           shape: BoxShape.circle,
        //                         ),
        //                       ),
        //                     )
        //                 ],
        //               ),
        //             ],
                    
        //           )
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          
         AnimatedSize(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      width: 150,
                      child: LinearProgressIndicator(
                        value: _profileProgress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),

          
          Column(
            children: [
              Row(
                children: [
                  _buildInteractiveTile(
                    context,
                    Icons.email,
                    'Email',
                    'user@example.com',
                    color: Colors.blue,
                  ),
                  SizedBox(width: 16),
                  _buildInteractiveTile(
                    context,
                    Icons.phone,
                    'Phone',
                    '+1 234 567 890',
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  _buildInteractiveTile(
                    context,
                    Icons.settings,
                    'Settings',
                    'Account settings',
                    color: Colors.orange,
                  ),
                  SizedBox(width: 16),
                  _buildInteractiveTile(
                    context,
                    Icons.person,
                    'Profile',
                    'Edit profile',
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveTile(BuildContext context, IconData icon,
      String title, String subtitle, {Color color = Colors.blue}) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Material(
          color: const Color.fromARGB(0, 102, 57, 57),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              HapticFeedback.selectionClick();
              _showTileDialog(context, title);
            },
            onHover: (hovering) {
              setState(() {});
            },
            child: Container(
              height: 120,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 176, 236, 168),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 36, color: color),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 8),
                        Text(subtitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Interaction Methods
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Profile Picture'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement image selection
              Navigator.pop(context);
            },
            child: Text('Choose Photo'),
          ),
        ],
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  void _showNotifications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No new notifications'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showTileDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$title Selected'),
        content: Text('You interacted with the $title tile'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  AnimatedIconButton({required this.icon, required this.onPressed});

  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_isPressed ? 0.9 : 1.0),
        child: IconButton(
          icon: Icon(widget.icon),
          color: Colors.grey[700],
          splashColor: Colors.blue.withOpacity(0.3),
          highlightColor: Colors.transparent,
          onPressed: null, // Handled by GestureDetector
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(child: Text(query));

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Search for "$query"'),
          leading: Icon(Icons.search),
        ),
      ],
    );
  }
}