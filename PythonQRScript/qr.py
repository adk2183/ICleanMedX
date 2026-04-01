import qrcode
import uuid
import os

if  __name__ == "__main__": 
	device_id = "STETH-" + str(uuid.uuid4())[:8]
	print(device_id)
	img = qrcode.make(device_id)
	os.makedirs("qrCodes", exist_ok=True)
	img.save("qrCodes/" + device_id + ".png")

