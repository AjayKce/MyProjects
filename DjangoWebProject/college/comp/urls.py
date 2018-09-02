from django.contrib.auth.views import LoginView, LogoutView
from django.contrib import admin
from django.conf.urls import url, include
from django.views.generic import TemplateView

from .views import (
    RegisterView,
    CompanyCreateView,
    companyIndexView,
    postcompanyIndexView,
    UpdateCompany,
    deletecompany,
    rejectcompany,
    RemeetUpdateCompany,
    sendremeet,
    remeetcompanyIndexView,
    report,
    listuser,
    deleteuser,
    filterreport,
    UpdateUser
)

urlpatterns = [
    url(r'^$', LoginView.as_view(template_name='comp/registration/login.html'), name='login'),
    url(r'^register/$', RegisterView.as_view(), name='register'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^userlist/$', listuser, name='userview'),
    url(r'company/(?P<pk>[0-9]+)/$', deleteuser, name='deleteuser'),
    url(r'company/update/(?P<pk>[0-9]+)/$', UpdateUser.as_view(), name='updateuser'),

    url(r'^home/$', companyIndexView, name='home'),
    url(r'^post/$', postcompanyIndexView, name='postmeetingcompany'),
    url(r'^remeet/$', remeetcompanyIndexView, name='remeetcompanyindex'),
    url(r'^sendremeeting/(?P<pk>[0-9]+)$', sendremeet, name='addremeeting'),

    url(r'^company/create$', CompanyCreateView.as_view(), name="companycreate"),
    url(r'^com/(?P<pk>[0-9]+)/update$', UpdateCompany.as_view(), name="companyupdate"),
    url(r'^com/(?P<pk>[0-9]+)/delete$', deletecompany, name="companydelete"),
    url(r'^com/(?P<pk>[0-9]+)/deletereemeet$', rejectcompany, name="companyreject"),

    url(r'^com/(?P<pk>[0-9]+)/remeet$', RemeetUpdateCompany.as_view(), name="remeet"),
    url(r'^com/report$', report, name="report"),
    url(r'^com/filterreport$', filterreport, name='filterreport')
]
