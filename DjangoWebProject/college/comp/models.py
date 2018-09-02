from django.db import models
from django.conf import settings

User = settings.AUTH_USER_MODEL

drop = (
    ('choose', 'CHOOSE'),
    ('product', 'PRODUCT'),
    ('service', 'SERVICE'),
)


class Company(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    company_name = models.CharField(max_length=150)
    company_type = models.CharField(max_length=150, choices=drop, default='choose')
    company_date = models.DateField()
    company_time = models.TimeField()
    door_no = models.CharField(max_length=150)
    street1 = models.CharField(max_length=150)
    street2 = models.CharField(max_length=150)
    city = models.CharField(max_length=150)
    state = models.CharField(max_length=150)
    pin_code = models.IntegerField()
    name = models.CharField(max_length=150)
    designation = models.CharField(max_length=150)
    ph_number = models.IntegerField()
    mailid = models.EmailField()
    job_description = models.TextField()
    company_requirements = models.TextField()
    remeet = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.company_name
