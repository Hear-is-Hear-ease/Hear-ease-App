import 'package:hear_ease_app/lang/detailInfo/lang.dart';
import 'package:hear_ease_app/models/detail_info.dart';

class DetailInfoEN extends DetailInfoLang {
  @override
  DetailInfo diaperInfo = DetailInfo(
    state: 'Diaper',
    predictionMap: {},
    iconPath: 'assets/icons/diaper.png',
    iconTitle: 'I Need a New Diaper!',
    iconDesc:
        'Does your baby\nmake uneasy\nexpressions,\nor keep fidgeting\nwith their eyes?',
    description:
        "One of the major reasons babies cry is\nwhen their **diaper condition** \nisn't comfortable!\nA wet diaper signals discomfort.\n\nTo ensure your baby's comfort,\nit is recommended\nto **change the diaper**.\nAdditionally, check for the baby's\n **urinary status** and\nthe presence of any **diaper rash**.",
  );

  @override
  DetailInfo uncomfortableInfo = DetailInfo(
    state: 'Uncomfortable',
    predictionMap: {},
    iconPath: 'assets/icons/uncomfortable.png',
    iconTitle: 'I feel uncomfortable!',
    iconDesc:
        "Have you\nchecked your \nbaby's body \ntemperature \nand behavior?",
    description:
        "If your baby has no fever \nand their tummy feels fine,\nthey might be experiencing **growing pains**!\nGently **massage** your baby's legs.\n\nAlternatively, it could be due to \nan unsuitable environment,\nso please check the **temperature** \nand **humidity**.\nFor your baby's comfort,\na room temperature of **24-26°C** \nand humidity of **50-60%** \nare recommended!",
  );

  @override
  DetailInfo sleepyInfo = DetailInfo(
    state: 'Sleepy',
    predictionMap: {},
    iconPath: 'assets/icons/sleepy.png',
    iconTitle: "I'm Sleepy!",
    iconDesc: "Is your baby\nrubbing their eyes\nor blinking repeatedly?",
    description:
        "If so, it means your baby is\ngetting **sleepy**.\n\nTo help your baby sleep well,\nmake the surroundings **quiet**.\n\nPress the button below, and we'll provide\na soothing **song** to help your baby sleep.",
  );

  @override
  DetailInfo sadInfo = DetailInfo(
    state: 'Sad',
    predictionMap: {},
    iconPath: 'assets/icons/sad.png',
    iconTitle: "I'm Sad!",
    iconDesc: "Does your baby\ncry suddenly\nwithout any\nclear reason?",
    description:
        "First, check your baby's\n **body temperature** and **physical condition**.\nDoes your baby have a fever?\nIf so, we can guide you\nto the nearest hospital.\n\nIf not, and your baby is **turning red** \nin the face,clenching their **fists** \nnear their body,\nand tensing their abdomen,\nit could be a sign of **infant colic**!",
  );

  @override
  DetailInfo hugInfo = DetailInfo(
    state: 'Hug',
    predictionMap: {},
    iconPath: 'assets/icons/hug.png',
    iconTitle: 'I need a hug!',
    iconDesc: "Is your baby\ncrying loudly\nwithout tears?",
    description:
        "In that case,\nyour baby is either askingto be **held** \nor might be throwing a little **tantrum** \nbecause they want to play!\nYour baby is seeking **interaction** \nwith their parents.\n\nHold and comfort your baby,\nengage in **eye contact**, and play with them.\nIt helps in building\nan **attachment** with your baby!",
  );

  @override
  DetailInfo awakeInfo = DetailInfo(
    state: 'Awake',
    predictionMap: {},
    iconPath: 'assets/icons/awake.png',
    iconTitle: 'Just Woke Up!',
    iconDesc:
        "Babies can\nstartle themselveswith\ntheir own movements\nand wake up crying.",
    description:
        "Your baby has just woken up!\nPlease **gently soothe** your baby,\n\nWrap your baby snugly in a **blanket** \nto provide them with a sense of security.\n\nHow about playing some\ncomforting **music** for your baby?",
  );

  @override
  DetailInfo hungryInfo = DetailInfo(
    state: 'Hungry',
    predictionMap: {},
    iconPath: 'assets/icons/hungry.png',
    iconTitle: "I'm Hungry!",
    iconDesc:
        "Try touching your\nbaby's lower lip\nwith your pinky finger.\nDo they make\nsucking motions?",
    description:
        "If so, your baby is likely **hungry**,\nso offer them **breastfeeding** or **formula**!\n\nAdditionally, please observe\nyour baby's **feeding schedule**,\nas it can vary.\n\nHow about setting an **alarm** to remind you\nof your baby's feeding times?",
  );
}
