import 'package:flutter/material.dart';
import 'package:login_flutter_example/data/service/api_constants.dart';

class AvatarComponent extends StatelessWidget {
  final String? avatar;
  final String? name;
  final String? lastName;

  const AvatarComponent({Key? key, this.avatar, this.name, this.lastName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Avatar',
          style: TextStyle(color: Colors.grey.withOpacity(.8)),
        ),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 64.0,
                  height: 64.0,
                  child: avatar != null
                      ? Image.network(
                          '${ApiConstants.API_URL}/get-avatar/${avatar!}',
                          errorBuilder: (context, _, trace) {
                            return buildIcon();
                          },
                        )
                      : buildIcon(),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.4),
                    shape: BoxShape.circle,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name ?? ''),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    lastName ?? '',
                    style: TextStyle(color: Colors.grey.withOpacity(.8)),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Icon buildIcon() {
    return Icon(
      Icons.person,
      size: 48,
      color: Colors.grey.withOpacity(.6),
    );
  }
}
