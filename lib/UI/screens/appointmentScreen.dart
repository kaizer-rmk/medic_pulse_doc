import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBG,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 25.0),
                child: Text(
                  "Appointments",
                  style: appBarHeadStyle.copyWith(fontSize: 30.0),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppointmentTile(
              dp: 'https://instagram.fpat3-2.fna.fbcdn.net/v/t51.2885-15/e35/70644279_2776155405749251_8671568005945060712_n.jpg?tp=1&_nc_ht=instagram.fpat3-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=c3Ym9ROefgcAX8r62PR&edm=AABBvjUBAAAA&ccb=7-4&oh=5612b2d93a382a2fb1ba99be365920dd&oe=60B4AC45&_nc_sid=83d603',
              name: "Ritick Saha",
              date: "09/05/2021 12:45AM",
              catgry: "Depression",
              message:
                  "from last few month due to depression have lots of pain in my head.",
              reason: "I don't know",
            ),
            AppointmentTile(
              dp: 'https://scontent.fpat3-1.fna.fbcdn.net/v/t1.6435-9/160558089_2905653819723763_2627622177389023010_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=oecObwkOkuAAX9JW8bm&_nc_ht=scontent.fpat3-1.fna&oh=bb3c1607e00cb69609f1d544d20d00f5&oe=60B29C98',
              name: "Mukesh Kumar",
              date: "16/05/2021 11:30AM",
              catgry: "Stomachace",
              message: "Doc. I have send you my report please chk!🎉",
              reason: "Scheduleed Checkup",
            ),
            AppointmentTile(
              dp: 'https://instagram.fpat3-1.fna.fbcdn.net/v/t51.2885-15/e35/135230666_1015618318959875_4958863263342675495_n.jpg?tp=1&_nc_ht=instagram.fpat3-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=n_PK5BgjtEoAX_XQCcl&edm=AABBvjUBAAAA&ccb=7-4&oh=81428227939782ff1b2794c822df9b9b&oe=60B1F13C&_nc_sid=83d603',
              name: "Aditya Kumar Sahu",
              date: "19/05/2021 03:15PM",
              catgry: "Eye Eaching",
              message: "Doc. I have send you my report please chk!",
              reason: "due to dry air",
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final dp;
  final name;
  final date;
  final catgry;
  final message;
  final reason;

  AppointmentTile(
      {this.dp, this.date, this.name, this.catgry, this.message, this.reason});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(dp),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
              color: headDark,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat"),
        ),
        subtitle: Text(date),
        backgroundColor: Color(0xFFcae9f5),
        childrenPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  "Payment: ",
                  style: expantionHead,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 28,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  "Category: ",
                  style: expantionHead,
                ),
                Text(
                  catgry,
                  style: expantionText,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  "Message: ",
                  maxLines: 3,
                  style: expantionHead,
                ),
                Expanded(
                  child: Text(
                    message,
                    style: expantionText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  "Reason:   ",
                  style: expantionHead,
                ),
                Text(
                  reason,
                  style: expantionText,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Attend Patient",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                color: docGreen,
                splashColor: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
