GDPC                                                                               $   res://Liquid/Liquid node.gd.remap          -       .�k~���@�D�ō��   res://Liquid/Liquid node.gdc      	      �}�4r3��0~��    res://Liquid/Liquid node.tscn   0      k      R��J��#+v�ޮ�I   res://Liquid/Type.gd.remap  P      &       a	px+V������   res://Liquid/Type.gdc   �      t      �[�Y�� Vc;�   res://icon.png  �      �      G1?��z�c��vN��   res://project.binaryp       �      \.wa���h �O�5    GDSC         E   �     ������ڶ   ���Ӷ���   �����϶�   �����Ҷ�   ������Ŷ   �������������¶�   ������������Ҷ��   �����������۶���   ������������ζ��   ��Ŷ   �������Ӷ���   ������Ҷ   ���¶���   ζ��   ϶��   ̶��   �������Ӷ���   �����������������Ҷ�   ���ض���   ������������¶��   ��������������Ҷ   	   levelData         rooms         liquids       size   	   sizeCheck               LineEdit      position       Position/Position/ChangePosition      Position/Position/X Position      Position/Position/Y Position      Position/Position/Z Position                             type      Liquid Type/Type                                           
         	      
         1      :      C      R      [      d      l      t      |      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   	  +     ,     -   #  .   '  /   ;  0   O  1   S  2   U  3   X  4   \  5   p  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   3YYYYYY;�  YYY0�  PQV�  ;�  �  T�  LML�  T�  ML�  ML�  T�  ML�  ML�  T�  M�  &�  T�	  P�  QV�  �
  P�  QT�  �  �  �
  P�  QT�  �>  P�  L�  MQ�  &�  T�	  P�  QV�  �
  P�  QT�  �  �  ;�  �
  P�	  Q�  ;�  �
  P�
  Q�  ;�  �
  P�  Q�  �  T�  �>  P�  L�  ML�  MQ�  �  T�  �>  P�  L�  ML�  MQ�  �  T�  �>  P�  L�  ML�  MQYYY0�  PQV�  &�P  P�
  P�  QT�  Q�  V�  &�
  P�  QT�  V�  .�P  P�
  P�  QT�  Q�  (V�  .�  �  (V�  .�  YYYYYY0�  PQV�  �  �  PQ�  ;�  NO�  &�
  P�  QT�  V�  ;�  �
  P�	  QT�  �  ;�  �
  P�
  QT�  �  ;�  �
  P�  QT�  �  &�  �  V�  �  N�  �  V�
  P�  QT�  P�
  P�  QT�  PQQR�  �  VL�  P�  QR�  P�  QR�  P�  QMR�  �  V�  �  O�  (V�  �  N�  �  V�
  P�  QT�  P�
  P�  QT�  PQQR�  �  VL�  P�  QR�  P�  QR�  P�  QM�  �  O�  (V�  &�  �  V�  �  N�  �  V�
  P�  QT�  P�
  P�  QT�  PQQR�  �  V�  �  O�  (V�  �  N�  �  V�
  P�  QT�  P�
  P�  QT�  PQQR�  O�  �  T�  LML�  T�  ML�  ML�  T�  ML�  ML�  T�  M�  �  Y`     [gd_scene load_steps=4 format=2]

[ext_resource path="res://Liquid/Type.gd" type="Script" id=1]
[ext_resource path="res://scripts/Position.tscn" type="PackedScene" id=2]
[ext_resource path="res://Liquid/Liquid node.gd" type="Script" id=3]

[node name="Liquid node" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
script = ExtResource( 3 )

[node name="Position" type="Control" parent="."]
margin_right = 40.0
margin_bottom = 40.0

[node name="Position" parent="Position" instance=ExtResource( 2 )]
position = Vector2( -13, 58 )

[node name="Liquid Type" type="Control" parent="."]
margin_left = 12.0
margin_top = 160.0
margin_right = 387.0
margin_bottom = 257.0

[node name="Type label" type="Label" parent="Liquid Type"]
margin_left = 3.0
margin_top = 25.0
margin_right = 43.0
margin_bottom = 39.0
rect_scale = Vector2( 2, 2 )
text = "Type:"

[node name="Type" type="OptionButton" parent="Liquid Type"]
margin_left = 75.0
margin_top = 22.0
margin_right = 205.0
margin_bottom = 42.0
rect_scale = Vector2( 2, 1.5 )
script = ExtResource( 1 )

[node name="sizeCheck" type="CheckBox" parent="."]
margin_left = 3.0
margin_top = 3.0
margin_right = 113.0
margin_bottom = 27.0
rect_scale = Vector2( 2, 2 )
text = "Change Size?"

[node name="LineEdit" type="LineEdit" parent="."]
margin_left = 218.0
margin_top = 9.0
margin_right = 418.0
margin_bottom = 44.0
text = "[X,Y,Z]"
align = 1

[node name="Button" type="Button" parent="."]
margin_left = 115.0
margin_top = 246.0
margin_right = 199.0
margin_bottom = 266.0
rect_scale = Vector2( 2, 2 )
text = "Save Liquid"

[connection signal="pressed" from="Button" to="." method="_on_Button_pressed"]
     GDSC            ,      �����������ض���   �����϶�   �������۶���      Water               Lava            Poison                                                         	   	   
   
                     %      &      '      (      )      *      3YYYYYYYYY0�  PQV�  �  PR�  Q�  �  P�  R�  Q�  �  P�  R�  QYYYYYY`            [remap]

path="res://Liquid/Liquid node.gdc"
   [remap]

path="res://Liquid/Type.gdc"
          �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Prime Plandomizer      application/run/main_scene         res://Root.tscn    application/config/icon         res://icon.png     autoload/Json_Handler(         *res://scripts/Json_Handler.gd     autoload/Globals         *res://Globals.gd      autoload/SaveIso$         res://scripts/save_iso.py      gdnative/singletons,               res://pythonscript.gdnlib   )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment(         res://scripts/default_env.tres                