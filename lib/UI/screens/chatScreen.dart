import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool searchVisibility = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 25.0),
              child: Text(
                "Chats",
                style: appBarHeadStyle.copyWith(fontSize: 36.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 25.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    searchVisibility = !searchVisibility;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: docGreen,
                  size: 36.0,
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: searchVisibility,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                labelText: "Search...",
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: docGreen),
                  borderRadius: new BorderRadius.circular(25.7),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: docGreen),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter text...';
                }
                return null;
              },
              onChanged: (value) {},
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ChatCard(
          title: "Mukesh Kumar",
          subtitle: "hey Doc. need help with covid-19...",
          img:
              'https://scontent.fpat3-1.fna.fbcdn.net/v/t1.6435-9/160558089_2905653819723763_2627622177389023010_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=oecObwkOkuAAX9JW8bm&_nc_ht=scontent.fpat3-1.fna&oh=bb3c1607e00cb69609f1d544d20d00f5&oe=60B29C98',
          date: "19/04/21",
        ),
        ChatCard(
          title: "Arab",
          subtitle: "need advice with eye care",
          img:
              'https://instagram.fpat3-3.fna.fbcdn.net/v/t51.2885-15/e35/72776470_169783494168529_3128901409264276618_n.jpg?tp=1&_nc_ht=instagram.fpat3-3.fna.fbcdn.net&_nc_cat=101&_nc_ohc=OHOrNJkLWbgAX866Q70&edm=AABBvjUBAAAA&ccb=7-4&oh=68603c9011c0a298dd2659f651264c20&oe=60B44488&_nc_sid=83d603',
          date: "18/04/21",
        ),
        ChatCard(
          title: "Aditya Kumar Sahu",
          subtitle: "thankyou for the advice",
          img:
              'https://instagram.fpat3-1.fna.fbcdn.net/v/t51.2885-15/e35/135230666_1015618318959875_4958863263342675495_n.jpg?tp=1&_nc_ht=instagram.fpat3-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=n_PK5BgjtEoAX_XQCcl&edm=AABBvjUBAAAA&ccb=7-4&oh=81428227939782ff1b2794c822df9b9b&oe=60B1F13C&_nc_sid=83d603',
          date: "16/04/21",
        ),
        ChatCard(
          title: "Ritick Saha",
          subtitle: "unable sleep properly at night",
          img:
              'https://instagram.fpat3-2.fna.fbcdn.net/v/t51.2885-15/e35/70644279_2776155405749251_8671568005945060712_n.jpg?tp=1&_nc_ht=instagram.fpat3-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=c3Ym9ROefgcAX8r62PR&edm=AABBvjUBAAAA&ccb=7-4&oh=5612b2d93a382a2fb1ba99be365920dd&oe=60B4AC45&_nc_sid=83d603',
          date: "11/04/21",
        ),
        ChatCard(
          title: "Ayush Kumar",
          subtitle: "next appointment after 4 week...",
          img:
              'https://instagram.fpat3-3.fna.fbcdn.net/v/t51.2885-19/s320x320/142159352_3571493286293871_1594186942271094639_n.jpg?tp=1&_nc_ht=instagram.fpat3-3.fna.fbcdn.net&_nc_ohc=DSGVSlXAomoAX9W7A7p&edm=ABfd0MgBAAAA&ccb=7-4&oh=4f79ac8f9ea2ad439e5708234539d8df&oe=60B427C2&_nc_sid=7bff83',
          date: "6/04/21",
        ),
      ],
    );
  }
}

class ChatCard extends StatelessWidget {
  final title;
  final subtitle;
  final img;
  final date;
  ChatCard({this.title, this.subtitle, this.img, this.date});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 1,
        child: Container(
          child: Column(
            children: [
              ListTile(
                tileColor: appBG,
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(img),
                  ),
                  radius: 35.0,
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(subtitle),
                trailing: Text(date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
