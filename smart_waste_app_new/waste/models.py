from django.db import models

class WasteReport(models.Model):
    description = models.TextField()
    image = models.ImageField(upload_to='waste_images/')
    classification = models.CharField(max_length=100)
    reported_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Report {self.id} - {self.classification}"
