import smtplib
from datetime import datetime

from django.core import mail
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from .models import *
# Create your views here.
def login(request):
    return render(request,'loginindex.html')

def login_post(request):
    Username=request.POST['textfield']
    Password=request.POST['textfield2']
    if Login.objects.filter(Username=Username,Password=Password).exists():
        A=Login.objects.get(Username=Username,Password=Password)
        if A.Password==Password:
            request.session['lid']=A.id
            if A.Type=='admin':
                return render(request,'Admin/Ahomeindex.html')
            elif A.Type =="organisation":
                return HttpResponse(
                        '''<script>alert('Login Successfull');window.location="/Scholarchain/orga_home/"</script>''')
            else:

                return HttpResponse("<script>alert('User not found'); window.location='/Scholarchain/login/'</script>")

        # return HttpResponse(
        #     '''<script>alert('Login Successfull');window.location="/Scholarchain/admin_home/"</script>''')
    return HttpResponse("<script>alert('User not found'); window.location='/Scholarchain/login/'</script>")

        # elif A.Type=='organisation':
        #     return HttpResponse(
        #         '''<script>alert('Login Successfull');window.location="/Scholarchain/orga_home/"</script>''')
        #
def forgot_Password(request):
    return render(request,'forgot password.html')

def ForgotPassword_Post(request):
    Email=request.POST['textfield']
    import random
    new_pass = random.randint(0000,9999)
    server = smtplib.SMTP('smtp.gmail.com',587)
    server.starttls()
    server.login("aaliyashanez786@gmail.com", "uuoa ocro darv iczi")

    to = Email
    subject = "Test Email"
    body = "Your new password is " + str(new_pass)
    msg = f"Subject:{subject}\n\n{body}"
    server.sendmail("aaliyashanez786@@gmail.com",to,msg)

    server.quit()
    Login.objects.filter(Username=Email).update(Password=new_pass)
    return HttpResponse('''<script>alert('New Password Has Been send to your mail');window.location="/Scholarchain/login/"</script>''')


def adupe(request):
    return render(request,"Admin/home_dupe.html")


def admin_home(request):
    return render(request,'Admin/Ahomeindex.html')


def admin_verify_organisation(request):
    data=Organizationpersonregistration.objects.filter(LOGIN__Type="pending").order_by('-id')
    return render(request,'Admin/Verify Organization.html',{"res":data})
def admin_verify_organisation_search(request):
    name=request.POST["textfield"]
    data=Organizationpersonregistration.objects.filter(LOGIN__Type="pending",Name__startswith=name)
    return render(request,'Admin/Verify Organization.html',{"res":data})
def admin_verify_organisation_more(request,id):
    data=Organizationpersonregistration.objects.get(id=id)
    return render(request,'Admin/verify_organization_more.html',{"res":data})

def admin_accept_reject_org(request):
    btval=request.POST["bt"]
    if btval=="Accept":
        lid=request.POST["lid"]
        data = Organizationpersonregistration.objects.filter(LOGIN=lid).update(Status="approved")
        data = Login.objects.filter(id=lid).update(Type="organisation")
        return HttpResponse('''<script>alert('Accepted');window.location="/Scholarchain/admin_verify_organisation/"</script>''')
    else:
        lid=request.POST["lid"]
        data = Organizationpersonregistration.objects.filter(LOGIN=lid).update(Status="rejected")

        data = Login.objects.filter(id=lid).update(Type="rejected")
        return HttpResponse(
            '''<script>alert('Rejected');window.location="/Scholarchain/admin_verify_organisation/"</script>''')

def admin_verify_student(request):
        data = Student.objects.filter(LOGIN__Type="Pending").order_by('-id')
        return render(request, 'Admin/verify student.html', {"res": data})

def admin_verify_student_search(request):
        name = request.POST["textfield"]
        data = Student.objects.filter(LOGIN__Type="Pending", Name__icontains=name).order_by('-id')
        return render(request, 'Admin/verify student.html', {"res": data})

def admin_verify_student_more(request, id):
        data = Student.objects.get(id=id)
        return render(request, 'Admin/verify_student_more.html', {"res": data})

def admin_accept_reject_student(request):
    btval=request.POST["bt"]
    if btval=="Accept":
        lid=request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(="approved")
        data = Login.objects.filter(id=lid).update(Type="Student")
        return HttpResponse('''<script>alert('Accepted');window.location="/Scholarchain/admin_verify_student/"</script>''')
    else:
        lid=request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(Status="rejected")

        data = Login.objects.filter(id=lid).update(Type="rejected")
        return HttpResponse(
            '''<script>alert('Rejected');window.location="/Scholarchain/admin_verify_student/"</script>''')

def admin_verify_sponsor(request):
        data = Sponsor.objects.filter(LOGIN__Type="Pending").order_by('-id')
        return render(request, 'Admin/verify sponsor.html', {"res": data})


def admin_verify_sponsor_search(request):
    name = request.POST["textfield"]
    data = Sponsor.objects.filter(LOGIN__Type="Pending", Name__icontains=name).order_by('-id')
    return render(request, 'Admin/verify sponsor.html', {"res": data})

def admin_verify_sponsor_more(request, id):
        data = Sponsor.objects.get(id=id)
        return render(request, 'Admin/verify_sponsor_more.html', {"res": data})

def admin_accept_reject_sponsor(request):
    print(request.POST)
    btval=request.POST["bt"]
    if btval=="Accept":
        lid=request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(="approved")
        data = Login.objects.filter(id=lid).update(Type="Sponsor")
        return HttpResponse('''<script>alert('Accepted');window.location="/Scholarchain/admin_verify_sponsor/"</script>''')
    else:
        lid=request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(Status="rejected")

        data = Login.objects.filter(id=lid).update(Type="rejected")
        return HttpResponse(
            '''<script>alert('Rejected');window.location="/Scholarchain/admin_verify_sponsor/"</script>''')

def admin_approved_sponsor_list(request):
        A = Sponsor.objects.filter(LOGIN__Type='Sponsor')
        return render(request, "Admin/list_approved_sponsors.html", {"data": A})
def admin_approved_sponsorlist_search(request):
    name=request.POST["textfield"]
    A=Sponsor.objects.filter(LOGIN__Type="Sponsor",Name__icontains=name)
    return render(request, "Admin/list_approved_sponsors.html", {"data": A})


def admin_view_listsch_search(request):
    f= request.POST["f1"]
    t = request.POST["t1"]
    res = Addscholarships.objects.filter(End_Date__range=[f,t])
    return render(request, 'Admin/Approved_sch.html', {"data": res})




def admin_view_listsch(request,):
    A=Addscholarships.objects.all()
    return render(request, "Admin/Approved_sch.html",{"data":A})







def view_geted_scholarships(request,id):
    res1=Scholarship_Apply.objects.filter(SCHOLARSHIPS_id=id,Status='Completed')
    if len(res1) > 0:


        res=Scholarship_Apply.objects.filter(SCHOLARSHIPS_id=id,Status='Completed')
        l=[]

        for i in res:

            p=Portfolio.objects.get(STUDENT=i.STUDENT)
            s=Student_info.objects.get(STUDENT=i.STUDENT)


            l.append({'s': i,'p':p, 's1':s })

        return render(request,'Admin/view_geted_sch.html',{'data':l})

    else:
        return HttpResponse(
            '''<script>alert('No Completed Applications');window.location="/Scholarchain/admin_view_listsch/"</script>''')



def  admin_view_Enquiry(request):
    A = Public_enquiry.objects.all().order_by('-id')
    return render(request, "Admin/view_enquiry.html", {"data": A})

# def admin_reply(request,id):
#     obj= Public_enquiry.objects.filter(id = id).update(Status = 'replied')
#     return redirect('/Scholarchain/admin_view_Enquiry/')

def admin_view_sponsor_interest(request):
    A = Sponsor_Student.objects.all().order_by('-id')
    return render(request, "Admin/view_sponsorship_request.html", {"data": A})

def admin_view_sponsorint_search(request):
    name=request.POST["textfield"]
    A=Sponsor_Student.objects.filter(STUDENT__Name__icontains=name)
    return render(request, "Admin/view_sponsorship_request.html", {"data": A})




# ________________organisation______________________

def orga_home(request):
    return render(request,'Organization/homeindex.html')


def organizationperson_registration(request):
    return render(request,'Organization/regisindex.html')

def registration_post(request):
    Name=request.POST['textfield']
    EMail=request.POST['textfield2']
    Phone=request.POST['textfield3']
    Address=request.POST['textfield4']
    Place=request.POST['textfield5']
    District=request.POST['textfield6']
    Pincode=request.POST['textfield7']
    Proof=request.FILES['fileField']
    Username=request.POST['textfield8']
    Password=request.POST['textfield9']
    ConformPassword=request.POST['textfield10']

    if Password!=ConformPassword:
        return HttpResponse(
            '''<script>alert('Passwords do not match');history.back()</script>''')
    if Login.objects.filter(Username=EMail).exists():
        return HttpResponse(
            '''<script>alert('Email Already exsists');history.back()</script>''')



    lobj=Login()
    lobj.Username=EMail
    lobj.Password=ConformPassword
    lobj.Type="pending"
    lobj.save()

    fs=FileSystemStorage()
    date=datetime.now().strftime("%Y%m%d_%H%M%S")+".pdf"
    fn=fs.save(date,Proof)
    path=fs.url(date)

    oobj=Organizationpersonregistration()
    oobj.Name=Name
    oobj.E_mail=EMail
    oobj.Phone=Phone
    oobj.Address= Address
    oobj.Place= Place
    oobj.District=District
    oobj.Pincode= Pincode
    oobj.Proof=path
    oobj.LOGIN=lobj
    oobj.save()
    return HttpResponse('''<script>alert('Registration Successfull');window.location="/Scholarchain/login/"</script>''')




def logout(request):
    return render(request, 'loginindex.html')

def orgView_Profile(request):
    A=Organizationpersonregistration.objects.get(LOGIN_id=request.session["lid"])
    return render(request,"Organization/View Profile.html",{"data":A})

def orgEdit_Profile(request):
    A=Organizationpersonregistration.objects.get(LOGIN_id=request.session["lid"])
    return render(request,"Organization/Edit Profile.html",{"data":A})

def orgEdit_Profile_POST(request):
    Name = request.POST['textfield']
    EMail = request.POST['textfield2']
    Phone = request.POST['textfield3']
    Address = request.POST['textfield4']
    Place = request.POST['textfield5']
    District = request.POST['textfield6']
    Pincode = request.POST['textfield7']
    if 'fileField' in request.FILES:
        Proof = request.FILES['fileField']

        fs = FileSystemStorage()
        date = datetime.now().strftime("%Y%m%d_%H%M%S") + ".pdf"
        fn = fs.save(date, Proof)
        path = fs.url(date)




        oobj=Organizationpersonregistration.objects.get(LOGIN_id=request.session["lid"])
        oobj.Name=Name
        oobj.E_mail=EMail
        oobj.Phone=Phone
        oobj.Address= Address
        oobj.Place= Place
        oobj.District=District
        oobj.Pincode= Pincode
        oobj.Proof=path
        oobj.save()
        return HttpResponse('''<script>alert('Updation Successfull');window.location="/Scholarchain/orgView_Profile/"</script>''')

    else:
        oobj = Organizationpersonregistration.objects.get(LOGIN_id=request.session["lid"])
        oobj.Name = Name
        oobj.E_mail = EMail
        oobj.Phone = Phone
        oobj.Address = Address
        oobj.Place = Place
        oobj.District = District
        oobj.Pincode = Pincode
        oobj.save()
        return HttpResponse('''<script>alert('Updation Successfull');window.location="/Scholarchain/orgView_Profile/"</script>''')




def orgAdd_Scholarships(request):
    dt = str(datetime.today().date())
    return render(request, 'Organization/Add Scholarship.html', {'dt':dt})

def orgAdd_Scholarships_POST(request):
    ScholarshipName = request.POST['textfield']
    Eligibility = request.POST['textfield2']
    StartDate = request.POST['textfield3']
    EndDate = request.POST['textfield4']
    Amount = request.POST['textfield5']
    Score = request.POST['textfield17']
    ScholarshipNumber = request.POST['textfield6']
    ScholarshipPeriod = request.POST['textfield7']
    SchType=request.POST['select']
    More = request.POST['textfield8']

    oobj=Addscholarships()
    oobj.ScholarShip_Name=ScholarshipName
    oobj.Eligibility=Eligibility
    oobj.Score=Score
    oobj.Start_Date=StartDate
    oobj.End_Date= EndDate
    oobj.Amount= Amount
    oobj.SchType= SchType
    oobj.Scholarship_Number=ScholarshipNumber
    oobj.Scholarship_Period= ScholarshipPeriod
    from datetime import datetime
    oobj.Renewal_Date=datetime.now()
    oobj.More=More
    oobj.ORGANIZATION_id=Organizationpersonregistration.objects.get(LOGIN_id=request.session['lid']).id
    oobj.save()
    return HttpResponse('''<script>alert('Added Successfully');window.location="/Scholarchain/orga_home/"</script>''')

def orglistsch(request):
    A=Addscholarships.objects.filter(ORGANIZATION__LOGIN_id=request.session['lid'])
    return render(request, "Organization/listsch.html",{"data":A})

def orgEditsch(request,id):
    dt = str(datetime.today().date())

    A=Addscholarships.objects.get(id=id)
    return render(request, 'Organization/Editsch.html',{'data':A,'dt':dt})

def orgEditsch_POST(request):
    Scholarship_Name = request.POST['textfield']
    Scholarship_Number = request.POST['textfield2']
    Eligibility = request.POST['textarea2']
    Start_Date = request.POST['textfield4']
    End_Date = request.POST['textfield5']
    Renewal_Date = request.POST['textfield6']
    Amount = request.POST['textfield7']
    Score = request.POST['textarea17']
    Scholarship_period=request.POST['textfield8']
    More=request.POST['textarea']
    id=request.POST['id']
    oobj=Addscholarships.objects.get(id=id)
    oobj.ScholarShip_Name=Scholarship_Name
    oobj.Eligibility=Eligibility
    oobj.Start_Date=Start_Date
    oobj.End_Date= End_Date
    oobj.Amount= Amount
    oobj.Score= Score
    oobj.ScholarshipNumber=Scholarship_Number
    oobj.Scholarship_Period= Scholarship_period
    oobj.Renewal_Date=Renewal_Date
    oobj.More=More
    oobj.save()
    return HttpResponse('''<script>alert('Updated Successfully');window.location="/Scholarchain/orga_home/"</script>''')

def delete_schl(request,id):
    res=Addscholarships.objects.get(id=id).delete()
    return HttpResponse('''<script>alert('Deleted');window.location="/Scholarchain/orglistsch/"</script>''')

def view_interested_sponsors(request,):
    res=Sponsor_interest.objects.filter(ADDSCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'])
    return render(request,'Organization/interested sponsors.html',{'data':res})

def accept_sponsor_interest(request, id):
        data = Sponsor_interest.objects.filter(id=id).update(Status='Approved')
        return HttpResponse(
            '''<script>alert('Accepted');window.location="/Scholarchain/view_interested_sponsors/"</script>''')


def org_accept_reject_interested_sponsor(request):
    print(request.POST)
    btval = request.POST["bt"]
    if btval == "Accept":
        lid = request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(="approved")
        data = Sponsor_interest.objects.filter(id=lid).update(Type="Accepted")
        return HttpResponse(
            '''<script>alert('Accepted');window.location="/Scholarchain/accept_sponsor_interest/"</script>''')
    else:
        lid = request.POST["lid"]
        # data = Student.objects.filter(LOGIN=lid).update(Status="rejected")

        data = Sponsor_interest.objects.filter(id=lid).update(Type="rejected")
        return HttpResponse(
            '''<script>alert('Rejected');window.location="/Scholarchain/accept_sponsor_interest/"</script>''')

def org_verify_Applications(request):
        data = Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'],Status='pending').order_by('-id')
        return render(request, 'Organization/view_applied_sch.html', {"res": data})


def org_verify_application_search(request):
    name = request.POST["textfield"]
    data = Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'],Status='pending',STUDENT__Name__icontains=name).order_by('-id')
    return render(request, 'Organization/view_applied_sch.html',{"res": data})

def org_accept_applications(request, id):
        data = Scholarship_Apply.objects.filter(id=id).update(Status='Approved')
        return HttpResponse(
            '''<script>alert('Accepted');window.location="/Scholarchain/orga_home/"</script>''')


def update_appl_status(request):
    select=request.POST['select']
    id=request.POST['id']
    data = Scholarship_Apply.objects.filter(id=id).update(Status=select)
    return HttpResponse('''<script>alert('Accepted');window.location="/Scholarchain/org_approved_app_listsch/"</script>''')


def org_accept_reject_applied_applications(request,id):

        data = Scholarship_Apply.objects.filter(id=id).update(Status="Accepted")
        return HttpResponse(
            '''<script>alert('Accepted');window.location="/Scholarchain/org_accept_applications/"</script>''')



def org_approved_app_listsch(request):
    A=Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'])
    return render(request, "Organization/list_app_sch.html",{"data":A})


def org_approved_app_listsch_post(request):
    s=request.POST['textfield2']
    A=Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'],Status__icontains=s)
    return render(request, "Organization/list_app_sch.html",{"data":A})








def org_view_studprof(request,id):
    A=Student_info.objects.get(STUDENT_id=id)
    B=Portfolio.objects.filter(STUDENT_id=id)
    return render(request, "Organization/viewstudentportfolio.html",{"res":A,'res1':B})

def org_verify_eligible_Applications(request,id):
    request.session['oid']=id
    data = Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'],
                                            Status='pending',SCHOLARSHIPS_id=id).order_by('-STUDENT__portfolio__Percentage')

    l = []
    for i, index in zip(data, range(len(data))):
        if Portfolio.objects.filter(STUDENT_id=i.STUDENT_id).exists():
            score = Portfolio.objects.filter(STUDENT_id=i.STUDENT_id)[0].Percentage
        l.append({
            'index':index,
            'id':i.id,
            'Date':i.Date,
            'ScholarShip_Name':i.SCHOLARSHIPS.ScholarShip_Name,
            'Image':i.STUDENT.Image,
            'sid':i.STUDENT.id,
            'Name':i.STUDENT.Name,
            'score':score,
            'Status':i.Status,
        })
    return render(request, 'Organization/view_applied_sch.html', {"res": l})
def org_verify_eligible_Applicationsser(request):
    search=request.POST['textfield']
    data = Scholarship_Apply.objects.filter(SCHOLARSHIPS__ORGANIZATION__LOGIN_id=request.session['lid'],
                                            Status='pending',SCHOLARSHIPS_id=request.session['oid'],STUDENT__Name__icontains=search).order_by('-STUDENT__portfolio__Percentage')

    l = []
    for i, index in zip(data, range(len(data))):
        if Portfolio.objects.filter(STUDENT_id=i.STUDENT_id).exists():
            score = Portfolio.objects.filter(STUDENT_id=i.STUDENT_id)[0].Percentage
        l.append({
            'index':index,
            'id':i.id,
            'Date':i.Date,
            'ScholarShip_Name':i.SCHOLARSHIPS.ScholarShip_Name,
            'Image':i.STUDENT.Image,
            'sid':i.STUDENT.id,
            'Name':i.STUDENT.Name,
            'score':score,
            'Status':i.Status,
        })
    return render(request, 'Organization/view_applied_sch.html', {"res": l})


#_________________________________Public__________________________


#
def public_view(request):
    res=Addscholarships.objects.all()
    l=[]
    for i in res:
        l.append({"id":i.id,"ScholarShip_Name":i.ScholarShip_Name,"Scholarship_Number":i.Scholarship_Number,"Eligibility":i.Eligibility,"Score":i.Score,"Start_Date":i.Start_Date,"End_Date":i.End_Date,"Amount":i.Amount,"Score":i.Score,"Scholarship_Period":i.Scholarship_Period,"Renewal_Date":i.Renewal_Date,"More":i.More})
    print(l)
    return JsonResponse({'status':"ok","data":l})

def public_view_search(request):
    search=request.POST['search']
    res=Addscholarships.objects.filter(SchType__icontains=search)
    l=[]
    for i in res:
        l.append({"id":i.id,"Score":i.Score,"ScholarShip_Name":i.ScholarShip_Name,"Scholarship_Number":i.Scholarship_Number,"Eligibility":i.Eligibility,"Score":i.Score,"Start_Date":i.Start_Date,"End_Date":i.End_Date,"Amount":i.Amount,"Scholarship_Period":i.Scholarship_Period,"Renewal_Date":i.Renewal_Date,"More":i.More})
    print(l)
    return JsonResponse({'status':"ok","data":l})




def Public_Enquiry_POST(request):
    Name=request.POST['Name']
    Email=request.POST['Email']
    Phoneno=request.POST['Phoneno']
    Enquiry=request.POST['Enquiry']

    obj=Public_enquiry()
    obj.Name=Name
    obj.Email=Email
    obj.Phoneno=Phoneno
    obj.Enquiry=Enquiry
    obj.Date=datetime.now().date()
    obj.Reply="pending"
    obj.Reply_date=datetime.now().date()
    obj.save()
    return JsonResponse({'status': 'ok'})


def Sponsorignup(request):
    Name=request.POST['Name']
    Address=request.POST['Address']
    Place=request.POST['Place']
    Pincode=request.POST['Pincode']
    District=request.POST['District']
    Gender=request.POST['Gender']
    State=request.POST['State']
    Country=request.POST['Country']
    Image = request.POST['Image']
    Email=request.POST['Email']
    if Login.objects.filter(Username=Email).exists():
        return JsonResponse({'status': 'no'})
    Phoneno=request.POST['Phoneno']
    Proof=request.POST['Proof']
    Password=request.POST['Password']
    ConformPassword=request.POST['ConformPassword']

    if Password==ConformPassword:
        import base64
        a = base64.b64decode(Image)
        b = datetime.now().strftime('%Y%m%d%H%M%S%f')+'I.jpg'
        open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Students\\'+b,'wb').write(a)

        aP = base64.b64decode(Proof)
        bP = datetime.now().strftime('%Y%m%d%H%M%S%f')+'P.jpg'
        open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Students\\'+bP,'wb').write(aP)

        lobj=Login()
        lobj.Username=Email
        lobj.Password=ConformPassword
        lobj.Type='Pending'
        lobj.save()



        obj=Sponsor()
        obj.Name=Name
        obj.Address=Address
        obj.Place=Place
        obj.Pincode=Pincode
        obj.District=District
        obj.Gender=Gender
        obj.State=State
        obj.Country=Country
        obj.Email=Email
        obj.Phoneno=Phoneno
        obj.Image='/media/Students/'+b
        obj.Proof='/media/Students/'+bP
        obj.LOGIN=lobj
        obj.save()
        return JsonResponse({'status':'ok'})
    return JsonResponse({'status': 'no'})

def view_port(request):
    lid=request.POST['lid']
    rr=Portfolio.objects.get(STUDENT__LOGIN_id=lid)
    return JsonResponse({'status': 'ok','id':rr.id})

def Student_Portfolio(request):
    lid=request.POST['lid']
    Type=request.POST['Type']
    Institutions = request.POST['Institutions']
    Percentage = request.POST['Percentage']
    # Cgpa = request.POST['Cgpa']
    Certificate=request.POST['certi']

    import base64
    a = base64.b64decode(Certificate)
    b = datetime.now().strftime('%Y%m%d%H%M%S%f') + '.pdf'
    open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Certificates\\' + b, 'wb').write(a)

    if Portfolio.objects.filter(STUDENT_id=Student.objects.get(LOGIN_id=lid)).exists():
        return JsonResponse({'status': 'no'})
    obj=Portfolio()

    obj.STUDENT=Student.objects.get(LOGIN_id=lid)
    obj.Type=Type
    obj.Institutions = Institutions
    obj.Percentage=Percentage
    # obj.Cgpa = Cgpa
    obj.Certificates='/media/Certificates/'+b
    obj.save()

    return JsonResponse({'status': 'ok'})



def Student_Portfolio3(request):
    Religion = request.POST['Religion']
    Caste = request.POST['Caste']
    Category = request.POST['Category']
    Parent_Occupation = request.POST['Parent_Occupation']
    Parent_Phoneno = request.POST['Parent_Phoneno']
    Income_Certificate=request.POST['Income_Certificate']
    Birth_Certificate=request.POST['Birth_Certificate']
    Caste_Certificate=request.POST['Caste_Certificate']
    Adhaar_Number=request.POST['Adhaar_Number']
    Family_Income=request.POST['Family_Income']
    Bank_Accountno=request.POST['Bank_Accountno']
    Ifsc_Code=request.POST['Ifsc_Code']
    Branch_Name=request.POST['Branch_Name']
    Holder_Name=request.POST['Holder_Name']

    import base64
    a = base64.b64decode(Income_Certificate)
    b = datetime.now().strftime('%Y%m%d%H%M%S%f') + '.pdf'
    open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Certificates\\' + b, 'wb').write(a)

    # import base64
    a1 = base64.b64decode(Birth_Certificate)
    b1 = datetime.now().strftime('%Y%m%d%H%M%S%f') + '-1.pdf'
    open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Certificates\\' + b1, 'wb').write(a1)

    # import base64
    a2 = base64.b64decode(Caste_Certificate)
    b2 = datetime.now().strftime('%Y%m%d%H%M%S%f') + '-2.pdf'
    open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Certificates\\' + b2, 'wb').write(a2)

    id = request.POST['lid']

    if Student_info.objects.filter(STUDENT_id=Student.objects.get(LOGIN_id=id)).exists():
        return JsonResponse({'status': 'no'})

    obj = Student_info()
    obj.Religion = Religion
    obj.Caste = Caste
    obj.Category = Category
    obj.Parent_Occupation = Parent_Occupation
    obj.Parent_Phoneno = Parent_Phoneno
    obj.Income_Certificate='/media/Certificates/'+b
    obj.Birth_Certificate='/media/Certificates/'+b1
    obj.Caste_Certificate='/media/Certificates/'+b2
    obj.Adhaar_Number=Adhaar_Number
    obj.Family_Income=Family_Income
    obj.Bank_Accountno=Bank_Accountno
    obj.Ifsc_Code=Ifsc_Code
    obj.Branch_Name=Branch_Name
    obj.Holder_Name=Holder_Name
    obj.STUDENT=Student.objects.get(LOGIN_id=id)
    obj.save()

    return JsonResponse({'status': 'ok'})



def Student_viewprofile_POST(request):
    lid = request.POST['lid']
    print(lid,'llllllllll')
    res = Student.objects.get(LOGIN_id=lid)
    return JsonResponse ({'status':'ok',
                          'Name':res.Name,"Dob":res.Dob,
                          "Address":res.Address,"Place":res.Place,"Pincode":res.Pincode,"District":res.District,
                          "Gender":res.Gender,"State":res.State,"Country":res.Country,"Email":res.Email,"Phoneno":res.Phoneno,
                          "Image":res.Image,"Parent_Name":res.Parent_Name,"Latest_Qualification":res.Latest_Qualification,"Institution":res.Institution})


def student_view_all_scholarships(request):
    res=Addscholarships.objects.all()
    l=[]
    for i in res:
        l.append({"id":i.id,"ScholarShip_Name":i.ScholarShip_Name,"Scholarship_Number":i.Scholarship_Number,"Eligibility":i.Eligibility,"Score":i.Score,"Start_Date":i.Start_Date,"End_Date":i.End_Date,"Amount":i.Amount,"Scholarship_Period":i.Scholarship_Period,"Renewal_Date":i.Renewal_Date,"More":i.More})
    print(l)
    return JsonResponse({'status':"ok","data":l})




















#####################################################




def flutterlogin(request):
    print(request.POST)
    Username=request.POST['username']
    Password=request.POST['password']
    log=Login.objects.filter(Username=Username,Password=Password)
    if log.exists():
        log1=Login.objects.get(Username=Username,Password=Password)
        lid=log1.id
        if log1.Type=='Student':
            return JsonResponse({'status':'ok','Type':log1.Type,'lid':str(lid)})
        elif log1.Type=='Sponsor':
            return JsonResponse({'status':'ok','Type':log1.Type,'lid':str(lid)})
        else:
            return JsonResponse({'status':'No','Type':"",'lid':""})
    else:
        print("jhbjb")
        return JsonResponse({'status':'None'})



# print(Login.objects.filter(Username='sreya@gmail.com'))
def Studentsignup(request):
    Name=request.POST['Name']
    Dob=request.POST['Dob']
    Address=request.POST['Address']
    Place=request.POST['Place']
    Pincode=request.POST['Pincode']
    District=request.POST['District']
    Gender=request.POST['Gender']
    Rsponsor=request.POST['Rsponsor']
    State=request.POST['State']
    Country=request.POST['Country']
    Email=request.POST['Email']
    if Login.objects.filter(Username=Email).exists():
        return JsonResponse({'status': 'no'})
    Phoneno=request.POST['Phoneno']
    Image=request.POST['Image']
    Parent_Name=request.POST['Parent_Name']
    Latest_Qualification=request.POST['Latest_Qualification']
    Institution=request.POST['Institution']
    Password=request.POST['Password']
    ConformPassword=request.POST['ConformPassword']


    if Password==ConformPassword:
        import base64
        a = base64.b64decode(Image)
        b = datetime.now().strftime('%Y%m%d%H%M%S%f')+'.jpg'
        open(r'C:\Users\Aaliya M Shanez\PycharmProjects\untitled\media\Students\\'+b,'wb').write(a)

        lobj=Login()
        lobj.Username=Email
        lobj.Password=ConformPassword
        lobj.Type='Pending'
        lobj.save()



        obj=Student()
        obj.Name=Name
        obj.Dob=Dob
        obj.Address=Address
        obj.Place=Place
        obj.Pincode=Pincode
        obj.District=District
        obj.Gender=Gender
        obj.State=State
        obj.Country=Country
        obj.Email=Email
        obj.Phoneno=Phoneno
        obj.Image='/media/Students/'+b
        obj.Parent_Name=Parent_Name
        obj.Latest_Qualification=Latest_Qualification
        obj.Institution=Institution
        obj.Required_Sponsorship=Rsponsor
        obj.LOGIN=lobj
        obj.save()
        return JsonResponse({'status':'ok'})
    return JsonResponse({'status': 'no'})

def user_view_scholarship(request):
    A=Addscholarships.objects.filter()
    list=[]
    for i in A:
        list.append({'ScholarshipName':i.ScholarShip_Name,'Eligibility':i.Eligibility,"Score":i.Score,'StartDate':i.Start_Date,'EndDate':i.End_Date,'Amount':i.Amount})
    return JsonResponse({'status':'ok', 'data':list})



def sponsor_view_scholarships(request):
    A=Addscholarships.objects.filter()
    list=[]
    for i in A:
        list.append({'ScholarshipName':i.ScholarShip_Name,'Eligibility':i.Eligibility,"Score":i.Score,
                     'StartDate':i.Start_Date,'EndDate':i.End_Date,'Amount':i.Amount, 'image':'/static/schalar.png'})
    return JsonResponse({'status':'ok', 'data':list})


def send_Sponsor_interest(request):
    SPONSOR_ID=request.POST['SPONSOR_ID']
    Scholarship_Id=request.POST['Scholarship_Id']

    if Sponsor_interest.objects.filter(SPONSOR=Sponsor.objects.get(LOGIN_id=SPONSOR_ID),ADDSCHOLARSHIPS_id=Scholarship_Id).exists():
        return JsonResponse({'status':'no',})
    obj = Sponsor_interest()
    obj.SPONSOR=Sponsor.objects.get(LOGIN_id=SPONSOR_ID)
    obj.ADDSCHOLARSHIPS_id=Scholarship_Id
    from datetime import datetime
    obj.Date=datetime.now().date()
    obj.Time=datetime.now().time()
    obj.Status='Pending'
    obj.save()
    return JsonResponse({'status': 'ok',})



def sponsor_view_sch(request):
    Scholarship_Type=request.POST['Scholarship_Type']

    res=Addscholarships.objects.filter(SchType__icontains=Scholarship_Type)
    l=[]
    for i in res:
        l.append({"id":i.id,"ScholarShip_Name":i.ScholarShip_Name,"Scholarship_Number":i.Scholarship_Number,"Eligibility":i.Eligibility,"Score":i.Score,"Start_Date":i.Start_Date,"End_Date":i.End_Date,"Amount":i.Amount,"Scholarship_Period":i.Scholarship_Period,"Renewal_Date":i.Renewal_Date,"More":i.More})
    print(l)
    return JsonResponse({'status':"ok","data":l})


def sponsor_view_interested_status(request,):
    lid=request.POST['lid']
    res=Sponsor_interest.objects.filter(SPONSOR__LOGIN_id=request.POST['lid'])
    L=[]
    for i in res:
         L.append({"id": i.id, "ScholarShip_Name": i.ADDSCHOLARSHIPS.ScholarShip_Name, "Scholarship_Number": i.ADDSCHOLARSHIPS.Scholarship_Number,
                  "Eligibility": i.ADDSCHOLARSHIPS.Eligibility,  "Amount": i.ADDSCHOLARSHIPS.Amount,
                  "Scholarship_Period": i.ADDSCHOLARSHIPS.Scholarship_Period, })
    print(L)
    return JsonResponse({'status': "ok", "data": L,})





def student_view_scholarship(request):
    cat = request.POST['cat']
    lid=request.POST['lid']
    s=Portfolio.objects.get(STUDENT__LOGIN_id=lid).Percentage
    elg=Portfolio.objects.get(STUDENT__LOGIN_id=lid).Type
    print(s)

    print(cat)
    ss=int(s)
    res=Addscholarships.objects.filter(SchType__icontains=cat,Score__lte=ss,Eligibility=elg)
    l=[]
    for i in res:
        l.append({"id":i.id,"ScholarShip_Name":i.ScholarShip_Name,"Scholarship_Number":i.Scholarship_Number,"Eligibility":i.Eligibility,str("Score"):i.Score,"Start_Date":i.Start_Date,"End_Date":i.End_Date,"Amount":i.Amount,"Scholarship_Period":i.Scholarship_Period,"Renewal_Date":i.Renewal_Date,"More":i.More})
    print(l)
    return JsonResponse({'status':"ok","data":l})

def student_viewall_scholarship(request):

    lid= request.POST["lid"]
    s = Portfolio.objects.get(STUDENT__LOGIN_id=lid).Percentage
    t = Portfolio.objects.get(STUDENT__LOGIN_id=lid).Type
    print(t)
    print(s)
    ss = int(s)
    resa = []

    print(t,ss,"hurrraaaaai")
    i=Addscholarships.objects.filter(Eligibility=t,Score__lte=int(ss))


    print(i,t,ss,"Feature")

    if len(i) ==1:
        i=i[0]
        applied = ''
        if Scholarship_Apply.objects.filter(SCHOLARSHIPS_id=i.id, STUDENT__LOGIN_id=lid).exists():
            applied = 'yes'
        resa.append({"id": i.id, "ScholarShip_Name": i.ScholarShip_Name, "Scholarship_Number": i.Scholarship_Number,
                    "Eligibility": i.Eligibility, "Score": i.Score, "Start_Date": i.Start_Date,
                    "End_Date": i.End_Date, "Amount": i.Amount, "Scholarship_Period": i.Scholarship_Period,
                    "Renewal_Date": i.Renewal_Date, "More": i.More, 'applied':applied})
    else:
        print(i,"hhhhhh")
        ls=[]
        for ia in i:
            print(ia.Eligibility)
            if ia.Eligibility not in ls:
                ls.append(ia.Eligibility)

        scholarshipid=[]
        features=[]
        res=Addscholarships.objects.filter(Eligibility=t,Score__lte=ss)
        for i in res:
            scholarshipid.append(i.id)
            el=[i.Eligibility]
            m=[]
            for k in ls:
                if k in el:
                    m.append(1)
                else:
                    m.append(0)
            features.append(m)

        test=[]
        for k in ls:
            if Portfolio.objects.filter(STUDENT=Student.objects.get(LOGIN_id=lid), Type=k):
                test.append(1)
            else:
                test.append(0)
        print(test,"hellllooooooooooooooooooooooooooooooooo")

        print(features,"ft")
        print(scholarshipid,"lb")
        from sklearn.ensemble import RandomForestClassifier
        rf=RandomForestClassifier()
        rf.fit(features,scholarshipid)
        s=rf.predict_proba([test])


        print(s,"ressssssssssssssss")

        s = s[0]
        for ia in range(0,len(s)):

            if s[ia]> 0.2 :

                i=Addscholarships.objects.get(id= scholarshipid[ia])
                applied = ''
                if Scholarship_Apply.objects.filter(SCHOLARSHIPS_id=i.id, STUDENT__LOGIN_id=lid).exists():
                    applied = 'yes'

                resa.append({"id": i.id, "ScholarShip_Name": i.ScholarShip_Name, "Scholarship_Number": i.Scholarship_Number,
                          "Eligibility": i.Eligibility, "Score": i.Score, "Start_Date": i.Start_Date,
                          "End_Date": i.End_Date, "Amount": i.Amount, "Scholarship_Period": i.Scholarship_Period,
                          "Renewal_Date": i.Renewal_Date, "More": i.More, 'applied':applied})

    print(resa,"==================")


    return JsonResponse({'status':"ok","data":resa})



def Student_apply_sch(request):
    lid=request.POST['lid']
    sid=request.POST['sid']
    obj=Scholarship_Apply()
    obj.STUDENT=Student.objects.get(LOGIN=lid)
    obj.SCHOLARSHIPS_id=sid
    obj.Date=datetime.now().date()
    obj.Status='pending'
    obj.save()
    return  JsonResponse({'status':"ok"})



def Student_view_Status(request):

    lid = request.POST['lid']
    res = Scholarship_Apply.objects.filter(STUDENT__LOGIN__id=request.POST['lid'])
    L = []
    for i in res:
        L.append({"id": i.id, "ScholarShip_Name": i.SCHOLARSHIPS.ScholarShip_Name,
                  "Name": i.SCHOLARSHIPS.ORGANIZATION.Name,
                  "Date": i.Date, "End_Date":i.SCHOLARSHIPS.End_Date,"Renewal_Date":i.SCHOLARSHIPS.Renewal_Date,"Status":i.Status, "Amount": i.SCHOLARSHIPS.Amount,
                  "Scholarship_Period": i.SCHOLARSHIPS.Scholarship_Period, })
    print(L)

    return JsonResponse({'status': "ok", "data": L, })

def Student_view_Sponsor(request):

    lid = request.POST['lid']
    res = Sponsor_Student.objects.filter(STUDENT__LOGIN__id=request.POST['lid'])
    L = []
    for i in res:
        L.append({"id": i.id, "Name": i.SPONSOR.Name,
                  "Email": i.SPONSOR.Email,
                  "Phoneno": i.SPONSOR.Phoneno,
                  "Address":i.SPONSOR.Address,
                  "Place":i.SPONSOR.Place,
                  "District":i.SPONSOR.District,
                  "Pincode": i.SPONSOR.Pincode,
                  "Image": i.SPONSOR.Image, })
    print(L)

    return JsonResponse({'status': "ok", "data": L, })





def Sponsor_view_Students(request):
    res = Student.objects.filter(Required_Sponsorship='Yes')
    L = []
    for i in res:
        L.append({"id": i.id, "Name": i.Name,
                  "Dob": i.Dob,
                  "Address": i.Address, "Place": i.Place, "Pincode": i.Pincode,
                  "District": i.District, "Gender": i.Gender,
                  "State": i.State,"Country": i.Country, "Email": i.Email,"Phoneno": i.Phoneno, "Image": i.Image,
                  "Parent_Name": i.Parent_Name,"Latest_Qualification": i.Latest_Qualification, "Institution": i.Institution,"Required_Sponsorship": i.Required_Sponsorship })
    print(L)

    return JsonResponse({'status': "ok", "data": L, })


def Sponsor_View_Student_more(request):
    sid = request.POST['sid']
    res = Student_info.objects.filter(STUDENT_id=sid)
    L = []
    for i in res:
        L.append({"id": i.id, "Religion": i.Religion,
                  "Caste": i.Caste,
                  "Category": i.Category, "Parent_Occupation": i.Parent_Occupation, "Parent_Phoneno": i.Parent_Phoneno,
                  "Income_Certificate": i.Income_Certificate, "Birth_Certificate": i.Birth_Certificate,
                  "Caste_Certificate": i.Caste_Certificate,"Adhaar_Number": i.Adhaar_Number, "Family_Income": i.Family_Income,"Bank_Accountno": i.Bank_Accountno, "Ifsc_Code": i.Ifsc_Code,
                  "Branch_Name": i.Branch_Name,"Holder_Name": i.Holder_Name,  })
    print(L)

    return JsonResponse({'status': "ok", "data": L, })



def Sponsor_View_Student_Portfolio(request):
    sid = request.POST['sid']
    res = Portfolio.objects.filter(STUDENT_id=sid)
    L = []
    for i in res:
        L.append({"id": i.id, "Type": i.Type,
                  "Percentage": i.Percentage,
                  "Certificates": i.Certificates,   })
    print(L)

    return JsonResponse({'status': "ok", "data": L, })


def Sponsor_viewstudentprofile_POST(request):
    lid = request.POST['sid']
    print(lid,'llllllllll')
    res = Student.objects.get(id=lid)
    return JsonResponse ({'status':'ok',
                          'Name':res.Name,"Dob":res.Dob,
                          "Address":res.Address,"Place":res.Place,"Pincode":res.Pincode,"District":res.District,
                          "Gender":res.Gender,"State":res.State,"Country":res.Country,"Email":res.Email,"Phoneno":res.Phoneno,
                          "Image":res.Image,"Parent_Name":res.Parent_Name,"Latest_Qualification":res.Latest_Qualification,"Institution":res.Institution})

def Sponsor_viewstudentportfolio_POST(request):
    lid = request.POST['sid']
    print(lid)
    print(lid,'llllllllll')
    res = Student_info.objects.filter(STUDENT_id=lid)

    L = []
    for i in res:
        a=Portfolio.objects.filter(STUDENT_id=i.STUDENT_id)
        Percentage='0'
        if a.exists():
            Percentage=a[0].Percentage
        L.append({"id":i.id,"Parent_Occupation": i.Parent_Occupation, "Parent_Phoneno": i.Parent_Phoneno,
                  "Adhaar_Number": i.Adhaar_Number,
                  'Percentage':Percentage,
                  "Bank_Accountno": i.Bank_Accountno,
                  "Student_id": i.STUDENT_id,
                  "Ifsc_Code":i.Ifsc_Code,"Branch_Name":i.Branch_Name,"Holder_Name":i.Holder_Name})
    print(L)

    return JsonResponse({'status': "ok", "data": L })
    #
    # return JsonResponse ({'status':'ok',
    #                       'Parent_Occupation':res.Parent_Occupation,"Parent_Phoneno":res.Parent_Phoneno,
    #                       "Adhaar_Number":res.Adhaar_Number,"Bank_Accountno":res.Bank_Accountno,"Ifsc_Code":res.Ifsc_Code,"Branch_Name":res.Branch_Name,
    #                       "Holder_Name":res.Holder_Name,})


def spon_sending_required_student(request):
        Student_id=request.POST['sid']
        Sponsor_id = request.POST['lid']
        if Sponsor_Student.objects.filter(STUDENT_id=Student_id,SPONSOR_id=Sponsor.objects.get(LOGIN_id=Sponsor_id).id).exists():
            return JsonResponse({'status': "no"})
        a=Sponsor_Student()
        a.STUDENT_id=Student_id
        a.SPONSOR_id=Sponsor.objects.get(LOGIN_id=Sponsor_id).id
        a.Date=datetime.now().date()
        a.save()
        return JsonResponse({'status': "ok" })