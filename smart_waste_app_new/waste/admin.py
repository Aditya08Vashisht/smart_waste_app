from django.contrib import admin
from .models import WasteReport

@admin.register(WasteReport)
class WasteReportAdmin(admin.ModelAdmin):
    list_display = ('id', 'description', 'classification', 'reported_at')
    search_fields = ('classification', 'description')
    list_filter = ('classification', 'reported_at')
