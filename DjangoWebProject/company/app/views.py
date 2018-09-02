from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.views.generic import DetailView, CreateView, UpdateView
from django.http import Http404
from django.urls import reverse_lazy

from .forms import RegisterForm, CollegeCreateForm
from .models import College


def index(request):
    return render(request, 'app/home.html')


class RegisterView(LoginRequiredMixin, CreateView):
    form_class = RegisterForm
    template_name = 'app/registration/register.html'
    success_url = '/home'

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
        return render(request, 'app/userview.html', context)
    else:
        return redirect("/home/")


def deleteuser(request, pk):
    wat = User.objects.filter(id=pk)
    wat.delete()
    users = User.objects.all()
    context = {'all': users}
    return render(request, 'app/userview.html', context)


class UpdateUser(UpdateView):
    form_class = RegisterForm
    template_name = 'app/updateuser.html'
    success_url = "/userlist/"

    def get_queryset(self, *args, **kwargs):
        return User.objects.filter(id=self.kwargs['pk'])


class CollegeCreateView(LoginRequiredMixin, CreateView):
    form_class = CollegeCreateForm
    template_name = 'app/collegeform.html'
    success_url = '/home'

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.owner = self.request.user
        # instance.save()
        return super(CollegeCreateView, self).form_valid(form)

    def get_context_data(self, *args, **kwargs):
        context = super(CollegeCreateView, self).get_context_data(*args, **kwargs)
        context['title'] = 'ADD Student'
        return context


def collegeIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = College.objects.filter(owner=request.user).filter(college_date__gte=todaydate)
        context = {
            'objects': queryset
        }
        return render(request, 'app/upcome.html', context)
    else:
        return redirect("/home")


class UpdateCollege(UpdateView):
    model = College
    fields = [
        'college_name',
        'college_type',
        'college_date',
        'college_time',
        'address',
        'city',
        'state',
        'pin_code',
        'placement_staff_name',
        'ph_number',
        'mailid',
        'ave_count'
    ]
    template_name = 'app/CollegeUpdateForm.html'
    success_url = '/home'


def deletecollege(request, pk):
    com = College.objects.filter(id=pk)
    com.delete()
    return redirect('/upcome')


def rejectcollege(request, pk):
    com = College.objects.filter(id=pk)
    com.delete()
    return redirect('/post')


def postrecruitmentIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = College.objects.filter(owner=request.user).filter(college_date__lt=todaydate).filter(remeet=False)
        context = {
            'objects': queryset
        }
        return render(request, 'app/postrecruitmentindex.html', context)
    else:
        return redirect("/home")


def rerecruitIndexView(request):
    if request.user.is_authenticated:
        import datetime
        todaydate = datetime.datetime.now().date()
        queryset = College.objects.filter(owner=request.user).filter(college_date__lt=todaydate).filter(remeet=True)
        context = {
            'objects': queryset
        }
        return render(request, 'app/rerecruitmentindex.html', context)
    else:
        return redirect("/")


def sendrerecruit(request, pk):
    obj = College.objects.filter(id=pk)
    for i in obj:
        i.remeet = True
        i.save()
    return redirect('/home')


class RerecruitUpdateCollege(UpdateView):
    model = College
    fields = [
        'college_date',
        'college_time',
        'ave_count'
    ]
    template_name = 'app/CollegeRerecruitUpdate.html'
    success_url = '/home'

    def form_valid(self, form):
        instance = form.save(commit=False)
        instance.remeet = False
        # instance.save()
        return super(RerecruitUpdateCollege, self).form_valid(form)

    def get_context_data(self, *args, **kwargs):
        context = super(RerecruitUpdateCollege, self).get_context_data(*args, **kwargs)
        context['title'] = 'ADD Student'
        return context


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
        dayactive = College.objects.filter(college_date=todaydate).filter(
            college_time__gte=thistime.time())
        daynactive = College.objects.filter(college_date=todaydate).filter(
            college_time__lt=thistime.time())
        weekactive = College.objects.filter(
            college_date__range=[start_week, end_week]).filter(
            college_date__gt=todaydate)
        weeknactive = College.objects.filter(
            college_date__range=[start_week, end_week]).filter(
            college_date__lt=todaydate)
        monthactive = College.objects.filter(college_date__year=thisyear).filter(
            college_date__month=thismonth).filter(
            college_date__gt=todaydate)
        monthnactive = College.objects.filter(college_date__year=thisyear).filter(
            college_date__month=thismonth).filter(
            college_date__lt=todaydate)
        yearactive = College.objects.filter(college_date__year=thisyear).filter(
            college_date__gt=todaydate)
        yearnactive = College.objects.filter(college_date__year=thisyear).filter(
            college_date__lt=todaydate)
    else:
        dayactive = College.objects.filter(owner=request.user).filter(college_date=todaydate).filter(
            college_time__gte=thistime.time())
        daynactive = College.objects.filter(owner=request.user).filter(college_date=todaydate).filter(
            college_time__lt=thistime.time())
        weekactive = College.objects.filter(owner=request.user).filter(
            college_date__range=[start_week, end_week]).filter(
            college_date__gt=todaydate)
        weeknactive = College.objects.filter(owner=request.user).filter(
            college_date__range=[start_week, end_week]).filter(
            college_date__lt=todaydate)
        monthactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
            college_date__month=thismonth).filter(
            college_date__gt=todaydate)
        monthnactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
            college_date__month=thismonth).filter(
            college_date__lt=todaydate)
        yearactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
            college_date__gt=todaydate)
        yearnactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
            college_date__lt=todaydate)
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
    return render(request, 'app/Report.html', context)


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
            dayactive = College.objects.filter(college_date=fildate).filter(college_date__gte=today)
            daynactive = College.objects.filter(college_date=fildate).filter(college_date__lt=today)
            weekactive = College.objects.filter(
                college_date__range=[start_week, end_week]).filter(
                college_date__gte=today)
            weeknactive = College.objects.filter(
                college_date__range=[start_week, end_week]).filter(
                college_date__lt=today)
            monthactive = College.objects.filter(college_date__year=thisyear).filter(
                college_date__month=thismonth).filter(
                college_date__gte=today)
            monthnactive = College.objects.filter(college_date__year=thisyear).filter(
                college_date__month=thismonth).filter(
                college_date__lt=today)
            yearactive = College.objects.filter(college_date__year=thisyear).filter(
                college_date__gte=today)
            yearnactive = College.objects.filter(college_date__year=thisyear).filter(
                college_date__lt=today)
        else:
            dayactive = College.objects.filter(owner=request.user).filter(college_date=today).filter(
                college_time__gte=thistime.time())
            daynactive = College.objects.filter(owner=request.user).filter(college_date=today).filter(
                college_time__lt=thistime.time())
            weekactive = College.objects.filter(owner=request.user).filter(
                college_date__range=[start_week, end_week]).filter(
                college_date__gte=today)
            weeknactive = College.objects.filter(owner=request.user).filter(
                college_date__range=[start_week, end_week]).filter(
                college_date__lt=today)
            monthactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
                college_date__month=thismonth).filter(
                college_date__gte=today)
            monthnactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
                college_date__month=thismonth).filter(
                college_date__lt=today)
            yearactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
                college_date__gte=today)
            yearnactive = College.objects.filter(owner=request.user).filter(college_date__year=thisyear).filter(
                college_date__lt=today)
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
        return render(request, 'app/filterreport.html', context)
