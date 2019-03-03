import win32gui,win32con

def turnoff():
	class Mode:
    		STAND_BY = 1
    		TURN_ON = -1
    		TURN_OFF = 2

	SC_MONITORPOWER = 0xF170 

	win32gui.SendMessage(win32con.HWND_BROADCAST, win32con.WM_SYSCOMMAND, SC_MONITORPOWER, Mode.TURN_OFF)
