import 'package:doctor_appointment_app/core/const/images_path.dart';

class ArticleModel {
  final String title;
  final String image;
  final String description;
  final String tag;
  final String dateTime;

  ArticleModel ({
    required this.title,
    required this.image,
    required this.description,
    required this.tag,
    required this.dateTime,
  });
}

final List<ArticleModel> articlesData = [
  ArticleModel(
    title: "COVID-19 Was a Top Cause of Death in 2020 and 2021, Even For Younger People",
    image: ImagesPath.covid19,
    description: "COVID-19 became one of the leading causes of death worldwide during"
        " 2020 and 2021. Studies analyzing national death records found that the disease"
        " ranked among the top three causes of death, following conditions such as heart"
        " disease and cancer.\n\nBetween March 2020 and October 2021, COVID-19 accounted for"
        " roughly one in every eight deaths in the United States, showing how severe the "
        "pandemic’s impact was on public health. Although older adults were the most affected,"
        " the virus also caused significant mortality among younger and middle-aged people.\n\n "
        "In several age groups—such as adults aged 35–54—COVID-19 rose rapidly in the rankings "
        "and in some cases became the first or second leading cause of death in 2021. This shift"
        " showed that the pandemic was not only a threat to the elderly but also a serious risk "
        "for younger populations.\n\nOverall, the data highlight how COVID-19 dramatically changed"
        " global mortality patterns during those years and underscored the importance of vaccination,"
        " public health measures, and medical preparedness to reduce deaths during large-scale health crises.",
    tag: "Covid-19",
    dateTime: "Dec, 2026"
  ),

  ArticleModel(
      title: "Depression Treatment: How Genetic Testing Can Help Find the Right Medication",
      image: ImagesPath.medical,
      description: "Depression treatment often involves finding the right medication, but "
          "this process can take time because people respond differently to antidepressants. "
          "Genetic testing is an emerging tool that can help doctors choose medications more"
          " effectively.\n\n By analyzing a person’s genes, the test can show how their body may "
          "metabolize certain drugs, which medications might work better, and which ones may"
          " cause stronger side effects. This personalized approach, often called pharmacogenetic"
          " testing, allows healthcare providers to make more informed decisions when prescribing"
          " antidepressants.\n\n Instead of relying only on trial and error, doctors can use genetic"
          " insights to select treatments that are more likely to be effective for each individual."
          "While genetic testing does not guarantee a perfect medication match, it can speed up the"
          " treatment process, reduce side effects, and improve the chances of successful depression"
          " management, helping patients receive more personalized mental health care.",
      tag: "Medical",
      dateTime: "Dec, 2026"
  ),

  ArticleModel(
      title: "Reconnecting with Old Friends May Boost Your Mental Health - and Theirs",
      image: ImagesPath.lifeStyle,
      description: "Reconnecting with old friends can have a powerful positive impact on mental health."
          " Reviving past friendships often brings back shared memories, feelings of comfort, and a sense"
          " of belonging. These connections can help reduce loneliness, improve mood, and provide emotional "
          "support during challenging times.\n\n Reaching out to someone you haven’t spoken to in years can also"
          " strengthen social bonds and remind both people that they are valued and remembered. Even a simple"
          " message or phone call can rebuild meaningful relationships and create new opportunities for support"
          " and happiness. \n\nIn many cases, reconnecting benefits both sides, boosting emotional well-being and"
          " reminding people that lasting friendships can continue to bring joy and comfort, even after long"
          " periods apart.",
      tag: "LifeStyle",
      dateTime: "Dec, 2026"
  ),

  ArticleModel(
      title: "Healthy Eating: The Key to a Strong Body",
      image: ImagesPath.health,
      description: "Healthy eating plays a crucial role in building and maintaining a strong body."
          " The foods we eat provide the nutrients, vitamins, and minerals our bodies need to function"
          " properly. A balanced diet that includes fruits, vegetables, whole grains, lean proteins, "
          "and healthy fats helps support growth, improve energy levels, and strengthen the immune "
          "system.\n\n When the body receives the right nutrients, it becomes better prepared to fight "
          "illnesses and stay active throughout the day. Fruits and vegetables are rich in essential"
          " vitamins, antioxidants, and fiber that help protect the body from many health problems."
          " \n\nWhole grains such as brown rice, oats, and whole wheat bread provide long-lasting energy"
          " and support healthy digestion. Protein sources like fish, eggs, beans, and lean meat help "
          "build and repair body tissues, while healthy fats from foods like nuts, seeds, and avocados "
          "support brain function and heart health.",
      tag: "Health",
      dateTime: "Dec, 2026"
  ),
];
