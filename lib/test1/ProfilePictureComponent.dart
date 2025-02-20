import 'package:flutter/material.dart';

class ProfilePictureComponent extends StatelessWidget {
  final String profileImageUrl;
  final VoidCallback onEditPressed;

  const ProfilePictureComponent({
    Key? key,
    this.profileImageUrl = 'https://dashboard.codeparrot.ai/api/image/Z6c1n6QaAZs3c_oK/group-12-3.png',
    this.onEditPressed = _defaultEditAction,
  }) : super(key: key);

  static void _defaultEditAction() {
    print('Edit button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minWidth: 200,
        minHeight: 250,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    profileImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onEditPressed,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAE24C),
                        borderRadius: BorderRadius.circular(14.5),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF111111),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

