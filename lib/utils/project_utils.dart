class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;
  final String? androidLink;
  final String? iosLink;
  final String? githubLink;
  final String? linkedInLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
    this.iosLink,
    this.androidLink,
    this.githubLink,
    this.linkedInLink,
  });
}

List<ProjectUtils> projectList = [
  ProjectUtils(
      image: "assets/images/qubecommerce1.png",
      title: "QubeCommerce App",
      subTitle:
          "QubeCommerce is an e-commerce platform paired with a powerful admin panel, designed to optimize product management and streamline user shopping experiences.",
      androidLink: "",
      iosLink: ""),
  ProjectUtils(
      image: "assets/images/QubeAnalytics.png",
      title: "Qube Analytics SDk",
      subTitle:
          "Private advanced Flutter package for comprehensive user behavior tracking from entry to exit, capturing the entire session, monitoring all interactions, and logging errors seamlessly without affecting the user experience—enhancing productivity and performance analysis efficiently.",
      linkedInLink:
          "https://www.linkedin.com/posts/kareem-tarek-17a9b819a_riseupaisummit-ai-innovation-activity-7293283886728437761-atmf?utm_source=share&utm_medium=member_desktop&rcm=ACoAAC7HPe4B_6Q-eBZsCfyPi7xVyHZl836cTuw"),
  ProjectUtils(
      image: "assets/images/tasky.png",
      title: "Tasky App",
      subTitle:
          "An engineer-focused task management application designed to boost productivity by 25%, featuring real-time updates and QR code functionalities for streamlined task handling and quick access.",
      androidLink: "https://www.amazon.com/dp/B0DQYB7CBG/ref=apps_sf_sta",
      githubLink: "https://github.com/kareemtarek74/Tasky",
      linkedInLink:
          "https://www.linkedin.com/posts/kareem-tarek-17a9b819a_flutterdevelopment-taskmanagement-engineers-activity-7270505776199139328-2wg-?utm_source=share&utm_medium=member_desktop&rcm=ACoAAC7HPe4B_6Q-eBZsCfyPi7xVyHZl836cTuw"),
  ProjectUtils(
    image: "assets/images/speedolife.png",
    title: "SpeedoLife App",
    subTitle:
        "A responsive e-commerce app for showcasing categorized products, achieving a 25% improvement in user engagement through streamlined navigation, localization, and a scalable design.",
    githubLink: "https://github.com/kareemtarek74/SpeedoLife",
  ),
  ProjectUtils(
    image: "assets/images/Dashboard.png",
    title: "Analytic Dashboard",
    subTitle:
        "Responsive & Adaptive dashboard application with real- time data visualization.",
    githubLink: "https://github.com/kareemtarek74/Dashboard",
  ),
];
