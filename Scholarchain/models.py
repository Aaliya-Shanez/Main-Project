from django.db import models

# Create your models here.
class Login(models.Model):
    Username=models.CharField(max_length=100)
    Password=models.CharField(max_length=100)
    Type=models.CharField(max_length=15)

class ForgotPassword(models.Model):
    New_Password=models.CharField(max_length=100)
    Confirm_Newpassword=models.CharField(max_length=100)

class  Organizationpersonregistration(models.Model):
    Name=models.CharField(max_length=100)
    E_mail= models.CharField(max_length=100)
    Phone=models.BigIntegerField()
    Address=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    District=models.CharField(max_length=100)
    Pincode=models.IntegerField()
    Proof=models.CharField(max_length=500)
    Status=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)

class Addscholarships(models.Model):
    ORGANIZATION=models.ForeignKey(Organizationpersonregistration,on_delete=models.CASCADE)
    ScholarShip_Name=models.CharField(max_length=100)
    Scholarship_Number=models.IntegerField()
    Eligibility=models.CharField(max_length=100)
    Score=models.IntegerField()
    Start_Date=models.DateField()
    End_Date=models.DateField()
    Renewal_Date=models.DateField()
    SchType=models.CharField(max_length=100)
    Amount=models.IntegerField()
    Scholarship_Period=models.CharField(max_length=100)
    More=models.CharField(max_length=100)
    Status=models.CharField(max_length=100, default='Active')

class Student(models.Model):
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Name=models.CharField(max_length=100,default='')
    Dob=models.DateField()
    Address=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    Pincode=models.IntegerField()
    District=models.CharField(max_length=100)
    Gender=models.CharField(max_length=100)
    State=models.CharField(max_length=100)
    Country=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Phoneno=models.BigIntegerField()
    Image=models.CharField(max_length=300,default=0)
    Parent_Name=models.CharField(max_length=100)
    Latest_Qualification=models.CharField(max_length=100)
    Institution=models.CharField(max_length=100)
    Required_Sponsorship=models.CharField(max_length=20,default='No')

class Public_enquiry(models.Model):
    Name=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Phoneno=models.BigIntegerField()
    Enquiry=models.CharField(max_length=100)
    Date=models.DateField()
    Reply=models.CharField(max_length=100)
    Reply_date=models.DateField()
    Status=models.CharField(max_length=100, default=" pending")

class Sponsor(models.Model):
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Name=models.CharField(max_length=100)
    Address=models.CharField(max_length=100)
    Place=models.CharField(max_length=100)
    Pincode=models.IntegerField()
    District=models.CharField(max_length=100)
    Gender=models.CharField(max_length=100)
    State=models.CharField(max_length=100)
    Country=models.CharField(max_length=100)
    Email=models.CharField(max_length=100)
    Phoneno=models.BigIntegerField()
    Proof=models.CharField(max_length=300,default=0)
    Image = models.CharField(max_length=300, default=0)

class Sponsor_interest(models.Model):
    SPONSOR=models.ForeignKey(Sponsor,on_delete=models.CASCADE)
    ADDSCHOLARSHIPS=models.ForeignKey(Addscholarships,on_delete=models.CASCADE)
    Date=models.DateField()
    Time=models.TimeField()
    Status=models.CharField(max_length=100)

class Portfolio(models.Model):
    STUDENT=models.ForeignKey(Student,on_delete=models.CASCADE)
    Type=models.CharField(max_length=100)
    Institutions=models.CharField(max_length=100)
    Percentage = models.CharField(max_length=50)
    # Cgpa = models.FloatField()
    Certificates=models.CharField(max_length=300)



class Student_info(models.Model):
    STUDENT = models.ForeignKey(Student, on_delete=models.CASCADE)
    Religion = models.CharField(max_length=100)
    Caste = models.CharField(max_length=100)
    Category = models.CharField(max_length=100)
    Parent_Occupation = models.CharField(max_length=100)
    Parent_Phoneno = models.BigIntegerField()
    Income_Certificate = models.CharField(max_length=300)
    Birth_Certificate = models.CharField(max_length=300)
    Caste_Certificate=models.CharField(max_length=300)
    Adhaar_Number = models.CharField(max_length=10)
    Family_Income = models.CharField(max_length=10)
    Bank_Accountno = models.CharField(max_length=10)
    Ifsc_Code = models.CharField(max_length=100)
    Branch_Name = models.CharField(max_length=100)
    Holder_Name = models.CharField(max_length=100)


class Scholarship_Apply(models.Model):
    STUDENT=models.ForeignKey(Student, on_delete=models.CASCADE)
    SCHOLARSHIPS=models.ForeignKey(Addscholarships,on_delete=models.CASCADE)
    Date=models.DateField()
    Status=models.CharField(max_length=100)


class Sponsor_Student(models.Model):
    SPONSOR = models.ForeignKey(Sponsor, on_delete=models.CASCADE)
    STUDENT = models.ForeignKey(Student, on_delete=models.CASCADE)
    Date=models.DateField()
