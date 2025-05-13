from django.urls import path
from .report_waste import ReportWasteView

urlpatterns = [
    path('report/', ReportWasteView.as_view(), name='report-waste'),
]
