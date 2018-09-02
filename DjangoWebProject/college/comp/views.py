from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.views.generic import DetailView, CreateView, UpdateView
from django.http import Http404
from django.urls import reverse_lazy

from .models import Company

from .form import RegisterForm, CompanyCreateForm


class RegisterView(LoginRequiredMixin, CreateView):
    form_class = RegisterForm
    template_name = 'comp/registration/register.html'
    success_url = '/userlist/'

    def dispatch(self, *args, **kwargs):
        if self.request.user.is_superuser:
            return super(RegisterView, self).dispatch(*args, **kwargs)
        else:
            if self.request.user.is_authenticated:
                return redirect("/home/")
            return super(RegisterView, self).dispatch(*args, **kwargs)


def listuser(request):
    if request.user.is_superuser:
        users = User.objects.all()
        context = {'all': users}
        return render(request, 'comp/userview.html', context)
    else:
        return redirect("/home/")


def deleteuser(request, pk):
    wat = User.objects.filter(id=pk)
    wat.delete()
    users = User.objects.all()
    context = {'all': users}
    return render(request, 'comp/userview.html', context)


class UpdateUser(UpdateView):
    form_class = RegisterForm
    template_name = 'comp/updateuser.html'
    success_url = "/userlist/"

    def get_queryset(self, *args, **kwargs):
        return User.objects.filter(id=self.kwargs['pk'])


class UpdateCompany(UpdateView):
    model = Company
    fields = [
        'company_name',
        'company_type',
        'company_date',
        'company_time',
        'door_no',
        'street1',
        'street2',
        'city',
        'state',
        'pin_code',
        'name',
        'designation',
        'ph_number',
        'mailid',
        'job_description',
        'company_requirements']
    template_name = 'comp/CompanyUpdateForm.html'
    success_url = '/home'


class RemeetUpdateCompany(UpdateView):
    model = Company
    fields = [
        'company_date',
        'company_time',
        'company_requirements'
    ]
    template_name = 'comp/CompanyRemeetUpdate.html'
    success_url = '/home'

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.remeet = False
        # instance.save()
        return super(RemeetUpdateCompany, self).form_valid(form)

    def get_context_data(self, *args, **kwargs):
        context = super(RemeetUpdateCompany, self).get_context_data(*args, **kwargs)
        context['title'] = 'ADD Student'
        return context


class CompanyCreateView(LoginRequiredMixin, CreateView):
    form_class = CompanyCreateForm
    template_name = 'comp/CompanyForm.html'
    success_url = '/home'

    # login_url = '/userlogin/'

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.owner = self.request.user
        # instance.save()
        return super(CompanyCreateView, self).form_valid(form)

    def get_context_data(self, *args, **kwargs):
        context = super(CompanyCreateView, self).get_context_data(*args, **kwargs)
        context['title'] = 'ADD Student'
        return context


def deletecompany(request, pk):
    com = Company.objects.filter(id=pk)
    com.delete()
    return redirect('/home')


def rejectcompany(request, pk):
    com = Company.objects.filter(id=pk)
    com.delete()
    return redirect('/post')


def companyIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = Company.objects.filter(owner=request.user).filter(company_date__gte=todaydate)
        context = {
            'objects': queryset
        }
        return render(request, 'comp/index.html', context)
    else:
        return redirect("/")


def postcompanyIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = Company.objects.filter(owner=request.user).filter(company_date__lt=todaydate).filter(remeet=False)
        context = {
            'objects': queryset
        }
        return render(request, 'comp/postmeetingindex.html', context)
    else:
        return redirect("/")


def remeetcompanyIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = Company.objects.filter(owner=request.user).filter(company_date__lt=todaydate).filter(remeet=True)
        context = {
            'objects': queryset
        }
        return render(request, 'comp/remeetingindex.html', context)
    else:
        return redirect("/")


def sendremeet(request, pk):
    obj = Company.objects.filter(id=pk)
    for i in obj:
        i.remeet = True
        i.save()
    return redirect('/home/')


def report(request):
    import datetime
    today = datetime.date.today()
    start_week = today - datetime.timedelta(today.weekday())
    end_week = start_week + datetime.timedelta(7)
    todaydate = datetime.datetime.now().date()
    thismonth = todaydate.month
    thisyear = todaydate.year
    thistime = datetime.datetime.now()
    if request.user.is_superuser:
        dayactive = Company.objects.filter(company_date=todaydate).filter(
            company_time__gte=thistime.time())
        daynactive = Company.objects.filter(company_date=todaydate).filter(
            company_time__lt=thistime.time())
        weekactive = Company.objects.filter(
            company_date__range=[start_week, end_week]).filter(
            company_date__gt=todaydate)
        weeknactive = Company.objects.filter(
            company_date__range=[start_week, end_week]).filter(
            company_date__lt=todaydate)
        monthactive = Company.objects.filter(company_date__year=thisyear).filter(
            company_date__month=thismonth).filter(
            company_date__gt=todaydate)
        monthnactive = Company.objects.filter(company_date__year=thisyear).filter(
            company_date__month=thismonth).filter(
            company_date__lt=todaydate)
        yearactive = Company.objects.filter(company_date__year=thisyear).filter(
            company_date__gt=todaydate)
        yearnactive = Company.objects.filter(company_date__year=thisyear).filter(
            company_date__lt=todaydate)
    else:
        dayactive = Company.objects.filter(owner=request.user).filter(company_date=todaydate).filter(
            company_time__gte=thistime.time())
        daynactive = Company.objects.filter(owner=request.user).filter(company_date=todaydate).filter(
            company_time__lt=thistime.time())
        weekactive = Company.objects.filter(owner=request.user).filter(
            company_date__range=[start_week, end_week]).filter(
            company_date__gt=todaydate)
        weeknactive = Company.objects.filter(owner=request.user).filter(
            company_date__range=[start_week, end_week]).filter(
            company_date__lt=todaydate)
        monthactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
            company_date__month=thismonth).filter(
            company_date__gt=todaydate)
        monthnactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
            company_date__month=thismonth).filter(
            company_date__lt=todaydate)
        yearactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
            company_date__gt=todaydate)
        yearnactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
            company_date__lt=todaydate)
    context = {
        'objectsdayactive': dayactive,
        'objectsdaynactive': daynactive,
        'objectsweekactive': weekactive,
        'objectsweeknactive': weeknactive,
        'objectsmonthactive': monthactive,
        'objectsmonthnactive': monthnactive,
        'objectsyearactive': yearactive,
        'objectsyearnactive': yearnactive
    }
    return render(request, 'comp/Report.html', context)


def filterreport(request):
    if request.method == 'POST':
        import datetime
        fildate = datetime.datetime.strptime(request.POST['date'], "%Y-%m-%d").date()
        print(fildate)
        today = datetime.datetime.now().date()
        start_week = fildate - datetime.timedelta(fildate.weekday())
        end_week = start_week + datetime.timedelta(7)
        todaydate = fildate
        thismonth = todaydate.month
        thisyear = todaydate.year
        thistime = datetime.datetime.now()
        if request.user.is_superuser:
            dayactive = Company.objects.filter(company_date=fildate).filter(company_date__gte=today)
            daynactive = Company.objects.filter(company_date=fildate).filter(company_date__lt=today)
            weekactive = Company.objects.filter(
                company_date__range=[start_week, end_week]).filter(
                company_date__gte=today)
            weeknactive = Company.objects.filter(
                company_date__range=[start_week, end_week]).filter(
                company_date__lt=today)
            monthactive = Company.objects.filter(company_date__year=thisyear).filter(
                company_date__month=thismonth).filter(
                company_date__gte=today)
            monthnactive = Company.objects.filter(company_date__year=thisyear).filter(
                company_date__month=thismonth).filter(
                company_date__lt=today)
            yearactive = Company.objects.filter(company_date__year=thisyear).filter(
                company_date__gte=today)
            yearnactive = Company.objects.filter(company_date__year=thisyear).filter(
                company_date__lt=today)
        else:
            dayactive = Company.objects.filter(owner=request.user).filter(company_date=today).filter(
                company_time__gte=thistime.time())
            daynactive = Company.objects.filter(owner=request.user).filter(company_date=today).filter(
                company_time__lt=thistime.time())
            weekactive = Company.objects.filter(owner=request.user).filter(
                company_date__range=[start_week, end_week]).filter(
                company_date__gte=today)
            weeknactive = Company.objects.filter(owner=request.user).filter(
                company_date__range=[start_week, end_week]).filter(
                company_date__lt=today)
            monthactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
                company_date__month=thismonth).filter(
                company_date__gte=today)
            monthnactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
                company_date__month=thismonth).filter(
                company_date__lt=today)
            yearactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
                company_date__gte=today)
            yearnactive = Company.objects.filter(owner=request.user).filter(company_date__year=thisyear).filter(
                company_date__lt=today)
        context = {
            'objectsdayactive': dayactive,
            'objectsdaynactive': daynactive,
            'objectsweekactive': weekactive,
            'objectsweeknactive': weeknactive,
            'objectsmonthactive': monthactive,
            'objectsmonthnactive': monthnactive,
            'objectsyearactive': yearactive,
            'objectsyearnactive': yearnactive
        }
        return render(request, 'comp/filterreport.html', context)
