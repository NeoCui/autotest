
Software tool test illustration:

 +-------------------------------------------------------------------------------------------------+
*                                                                                                   *
*                              "LENOVO SW-OS Development Testing Team."                             *
*                                            Jul. 29, 2015                                          *
*                                             By Liangjw2                                           *
*                                                                                                   *
 +-------------------------------------------------------------------------------------------------+


 +-------------------------------------------------------------------------------------------------+
*                                                                                                   *
*                     This batch file is apply for Windows vNext_xxx test.                          *
*                                                                                                   *
*                         System will restart after performing this step.                           *
*                                                                                                   *
 +-------------------------------------------------------------------------------------------------+

Setting steps:

1. Reboot options:
   a. Maximum reboots: no less than 300 cycels;
   b. Reboot type: Reboot;
   c. Force shutdown: Ask to close;
   d. Delay: no less than 110 Sec, recommended value: 120 Sec;
   e. Checked "Auto load Rebooter at startup" option;
   f. Choose the location where you want to save log file; Such as, c:\Users\Administrator\Desktop;
2. Auto-login:
   g. Domain: N/A;
   h. User Name: SUT name, here is Administrator;
   i. Password: Login SUT password, here is `1q;
   j. Click "Set Auto-login";
   k. Click "Start Cycel".