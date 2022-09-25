import serial.tools.list_ports

for i in serial.tools.list_ports.comports():
    d = serial.Serial(i[0])
    print '%s - ' % i[0] , d.isOpen()
    
# import bus
# 
# busses = usb.busses()
# 
# for bus in busses:
    # devices = bus.devices
    # for dev in devices:
        # print("Device:", dev.filename)
        # print("idVendor: %d (0x%04x)" % (dev.idVendor, dev.idVendor))
        # print("idProduct: %d (0x%04x)" % (dev.idProduct, dev.idProduct))
