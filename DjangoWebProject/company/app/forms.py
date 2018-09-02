from django import forms
from django.contrib.auth import get_user_model

from .models import College

User = get_user_model()


class RegisterForm(forms.ModelForm):
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ('username', 'email')

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        user = super(RegisterForm, self).save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        user.is_active = True
        if commit:
            user.save()
        return user


class CollegeCreateForm(forms.ModelForm):
    class Meta:
        model = College
        fields = [
            "college_name",
            "college_type",
            "college_date",
            "college_time",
            "address",
            "city",
            "state",
            "pin_code",
            "placement_staff_name",
            "ph_number",
            "mailid",
            "ave_count",
        ]
