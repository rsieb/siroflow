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
�� .aevtoappnull  �   � **** � o      ���� 0 argv  ��   � k    � � �  � � � I     � ��~� 0 writelog WriteLog �  ��} � m     � � � � � @ S t a r t i n g   P r o m p t _ f o r _ P o m o d o r o 2 . . .�}  �~   �  � � � l   �|�{�z�|  �{  �z   �  � � � l   �y � ��y   � 4 . #############################################    � � � � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # �  � � � r    
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
WriteErrorK L�CL m   u xMM �NN f E r r o r :   N o t   I D L E .   F i r s t   s t o p   P o m o d o r o   o r   s e t   I D L E . . .�C  �D  J O�BO L   } �A�A  �B  . PQP l  � ��@�?�>�@  �?  �>  Q RSR l   � ��=TU�=  T	-- #############################################	set thisroutine to "Turn Noisy Off"	try		tell application "Noisy" to set the noise type to none		WriteLog("Success: " & thisroutine)	on error errStr number errorNumber		WriteError("Error: " & thisroutine)		return	end try   U �VV. 	 - -   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  	 s e t   t h i s r o u t i n e   t o   " T u r n   N o i s y   O f f "  	 t r y  	 	 t e l l   a p p l i c a t i o n   " N o i s y "   t o   s e t   t h e   n o i s e   t y p e   t o   n o n e  	 	 W r i t e L o g ( " S u c c e s s :   "   &   t h i s r o u t i n e )  	 o n   e r r o r   e r r S t r   n u m b e r   e r r o r N u m b e r  	 	 W r i t e E r r o r ( " E r r o r :   "   &   t h i s r o u t i n e )  	 	 r e t u r n  	 e n d   t r y S WXW l  � ��<�;�:�<  �;  �:  X YZY l  � ��9�8�7�9  �8  �7  Z [\[ l   � ��6]^�6  ] � �
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
WriteError� ��� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  E r r o r :  � o   � ��� 0 thisroutine  � m   � ��� ���   � o   � ��� 0 errstr errStr� m   � ��� ���    (� o   � ��� 0 errornumber errorNumber� m   � ��� ���  )�  �  r ��� l  � �� �����   ��  ��  � ��� l   � �������  ���	-- #############################################	set thisroutine to "Play a random track and mark it as played"	try		set tracknumber to ((item 1 of argv as number) + 1) -- catch argument being zero		--tell application "Adium" to activate		with timeout of 5 seconds			tell application "iTunes"				try					set someTrack to track tracknumber of (the first playlist whose name is "JapanesePod101")				on error					-- pick the Studio Brussel audio stream					set someTrack to (the first track whose name contains ("Studio Brussel | kwaliteit"))				end try				ignoring application responses					try						set played date of someTrack to mytimestamp						set skipped date of someTrack to mytimestamp						play someTrack					on error						say "bad iTunes"					end try				end ignoring			end tell		end timeout		WriteLog("Success: " & thisroutine)	on error errStr number errorNumber		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")	end try	   � ���� 	 - -   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  	 s e t   t h i s r o u t i n e   t o   " P l a y   a   r a n d o m   t r a c k   a n d   m a r k   i t   a s   p l a y e d "  	 t r y  	 	 s e t   t r a c k n u m b e r   t o   ( ( i t e m   1   o f   a r g v   a s   n u m b e r )   +   1 )   - -   c a t c h   a r g u m e n t   b e i n g   z e r o  	 	 - - t e l l   a p p l i c a t i o n   " A d i u m "   t o   a c t i v a t e  	 	 w i t h   t i m e o u t   o f   5   s e c o n d s  	 	 	 t e l l   a p p l i c a t i o n   " i T u n e s "  	 	 	 	 t r y  	 	 	 	 	 s e t   s o m e T r a c k   t o   t r a c k   t r a c k n u m b e r   o f   ( t h e   f i r s t   p l a y l i s t   w h o s e   n a m e   i s   " J a p a n e s e P o d 1 0 1 " )  	 	 	 	 o n   e r r o r  	 	 	 	 	 - -   p i c k   t h e   S t u d i o   B r u s s e l   a u d i o   s t r e a m  	 	 	 	 	 s e t   s o m e T r a c k   t o   ( t h e   f i r s t   t r a c k   w h o s e   n a m e   c o n t a i n s   ( " S t u d i o   B r u s s e l   |   k w a l i t e i t " ) )  	 	 	 	 e n d   t r y  	 	 	 	 i g n o r i n g   a p p l i c a t i o n   r e s p o n s e s  	 	 	 	 	 t r y  	 	 	 	 	 	 s e t   p l a y e d   d a t e   o f   s o m e T r a c k   t o   m y t i m e s t a m p  	 	 	 	 	 	 s e t   s k i p p e d   d a t e   o f   s o m e T r a c k   t o   m y t i m e s t a m p  	 	 	 	 	 	 p l a y   s o m e T r a c k  	 	 	 	 	 o n   e r r o r  	 	 	 	 	 	 s a y   " b a d   i T u n e s "  	 	 	 	 	 e n d   t r y  	 	 	 	 e n d   i g n o r i n g  	 	 	 e n d   t e l l  	 	 e n d   t i m e o u t  	 	 W r i t e L o g ( " S u c c e s s :   "   &   t h i s r o u t i n e )  	 o n   e r r o r   e r r S t r   n u m b e r   e r r o r N u m b e r  	 	 W r i t e E r r o r ( " E r r o r :   "   &   t h i s r o u t i n e   &   "   "   &   e r r S t r   &   "   ( "   &   e r r o r N u m b e r   &   " ) " )  	 e n d   t r y  	� ��� l  � ���������  ��  ��  � ��� l  � �������  � 4 . #############################################   � ��� \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #� ��� r   � ���� m   � ��� ���  R e a d   t h e   t a s k s� o      ���� 0 thisroutine  � ��� Q   �1���� k   ��� ��� O   ���� k   ��� ��� r   ���� I  � ������
�� .sysoexecTEXT���     TEXT� m   � ��� ��� ` / b i n / c a t   - s   / U s e r s / r s / D r o p b o x / E l e m e n t s / T o d y n . t x t��  � o      ���� 0 mytasks  � ��� l ��������  ��  ��  � ���� l  ������  � N H
			set mytoptask to the first paragraph of mytasks			say mytoptask
			   � ��� � 
 	 	 	 s e t   m y t o p t a s k   t o   t h e   f i r s t   p a r a g r a p h   o f   m y t a s k s  	 	 	 s a y   m y t o p t a s k 
 	 	 	��  � m   � ����                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��  � ���� I  ������� 0 writelog WriteLog� ���� b  ��� m  	�� ���  S u c c e s s :  � o  	
���� 0 thisroutine  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errstr errStr� �����
�� 
errn� o      ���� 0 errornumber errorNumber��  � I  1������� 0 
writeerror 
WriteError� ���� b  -��� b  )��� b  '��� b  #��� b  !��� b  ��� m  �� ���  E r r o r :  � o  ���� 0 thisroutine  � m   �� ���   � o  !"���� 0 errstr errStr� m  #&�� ���    (� o  '(���� 0 errornumber errorNumber� m  ),�� ���  )��  ��  � ��� l 22��������  ��  ��  � � � l 22��������  ��  ��     l 22����   4 . #############################################    � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  r  27	 m  25

 � & P r o m p t   f o r   P o m o d o r o	 o      ���� 0 thisroutine    Q  8� k  ;�  l ;;����   4 . should not do this one, only causes confusion    � \   s h o u l d   n o t   d o   t h i s   o n e ,   o n l y   c a u s e s   c o n f u s i o n  l ;;����   m gtell application "Terminal" to do shell script "cd /Users/rs/rt ; /Users/rs/rt/auto_update_todyn.sh & "    � � t e l l   a p p l i c a t i o n   " T e r m i n a l "   t o   d o   s h e l l   s c r i p t   " c d   / U s e r s / r s / r t   ;   / U s e r s / r s / r t / a u t o _ u p d a t e _ t o d y n . s h   &   "  l ;;��������  ��  ��    O  ;� !  k  A�"" #$# r  AJ%&% I AF������
�� .misccurdldt    ��� null��  ��  & o      ���� 0 newtimestamp  $ '(' r  KV)*) \  KR+,+ o  KN���� 0 newtimestamp  , o  NQ���� 0 mytimestamp  * o      ���� 
0 mydiff  ( -.- r  Wb/0/ l W^1����1 I W^��2��
�� .sysoexecTEXT���     TEXT2 m  WZ33 �44 | p s   - o c o m m a n d =   - p   $ P P I D   |   a w k   - F /   ' { p r i n t   $ N F } '   |   a w k   ' { p r i n t } '��  ��  ��  0 o      ���� 0 parent_process  . 565 n ci787 o  dh���� 0 minimizeall minimizeAll8  f  cd6 9:9 I jo������
�� .miscactvnull��� ��� obj ��  ��  : ;��; I p���<=
�� .sysodlogaskr        TEXT< m  ps>> �?? . S p e n d   n e x t   P o m o d o r o   o n ?= ��@A
�� 
appr@ b  v�BCB b  v�DED b  v}FGF o  vy���� 0 parent_process  G m  y|HH �II    (E o  }����� 
0 mydiff  C m  ��JJ �KK    s e c   d e l a y )A ��LM
�� 
btnsL J  ��NN OPO m  ��QQ �RR  C a n c e lP S��S m  ��TT �UU 
 S t a r t��  M ��VW
�� 
dtxtV o  ������ 0 mytasks  W ��XY
�� 
dfltX m  ������ Y ��Z��
�� 
givuZ m  ������ ;��  ��  ! m  ;>[[�                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��   \]\ Z  ��^_����^ = ��`a` l ��b����b n  ��cdc 1  ����
�� 
bhitd l ��e����e 1  ����
�� 
rslt��  ��  ��  ��  a m  ��ff �gg 
 S t a r t_ k  ��hh iji r  ��klk l ��m����m n  ��non 4 ����p
�� 
cparp m  ������ o n  ��qrq 1  ����
�� 
ttxtr l ��s����s 1  ����
�� 
rslt��  ��  ��  ��  l o      ���� 0 
myfulltask  j tut r  ��vwv n ��xyx 1  ����
�� 
txdly 1  ����
�� 
ascrw o      ���� 0 ods  u z{z r  ��|}| m  ��~~ �  `} n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr{ ��� r  ����� l �������� n  ����� 4 �����
�� 
citm� m  ������ � o  ������ 0 
myfulltask  ��  ��  � o      ���� 
0 mytask  � ��� Q  ����� r  ����� c  ����� l �������� n  ����� 4 �����
�� 
citm� m  ������ � o  ������ 0 
myfulltask  ��  ��  � m  ����
�� 
nmbr� o      ���� 0 
myduration  � R      ������
�� .ascrerr ****      � ****��  ��  � r  ��� m  
���� � o      ���� 0 
myduration  � ��� r  ��� o  ���� 0 ods  � n     ��� 1  ��
�� 
txdl� 1  ��
�� 
ascr� ��� Q  >���� r  /��� I +����
�� .sysoexecTEXT���     TEXT� m  !�� ��� 2 c a t   / t m p / p o m o d o r o d o n e . l o g� �����
�� 
rtyp� m  $'��
�� 
TEXT��  � o      ���� 0 breakminutes  � R      ������
�� .ascrerr ****      � ****��  ��  � r  7>��� m  7:�� ���  5� o      ���� 0 breakminutes  � ��� l ??������  � I Cset breakminutes to 5 --set breakminutes to breakminutes as integer   � ��� � s e t   b r e a k m i n u t e s   t o   5   - - s e t   b r e a k m i n u t e s   t o   b r e a k m i n u t e s   a s   i n t e g e r� ��� Z ?T����~� A  ?F��� o  ?B�}�} 0 breakminutes  � m  BE�|�| � r  IP��� m  IL�{�{ � o      �z�z 0 breakminutes  �  �~  � ��� Z Uj���y�x� ?  U\��� o  UX�w�w 0 breakminutes  � m  X[�v�v � r  _f��� m  _b�u�u � o      �t�t 0 breakminutes  �y  �x  � ��� Z k����s�r� A  kr��� o  kn�q�q 0 
myduration  � m  nq�p�p � r  u|��� o  ux�o�o 0 
myduration  � o      �n�n 0 breakminutes  �s  �r  � ��� O  ����� I ���m��
�m .POMOStrtnull���     ctxt� o  ���l�l 
0 mytask  � �k��
�k 
PMdr� o  ���j�j 0 
myduration  � �i��h
�i 
PMbk� o  ���g�g 0 breakminutes  �h  � m  �����                                                                                      @ alis    F  Ibis500                    �m>YH+   J΁Pomodoro.app                                                    C@���+�        ����  	                Applications    �m��      ��	     J΁  "Ibis500:Applications: Pomodoro.app    P o m o d o r o . a p p    I b i s 5 0 0  Applications/Pomodoro.app   / ��  � ��� Z  �����f�e� E  ����� o  ���d�d 0 pomodoroname PomodoroName� m  ���� ��� 
 + b e e m� O ����� I ���c��b
�c .GURLGURLnull��� ��� TEXT� m  ���� ��� X h t t p s : / / w w w . b e e m i n d e r . c o m / c y b e r r o l a n d / g o a l s /�b  � m  �����                                                                                  MACS  alis    f  Ibis500                    �m>YH+   J�'
Finder.app                                                      M%��B        ����  	                CoreServices    �m��      �B�     J�' J� J�  1Ibis500:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    I b i s 5 0 0  &System/Library/CoreServices/Finder.app  / ��  �f  �e  � ��a� O ����� I ���`�_�^
�` .hookStopnull��� ��� null�_  �^  � m  �����                                                                                  hook  alis    >  Ibis500                    �m>YH+   J΁
iTunes.app                                                      =#G���        ����  	                Applications    �m��      ��r     J΁   Ibis500:Applications: iTunes.app   
 i T u n e s . a p p    I b i s 5 0 0  Applications/iTunes.app   / ��  �a  ��  ��  ] ��]� I  ���\��[�\ 0 writelog WriteLog� ��Z� b  ����� m  ���� ���  S u c c e s s :  � o  ���Y�Y 0 thisroutine  �Z  �[  �]   R      �X��
�X .ascrerr ****      � ****� o      �W�W 0 errstr errStr� �V��U
�V 
errn� o      �T�T 0 errornumber errorNumber�U   I  ���S��R�S 0 
writeerror 
WriteError� ��Q� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ��   �  E r r o r :  � o  ���P�P 0 thisroutine  � m  �� �   � o  ���O�O 0 errstr errStr� m  �� �    (� o  ���N�N 0 errornumber errorNumber� m  �� �  )�Q  �R   �M l ���L�K�J�L  �K  �J  �M   � 	�I	 l     �H�G�F�H  �G  �F  �I       �E
�D�E  
 �C�B�A�@�?�>�C 0 hideall hideAll�B 0 minimizeall minimizeAll�A 0 writelog WriteLog�@ 0 
writeerror 
WriteError�? 0 tracknumber  
�> .aevtoappnull  �   � **** �= 
�<�;�:�= 0 hideall hideAll�<  �;       �9�8�7�6�5�4
�9 .miscactvnull��� ��� obj 
�8 
prcs
�7 
pvis  
�6 
pisf
�5 
cwin
�4 .coreclosnull���    obj �: .� **j Of*�-�,�[[�,\Ze8\[�,\Zf8A1FO*�-j U �3 &�2�1�0�3 0 minimizeall minimizeAll�2  �1   �/�.�-�,�/ 0 
thebuttons 
theButtons�.  0 theapplication theApplication�- 0 	thewindow 	theWindow�, 0 	thebutton 	theButton  o�+�*�)�(�' >�&�%�$ L�#
�+ 
pcap
�* 
kocl
�) 
cobj
�( .corecnte****       ****
�' 
pnam
�& 
cwin
�% 
butT
�$ 
desc
�# .prcsclicnull��� ��� uiel�0 �� �jvE�O c*�-[��l kh ��,� F @��-[��l kh  )��-[��l kh ��,�  ��kv%E�Y h[OY��[OY��Y h[OY��O �[��l kh �j [OY��O �[��l kh �j [OY��OPUOP �" v�!� ��" 0 writelog WriteLog�! ��   �� 0 text4log text4Log�    �� 0 text4log text4Log  �� � ��� ��
� 
strq
� .sysoexecTEXT���     TEXT
� 
appr
� .sysonotfnull��� ��� TEXT� ��,%�%�%j O���l  � ����� 0 
writeerror 
WriteError� ��   �� 0 text4log text4Log�   �� 0 text4log text4Log 
 �� � �� �����
� 
strq
� .sysoexecTEXT���     TEXT
� 
mesS
� 
givu� 
� .sysodisAaleR        TEXT� ��,%�%�%j O���k� 	�D  �
 ��	��
�
 .aevtoappnull  �   � ****�	 0 argv  �   ���� 0 argv  � 0 errstr errStr� 0 errornumber errorNumber i �� ��� �� 
������������+;����CMi���������������������������
����3����>��HJ��QT��������������f������������~�������������������������������������������� � 0 writelog WriteLog� 0 thisroutine  � 0 hideall hideAll�  0 errstr errStr ������
�� 
errn�� 0 errornumber errorNumber��  �� 0 
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
�� .aevtstvlnull��� ��� nmbr�� 0 mytasks  �� 0 newtimestamp  �� 
0 mydiff  �� 0 parent_process  �� 0 minimizeall minimizeAll
�� 
appr
�� 
btns
�� 
dtxt
�� 
dflt�� ;�� 

�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
ttxt
�� 
cpar�� 0 
myfulltask  
�� 
ascr
�� 
txdl�� 0 ods  
�� 
citm�� 
0 mytask  
�� 
nmbr�� 0 
myduration  ��  ��  �� 
�� 
rtyp
�� 
TEXT�� 0 breakminutes  �� �� 
�� 
PMdr
�� 
PMbk
�� .POMOStrtnull���     ctxt�� 0 pomodoroname PomodoroName
�� .GURLGURLnull��� ��� TEXT
�� .hookStopnull��� ��� null��*�k+ O�E�O )j+ O*��%k+ W X  *��%�%�%�%�%�%k+ O*j O��a a ka  Oa E�O a j E` O*a �%k+ W X  *a k+ OhOa E�O*j E` O 6*j a ,Ef  *a *j a ,kl  Y hO*a !�%k+ W !X  *a "�%a #%�%a $%�%a %%k+ Oa &E�O $a ' a (j E` )OPUO*a *�%k+ W !X  *a +�%a ,%�%a -%�%a .%k+ Oa /E�O�a ' g*j E` 0O_ 0_ E` 1Oa 2j E` 3O)a 4,EO*j Oa 5a 6_ 3a 7%_ 1%a 8%a 9a :a ;lva <_ )a =ka a >a ? @UO_ Aa B,a C _ Aa D,a Ek/E` FO_ Ga H,E` IOa J_ Ga H,FO_ Fa Kk/E` LO _ Fa Kl/a M&E` NW X O Pa QE` NO_ I_ Ga H,FO a Ra Sa Tl E` UW X O Pa VE` UO_ Ua W a WE` UY hO_ Ua X a XE` UY hO_ Na W _ NE` UY hOa Y _ La Z_ Na [_ Ua  \UO_ ]a ^ a _ 	a `j aUY hOa b *j cUY hO*a d�%k+ W !X  *a e�%a f%�%a g%�%a h%k+ OPascr  ��ޭ