class CourseModel {
  String? ScholarshipName;
  String? Eligibility;
  String? StartDate;
  String? EndDate;
  String? Amount;
  String? tag2;

  CourseModel(
      {this.ScholarshipName,
      this.Eligibility,
      this.StartDate,
      this.EndDate,
      this.Amount,
      this.tag2});
}

class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        ScholarshipName: "Data Science",
        Eligibility:
            "Launch your career in data science. A sweet-cource introduction to data science, develop and taught by leading professors.",
        StartDate: "Jons Hopkins University",
        EndDate: "17 courses",
        Amount: "Data science",
        tag2: "Machine Learning"),
    CourseModel(
        ScholarshipName: "Machine Learning",
        Eligibility:
            "This specialization from leading researchers at university of washington introduce to you to the exciting high-demand field of machine learning ",
        StartDate: "University of washington",
        EndDate: "8 courses",
        Amount: "Machine Learning",
        tag2: "Decision Tree"),
    CourseModel(
        ScholarshipName: "Big Data",
        Eligibility:
            "Drive better bussiness decision with an overview OF how big data is organised  and intepreted. Apply insight to real-world problems and question",
        StartDate: "Us San Diego",
        EndDate: "10 courses",
        Amount: "Data Data",
        tag2: "Apache Spark"),
  ];
}
