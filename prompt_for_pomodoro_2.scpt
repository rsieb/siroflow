FasdUAS 1.101.10   ��   ��    k             i         I      �������� 0 minimizeall minimizeAll��  ��    k     � 	 	  
  
 O     �    k    �       r        J    ����    o      ���� 0 
thebuttons 
theButtons      l  	 	��������  ��  ��        X   	 m ��   Z    h  ����  >         l    ����  n        1    ��
�� 
pnam  o    ����  0 theapplication theApplication��  ��    m         � ! !  F l u i d A p p  X   # d "�� # " X   5 _ $�� % $ Z   G Z & '���� & l  G L (���� ( =  G L ) * ) l  G J +���� + n   G J , - , 1   H J��
�� 
desc - o   G H���� 0 	thebutton 	theButton��  ��   * m   J K . . � / /  m i n i m i z e   b u t t o n��  ��   ' r   O V 0 1 0 b   O T 2 3 2 o   O P���� 0 
thebuttons 
theButtons 3 J   P S 4 4  5�� 5 o   P Q���� 0 	thebutton 	theButton��   1 o      ���� 0 
thebuttons 
theButtons��  ��  �� 0 	thebutton 	theButton % n   8 ; 6 7 6 2  9 ;��
�� 
butT 7 o   8 9���� 0 	thewindow 	theWindow�� 0 	thewindow 	theWindow # n   & ) 8 9 8 2  ' )��
�� 
cwin 9 o   & '����  0 theapplication theApplication��  ��  ��  0 theapplication theApplication  2   ��
�� 
pcap   : ; : l  n n��������  ��  ��   ;  < = < X   n � >�� ? > I  ~ ��� @��
�� .prcsclicnull��� ��� uiel @ o   ~ ���� 0 	thebutton 	theButton��  �� 0 	thebutton 	theButton ? o   q r���� 0 
thebuttons 
theButtons =  A B A l  � ���������  ��  ��   B  C D C l  � ��� E F��   E > 8do it twice because it usually misses one the first time    F � G G p d o   i t   t w i c e   b e c a u s e   i t   u s u a l l y   m i s s e s   o n e   t h e   f i r s t   t i m e D  H I H X   � � J�� K J I  � ��� L��
�� .prcsclicnull��� ��� uiel L o   � ����� 0 	thebutton 	theButton��  �� 0 	thebutton 	theButton K o   � ����� 0 
thebuttons 
theButtons I  M�� M l   � ��� N O��   N � �
		activate
		display dialog "Are all windows mimimized?" buttons {"No", "Yes"} default button 1 giving up after 10
		if the button returned of the result is "No" then
			set the visible of every process to false
		end if
		    O � P P� 
 	 	 a c t i v a t e 
 	 	 d i s p l a y   d i a l o g   " A r e   a l l   w i n d o w s   m i m i m i z e d ? "   b u t t o n s   { " N o " ,   " Y e s " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   1 0 
 	 	 i f   t h e   b u t t o n   r e t u r n e d   o f   t h e   r e s u l t   i s   " N o "   t h e n 
 	 	 	 s e t   t h e   v i s i b l e   o f   e v e r y   p r o c e s s   t o   f a l s e 
 	 	 e n d   i f 
 	 	��    m      Q Q�                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��     R�� R l  � ���������  ��  ��  ��     S T S l     ��������  ��  ��   T  U V U i    W X W I      �� Y���� 0 writelog WriteLog Y  Z�� Z o      ���� 0 text4log text4Log��  ��   X k     ( [ [  \ ] \ I    �� ^��
�� .sysoexecTEXT���     TEXT ^ b     	 _ ` _ b      a b a b      c d c m      e e � f f B e c h o   ` d a t e   ' + % Y - % m - % d   % H : % M : % s ' `   d n     g h g 1    ��
�� 
strq h o    ���� 0 text4log text4Log b m     i i � j j  > > ` m     k k � l l n / U s e r s / r s / L i b r a r y / L o g s / c o m . r o l a n d s i e b e l i n k . p o m o d o r o . l o g��   ]  m�� m l   ( n o p n O   ( q r q I   '���� s
�� .notifygrnull��� ��� null��   s �� t u
�� 
name t m     v v � w w  I n f o u �� x y
�� 
titl x o    ���� 0 text4log text4Log y �� z {
�� 
desc z o    ���� 0 text4log text4Log { �� | }
�� 
appl | m     ~ ~ �    P o m o d o r o G l u e } �� ���
�� 
prio � m     !��������   r 5    �� ���
�� 
capp � m     � � � � � 0 c o m . G r o w l . G r o w l H e l p e r A p p
�� kfrmID   o 1 +set to 0 to see these success notifications    p � � � V s e t   t o   0   t o   s e e   t h e s e   s u c c e s s   n o t i f i c a t i o n s��   V  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 
writeerror 
WriteError �  ��� � o      ���� 0 text4log text4Log��  ��   � k     & � �  � � � I    �� ���
�� .sysoexecTEXT���     TEXT � b     	 � � � b      � � � b      � � � m      � � � � � @ e c h o   ` d a t e   ' + % Y - % m - % d   % H : % M : % s `   � n     � � � 1    ��
�� 
strq � o    ���� 0 text4log text4Log � m     � � � � �  > > � m     � � � � � n / U s e r s / r s / L i b r a r y / L o g s / c o m . r o l a n d s i e b e l i n k . p o m o d o r o . l o g��   �  ��� � O   & � � � I   %���� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � m     � � � � � 
 E r r o r � �� � �
�� 
titl � o    ���� 0 text4log text4Log � �� � �
�� 
desc � o    ���� 0 text4log text4Log � �� � �
�� 
appl � m     � � � � �  P o m o d o r o G l u e � �� ���
�� 
prio � m     !���� ��   � 5    �� ���
�� 
capp � m     � � � � � 0 c o m . G r o w l . G r o w l H e l p e r A p p
�� kfrmID  ��   �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 0 tracknumber   � m    ����  �  � � � l     ��������  ��  ��   �  � � � i     � � � I     �� ���
�� .aevtoappnull  �   � **** � o      ���� 0 argv  ��   � k    � � �  � � � l     � � � � r      � � � I    �� ���
�� .sysoexecTEXT���     TEXT � m      � � � � � L g r e p   - q   " I D L E "   / t m p / r o u t i n e t r a c k e r . l o g��   � o      ���� 0 myresult   � : 4 should cancel the script if IDLE is not in the file    � � � � h   s h o u l d   c a n c e l   t h e   s c r i p t   i f   I D L E   i s   n o t   i n   t h e   f i l e �  � � � l   ��������  ��  ��   �  � � � O    & � � � I   %���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � m     � � � � �  P o m o d o r o G l u e � � � �
� 
anot � J     � �  � � � m     � � � � �  I n f o �  ��~ � m     � � � � � 
 E r r o r�~   � �} � �
�} 
dnot � J     � �  � � � m     � � � � �  I n f o �  ��| � m     � � � � � 
 E r r o r�|   � �{ ��z
�{ 
iapp � m     � � � � �  P o m o d o r o . a p p�z   � 5    �y ��x
�y 
capp � m   
  � � � � � 0 c o m . G r o w l . G r o w l H e l p e r A p p
�x kfrmID   �  � � � l  ' '�w�v�u�w  �v  �u   �  � � � l  ' '�t � ��t   � 4 . #############################################    � � � � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # �  � � � r   ' . � � � m   ' * � � � � � * I n c r e a s e   s o u n d   v o l u m e � o      �s�s 0 thisroutine   �  � � � Q   / � �  � k   2 e  Z   2 X�r�q =  2 > l  2 <	�p�o	 e   2 <

 l  2 <�n�m n   2 < 1   7 ;�l
�l 
mute l  2 7�k�j I  2 7�i�h�g
�i .sysogtvlvlst   ��� null�h  �g  �k  �j  �n  �m  �p  �o   m   < =�f
�f boovfals l  A T I  A T�e�d
�e .aevtstvlnull��� ��� nmbr�d   �c�b
�c 
ouvl l  E P�a�` [   E P l  E N�_�^ n   E N 1   J N�]
�] 
ouvl l  E J�\�[ I  E J�Z�Y�X
�Z .sysogtvlvlst   ��� null�Y  �X  �\  �[  �_  �^   m   N O�W�W �a  �`  �b   7 1 should not choke on setting it above 100, tested    � b   s h o u l d   n o t   c h o k e   o n   s e t t i n g   i t   a b o v e   1 0 0 ,   t e s t e d�r  �q   �V I   Y e�U�T�U 0 writelog WriteLog �S b   Z a  m   Z ]!! �""  S u c c e s s :    o   ] `�R�R 0 thisroutine  �S  �T  �V    R      �Q#$
�Q .ascrerr ****      � ****# o      �P�P 0 errstr errStr$ �O%�N
�O 
errn% o      �M�M 0 errornumber errorNumber�N   I   m ��L&�K�L 0 
writeerror 
WriteError& '�J' b   n �()( b   n �*+* b   n ,-, b   n {./. b   n y010 b   n u232 m   n q44 �55  E r r o r :  3 o   q t�I�I 0 thisroutine  1 m   u x66 �77   / o   y z�H�H 0 errstr errStr- m   { ~88 �99    (+ o    ��G�G 0 errornumber errorNumber) m   � �:: �;;  )�J  �K   � <=< l  � ��F�E�D�F  �E  �D  = >?> l  � ��C@A�C  @ 4 . #############################################   A �BB \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #? CDC r   � �EFE m   � �GG �HH  H i d e   a l l   a p p sF o      �B�B 0 thisroutine  D IJI Q   � �KLMK k   � �NN OPO n  � �QRQ I   � ��A�@�?�A 0 minimizeall minimizeAll�@  �?  R  f   � �P S�>S I   � ��=T�<�= 0 writelog WriteLogT U�;U b   � �VWV m   � �XX �YY  S u c c e s s :  W o   � ��:�: 0 thisroutine  �;  �<  �>  L R      �9Z[
�9 .ascrerr ****      � ****Z o      �8�8 0 errstr errStr[ �7\�6
�7 
errn\ o      �5�5 0 errornumber errorNumber�6  M I   � ��4]�3�4 0 
writeerror 
WriteError] ^�2^ b   � �_`_ b   � �aba b   � �cdc b   � �efe b   � �ghg b   � �iji m   � �kk �ll  E r r o r :  j o   � ��1�1 0 thisroutine  h m   � �mm �nn   f o   � ��0�0 0 errstr errStrd m   � �oo �pp    (b o   � ��/�/ 0 errornumber errorNumber` m   � �qq �rr  )�2  �3  J sts l  � ��.uv�.  u 4 . #############################################   v �ww \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #t xyx l  � ��-�,�+�-  �,  �+  y z{z r   � �|}| m   � �~~ � R P l a y   a   r a n d o m   t r a c k   a n d   m a r k   i t   a s   p l a y e d} o      �*�* 0 thisroutine  { ��� Q   ������ k   ���� ��� r   � ���� I  � ��)�(�'
�) .misccurdldt    ��� null�(  �'  � o      �&�& 0 mytimestamp  � ��� l  � ����� r   � ���� l  � ���%�$� [   � ���� l  � ���#�"� c   � ���� n   � ���� 4   � ��!�
�! 
cobj� m   � �� �  � o   � ��� 0 argv  � m   � ��
� 
nmbr�#  �"  � m   � ��� �%  �$  � o      �� 0 tracknumber  �    catch argument being zero   � ��� 4   c a t c h   a r g u m e n t   b e i n g   z e r o� ��� l  � �����  � * $tell application "Adium" to activate   � ��� H t e l l   a p p l i c a t i o n   " A d i u m "   t o   a c t i v a t e� ��� t   ����� O   ���� k   �~�� ��� Q   �D���� r  #��� n  ��� 4  ��
� 
cTrk� o  �� 0 tracknumber  � l ���� 6 ��� l ���� 4 ��
� 
cPly� m  �� �  �  � = 
��� 1  �
� 
pnam� m  �� ���  J a p a n e s e P o d 1 0 1�  �  � o      �� 0 	sometrack 	someTrack� R      ���
� .ascrerr ****      � ****�  �  � k  +D�� ��� l ++����  � + % pick the Studio Brussel audio stream   � ��� J   p i c k   t h e   S t u d i o   B r u s s e l   a u d i o   s t r e a m� ��� r  +D��� l +@���
� 6 +@��� l +1��	�� 4 +1��
� 
cTrk� m  /0�� �	  �  � E  4?��� 1  59�
� 
pnam� l :>���� m  :>�� ��� 4 S t u d i o   B r u s s e l   |   k w a l i t e i t�  �  �  �
  � o      �� 0 	sometrack 	someTrack�  � ��� P  E~�� �� Q  L}���� k  On�� ��� r  OZ��� o  OR���� 0 mytimestamp  � n      ��� 1  UY��
�� 
pPlD� o  RU���� 0 	sometrack 	someTrack� ��� r  [f��� o  [^���� 0 mytimestamp  � n      ��� 1  ae��
�� 
pSkD� o  ^a���� 0 	sometrack 	someTrack� ���� I gn�����
�� .hookPlaynull    ��� obj � o  gj���� 0 	sometrack 	someTrack��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � I v}�����
�� .sysottosnull���     TEXT� m  vy�� ���  b a d   i T u n e s��  �   � ����
�� consrmte��  �  � m   � ����                                                                                  hook  alis    >  Ibis500                    �m>YH+   J΁
iTunes.app                                                      =#G���        ����  	                Applications    �m��      ��r     J΁   Ibis500:Applications: iTunes.app   
 i T u n e s . a p p    I b i s 5 0 0  Applications/iTunes.app   / ��  � m   � ����� � ���� I  ��������� 0 writelog WriteLog� ���� b  ����� m  ���� ���  S u c c e s s :  � o  ������ 0 thisroutine  ��  ��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errstr errStr� �����
�� 
errn� o      ���� 0 errornumber errorNumber��  � I  ��������� 0 
writeerror 
WriteError� ���� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  E r r o r :  � o  ������ 0 thisroutine  � m  ��   �   � o  ������ 0 errstr errStr� m  �� �    (� o  ������ 0 errornumber errorNumber� m  �� �  )��  ��  �  l ����������  ��  ��   	 l ����������  ��  ��  	 

 l ����������  ��  ��    l ������   4 . #############################################    � \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  r  �� m  �� �  R e a d   t h e   t a s k s o      ���� 0 thisroutine    Q  � k  ��  O  ��  k  ��!! "#" r  ��$%$ I ����&��
�� .sysoexecTEXT���     TEXT& m  ��'' �(( ` / b i n / c a t   - s   / U s e r s / r s / D r o p b o x / E l e m e n t s / T o d y n . t x t��  % o      ���� 0 mytasks  # )*) l ����������  ��  ��  * +,+ r  ��-.- l ��/����/ n  ��010 4 ����2
�� 
cpar2 m  ������ 1 o  ������ 0 mytasks  ��  ��  . o      ���� 0 	mytoptask  , 3��3 I ����4��
�� .sysottosnull���     TEXT4 o  ������ 0 	mytoptask  ��  ��    m  ��55�                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��   6��6 I  ����7���� 0 writelog WriteLog7 8��8 b  ��9:9 m  ��;; �<<  S u c c e s s :  : o  ������ 0 thisroutine  ��  ��  ��   R      ��=>
�� .ascrerr ****      � ****= o      ���� 0 errstr errStr> ��?��
�� 
errn? o      ���� 0 errornumber errorNumber��   I  ���@���� 0 
writeerror 
WriteError@ A��A b  �BCB b  �DED b  �FGF b  �HIH b  �JKJ b  �LML m  ��NN �OO  E r r o r :  M o  � ���� 0 thisroutine  K m  PP �QQ   I o  ���� 0 errstr errStrG m  
RR �SS    (E o  ���� 0 errornumber errorNumberC m  TT �UU  )��  ��   VWV l ��������  ��  ��  W XYX l ��������  ��  ��  Y Z[Z l ��\]��  \ 4 . #############################################   ] �^^ \   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #[ _`_ r  aba m  cc �dd & P r o m p t   f o r   P o m o d o r ob o      ���� 0 thisroutine  ` efe Q  �ghig k  !�jj klk l !!��mn��  m 4 . should not do this one, only causes confusion   n �oo \   s h o u l d   n o t   d o   t h i s   o n e ,   o n l y   c a u s e s   c o n f u s i o nl pqp l !!��rs��  r m gtell application "Terminal" to do shell script "cd /Users/rs/rt ; /Users/rs/rt/auto_update_todyn.sh & "   s �tt � t e l l   a p p l i c a t i o n   " T e r m i n a l "   t o   d o   s h e l l   s c r i p t   " c d   / U s e r s / r s / r t   ;   / U s e r s / r s / r t / a u t o _ u p d a t e _ t o d y n . s h   &   "q uvu l !!��������  ��  ��  v wxw O  !�yzy k  '�{{ |}| r  '0~~ I ',������
�� .misccurdldt    ��� null��  ��   o      ���� 0 newtimestamp  } ��� r  1<��� \  18��� o  14���� 0 newtimestamp  � o  47���� 0 mytimestamp  � o      ���� 
0 mydiff  � ��� r  =H��� l =D������ I =D�����
�� .sysoexecTEXT���     TEXT� m  =@�� ��� | p s   - o c o m m a n d =   - p   $ P P I D   |   a w k   - F /   ' { p r i n t   $ N F } '   |   a w k   ' { p r i n t } '��  ��  ��  � o      ���� 0 parent_process  � ��� n IO��� o  JN���� 0 minimizeall minimizeAll�  f  IJ� ��� I PU������
�� .miscactvnull��� ��� null��  ��  � ���� I V�����
�� .sysodlogaskr        TEXT� m  VY�� ��� . S p e n d   n e x t   P o m o d o r o   o n ?� ����
�� 
appr� b  \k��� b  \g��� b  \c��� o  \_���� 0 parent_process  � m  _b�� ���    (� o  cf���� 
0 mydiff  � m  gj�� ���    s e c   d e l a y )� ����
�� 
btns� J  nv�� ��� m  nq�� ���  C a n c e l� ���� m  qt�� ��� 
 S t a r t��  � ����
�� 
dtxt� o  y|���� 0 mytasks  � ����
�� 
dflt� m  ����� � �����
�� 
givu� m  ������ ;��  ��  z m  !$���                                                                                  sevs  alis    �  Ibis500                    �m>YH+   J�'System Events.app                                               N�C�4�-        ����  	                CoreServices    �m��      �5"�     J�' J� J�  8Ibis500:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    I b i s 5 0 0  -System/Library/CoreServices/System Events.app   / ��  x ��� Z  ��������� = ����� l �������� n  ����� 1  ����
�� 
bhit� l �������� 1  ����
�� 
rslt��  ��  ��  ��  � m  ���� ��� 
 S t a r t� k  ���� ��� r  ����� l �����~� n  ����� 4 ���}�
�} 
cpar� m  ���|�| � n  ����� 1  ���{
�{ 
ttxt� l ����z�y� 1  ���x
�x 
rslt�z  �y  �  �~  � o      �w�w 0 
myfulltask  � ��� r  ����� n ����� 1  ���v
�v 
txdl� 1  ���u
�u 
ascr� o      �t�t 0 ods  � ��� r  ����� m  ���� ���  `� n     ��� 1  ���s
�s 
txdl� 1  ���r
�r 
ascr� ��� r  ����� l ����q�p� n  ����� 4 ���o�
�o 
citm� m  ���n�n � o  ���m�m 0 
myfulltask  �q  �p  � o      �l�l 
0 mytask  � ��� Q  ������ r  ����� c  ����� l ����k�j� n  ����� 4 ���i�
�i 
citm� m  ���h�h � o  ���g�g 0 
myfulltask  �k  �j  � m  ���f
�f 
nmbr� o      �e�e 0 
myduration  � R      �d�c�b
�d .ascrerr ****      � ****�c  �b  � r  ����� m  ���a�a � o      �`�` 0 
myduration  � ��� r  � ��� o  ���_�_ 0 ods  � n     ��� 1  ���^
�^ 
txdl� 1  ���]
�] 
ascr� ��� Q  $���� r  ��� I �\� 
�\ .sysoexecTEXT���     TEXT� m   � 2 c a t   / t m p / p o m o d o r o d o n e . l o g  �[�Z
�[ 
rtyp m  
�Y
�Y 
TEXT�Z  � o      �X�X 0 breakminutes  � R      �W�V�U
�W .ascrerr ****      � ****�V  �U  � r  $ m    �  5 o      �T�T 0 breakminutes  � 	 r  %0

 c  %, o  %(�S�S 0 breakminutes   m  (+�R
�R 
long o      �Q�Q 0 breakminutes  	  Z 1F�P�O A  18 o  14�N�N 0 breakminutes   m  47�M�M  r  ;B m  ;>�L�L  o      �K�K 0 breakminutes  �P  �O    Z G\�J�I ?  GN o  GJ�H�H 0 breakminutes   m  JM�G�G  r  QX m  QT�F�F  o      �E�E 0 breakminutes  �J  �I    Z ]n !�D�C  =  ]b"#" o  ]`�B�B 0 
myduration  # m  `a�A�A ! r  ej$%$ m  ef�@�@ % o      �?�? 0 breakminutes  �D  �C   &'& O  o�()( I u��>*+
�> .POMOStrtnull���     ctxt* o  ux�=�= 
0 mytask  + �<,-
�< 
PMdr, o  {~�;�; 0 
myduration  - �:.�9
�: 
PMbk. o  ���8�8 0 breakminutes  �9  ) m  or//�                                                                                      @ alis    F  Ibis500                    �m>YH+   J΁Pomodoro.app                                                    C@���+�        ����  	                Applications    �m��      ��	     J΁  "Ibis500:Applications: Pomodoro.app    P o m o d o r o . a p p    I b i s 5 0 0  Applications/Pomodoro.app   / ��  ' 010 l  ���723�7  2 � �
			if PomodoroName contains "+rout" then
				tell application "Beeminder" to open location "https://www.beeminder.com/cyberroland/goals/effrout"
			end if
			   3 �44> 
 	 	 	 i f   P o m o d o r o N a m e   c o n t a i n s   " + r o u t "   t h e n 
 	 	 	 	 t e l l   a p p l i c a t i o n   " B e e m i n d e r "   t o   o p e n   l o c a t i o n   " h t t p s : / / w w w . b e e m i n d e r . c o m / c y b e r r o l a n d / g o a l s / e f f r o u t " 
 	 	 	 e n d   i f 
 	 	 	1 5�65 O ��676 I ���5�4�3
�5 .hookStopnull        null�4  �3  7 m  ��88�                                                                                  hook  alis    >  Ibis500                    �m>YH+   J΁
iTunes.app                                                      =#G���        ����  	                Applications    �m��      ��r     J΁   Ibis500:Applications: iTunes.app   
 i T u n e s . a p p    I b i s 5 0 0  Applications/iTunes.app   / ��  �6  ��  ��  � 9�29 I  ���1:�0�1 0 writelog WriteLog: ;�/; b  ��<=< m  ��>> �??  S u c c e s s :  = o  ���.�. 0 thisroutine  �/  �0  �2  h R      �-@A
�- .ascrerr ****      � ****@ o      �,�, 0 errstr errStrA �+B�*
�+ 
errnB o      �)�) 0 errornumber errorNumber�*  i I  ���(C�'�( 0 
writeerror 
WriteErrorC D�&D b  ��EFE b  ��GHG b  ��IJI b  ��KLK b  ��MNM b  ��OPO m  ��QQ �RR  E r r o r :  P o  ���%�% 0 thisroutine  N m  ��SS �TT   L o  ���$�$ 0 errstr errStrJ m  ��UU �VV    (H o  ���#�# 0 errornumber errorNumberF m  ��WW �XX  )�&  �'  f Y�"Y l ���!� ��!  �   �  �"   � Z�Z l     ����  �  �  �       �[\]^�_`cabcde�fghi����  [ �����������
�	��������� 0 minimizeall minimizeAll� 0 writelog WriteLog� 0 
writeerror 
WriteError� 0 tracknumber  
� .aevtoappnull  �   � ****� 0 myresult  � 0 thisroutine  � 0 mytimestamp  � 0 	sometrack 	someTrack� 0 mytasks  �
 0 	mytoptask  �	 0 newtimestamp  � 
0 mydiff  � 0 parent_process  � 0 
myfulltask  � 0 ods  � 
0 mytask  � 0 
myduration  � 0 breakminutes  �  \ �  ����jk���  0 minimizeall minimizeAll��  ��  j ���������� 0 
thebuttons 
theButtons��  0 theapplication theApplication�� 0 	thewindow 	theWindow�� 0 	thebutton 	theButtonk  Q����������  ������ .��
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
�� .prcsclicnull��� ��� uiel�� �� �jvE�O c*�-[��l kh ��,� F @��-[��l kh  )��-[��l kh ��,�  ��kv%E�Y h[OY��[OY��Y h[OY��O �[��l kh �j [OY��O �[��l kh �j [OY��OPUOP] �� X����lm���� 0 writelog WriteLog�� ��n�� n  ���� 0 text4log text4Log��  l ���� 0 text4log text4Logm  e�� i k���� ����� v������ ~��������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
capp
�� kfrmID  
�� 
name
�� 
titl
�� 
desc
�� 
appl
�� 
prio������ 

�� .notifygrnull��� ��� null�� )��,%�%�%j O)���0 *��������a  U^ �� �����op���� 0 
writeerror 
WriteError�� ��q�� q  ���� 0 text4log text4Log��  o ���� 0 text4log text4Logp  ��� � ����� ����� ������� �������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
capp
�� kfrmID  
�� 
name
�� 
titl
�� 
desc
�� 
appl
�� 
prio�� 

�� .notifygrnull��� ��� null�� '��,%�%�%j O)���0 *�������k� U� _ �� �����rs��
�� .aevtoappnull  �   � ****�� 0 argv  ��  r �������� 0 argv  �� 0 errstr errStr�� 0 errornumber errorNumbers � ������� ����� ��� � ��� � ��� ����� �����������!����t468:��G��Xkmoq~�������������u������������������������ 5'������;NPRTc����������������������������������������������������������������/��������~>QSUW
�� .sysoexecTEXT���     TEXT�� 0 myresult  
�� 
capp
�� kfrmID  
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null�� 0 thisroutine  
�� .sysogtvlvlst   ��� null
�� 
mute
�� 
ouvl
�� .aevtstvlnull��� ��� nmbr�� 0 writelog WriteLog�� 0 errstr errStrt �}�|�{
�} 
errn�| 0 errornumber errorNumber�{  �� 0 
writeerror 
WriteError�� 0 minimizeall minimizeAll
�� .misccurdldt    ��� null�� 0 mytimestamp  
�� 
cobj
�� 
nmbr�� 
�� 
cPlyu  
�� 
pnam
�� 
cTrk�� 0 	sometrack 	someTrack��  ��  
�� 
pPlD
�� 
pSkD
�� .hookPlaynull    ��� obj 
�� .sysottosnull���     TEXT�� 0 mytasks  
�� 
cpar�� 0 	mytoptask  �� 0 newtimestamp  �� 
0 mydiff  �� 0 parent_process  
�� .miscactvnull��� ��� null
�� 
appr
�� 
btns
�� 
dtxt
�� 
dflt
�� 
givu�� ;�� 

�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
ttxt�� 0 
myfulltask  
�� 
ascr
�� 
txdl�� 0 ods  
�� 
citm�� 
0 mytask  �� 0 
myduration  �� 
�� 
rtyp
�� 
TEXT�� 0 breakminutes  
�� 
long�� 
�� 
PMdr
�� 
PMbk�� 
� .POMOStrtnull���     ctxt
�~ .hookStopnull        null����j E�O)���0 *�����lv���lv��a  UOa E` O 8*j a ,Ef  *a *j a ,kl Y hO*a _ %k+ W #X  *a _ %a %�%a %�%a %k+  Oa !E` O )j+ "O*a #_ %k+ W #X  *a $_ %a %%�%a &%�%a '%k+  Oa (E` O �*j )E` *O�a +k/a ,&kEc  Oa -na . � '*a /k/a 0[a 1,\Za 281a 3b  /E` 4W  X 5 6*a 3k/a 0[a 1,\Za 7@1E` 4Oga 8 4 $_ *_ 4a 9,FO_ *_ 4a :,FO_ 4j ;W X 5 6a <j =VUoO*a >_ %k+ W #X  *a ?_ %a @%�%a A%�%a B%k+  Oa CE` O 9a D "a Ej E` FO_ Fa Gk/E` HO_ Hj =UO*a I_ %k+ W #X  *a J_ %a K%�%a L%�%a M%k+  Oa NE` O�a D g*j )E` OO_ O_ *E` POa Qj E` RO)a ",EO*j SOa Ta U_ Ra V%_ P%a W%a Xa Ya Zlva [_ Fa \ka ]a ^a _ `UO_ aa b,a c _ aa d,a Gk/E` eO_ fa g,E` hOa i_ fa g,FO_ ea jk/E` kO _ ea jl/a ,&E` lW X 5 6a mE` lO_ h_ fa g,FO a na oa pl E` qW X 5 6a rE` qO_ qa s&E` qO_ qa - a -E` qY hO_ qa t a tE` qY hO_ lk  
kE` qY hOa u _ ka v_ la w_ qa x yUOa . *j zUY hO*a {_ %k+ W #X  *a |_ %a }%�%a ~%�%a %k+  OP` �vv  a ldt     ЄU�b ww x�z�y�xx y�w�v�uy ��t�s�r
�t 
cSrc�s I
�r kfrmID  
�w 
cUsP�v  �
�u kfrmID  
�z 
cFlT�y  �
�x kfrmID  c �zz
�  R e a d y   f o r   V e g a s   t a l k   # 8 2 0 5 5 1 3 2 > > B r a i n s t o r m   o n   p a p e r     + 6 . t h l > v g s  F u p   o n   o w n   M B A   f u n n e l   # 8 1 8 1 9 1 6 2 > > R e v i e w   f u n n e l     + a . t h l > m b a  S o l v e   d a t a   e r r o r s   i n   P e t e   P y t h o n   s c r i p t s   # 8 2 2 3 4 2 8 6 > > U p d a t e   Q A   q u e r y     + w 4 5 a  I n v i t e   B u s h i / S e b a s t i n   t o   I C F   c o d e   # 8 1 5 5 7 2 0 4 > > T a l k   t o   t h e m   a b o u t   t h e   c o d e   w h e n   I   s e e   t h e m   i n   t h e   o f f i c e     + 4 . q d v > f i x  O r d e r   k a r a o k e   k i t   f o r   x m a s   a t   h o m e   # 8 0 5 2 2 8 0 8 > > I n v e s t i g a t e   f u r t h e r     + w 4 2 s  W 4 5 - F r i   W r i t e   1 5 F i v e   # 8 2 0 5 5 6 6 6 > > J u s t   w r i t e   i t     + . r d v !  W 4 5 - F r i   Q u a l i t y   e m a i l   s e n t   o u t   # 8 2 0 5 5 6 6 8 > > S e n d   o u t     + 7 . q d v > w q c  W 4 5 - S a t   R e s t   d a y   2   # 8 2 0 5 5 6 7 0 > > W a t c h   a   m o v i e     + ! " b a c > < 4 0 y  W 4 5 - S a t   R e p r i o r i t i z e   f o r   t e a m   # 8 2 0 5 5 6 7 2 > > R e v i e w   s t o r i e s   a n d   e p i c s     + 8 . c c h > t s u   2 3 h 0 0  �=��0�0��0�0�0�0�0�'d�   O R A N G E   U S D 0 0 5   R e p r i o r i t i z e   r e p r i o r i t i z e   + b e e m   + 0 . 2 9   i n   1   d a y  O R A N G E   U S D 0 0 5   @ R u n K e e p e r   r u n k e e p e r   + b e e m   + 0 . 1 2   i n   1   d a y  0 7 h 3 0  0�0�0�0�0h  ���0  + r o u t   ` 2 0  0 8 h 0 0  0�0�0�0�0�0�0�0�   + r o u t   ` 2 0  0 9 h 3 0   M i s e - e n - p l a c e :   1 / W a t e r   2 / g u m   3 / P L p r i n t   4 / w d T o p 3   + r o u t   ` 9  1 3 h 0 0   5 0 0 00�0�0�0�f<��RM   + r o u t   ` 3 0  1 8 h 0 0   1N0�0�0�0�Y��RM   + r o u t   ` 3 0  2 2 h 3 0  ��� 3 + r o u t   ` 1 5   D e t e r m i n e   p r i o r i t i e s   f o r   t h e   w e e k   + r o u t  T r i m   a n d   s h a v e   + r o u t  F i l l   u p   v i t a m i n s   + 8 h c r  R e a d   u p   o n   1 5 F i v e s   -   3 d   o n d e r   1 9 . 5 k g :   l a b e l   p r i n t e r   @ r o l a n d   ( 2 0 1 4 / 1 1 / 0 6 )  -   A a r o n   P a t z e r ?   ( 2 0 1 4 - 1 0 - 3 1 )   @ r o l a n d  -   A k i   c a d e a u   r e g e l e n   ( 2 0 1 4 - 1 0 - 2 3 )  -   A k i   c a d e a u   v r a g e n   ( 2 0 1 4 - 1 0 - 1 8 )  -   A r t h u r   N i c h o l l s   ( 2 0 1 4 - 1 1 - 0 3 )   @ r o l a n d  -   B o w e i   G a i   ( 2 0 1 4 - 1 0 - 2 8 )   @ r o l a n d  -   C h e c k   o p e n   b o n u s   9 8 4 0   C a r l s o n   @ R o l a n d   ( 2 0 1 4 - 1 1 - 0 4 )   2 0 1 4 - 1 1 - 0 8   2 3 : 2 0 : 2 9   c h a s e i d l e . r bd �{{  e ldt     ЄU��  f �|| 8 p r o m p t _ f o r _ p o m o d o r o _ 2 . s c p t   2g �}} $ 2 2 h 3 0  ��� 3 + r o u t   ` 1 5h �q~�q ~   ���  i ���  2 2 h 3 0  ��� 3 + r o u t  � � 
�  ascr  ��ޭ