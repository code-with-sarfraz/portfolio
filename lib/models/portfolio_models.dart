class ProjectItem {
  final String title;
  final String description;
  final String imagePath;

  ProjectItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class SkillItem {
  final String name;
  final String iconPath;

  SkillItem({
    required this.name,
    required this.iconPath,
  });
}

class CertificateItem {
  final String title;
  final String imagePath;

  CertificateItem({
    required this.title,
    required this.imagePath,
  });
}

class ExperienceItem {
  final String role;
  final String company;
  final String duration;
  final String description;

  ExperienceItem({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String year;

  EducationItem({
    required this.degree,
    required this.institution,
    required this.year,
  });
}
