from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import status
from .models import WasteReport
from .serializers import WasteReportSerializer
from .classification import classify_waste

class ReportWasteView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        description = request.data.get('description')
        image = request.FILES.get('image')

        if not description or not image:
            return Response({'error': 'Both description and image are required.'}, status=status.HTTP_400_BAD_REQUEST)

        classification = classify_waste(description)
        waste_report = WasteReport(description=description, image=image, classification=classification)
        waste_report.save()

        serializer = WasteReportSerializer(waste_report)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
