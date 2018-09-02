from django.contrib.auth.views import LoginView, LogoutView
from django.conf.urls import url, include
from django.views.generic import TemplateView
from .views import *

urlpatterns = [
    url(r'^$', TemplateView.as_view(template_name='app/first.html'), name='preload'),
    url(r'^test/$', TemplateView.as_view(template_name='app/test.html'), name='test'),
    url(r'^thankyou$', TemplateView.as_view(template_name='app/last.html'), name='thankyou'),
    url(r'home/$', index, name='index'),

    url(r'^login/$', LoginView.as_view(template_name='app/registration/login.html'), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^register/$', RegisterView.as_view(), name='register'),
    url(r'^userlist/$', listuser, name='userview'),
    url(r'user/(?P<pk>[0-9]+)/$', deleteuser, name='deleteuser'),
    url(r'user/update/(?P<pk>[0-9]+)/$', UpdateUser.as_view(), name='updateuser'),

    url(r'^upcome/$', collegeIndexView, name='upcoming'),
    url(r'^college/create$', CollegeCreateView.as_view(), name="collegecreate"),
    url(r'^college/(?P<pk>[0-9]+)/update$', UpdateCollege.as_view(), name="collegeupdate"),
    url(r'^college/(?P<pk>[0-9]+)/delete$', deletecollege, name="collegedelete"),

    url(r'^post/$', postrecruitmentIndexView, name='postrecruitment'),
    url(r'^rerecruit/$', rerecruitIndexView, name='rerecruitment'),
    url(r'^sendrerecruit/(?P<pk>[0-9]+)$', sendrerecruit, name='addrerecruit'),
    url(r'^college/(?P<pk>[0-9]+)/rerecruit$', RerecruitUpdateCollege.as_view(), name="rerecruit"),
    url(r'^college/(?P<pk>[0-9]+)/deletererecruit$', rejectcollege, name="collegereject"),

    url(r'^college/report$', report, name="report"),
    url(r'^college/filterreport$', filterreport, name='filterreport')

]
