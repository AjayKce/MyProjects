from django.db import models
from django.conf import settings

User = settings.AUTH_USER_MODEL

drop = (
    ('choose', 'CHOOSE'),
    ('autonomous', 'autonomous'),
    ('annauniversity', 'annauniversity'),
)


class College(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    college_name = models.CharField(max_length=150)
    college_type = models.CharField(max_length=150, choices=drop, default='choose')
    college_date = models.DateField()
    college_time = models.TimeField()
    address = models.CharField(max_length=1000)
    city = models.CharField(max_length=150)
    state = models.CharField(max_length=150)
    pin_code = models.IntegerField()
    placement_staff_name = models.CharField(max_length=150)
    ph_number = models.IntegerField()
    mailid = models.EmailField()
    ave_count = models.IntegerField()
    remeet = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.college_name
