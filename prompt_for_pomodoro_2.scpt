FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        i      	 
 	 I      �������� 0 hideall hideAll��  ��   
 O     -    k    ,       I   	������
�� .miscactvnull��� ��� obj ��  ��        r   
 $    m   
 ��
�� boovfals  6   #    n        1    ��
�� 
pvis  2    ��
�� 
prcs  F    "    =       1    ��
�� 
pvis  m    ��
�� boovtrue  =   !    1    ��
�� 
pisf  m     ��
�� boovfals   ��  I  % ,�� ��
�� .coreclosnull���    obj   2   % (��
�� 
cwin��  ��    m         �                                                                                  MACS  alis    f  Ibis500                    �m>YH+   J�'
Finder.app                                                      M%��B        ����  	                CoreServices    �m��      �B�     J�' J� J�  1Ibis500:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    I b i s 5 0 0  &System/Library/CoreServices/Finder.app  / ��     ! " ! l     ��������  ��  ��   "  # $ # i     % & % I      �������� 0 minimizeall minimizeAll��  ��   & k     � ' '  ( ) ( O     � * + * k    � , ,  - . - r     / 0 / J    ����   0 o      ���� 0 
thebuttons 
theButtons .  1 2 1 l  	 	��������  ��  ��   2  3 4 3 X   	 m 5�� 6 5 Z    h 7 8���� 7 >      9 : 9 l    ;���� ; n     < = < 1    ��
�� 
pnam = o    ����  0 theapplication theApplication��  ��   : m     > > � ? ?  F l u i d A p p 8 X   # d @�� A @ X   5 _ B�� C B Z   G Z D E���� D l  G L F���� F =  G L G H G l  G J I���� I n   G J J K J 1   H J��
�� 
desc K o   G H���� 0 	thebutton 	theButton��  ��   H m   J K L L � M M  m i n i m i z e   b u t t o n��  ��   E r   O V N O N b   O T P Q P o   O P���� 0 
thebuttons 
theButtons Q J   P S R R  S�� S o   P Q���� 0 	thebutton 	theButton��   O o      ���� 0 
thebuttons 
theButtons��  ��  �� 0 	thebutton 	theButton C n   8 ; T U T 2  9 ;��
�� 
butT U o   8 9���� 0 	thewindow 	theWindow�� 0 	thewindow 	theWindow A n   & ) V W V 2  ' )��
�� 
cwin W o   & '����  0 theapplication theApplication��  ��  ��  0 theapplication theApplication 6 2   ��
�� 
pcap 4  X Y X l  n n��������  ��  ��   Y  Z [ Z X   n � \�� ] \ I  ~ ��� ^��
�� .prcsclicnull��� ��� uiel ^ o   ~ ���� 0 	thebutton 	theButton��  �� 0 	thebutton 	theButton ] o   q r���� 0 
thebuttons 
theButtons [  _ ` _ l  � ���������  ��  ��   `  a b a l  � ��� c d��   c > 8do it twice because it usually misses one the first time    d � e e p d o   i t   t w i c e   b e c a u s e   i t   u s u a l l y   m i s s e s   o n e   t h e   f i r s t   t i m e b  f g f X   � � h�� i h I  � ��� j��
�� .prcsclicnull��� ��� uiel j o   � ����� 0 	thebutton 	theButton��  �� 0 	thebutton 	theButton i o   � ����� 0 
thebuttons 
theButtons g  k�� k l   � ��� l m��   l � �
		activate
		display dialog "Are all windows mimimized?" buttons {"No", "Yes"} default button 1 giving up after 10
		if the button returned of the result is "No" then
			set the visible of every process to false
		end if
		    m � n n� 
 	 	 a c t i v a t e 
 	 	 d i s p l a y   d i a l o g   " A r e   a l l   w i n d o w s   m i m i m i z e d ? "   b u t t o n s   { " N o " ,   " Y e s " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 0 
 	 	 i f   t h e   b u t t o n   r e t u r n e d   o f   t h e   r e s u l t   i s   " N o "   t h e n 
 	 	 	 s e t   t h e   v i s i b l e   o f   e v e r y   p r o c e s s   t o   f a l s e 
 	 	 e n d   i f 
 	 	��   + m      o o�                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��   )  p�� p l  � ���������  ��  ��  ��   $  q r q l     ��������  ��  ��   r  s t s i    u v u I      �� w���� 0 writelog WriteLog w  x�� x o      ���� 0 text4log text4Log��  ��   v k      y y  z { z I    �� |��
�� .sysoexecTEXT���     TEXT | b     	 } ~ } b       �  b      � � � m      � � � � � B e c h o   ` d a t e   ' + % Y - % m - % d   % H : % M : % s ' `   � n     � � � 1    ��
�� 
strq � o    ���� 0 text4log text4Log � m     � � � � �  > > ~ m     � � � � � n / U s e r s / r s / L i b r a r y / L o g s / c o m . r o l a n d s i e b e l i n k . p o m o d o r o . l o g��   {  � � � l   �� � ���   � � �tell application id "com.Growl.GrowlHelperApp" to notify with name "Info" title text4Log description text4Log application name "PomodoroGlue" priority -2 --set to 0 to see these success notifications    � � � �� t e l l   a p p l i c a t i o n   i d   " c o m . G r o w l . G r o w l H e l p e r A p p "   t o   n o t i f y   w i t h   n a m e   " I n f o "   t i t l e   t e x t 4 L o g   d e s c r i p t i o n   t e x t 4 L o g   a p p l i c a t i o n   n a m e   " P o m o d o r o G l u e "   p r i o r i t y   - 2   - - s e t   t o   0   t o   s e e   t h e s e   s u c c e s s   n o t i f i c a t i o n s �  ��� � I   �� � �
�� .sysonotfnull��� ��� TEXT � o    ���� 0 text4log text4Log � �� ���
�� 
appr � m     � � � � � " P r o m p t F o r P o m o d o r o��  ��   t  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 
writeerror 
WriteError �  ��� � o      ���� 0 text4log text4Log��  ��   � k      � �  � � � I    �� ���
�� .sysoexecTEXT���     TEXT � b     	 � � � b      � � � b      � � � m      � � � � � @ e c h o   ` d a t e   ' + % Y - % m - % d   % H : % M : % s `   � n     � � � 1    ��
�� 
strq � o    ���� 0 text4log text4Log � m     � � � � �  > > � m     � � � � � n / U s e r s / r s / L i b r a r y / L o g s / c o m . r o l a n d s i e b e l i n k . p o m o d o r o . l o g��   �  � � � l   �� � ���   � � �tell application id "com.Growl.GrowlHelperApp" to notify with name "Error" title text4Log description text4Log application name "PomodoroGlue" priority 1    � � � �2 t e l l   a p p l i c a t i o n   i d   " c o m . G r o w l . G r o w l H e l p e r A p p "   t o   n o t i f y   w i t h   n a m e   " E r r o r "   t i t l e   t e x t 4 L o g   d e s c r i p t i o n   t e x t 4 L o g   a p p l i c a t i o n   n a m e   " P o m o d o r o G l u e "   p r i o r i t y   1 �  ��� � I   �� � �
�� .sysodisAaleR        TEXT � m     � � � � � " P r o m p t F o r P o m o d o r o � �� � �
�� 
mesS � o    ���� 0 text4log text4Log � �� ���
�� 
givu � m    ���� ��  ��   �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 0 tracknumber   � m    ����  �  � � � l     ��������  ��  ��   �  � � � i     � � � I     �� ���
�� .aevtoappnull  �   � **** � o      ���� 0 argv  ��   � k    � � �  � � � I     � ��~� 0 writelog WriteLog �  ��} � m     � � � � � @ S t a r t i n g   P r o m p t _ f o r _ P o m o d o r o 2 . . .�}  �~   �  � � � l   �|�{�z�|  �{  �z   �  � � � l   �y � ��y   � 4 . #############################################    � � � � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # �  � � � r    
 � � � m     � � � � �  H i d e   a l l   a p p s � o      �x�x 0 thisroutine   �  � � � Q    6 � � � � k     � �  � � � l   �w � ��w   �  my minimizeAll()    � � � �   m y   m i n i m i z e A l l ( ) �  � � � n    � � � I    �v�u�t�v 0 hideall hideAll�u  �t   �  f     �  ��s � I    �r ��q�r 0 writelog WriteLog �  ��p � b     � � � m     � � � � �  S u c c e s s :   � o    �o�o 0 thisroutine  �p  �q  �s   � R      �n � �
�n .ascrerr ****      � **** � o      �m�m 0 errstr errStr � �l ��k
�l 
errn � o      �j�j 0 errornumber errorNumber�k   � I   $ 6�i ��h�i 0 
writeerror 
WriteError �  ��g � b   % 2 � � � b   % 0 � � � b   % . � � � b   % , � � � b   % *   b   % ( m   % & �  E r r o r :   o   & '�f�f 0 thisroutine   m   ( ) �    � o   * +�e�e 0 errstr errStr � m   , - �		    ( � o   . /�d�d 0 errornumber errorNumber � m   0 1

 �  )�g  �h   �  l  7 7�c�c   4 . #############################################    � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  l  7 7�b�a�`�b  �a  �`    I  7 <�_�^�]
�_ .miscactvnull��� ��� obj �^  �]    I  = L�\
�\ .sysodisAaleR        TEXT m   = > � " P r o m p t F o r P o m o d o r o �[
�[ 
mesS m   ? B � H P r o m p t i n g   f o r   P o m o d o r o . . .   h o l d   o n . . . �Z�Y
�Z 
givu m   E F�X�X �Y    !  l  M M�W�V�U�W  �V  �U  ! "#" l  M M�T$%�T  $ 4 . #############################################   % �&& \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ## '(' r   M R)*) m   M P++ �,,  C h e c k   f o r   I D L E* o      �S�S 0 thisroutine  ( -.- Q   S /01/ k   V l22 343 l  V a5675 r   V a898 I  V ]�R:�Q
�R .sysoexecTEXT���     TEXT: m   V Y;; �<< L g r e p   - q   " I D L E "   / t m p / r o u t i n e t r a c k e r . l o g�Q  9 o      �P�P 0 myresult  6 : 4 should cancel the script if IDLE is not in the file   7 �== h   s h o u l d   c a n c e l   t h e   s c r i p t   i f   I D L E   i s   n o t   i n   t h e   f i l e4 >�O> I   b l�N?�M�N 0 writelog WriteLog? @�L@ b   c hABA m   c fCC �DD  S u c c e s s :  B o   f g�K�K 0 thisroutine  �L  �M  �O  0 R      �JEF
�J .ascrerr ****      � ****E o      �I�I 0 errstr errStrF �HG�G
�H 
errnG o      �F�F 0 errornumber errorNumber�G  1 k   t HH IJI I   t |�EK�D�E 0 
writeerror 
WriteErrorK L�CL m   u xMM �NN l E r r o r :   N o t   I D L E .   W a i t   f o r   t h e   t a s k   o r   b r e a k   t o   f i n i s h !�C  �D  J O�BO L   } �A�A  �B  . PQP l  � ��@�?�>�@  �?  �>  Q RSR l   � ��=TU�=  T	-- #############################################	set thisroutine to "Turn Noisy Off"	try		tell application "Noisy" to set the noise type to none		WriteLog("Success: " & thisroutine)	on error errStr number errorNumber		WriteError("Error: " & thisroutine)		return	end try   U �VV. 	 - -   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  	 s e t   t h i s r o u t i n e   t o   " T u r n   N o i s y   O f f "  	 t r y  	 	 t e l l   a p p l i c a t i o n   " N o i s y "   t o   s e t   t h e   n o i s e   t y p e   t o   n o n e  	 	 W r i t e L o g ( " S u c c e s s :   "   &   t h i s r o u t i n e )  	 o n   e r r o r   e r r S t r   n u m b e r   e r r o r N u m b e r  	 	 W r i t e E r r o r ( " E r r o r :   "   &   t h i s r o u t i n e )  	 	 r e t u r n  	 e n d   t r y S WXW l  � ��<�;�:�<  �;  �:  X YZY l  � ��9�8�7�9  �8  �7  Z [\[ l   � ��6]^�6  ] � �
	tell application id "com.Growl.GrowlHelperApp"
		register as application "PomodoroGlue" all notifications {"Info", "Error"} default notifications {"Info", "Error"} icon of application "Pomodoro.app"
	end tell
   ^ �__� 
 	 t e l l   a p p l i c a t i o n   i d   " c o m . G r o w l . G r o w l H e l p e r A p p " 
 	 	 r e g i s t e r   a s   a p p l i c a t i o n   " P o m o d o r o G l u e "   a l l   n o t i f i c a t i o n s   { " I n f o " ,   " E r r o r " }   d e f a u l t   n o t i f i c a t i o n s   { " I n f o " ,   " E r r o r " }   i c o n   o f   a p p l i c a t i o n   " P o m o d o r o . a p p " 
 	 e n d   t e l l 
\ `a` l  � ��5bc�5  b 4 . #############################################   c �dd \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #a efe r   � �ghg m   � �ii �jj * I n c r e a s e   s o u n d   v o l u m eh o      �4�4 0 thisroutine  f klk r   � �mnm I  � ��3�2�1
�3 .misccurdldt    ��� null�2  �1  n o      �0�0 0 mytimestamp  l opo l  � ��/�.�-�/  �.  �-  p qrq Q   � �stus k   � �vv wxw Z   � �yz�,�+y =  � �{|{ l  � �}�*�)} e   � �~~ l  � ��(�' n   � ���� 1   � ��&
�& 
mute� l  � ���%�$� I  � ��#�"�!
�# .sysogtvlvlst   ��� null�"  �!  �%  �$  �(  �'  �*  �)  | m   � �� 
�  boovfalsz l  � ����� I  � ����
� .aevtstvlnull��� ��� nmbr�  � ���
� 
ouvl� l  � ����� [   � ���� l  � ����� n   � ���� 1   � ��
� 
ouvl� l  � ����� I  � ����
� .sysogtvlvlst   ��� null�  �  �  �  �  �  � m   � ��� �  �  �  � 7 1 should not choke on setting it above 100, tested   � ��� b   s h o u l d   n o t   c h o k e   o n   s e t t i n g   i t   a b o v e   1 0 0 ,   t e s t e d�,  �+  x ��� I   � ����� 0 writelog WriteLog� ��� b   � ���� m   � ��� ���  S u c c e s s :  � o   � ��� 0 thisroutine  �  �  �  t R      ���
� .ascrerr ****      � ****� o      �
�
 0 errstr errStr� �	��
�	 
errn� o      �� 0 errornumber errorNumber�  u I   � ����� 0 
writeerror 
WriteError� ��� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  E r r o r :  � o   � ��� 0 thisroutine  � m   � ��� ���   � o   � ��� 0 errstr errStr� m   � ��� ���    (� o   � ��� 0 errornumber errorNumber� m   � ��� ���  )�  �  r ��� l  � �� �����   ��  ��  � ��� l  � �������  � 4 . #############################################   � ��� \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #� ��� r   � ���� m   � ��� ��� R P l a y   a   r a n d o m   t r a c k   a n d   m a r k   i t   a s   p l a y e d� o      ���� 0 thisroutine  � ��� Q   ������ k   ���� ��� l  ����� r   ���� l  � ������� [   � ���� l  � ������� c   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � o   � ����� 0 argv  � m   � ���
�� 
nmbr��  ��  � m   � ����� ��  ��  � o      ���� 0 tracknumber  �    catch argument being zero   � ��� 4   c a t c h   a r g u m e n t   b e i n g   z e r o� ��� l ������  � * $tell application "Adium" to activate   � ��� H t e l l   a p p l i c a t i o n   " A d i u m "   t o   a c t i v a t e� ��� t  ���� O  ���� k  ��� ��� Q  S���� r  2��� n  .��� 4  %.���
�� 
cTrk� o  (-���� 0 tracknumber  � l %������ 6 %��� l ������ 4 ���
�� 
cPly� m  ���� ��  ��  � = $��� 1  ��
�� 
pnam� m  #�� ���  J a p a n e s e P o d 1 0 1��  ��  � o      ���� 0 	sometrack 	someTrack� R      ������
�� .ascrerr ****      � ****��  ��  � k  :S�� ��� l ::������  � + % pick the Studio Brussel audio stream   � ��� J   p i c k   t h e   S t u d i o   B r u s s e l   a u d i o   s t r e a m� ���� r  :S��� l :O������ 6 :O��� l :@������ 4 :@�� 
�� 
cTrk  m  >?���� ��  ��  � E  CN 1  DH��
�� 
pnam l IM���� m  IM � 4 S t u d i o   B r u s s e l   |   k w a l i t e i t��  ��  ��  ��  � o      ���� 0 	sometrack 	someTrack��  � �� P  T��� Q  [�	
	 k  ^}  r  ^i o  ^a���� 0 mytimestamp   n       1  dh��
�� 
pPlD o  ad���� 0 	sometrack 	someTrack  r  ju o  jm���� 0 mytimestamp   n       1  pt��
�� 
pSkD o  mp���� 0 	sometrack 	someTrack �� I v}����
�� .hookPlaynull    ��� obj  o  vy���� 0 	sometrack 	someTrack��  ��  
 R      ������
�� .ascrerr ****      � ****��  ��   I ������
�� .sysottosnull���     TEXT m  �� �  b a d   i T u n e s��  ��   ����
�� consrmte��  ��  � m  
�                                                                                  hook  alis    >  Ibis500                    �m>YH+   J΁
iTunes.app                                                      =#G���        ����  	                Applications    �m��      ��r     J΁   Ibis500:Applications: iTunes.app   
 i T u n e s . a p p    I b i s 5 0 0  Applications/iTunes.app   / ��  � m  ���� � �� I  ���� ���� 0 writelog WriteLog  !��! b  ��"#" m  ��$$ �%%  S u c c e s s :  # o  ������ 0 thisroutine  ��  ��  ��  � R      ��&'
�� .ascrerr ****      � ****& o      ���� 0 errstr errStr' ��(��
�� 
errn( o      ���� 0 errornumber errorNumber��  � I  ����)���� 0 
writeerror 
WriteError) *��* b  ��+,+ b  ��-.- b  ��/0/ b  ��121 b  ��343 b  ��565 m  ��77 �88  E r r o r :  6 o  ������ 0 thisroutine  4 m  ��99 �::   2 o  ������ 0 errstr errStr0 m  ��;; �<<    (. o  ������ 0 errornumber errorNumber, m  ��== �>>  )��  ��  � ?@? l ����������  ��  ��  @ ABA l ����������  ��  ��  B CDC l ����EF��  E 4 . #############################################   F �GG \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #D HIH r  ��JKJ m  ��LL �MM  R e a d   t h e   t a s k sK o      ���� 0 thisroutine  I NON Q  �PQRP k  ��SS TUT O  ��VWV k  ��XX YZY r  ��[\[ I ����]��
�� .sysoexecTEXT���     TEXT] m  ��^^ �__ ` / b i n / c a t   - s   / U s e r s / r s / D r o p b o x / E l e m e n t s / T o d y n . t x t��  \ o      ���� 0 mytasks  Z `a` l ����������  ��  ��  a b��b l  ����cd��  c N H
			set mytoptask to the first paragraph of mytasks			say mytoptask
			   d �ee � 
 	 	 	 s e t   m y t o p t a s k   t o   t h e   f i r s t   p a r a g r a p h   o f   m y t a s k s  	 	 	 s a y   m y t o p t a s k 
 	 	 	��  W m  ��ff�                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��  U g��g I  ����h���� 0 writelog WriteLogh i��i b  ��jkj m  ��ll �mm  S u c c e s s :  k o  ������ 0 thisroutine  ��  ��  ��  Q R      ��no
�� .ascrerr ****      � ****n o      ���� 0 errstr errStro ��p��
�� 
errnp o      ���� 0 errornumber errorNumber��  R I  ���q���� 0 
writeerror 
WriteErrorq r��r b  �sts b  ��uvu b  ��wxw b  ��yzy b  ��{|{ b  ��}~} m  �� ���  E r r o r :  ~ o  ������ 0 thisroutine  | m  ���� ���   z o  ������ 0 errstr errStrx m  ���� ���    (v o  ������ 0 errornumber errorNumbert m  ��� ���  )��  ��  O ��� l ��������  ��  ��  � ��� l ��������  ��  ��  � ��� l ������  � 4 . #############################################   � ��� \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #� ��� r  ��� m  �� ��� & P r o m p t   f o r   P o m o d o r o� o      ���� 0 thisroutine  � ��� Q  ����� k  ��� ��� l ������  � 4 . should not do this one, only causes confusion   � ��� \   s h o u l d   n o t   d o   t h i s   o n e ,   o n l y   c a u s e s   c o n f u s i o n� ��� l ������  � m gtell application "Terminal" to do shell script "cd /Users/rs/rt ; /Users/rs/rt/auto_update_todyn.sh & "   � ��� � t e l l   a p p l i c a t i o n   " T e r m i n a l "   t o   d o   s h e l l   s c r i p t   " c d   / U s e r s / r s / r t   ;   / U s e r s / r s / r t / a u t o _ u p d a t e _ t o d y n . s h   &   "� ��� l ��������  ��  ��  � ��� O  }��� k  |�� ��� r   ��� I ������
�� .misccurdldt    ��� null��  ��  � o      ���� 0 newtimestamp  � ��� r  !,��� \  !(��� o  !$���� 0 newtimestamp  � o  $'���� 0 mytimestamp  � o      ���� 
0 mydiff  � ��� r  -8��� l -4���~� I -4�}��|
�} .sysoexecTEXT���     TEXT� m  -0�� ��� | p s   - o c o m m a n d =   - p   $ P P I D   |   a w k   - F /   ' { p r i n t   $ N F } '   |   a w k   ' { p r i n t } '�|  �  �~  � o      �{�{ 0 parent_process  � ��� n 9?��� o  :>�z�z 0 minimizeall minimizeAll�  f  9:� ��� I @E�y�x�w
�y .miscactvnull��� ��� obj �x  �w  � ��v� I F|�u��
�u .sysodlogaskr        TEXT� m  FI�� ��� . S p e n d   n e x t   P o m o d o r o   o n ?� �t��
�t 
appr� b  L[��� b  LW��� b  LS��� o  LO�s�s 0 parent_process  � m  OR�� ���    (� o  SV�r�r 
0 mydiff  � m  WZ�� ���    s e c   d e l a y )� �q��
�q 
btns� J  ^f�� ��� m  ^a�� ���  C a n c e l� ��p� m  ad�� ��� 
 S t a r t�p  � �o��
�o 
dtxt� o  il�n�n 0 mytasks  � �m��
�m 
dflt� m  op�l�l � �k��j
�k 
givu� m  sv�i�i ;�j  �v  � m  ���                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��  � ��� Z  ~����h�g� = ~���� l ~���f�e� n  ~���� 1  ���d
�d 
bhit� l ~���c�b� 1  ~��a
�a 
rslt�c  �b  �f  �e  � m  ���� ��� 
 S t a r t� k  ���� ��� r  ����� l ����`�_� n  ����� 4 ���^�
�^ 
cpar� m  ���]�] � n  ����� 1  ���\
�\ 
ttxt� l ����[�Z� 1  ���Y
�Y 
rslt�[  �Z  �`  �_  � o      �X�X 0 
myfulltask  � ��� r  ��   n �� 1  ���W
�W 
txdl 1  ���V
�V 
ascr o      �U�U 0 ods  �  r  �� m  �� �		  ` n     

 1  ���T
�T 
txdl 1  ���S
�S 
ascr  r  �� l ���R�Q n  �� 4 ���P
�P 
citm m  ���O�O  o  ���N�N 0 
myfulltask  �R  �Q   o      �M�M 
0 mytask    Q  �� r  �� c  �� l ���L�K n  �� 4 ���J 
�J 
citm  m  ���I�I  o  ���H�H 0 
myfulltask  �L  �K   m  ���G
�G 
nmbr o      �F�F 0 
myduration   R      �E�D�C
�E .ascrerr ****      � ****�D  �C   r  ��!"! m  ���B�B " o      �A�A 0 
myduration   #$# r  ��%&% o  ���@�@ 0 ods  & n     '(' 1  ���?
�? 
txdl( 1  ���>
�> 
ascr$ )*) Q  �+,-+ r  �./. I ��=01
�= .sysoexecTEXT���     TEXT0 m  ��22 �33 2 c a t   / t m p / p o m o d o r o d o n e . l o g1 �<4�;
�< 
rtyp4 m  ���:
�: 
TEXT�;  / o      �9�9 0 breakminutes  , R      �8�7�6
�8 .ascrerr ****      � ****�7  �6  - r  565 m  77 �88  56 o      �5�5 0 breakminutes  * 9:9 l �4;<�4  ; I Cset breakminutes to 5 --set breakminutes to breakminutes as integer   < �== � s e t   b r e a k m i n u t e s   t o   5   - - s e t   b r e a k m i n u t e s   t o   b r e a k m i n u t e s   a s   i n t e g e r: >?> Z *@A�3�2@ A  BCB o  �1�1 0 breakminutes  C m  �0�0 A r  &DED m  "�/�/ E o      �.�. 0 breakminutes  �3  �2  ? FGF Z +@HI�-�,H ?  +2JKJ o  +.�+�+ 0 breakminutes  K m  .1�*�* I r  5<LML m  58�)�) M o      �(�( 0 breakminutes  �-  �,  G NON Z AVPQ�'�&P A  AHRSR o  AD�%�% 0 
myduration  S m  DG�$�$ Q r  KRTUT o  KN�#�# 0 
myduration  U o      �"�" 0 breakminutes  �'  �&  O VWV O  WsXYX I ]r�!Z[
�! .POMOStrtnull���     ctxtZ o  ]`� �  
0 mytask  [ �\]
� 
PMdr\ o  cf�� 0 
myduration  ] �^�
� 
PMbk^ o  il�� 0 breakminutes  �  Y m  WZ__�                                                                                      @ alis    F  Ibis500                    �m>YH+   J΁Pomodoro.app                                                    C@���+�        ����  	                Applications    �m��      ��	     J΁  "Ibis500:Applications: Pomodoro.app    P o m o d o r o . a p p    I b i s 5 0 0  Applications/Pomodoro.app   / ��  W `a` l  tt�bc�  b � �
			if PomodoroName contains "+rout" then
				tell application "Beeminder" to open location "https://www.beeminder.com/cyberroland/goals/effrout"
			end if
			   c �dd> 
 	 	 	 i f   P o m o d o r o N a m e   c o n t a i n s   " + r o u t "   t h e n 
 	 	 	 	 t e l l   a p p l i c a t i o n   " B e e m i n d e r "   t o   o p e n   l o c a t i o n   " h t t p s : / / w w w . b e e m i n d e r . c o m / c y b e r r o l a n d / g o a l s / e f f r o u t " 
 	 	 	 e n d   i f 
 	 	 	a e�e O t�fgf I z���
� .hookStopnull        null�  �  g m  twhh�                                                                                  hook  alis    >  Ibis500                    �m>YH+   J΁
iTunes.app                                                      =#G���        ����  	                Applications    �m��      ��r     J΁   Ibis500:Applications: iTunes.app   
 i T u n e s . a p p    I b i s 5 0 0  Applications/iTunes.app   / ��  �  �h  �g  � i�i I  ���j�� 0 writelog WriteLogj k�k b  ��lml m  ��nn �oo  S u c c e s s :  m o  ���� 0 thisroutine  �  �  �  � R      �pq
� .ascrerr ****      � ****p o      �� 0 errstr errStrq �r�
� 
errnr o      �� 0 errornumber errorNumber�  � I  ���s�
� 0 
writeerror 
WriteErrors t�	t b  ��uvu b  ��wxw b  ��yzy b  ��{|{ b  ��}~} b  ��� m  ���� ���  E r r o r :  � o  ���� 0 thisroutine  ~ m  ���� ���   | o  ���� 0 errstr errStrz m  ���� ���    (x o  ���� 0 errornumber errorNumberv m  ���� ���  )�	  �
  � ��� l ������  �  �  �   � ��� l     � �����   ��  ��  �       ��������������������������������������  � �������������������������������������������������� 0 hideall hideAll�� 0 minimizeall minimizeAll�� 0 writelog WriteLog�� 0 
writeerror 
WriteError�� 0 tracknumber  
�� .aevtoappnull  �   � ****�� 0 thisroutine  �� 0 myresult  �� 0 mytimestamp  �� 0 	sometrack 	someTrack�� 0 mytasks  �� 0 newtimestamp  �� 
0 mydiff  �� 0 parent_process  �� 0 
myfulltask  �� 0 ods  �� 
0 mytask  �� 0 
myduration  �� 0 breakminutes  ��  ��  ��  ��  ��  � �� 
���������� 0 hideall hideAll��  ��  �  �   �������������
�� .miscactvnull��� ��� obj 
�� 
prcs
�� 
pvis�  
�� 
pisf
�� 
cwin
�� .coreclosnull���    obj �� .� **j Of*�-�,�[[�,\Ze8\[�,\Zf8A1FO*�-j U� �� &���������� 0 minimizeall minimizeAll��  ��  � ���������� 0 
thebuttons 
theButtons��  0 theapplication theApplication�� 0 	thewindow 	theWindow�� 0 	thebutton 	theButton�  o���������� >������ L��
�� 
pcap
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pnam
�� 
cwin
�� 
butT
�� 
desc
�� .prcsclicnull��� ��� uiel�� �� �jvE�O c*�-[��l kh ��,� F @��-[��l kh  )��-[��l kh ��,�  ��kv%E�Y h[OY��[OY��Y h[OY��O �[��l kh �j [OY��O �[��l kh �j [OY��OPUOP� �� v���������� 0 writelog WriteLog�� ����� �  ���� 0 text4log text4Log��  � ���� 0 text4log text4Log�  ��� � ����� ���
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
appr
�� .sysonotfnull��� ��� TEXT�� ��,%�%�%j O���l � �� ����������� 0 
writeerror 
WriteError�� ����� �  ���� 0 text4log text4Log��  � ���� 0 text4log text4Log� 
 ��� � ��� ���������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
mesS
�� 
givu�� 
�� .sysodisAaleR        TEXT�� ��,%�%�%j O���k� 	�� � �� ���������
�� .aevtoappnull  �   � ****�� 0 argv  ��  � �������� 0 argv  �� 0 errstr errStr�� 0 errornumber errorNumber� x ��� ����� ����
������������+;����CMi����������������������������������������������$79;=Lf^��l�����������~��}���|���{�z�y�x�w�v�u��t�s�r�q�p�o�n�m�l�k2�j�i�h7�g_�f�e�d�cn������ 0 writelog WriteLog�� 0 thisroutine  �� 0 hideall hideAll�� 0 errstr errStr� �b�a�`
�b 
errn�a 0 errornumber errorNumber�`  �� 0 
writeerror 
WriteError
�� .miscactvnull��� ��� obj 
�� 
mesS
�� 
givu�� 
�� .sysodisAaleR        TEXT
�� .sysoexecTEXT���     TEXT�� 0 myresult  
�� .misccurdldt    ��� null�� 0 mytimestamp  
�� .sysogtvlvlst   ��� null
�� 
mute
�� 
ouvl
�� .aevtstvlnull��� ��� nmbr
�� 
cobj
�� 
nmbr�� 
�� 
cPly
�� 
pnam
�� 
cTrk�� 0 	sometrack 	someTrack��  ��  
�� 
pPlD
�� 
pSkD
�� .hookPlaynull    ��� obj 
�� .sysottosnull���     TEXT�� 0 mytasks  �� 0 newtimestamp  �� 
0 mydiff  � 0 parent_process  �~ 0 minimizeall minimizeAll
�} 
appr
�| 
btns
�{ 
dtxt
�z 
dflt�y ;�x 

�w .sysodlogaskr        TEXT
�v 
rslt
�u 
bhit
�t 
ttxt
�s 
cpar�r 0 
myfulltask  
�q 
ascr
�p 
txdl�o 0 ods  
�n 
citm�m 
0 mytask  �l 0 
myduration  �k 
�j 
rtyp
�i 
TEXT�h 0 breakminutes  �g 
�f 
PMdr
�e 
PMbk
�d .POMOStrtnull���     ctxt
�c .hookStopnull        null���*�k+ O�E�O )j+ O*��%k+ W X  *��%�%�%�%�%�%k+ O*j O��a a ka  Oa E�O a j E` O*a �%k+ W X  *a k+ OhOa E�O*j E` O 6*j a ,Ef  *a *j a ,kl  Y hO*a !�%k+ W !X  *a "�%a #%�%a $%�%a %%k+ Oa &E�O ��a 'k/a (&kEc  Oa )na * � '*a +k/a ,[a -,\Za .81a /b  /E` 0W  X 1 2*a /k/a ,[a -,\Za 3@1E` 0Oga 4 4 $_ _ 0a 5,FO_ _ 0a 6,FO_ 0j 7W X 1 2a 8j 9VUoO*a :�%k+ W !X  *a ;�%a <%�%a =%�%a >%k+ Oa ?E�O $a @ a Aj E` BOPUO*a C�%k+ W !X  *a D�%a E%�%a F%�%a G%k+ Oa HE�O�a @ g*j E` IO_ I_ E` JOa Kj E` LO)a M,EO*j Oa Na O_ La P%_ J%a Q%a Ra Sa Tlva U_ Ba Vka a Wa X YUO_ Za [,a \  �_ Za ],a ^k/E` _O_ `a a,E` bOa c_ `a a,FO_ _a dk/E` eO _ _a dl/a (&E` fW X 1 2a gE` fO_ b_ `a a,FO a ha ia jl E` kW X 1 2a lE` kO_ ka ) a )E` kY hO_ ka m a mE` kY hO_ fa ) _ fE` kY hOa n _ ea o_ fa p_ ka  qUOa * *j rUY hO*a s�%k+ W !X  *a t�%a u%�%a v%�%a w%k+ OP� ���  � ldt     ���� �� ��_�^�]� ��\�[�Z� �Y�X�W
�Y 
cSrc�X E
�W kfrmID  
�\ 
cUsP�[  �{
�Z kfrmID  
�_ 
cFlT�^  �
�] kfrmID  � ���� T O D Y N   D o c u m e n t   w e e k ' s   w o r t h   o f   i s s u e s   # 8 6 8 7 1 0 8 4 > > F i l l   i n   J I R A s   h e r e     + 1� e r < r d v  S e n d   e x e c   r e p o r t   t o   J a r v i s   # 8 6 8 7 1 1 0 4   + 1� e r < r d v  G e t   Q u e l l e n s t e u e r   p r o c e s s   s t a r t e d   # 8 2 8 7 0 6 6 8   + ? " h s w > f i n   1 4 h 0 0   W a n i k a n i #� ,   c l e a n   P i v o t a l   a n d   e m a i l   + r o u t   ` 2 0  1 6 h 3 0   C l o t h e s   t o - f r o m   l a u n d r y  1 8 h 0 0   D i n n e r   + r o u t   ` 3 0   r p e c k o :   Q I - 7 6 4   P r o j e c t   M a n a g e m e n t   W o r k f l o w   R e q u e s t s   0 1 - 2 9 T 1 0 : 4 6  r o l a n d :   Q I - 9 0 0   D e v e l o p   g e n e r a l   o u t a g e   p r o c e s s   w i t h   M a n u   0 1 - 2 6 T 1 3 : 4 1  r o l a n d :   Q I - 5 9 5   R e p l i c a t e   A p o l l o   a l e r t s   f u n c t i o n a l i t y   i n   F U E L   f o r   i n t e r n a l   u s e r s   0 1 - 2 3 T 1 1 : 1 0   W a n i k a n i   r e v i e w s :   4 1 8   + r o u t   W a n i k a n i   p r o g r e s s :   8 . 7 8 1 2 5     |  QeX4   |  ��   < 6 0 %     + r o u t   R E D   U S D 0 1 0   p 1   G r e e n   t e a   m a t c h a   + b e e m   + 1 . 2 9   i n   0   d a y s   ` 2  R E D   U S D 0 0 5   D a y S c o r e   d a y s c o r e   + b e e m   + 1 . 6 7   i n   0   d a y s   ` 2  O R A N G E   U S D 0 0 5   p 3   K a n j i   k a n j i   + b e e m   + 0 . 0 3   i n   1   d a y   ( 8 . 8 1 )   ` 2  M i s e - e n - p l a c e   + r o u t   ` 9  D e t e r m i n e   p r i o r i t i e s   f o r   t h e   w e e k   + r o u t  T r i m   a n d   s h a v e   + r o u t  F i l l   u p   v i t a m i n s   + 8 h c r   -   @ R o l a n d   t o   f o l l o w   u p   w i t h   D a n   G r i g g s   a b o u t   j o b s   a t   S i t e c o r e   ( 2 0 1 5 - 0 1 - 2 4 )   2 0 1 5 - 0 1 - 3 1   1 4 : 3 9 : 2 7   c h a s e i d l e . r b� ldt     �����  � ��� 8 p r o m p t _ f o r _ p o m o d o r o _ 2 . s c p t   0� ��� l R E D   U S D 0 0 5   D a y S c o r e   d a y s c o r e   + b e e m   + 1 . 6 7   i n   0   d a y s   ` 2 5� �V��V �  �� ���  � ��� f R E D   U S D 0 0 5   D a y S c o r e   d a y s c o r e   + b e e m   + 1 . 6 7   i n   0   d a y s  �� �� ��  ��  ��  ��  ��  ascr  ��ޭ