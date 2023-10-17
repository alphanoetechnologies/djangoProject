from django.contrib import admin
from campaigns.models import Campaign


# Register your models here.

class CampaignAdmin(admin.ModelAdmin):
    list_display = ("name", "code", "createdAt", "liveAt", "endAt", "file", "status")
    list_filter = ("status",)


admin.site.register(Campaign, CampaignAdmin)

