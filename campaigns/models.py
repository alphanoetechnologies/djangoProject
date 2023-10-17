from django.db import models


# Create your models here.

class Asset(models.Model):
    title = models.CharField(max_length=250)
    language = models.CharField(max_length=50)
    # country
    # landing_page
    # email_template
    # created


STATUS_CHOICES = (
    ("Waiting", "Waiting"),
    ("Live", "Live"),
    ("Stop", "Stop"),
    ("Deliver", "Deliver")
)


class Campaign(models.Model):
    name = models.CharField(max_length=50)
    code = models.CharField(max_length=20, verbose_name="Campaign Code")
    description = models.CharField(max_length=200)
    createdAt = models.DateTimeField(auto_now_add=True)
    liveAt = models.DateField(verbose_name="Campaign Live")
    endAt = models.DateField(verbose_name="Campaign End")
    file = models.FileField(upload_to="campaign/%Y/%m/%d/", max_length=250, null=True, default=None)
    status = models.CharField(choices=STATUS_CHOICES, max_length=100)

    def __str__(self):
        return self.code + " : " + self.name
