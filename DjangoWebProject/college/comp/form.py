from django import forms
from django.contrib.auth import get_user_model

from .models import Company

User = get_user_model()


class RegisterForm(forms.ModelForm):
    """A form for creating new users. Includes all the required
    fields, plus a repeated password."""
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ('username', 'email')

    # def clean_email(self):
    #     email = self.cleaned_data.get("email")
    #     qs = User.objects.filter(email__iexact=email)
    #     if qs.exists():
    #         raise forms.ValidationError("Cannot use this email because it is already registeres")
    #     return email

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


class CompanyCreateForm(forms.ModelForm):
    class Meta:
        model = Company
        fields = [
            "company_name",
            "company_type",
            "company_date",
            "company_time",
            "door_no",
            "street1",
            "street2",
            "city",
            "state",
            "pin_code",
            "name",
            "designation",
            "ph_number",
            "mailid",
            "job_description",
            "company_requirements",
        ]
