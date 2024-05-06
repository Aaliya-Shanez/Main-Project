"""
URL configuration for untitled project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from Scholarchain import views

urlpatterns = [
    path('login/',views.login),
    path('login_post/',views.login_post),
    path('admin_home/',views.admin_home),
    path('adupe/',views.adupe),
    path('admin_verify_organisation/',views.admin_verify_organisation),
    path('admin_verify_organisation_search/',views.admin_verify_organisation_search),
    path('orga_home/',views.orga_home),
    path('organizationperson_registration/',views.organizationperson_registration),
    path('admin_verify_organisation_more/<id>',views.admin_verify_organisation_more),
    path('admin_accept_reject_org/',views.admin_accept_reject_org),
    path('admin_view_listsch/',views.admin_view_listsch),
    path('view_geted_scholarships/<id>',views.view_geted_scholarships),
    path('admin_view_listsch_search/',views.admin_view_listsch_search),







    path('registration_post/',views.registration_post),
    path('logout/', views.logout),
    path('orgView_Profile/',views.orgView_Profile),
    path('orgEdit_Profile/',views.orgEdit_Profile),
    path('orgEdit_Profile_post/',views.orgEdit_Profile_POST),
    path('orgAdd_Scholarships/',views.orgAdd_Scholarships),
    path('orgAdd_Scholarships_POST/',views.orgAdd_Scholarships_POST),
    path('org_verify_Applications/',views.org_verify_Applications),
    path('org_verify_applications_search/',views.org_verify_application_search),
    path('org_accept_applications/<id>',views.org_accept_applications),
    path('org_accept_reject_applied_applications/<id>',views.org_accept_reject_applied_applications),
    path('org_approved_app_listsch/',views.org_approved_app_listsch),
    path('org_approved_app_listsch_post/',views.org_approved_app_listsch_post),
    path('org_view_studprof/<id>',views.org_view_studprof),
    path('org_verify_eligible_Applications/<id>',views.org_verify_eligible_Applications),
    path('org_verify_eligible_Applicationsser/',views.org_verify_eligible_Applicationsser),
    path('update_appl_status/',views.update_appl_status),
    path('admin_approved_sponsor_list/',views.admin_approved_sponsor_list),
    path('Student_view_Status/',views.Student_view_Status),
    path('student_viewall_scholarship/',views.student_viewall_scholarship),








    path('delete_schl/<id>',views.delete_schl),
    path('orgEditsch/<id>',views.orgEditsch),
    path('orgEditsch_POST/',views.orgEditsch_POST),
    path('orglistsch/',views.orglistsch),
    path('flutterlogin/',views.flutterlogin),


    #######################Student##########################



    path('Student/',views.Student),
    path('Studentsignup/',views.Studentsignup),
    path('Student_Portfolio/',views.Student_Portfolio),
    path('Student_Portfolio3/',views.Student_Portfolio3),
    path('view_port/',views.view_port),
    path('Student_viewprofile_POST/',views.Student_viewprofile_POST),



    path('user_view_scholarship/',views.user_view_scholarship),
    path('admin_verify_student/', views.admin_verify_student),
    path('admin_verify_student_search/', views.admin_verify_student_search),
    path('admin_verify_student_more/<id>', views.admin_verify_student_more),
    path('admin_accept_reject_student/', views.admin_accept_reject_student),
    path('forgot_Password/',views.forgot_Password),
    path('ForgotPassword_Post/',views.ForgotPassword_Post),
    path('public_view/',views.public_view),
    path('public_view_search/',views.public_view_search),
    path('Public_Enquiry_POST/',views.Public_Enquiry_POST),






    path('admin_view_sponsor_interest/',views.admin_view_sponsor_interest),
    path('admin_view_Enquiry/', views.admin_view_Enquiry),
    path('admin_verify_sponsor/', views.admin_verify_sponsor),
    path('admin_verify_sponsor_search/', views.admin_verify_sponsor_search),
    path('admin_verify_sponsor_more/<id>', views.admin_verify_sponsor_more),
    path('admin_accept_reject_sponsor/', views.admin_accept_reject_sponsor),
    path('admin_approved_sponsorlist_search/',views.admin_approved_sponsorlist_search),
    path('admin_view_sponsorint_search/', views.admin_view_sponsorint_search),

    path('student_view_scholarship/',views.student_view_scholarship),
    path('student_view_all_scholarships/',views.student_view_all_scholarships),
    path('Student_apply_sch/',views.Student_apply_sch),
    path('Student_view_Sponsor/',views.Student_view_Sponsor),

    # Sponsors
    path('SponsorSignup/', views.Sponsorignup),
    path('sponsor_view_scholarships/', views.sponsor_view_scholarships),
    path('send_Sponsor_Interest/',views.send_Sponsor_interest),
    path('sponsor_view_sch/',views.sponsor_view_sch),
    path('view_interested_sponsors/',views.view_interested_sponsors),
    path('sponsor_view_interested_status/',views.sponsor_view_interested_status),
    path('accept_sponsor_interest/<id>',views.accept_sponsor_interest),
    path('org_accept_reject_interested_sponsor/<id>',views.org_accept_reject_interested_sponsor),
    path('Sponsor_view_Students/',views.Sponsor_view_Students),
    path('Sponsor_View_Student_Portfolio/',views.Sponsor_View_Student_Portfolio),
    path('Sponsor_View_Student_more/',views.Sponsor_View_Student_more),
    path('Sponsor_viewstudentprofile_POST/',views.Sponsor_viewstudentprofile_POST),
    path('Sponsor_viewstudentportfolio_POST/',views.Sponsor_viewstudentportfolio_POST),
    path('spon_sending_required_student/',views.spon_sending_required_student),


    # path('admin_reply/<id>',views.admin_reply),


]
