def classify_waste(description):
    description = description.lower()
    if "plastic" in description:
        return "Plastic"
    elif "paper" in description:
        return "Paper"
    elif "glass" in description:
        return "Glass"
    elif "metal" in description:
        return "Metal"
    elif "organic" in description or "food" in description:
        return "Organic"
    else:
        return "Unknown"
