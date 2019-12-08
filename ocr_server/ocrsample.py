try:
    from PIL import Image
except ImportError:
    import Image
import pytesseract

# This is the extensions which are allowed 
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

# By using the tessract getting text from the image of the invoice
def ocr_core(filename):
    text = pytesseract.image_to_string(Image.open(filename))
    return text

# Checking the extension of file uploaded 
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

