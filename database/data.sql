PGDMP     ,                     y            test 2 #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) #   12.7 (Ubuntu 12.7-0ubuntu0.20.04.1) &    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    20269    test 2    DATABASE     n   CREATE DATABASE "test 2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE "test 2";
                postgres    false            o          0    20334    accounts_state 
   TABLE DATA           3   COPY public.accounts_state (id, state) FROM stdin;
    public          postgres    false    224   m$       Y          0    20270    accounts_city 
   TABLE DATA           ;   COPY public.accounts_city (id, city, state_id) FROM stdin;
    public          postgres    false    202   �%       [          0    20275    accounts_education 
   TABLE DATA           ;   COPY public.accounts_education (id, education) FROM stdin;
    public          postgres    false    204   �s       ]          0    20280    accounts_familytype 
   TABLE DATA           9   COPY public.accounts_familytype (id, family) FROM stdin;
    public          postgres    false    206   �s       _          0    20285    accounts_firstmodule 
   TABLE DATA           e   COPY public.accounts_firstmodule (id, name, email, tennis, cricket, chess, food, drinks) FROM stdin;
    public          postgres    false    208   �s       a          0    20293    accounts_form 
   TABLE DATA           1   COPY public.accounts_form (id, name) FROM stdin;
    public          postgres    false    210   t       m          0    20329    accounts_school 
   TABLE DATA           X   COPY public.accounts_school (id, name, address, pincode, city_id, state_id) FROM stdin;
    public          postgres    false    222   ?t       w          0    20367 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    232   �t       s          0    20347    accounts_teacherincharge 
   TABLE DATA           P   COPY public.accounts_teacherincharge (id, name, school_id, user_id) FROM stdin;
    public          postgres    false    228   >v       c          0    20298    accounts_formdetails 
   TABLE DATA           r   COPY public.accounts_formdetails (id, open, pre, start_timestamp, end_timestamp, form_id, teacher_id) FROM stdin;
    public          postgres    false    212   gv       g          0    20311    accounts_occupation 
   TABLE DATA           =   COPY public.accounts_occupation (id, occupation) FROM stdin;
    public          postgres    false    216   �v       k          0    20324    accounts_religiousbelief 
   TABLE DATA           @   COPY public.accounts_religiousbelief (id, religion) FROM stdin;
    public          postgres    false    220   �v       i          0    20316    accounts_parentsinfo 
   TABLE DATA             COPY public.accounts_parentsinfo (id, email, consent, name, gender, age, address, pincode, no_of_family_members, children_count, first_password, password_changed, city_id, edu_id, occupation_id, religion_id, state_id, type_of_family_id, user_id) FROM stdin;
    public          postgres    false    218   w       q          0    20339    accounts_studentsinfo 
   TABLE DATA           �   COPY public.accounts_studentsinfo (id, name, address, rollno, gender, dob, first_password, password_changed, parent_id, school_id, teacher_id, user_id) FROM stdin;
    public          postgres    false    226   >x       e          0    20303    accounts_moduleone 
   TABLE DATA           r  COPY public.accounts_moduleone (id, pre, draft, "nutriGarden", source_fruits_vegetables, grow_own_food, if_grow_what, reason_gardening, healthy_diet, imp_nutrients, citrus_fruits_blank, not_richsource_iron, "source_vitaminA", imp_eat_fruits_vegetables, reason_wide_variety_food, microgreen, microgreen_example, harvestdays_microgreen, microgreen_grow_seeds_kitchen, microgreen_nutritiousthan_fullgrownvegetables, microgreen_immunity, microgreen_variety, microgreen_source, newspaper_grow_microgreen, microgreen_first_step, soaking_time_seeds, microgreen_watering, microgreen_use, submission_timestamp, student_id) FROM stdin;
    public          postgres    false    214   y       u          0    20352 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    230   [z       x          0    20373    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    233   �z       �           0    0    accounts_city_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_city_id_seq', 2881, true);
          public          postgres    false    203            �           0    0    accounts_education_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_education_id_seq', 2, true);
          public          postgres    false    205            �           0    0    accounts_familytype_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accounts_familytype_id_seq', 2, true);
          public          postgres    false    207            �           0    0    accounts_firstmodule_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.accounts_firstmodule_id_seq', 1, false);
          public          postgres    false    209            �           0    0    accounts_form_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_form_id_seq', 3, true);
          public          postgres    false    211            �           0    0    accounts_formdetails_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.accounts_formdetails_id_seq', 1, true);
          public          postgres    false    213            �           0    0    accounts_moduleone_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_moduleone_id_seq', 1, true);
          public          postgres    false    215            �           0    0    accounts_occupation_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accounts_occupation_id_seq', 2, true);
          public          postgres    false    217            �           0    0    accounts_parentsinfo_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.accounts_parentsinfo_id_seq', 1, true);
          public          postgres    false    219            �           0    0    accounts_religiousbelief_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accounts_religiousbelief_id_seq', 2, true);
          public          postgres    false    221            �           0    0    accounts_school_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_school_id_seq', 2, true);
          public          postgres    false    223            �           0    0    accounts_state_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_state_id_seq', 35, true);
          public          postgres    false    225            �           0    0    accounts_studentsinfo_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.accounts_studentsinfo_id_seq', 1, true);
          public          postgres    false    227            �           0    0    accounts_teacherincharge_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accounts_teacherincharge_id_seq', 1, true);
          public          postgres    false    229            �           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 4, true);
          public          postgres    false    231            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 5, true);
          public          postgres    false    234            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 6, true);
          public          postgres    false    235            o   L  x�U��n�0�ϻO�S������Ң���^ba�� �iE���"Q������+��5Bv�=��i�Ⱥc."�D�qlhۀ�Cuc9M�5�i�,��!���x(�CJ��G4C!zb����<|u���U�f�r����	�4��#"+C��М��E�i��nEh���>��RR�]$VCZ!$�"0�����5�G��C�e�u��(���l����h��Z��ϭ4dhm��9���)J�O݅U���t�zH��T�w6��m�pĎ��^pD�$&�����5E[Ծ������m�\���[JR��c�+@�
aӧwۤlj����{f�Zz��      Y      x�m}Y�ܶ��s�W�����ut��գd�JV[�F-����j�Evq�����~��9�	R�&�D�$	 �	���U�\�q��)ڽ�ˢ+��ߦ��K!@��i���ݫ�h���^\�}Z�s!�d�j��/NnJw���47�n�Yp&x�M1��uU��?p8Z����uӗ�\����C���y �v��a�T�=�?�~)ʪmo>M���c����B��~���h+�t�K��ߥ��L�e�7��U�P����7͹i�J�ݛ�}9�#z�v�v�7G��۪�_�Q�{;Vr���a��tؽ+�r��X~>U��p�\Ov�~|���x�L�ʥ�T���9�v�SY�ا�w�I{����?�r���s��Tϛ��߽/�s�ܼ��u��}-�����p��B��?�b��>$�����}zc��]���ϰ>��~o湭nduF˝�c���߇��g��Eӽ����n�����#�҂e����q����uqs'�р��>VͶZq���<�b�в��a��[s]m��v�S1M�y�9�Ѯ�W��j��V.I9����{C���XfiĆ�>u[��� ��?��_0�w���I��TMq�LU����l�I�v�-tK��>��U�d��t"�;T�{���tl!C�E���gy	GI�>/3]KH�{���4��e)_�SU\@Hv�uQ{I��}'_f�p�����A���hz��_�˦��ݗb�䕸�K[�6Q�h�����}�v_��$�ˮ��ݗe
,(KvV�fVg��Ϧ�Y�V>�l���h����+��Zͻ��{U6-ˊ~�o	��Ͻ�X�K:A�0�ߺ,@a��^��a�s�N����vL���
��3�^9���z�KG0��:J-�np�Q�15[��R��Y��?JE�N������7w20��0���D�w)���{iBjs{���s�>�"W+4�xE��&�o��˓2��������R��˨1[���� R�O��T���n�)��[��u��	��T�S1�RG�q�f$ʁ�Q��]kv��V�9s��A���h�(�J���i�v�ҧ.���)�����2�QFk�"H>�Z	1$�)Z��	A�l���p$�9:J>-HI��"��2Z@�:
��:F��P��!��E��`kE���t�E���7�8�{ ��e��뉤y#�uӱ"nވ�	-��yҟ{�����ș7��/+���B��[��>�~�I��9�뼌n�:4o��Y�M����IzcsO�s��ȇ(�C�U"X�6�x�x{�-۷�hy;�vo�ǟl�hhO%��x��r5(�y�'�j{ ����Q1+��w/en!��i,d���[����|.^^
��{B�m��x_t� 2�3;O��<�
P�h���弔�����{ω����Ү�pW4��?����"��!��h��4��%B(/29��L�[��OcRX	�X�]'B���e/b�E^��c/k3�e�Z�M�3C5�
�"d! ÷�4ԣ:7��է�E��Q�?X-ah��p74�E��N,	wC��݋8 ��)2�nxz��R3��u�GE$܍�d%�T�[�W��H�;���P����A5aZ��� )&��$$$hG�-)(�_πz���E]���2F	w�%��o�;b�u��bG��V�u享Ĉ�+�1�e���Q�^
����%�*��u�H�UI�@x$���Hd~�]��!�񡚽�Ȍc#�o�z]j��˙��V/m`X����h�%ty$��<l|*Y!�-���i!IV�*�*BY�I�|B���K����P^ؘH��Gy�䫅HĆ��Dh�$ӧ��UIR�$�'��h��r0ڣ�ߟ�����Q���:�� I�n��(�묮���w���%y�Q�
�S$���_hG���-�!�=t�ȍO2��~Yzʸ�'��[	�H���y!@�dO�4��,��3���bG���O��f"���P�s@��Y�,ժ�*���TQ$ژ1�/Sŧ�_B")>5�c�r;y񩑵'K�Y�jec�K��͘��i��6��� /W������S՗�&�y����i�m"E"+>�T�e�TrF"+@�l�F"->���*_Z��"0@q`�Md�g�����!��9Hr!ؐ��Y�<1���Q�&"l(��6x�����^�dM�����L�+��	���*)"l(��Ev�:���~�.��_�ʬMYJc�iq�ȧEX�7�CcW�@H�;)�{(Tƽ�'�B/���E~^��.gJh��N2\I�A����:������b�H���RbEk�r���Ѫ.2�L9v���HD�l��Yǁ�/��l�HA�EA��R].*6#_�g�/5�4���Dz|�d%���pF,���ן��kY��@�Dd|mE���Db|��aR���:��7i����?�|��)��[ф�B$㛌���\J$Ʒ����� bc%XODt|k�1ېDx|k.��:������w">�i��M��e�\"?�	�|)�E�A��КHR����>�����N=��SiK�Ķ���A��_�x"���D���� RDp�͝�b�V� 
�"B�}�D��U��3B�}wI�K�%&�Z��[��}#���E|,��� -`e7ɮ⎿n��maװ�E�u���(���|��;ɭ7�0�_Hæc��E��+^�?:��{duD��6�' ĚY��n�Q�F�bOr5j5r';F�t`�'��ص+6y��n�JT`ɦ�Ev�><W�����r/K�~j���ga��C�U=�˅��F�`WP����d��˥�"����nO �{]���	G*��3t~�E�|�9"?ڊw����dm���zV~�Ѳ�I��#�Cf����}��\���0�e�׉L�z���hF�v�ȇ�p��]S�m�ݫS-����
bCi�Ҡ��0��<���<��)۽njl��%��kyG��XQ���Ap���.�B�p������v蠩�Hܼq2��m6�0P�m�eAѽ���+Y/�
o�复α�>���xU�iЋ��n�����`����o�C@6�2���a�o�g�K��"[X���$�&�xdS���+ڿ9�
�7<�K����y�
�?��)A@m�y%l�KJt'G]06[���u����9vJ�'k��e(��c�P<
[ ��֤�+zE"�v1v�|�x,_�z5��� �
Ԁ�2����ߋ�}!�c�q�ȋ �ְ��x*֫2��e�So���*%l]�_����ri�MdnK1�+\G馲��28����D��G,w�"�1_ d��|��Ƣ��D~C3�����BY�t�g`T^�7Ճ"��Cn9}�c.�>a� `=�}��R+]8Au^�Q,\���pV�*�	;]������T/��#��W���zxt$�iT����Ɔ�I�Ja5��8�A�Z5ޫ��_/�U�oh e���1�XwKC��J�0�7E;	/�Ck���Q�Q�r���'�[��6z-�﮴/#���ҍ�@���K��ݿ��TMޔz�^~�v8��I
u�,�6���~�-�8[�R���K�0����º�AN�;��֭=�BQ�h�I�����$a��n�}��+�[�$l�}�y6��\�� Ѓ����M5��� -�,;�3�0Y��E*TU3>>�T�`Sj !���]3�shc�_��2��-�j���1�^����	���ź�J�F�!,����eTM��䰇
h�j��B�#��~���l�	Տ@+zY�T
�:����C���8���H�
ED�YȢ�)��G(-X��*Юpy����BCpe!%��I�+��ڟ�	d-�߲�ʼ���q�Oف/W6(&.ۊʞ� ����[r{��bD����[�챛�ý{l��K�%�=�P�Z�ߟ���M�u���Z>�t��Y��n�D��F��=b�e�h� �C�L���D��}�\j-�0���B �4�-h<S��� ��ۭ6_��=X�sa�K�    X��Z��5�!"�����(��^���z��_���o�����u�����t��	E�[�����f-D7л�H����77"�2�[�FU��`X����8&�����
R�|*j|$`ș3l�D5����^�C�߉���ЫXv��� ��n\sn�z-p�.��&�
H�`x�r������Vx@��L��H6b��M`���u,f��I�aLI`�^&��,�X��h��L)�XTr�$�wx�
�!�ť��uYϝ����oN�4C��B��:��CP�2v�q��E8d㩶3HE�r]1*	���+r`��p��,6aH��qLi�*�ǵ7�lg��ڡ���#�j�E�����Մ�E���&�p��%�-kwy��7b,��Ko(���]S�j9L;�RW,�4�<��	�;���*H������G�����q�H�H���"��	��/^����Tz��Tl+��s툲����W�B~[���j�h/	��8�.Mo!+�ٔ��{���r���a�+�#��΋L�SU*A�"�,��Tx���_~��V��%sC/�w�:�Ǿ~�x���ߗ���tQ*O��$@l_�Ro�e����۵O�i�����s���*k[��xֺB��5������>V��)4���T���YK���,��0R���������z|X�-�HH�}�b���럊����ߔ������6�C�^jU���p�����|4���}
����o���Z^r�m�3�!��U�MZD�
C[TҞ�14ѰZ�t�M�u�p�{r�>�QPz�",���1��4�*w</����a�zQ��
�2��W�.��&���uTn�
k�>M���p ���2PZ��p�+e��7�.�^I�)����qCk����&�J��o� ��%u�<@1͵�>���C-	�>�?�^�v�H]�Q,�+����(�paW	0���l� V�Kmo��y�=� ւ�.`c?��'�S�X��S�W�1~�a�_;��e�a�ߊ~Қ��V�m�@,U+k׎H$����c��Q"C�we�
 ��lt�[$G����g����9ş���	�`hq:M��/��@B�����ho�T�����ͥbC�e�?o	�9�mH��������5jCwO��h�ö́������"�}��#W���)>P��v�wJ��E�Q�;����E�-��&ou��ѻ�'��.z�����PQ���ª8�	���a,� �b��¸S��^�]U�Y$��"��7��`tY�v#�ё\z	���ޛ P��0�uIX��F-�ju�(a&!!�G�PXڕ���
s��ZP�EB�F�G��S��b5
-�Bjc^�e�����<)��V��W�5.�B�G��A�@��_�L�<�o�de���Fhd�Y��̚ķ\6S����|���3KR�%;VkF|�p��Kg�%���jƘ�p~�E+C�vE�Ra�o��)�N�Z��&�B�\�(�"��@S=�eK� !�Ͼ�Ο.>���#�ŧ�/��x��$��?
]�t�^����+k+�1~�r�ؐ+:@�3O�WR����)l�-jڨ�PZ�ٲvB���k������(�������#J��;)Vǈp�wM�]��U8�o^f_����b,��G���X�Eqw�R�ai���V��@"�W��+2�=t:�}��J��F�ȁ�C�KB�փ"��S�����9V��9��dP��I�SP�X�p� ��\rտ�Ts�N
}���ka�^Wb�����2R�]B�^6�u��s�%ܙ.<$�\0K�`���:�s,�����(	�N3l[�����6 ���S=�+sa���>�(���t��JJ�.ޜ\���ҭO�c��?����\�^��r}��+��4��CEO��Ex=���#p�-�|x���V�X�W��-�R^^d\!�C���%��~�d��~G� ����!g����5�;"��l(���:��7��Z�к��0>��G[*|���
�����tv�s)�:���O���9m3{���cD�����V� ���1L��9�����p͑��r.�a����e(2���?��v7D1��կ��_�Ia���$ͱ�/\P�X��R�CK{�0d��/�$���'���y�$�9����M�l6^�6��W�D�$��.��l=�j챙�Vl8:z���q؄K�82r�_��{�-tE���B�	A�@;@���ɯ���}�/�d	3٢��l�Q�h�/2@�
��j��uۊ�v�gXew�3�[[�����Y
��V\�w*��c
��V��D����o��"��4��h���íc��X�7��EX��x���Y@7cȡ��([�,
K���4��B��ĕ�,e�CF bV�O�b$.��JA��ua}%�mA�=�ߎ����#<�e�MY�)�4��W{��7YݍTv�����p��~m���%@8��]@o����sU������H������]G�PnT K5M�Dp�u��2������L?ƚ@�@��)�t�������j������Pqё@��/{PEz����֚��<{Rs��T�t��j�n�+�QD��U3D�[kL ���3&/���Ay�ݱ�V
�F{��	)�����P�:B,�$�3mX���}Yt�)	hTU(����g�N;7��J��"h�(���)����`� �ռ`�i��	����a��&�&a�A��L���n�O��/���ވCH��ݰ�V�5��bO�"*�a�RKl=,��@�,n���KH�����K������
"�Uߒ`p�����ס�%���Q�Cw�m�P"f�`O��`���\ �U�*�R��NԯH�7��D3�Lh��W�;*��2�Em��vT�Z}�[�M�ja�p�yC�p9�� xY^�Y� ���c�	��RW�YAg�9����]����O~:"LaTR�b0UY@Ú���:��R	�i��.%ո�a�_K����eC��]1�ki��,��!=+D��xnZE�r}�ﴝŴ2�T '(�z,�+�z��v���I�N�fh��oo�x�8�'�2$�@z:GU&�8���		���<\� 7���+�'�5@7��C�Q��[c�d!XA٦�,N\��l�7�2Hj�$$j{�ٟ{!М��5�(���. 	��]:��)�r�.��r�b��U���=@���Xy�z�`�jS�+�f=�s��)Q�)u�u'I�m��J��H���SiN܌��'��"�O��f\�3ᵆ�ʘ�g�\��~,J�r��5�*	1fù�>0¬�
�v��bE����mLZ퍊i?�6�4��k����nUB$$����^�+�$x�{C�`t��14O³C�E�]:/!\��J���^��\�kSE��&C��o��Z���3���2�+8�(�z��&�
���c�3���b���+E*("��l�(�Ɨ�=y	l���)	"��{�UK�� FJ�H�˰��թ񺥈	�j��.�򌒫kKh^�QI�!!���7�����#{�V�0�3�ڇ�8���&���e�[���E� t�Ŧ3F���4�����`!�&��斈�QlV���97����*7��'}p���3�9��(��du���9VM��"r:te��|�U���|x��⩙��G��`xV$릿�۞6AVO�z�)NҌqB�j�&W0�*���e@=	�~1I�!l2�ي ��0�{z����zp� �E���1�
��I���QFoZ��Z�
L_�!T#_)7��c��3���˂���@hp�m�*�[�s�^8�zO��"#�e���_�q���$S:���ֈ�'8�(�>��� d��>�,�~ݔީ?�3&�cۜ�a2������Tq����/���s(�>��r�#��r#m: :���B�y��J�J��\N�a*������@>�����J*�6����j����PCx,���.��]RD�q�n���_�u��bx.�U�af�9�    n��P��VP��[bɮ���pJ��`|��+�ُ=�&��laҌ4B؎����@B%��|�V���D����d�H���5N3ݗ�����w?�����r�k�~~��*k洞��������p>_�o�Q��_4��B���)V|���:[�X���V�UF�K�REa[�:�E�	��onC���R�s�O>D����؀�C(��v�<��ℌ�z�����a�n�\B�D��[:�ʐ�b�q^z���c%ˉ���em�F�ݕ#u��?�3Ə����z��j�����24�5Hd�B�>�܁F�2H�C5i	��q��n@�>+����!�u��CE�K�S�|6A�� R����?/S��1���ZKG�7e�ň~K�c9��BԲ���Z`���wK.���n.Ű�����_�<�����[��*'ٴ,F�j
����e50!tU)4��MS�"�w��(S[�`�Ն�2�b�6��*b��zj��m�蟼�\�:�"L#�|6�=� �0���,7�S�����teK�։(��U��D������R%��-��z���e
���Y.4Q�5��P�G!-�Ё�Ya>"��Q�G����@sL��~�?J��kӝ;�Hg����Bc���uBn�����VE!*�C��M�������S���87��;f�_��ͥ�������i3R�J.æ�^�g��H�Ix�*�
DP��s0��Zo��F��s#�f�X���hc�K�������3^	Xn�<��6���I����ߟ���z��uM~3c�e>:3a���=�+O@K�N�[ܯ�%elq�<��4�[h�����4� "��F�E̢��AX��uَX�/U��ȣ$}8�q�P�/�59��d`&p\��M��RZ����gC�sǚ�A��_E�r��q��Y�4�5���JDO�
:���j@"���*̰��^��0���2s��ǩ�^+{�����2��)��*bj=d�2�lK�#"!�F $ Nh(]��g��e�;��r&�k+���Uf�F���X��JY64���F�9�GF�%BZ"'�U���JW�?�Zꊣ�j�uobfpyDܧ�#2�Ko��8h�e��{ �'�C��B<���� $��i��&��/7�DL�</�Xm��ź 6�A���O�z�wak����Rg�I�M2:�hā"��~�$�(9?�����^	N���x�I�q�0X�UD�!�
��up"^�cU.���W�I�3h^I��[8�Xa�{�*��7
���A3�V׽v����ݍ�c���e��K�:$UU��3(AĔ�-��:ad$���T<�Ep����������4�`���Q3�ނ�q��O��5��I��ICHe�<��8Z��)y�򤟷�|tc_�{o�D�L	��k�'�Q�i���A)��y���d࠼�k��U�?�w���L<V�I	.�?�
���/	��3\�mwq�=��H?*�����*��d�$����'5r��#����5�&���Gj� Y��Uu���
��>E~��=U ����#�c�E�� &��#:��|}��k+%�XX���r E3H�Ӵ�E�p��Z���q@�1"���bDH�A��0��O���g�9Hܫ�hi�QZD��<�Q�-ۼ�+!<��ު���(�ᨐ��V�cmYk��K�-� :)t��PjV_x(���x�<�3�+���tMU���v�)��3��|��FBbٳ��������k#�H�b�X�u��yiŖ���j/@ìJ�`1SRa�% �J֡���$Yu>B(�f}EP2
'Ս�R�ve�b�@��<"�:�⠬�'�/��*�Nlް�+ʉ�/^o������+�z�K){�2�O3!\�C/Df+���U�� �UqBF�)A=RfU�+)���y���7��)�h
9��I�&q}�"��ݩ!$�jC��}0�m��rA�w*�YP5��є�l�/VC�_:��VLYҒP:�Y4{�h�V4��V-�b�Y� ��
ع�i�Z��U�M�p��R8��V�Qh�y�&���@80q&QD4���0��+ls�)>���b��.>&Ef	�
W�T�7��,|u�C�=VAV5���RJ_�0��>N�5@��g��?K=y����ț����~"i~������۬y4�~ڌĤ'g�I!|Ja�NÕ�#6�=������Y�D(N��A�~��nz<�A�9�
�gz%+���i���q�)D����sW�^Pj��@]߈M�����s��j�1tU|c��O5|W����4��V��u�3*qv��^�<>���P�^�#���3����Ǳ�'��t�ˀ����w�ZRϾ@��6�a�w��j�	�e#;H��w��^F��]�'�֩�4���u��tv3�R�B����Z�5P���^vR��9�Kvm�G�:��{�n7
̼��/ʐ�џ�i..��ȍ�>�����IXI��)���ۦ�1RVl��� 1�C�-,WIT?&����7������H5���[�T�j.��!��C���M��mE�|��gL&S��@ �"K_4c�g�r����F'��?�Wq|���~mh�wR����Ch�qa"joB/B�RާL5Uu��Q����>q�hc�9ҟ�3�|�Gp	]	7s"�+a�F�~�蠱�>#���m����t�c���A��{gk�$K�ڹ7��?a3�ϋ������iD\9��xD�`O�C
^s�T_G�S"l��z�PRRw�P"BZk��p�Z���u�u�YkU�����tΐW��
q�+��������Է�RN�ϔQW��?�<����Պ�k4���SۨhO��/��~_�/r侒a��Qr_!3��ؚ_�n�p���+f�Ǎ�D�;(�~p��M���V9��Ⱦ���䧰|C��}�<�1�����:�[=�={ļ�%C���r������~�t����c1,��!��+/�R�6�
�L.�����;c���a��墡J:
i�ggĈ��R�\�_d�Ӆ����/�K�V#(�<3��x��Q�߽�d���a�
��߀��:7�^�/��q�H�8���h�����hDY"�0�ǂ �]�4���I���'��"��#&|Q� �|��(ʉ*C�C����b��RnJL�C�GL�f�2"��Gi������D	�?<.ȓR�æ`�!B���tW(�	E�l�y)	�:����RN�Ү���z�	S���_A?�Q�$7_�K�Dn�'G��O!�Oi̝2U��;��*�ܚ+�sxM �n�����}*��	�%�L�to<�!4�9T�Zi03��A����!l���	T��#�?�^&s(�)T���9T��̇$��Қ8%A���iw�#�m���0�
�1\���8�Z�ű�$eo[L�����"n�e�����#t��'���m��b�˘�Zz	��҅�"��4�Gf�ґ��B��ߏ/k��NCp�9������������~A��З0�1s� �T��
Mo�����o��:x7���<o0�|���y#s�x�1&j��Y��'LWmq��U���|E�����2��fOw�3�D� �W��h�I �N[<	J�3t�\��I�y�I��⟀���Xx���Н	�m��Y��G�p�Р�ks�"���0n���3��q��6ݏP�wP��V	n?pFV�&I	I��<��X=D �v.�0����g(������aW�2F������~z�x�E�$W�0��sm ������y��s98�g܇��V��� ���h�#4Ƞ;�+�C�T�sEIHC`�[5�b=��Z�Թt�T�=w�+����~�!;����y�(������G�F1�z�+���}�ZǴ3�H��_��1����k~��"��� n���]LS���|!��o�0�����^�ʶ^G%������(F�]�����ѳǖd$г�2�Gn�Wn��    �ߙRr��Z�#�����z
}���3AD��[�/�z�DHT��Lϐ0��;�7����W�nF%��؛��s�f�н[�d���e�㌻�iqֈ\ 6#5��ù�*=W�q�Qi���VC���^D> x�+S7���������ڿ�6V�0%�����2	��id����0<�� Ϙ�q�H޸�,���gL�(�ş�c|�8�c���ڛ8���!��|�R�̍���#cΞ|!�| 8�j�\ =9�"�'��@�*�FatchL��;���)����	���0�?����o����XE"�?:Dk�vL��UʁJ��H���Xk�>1{��~�j�,��?Ƌ%�'5wjh��i�j� � =�/L����v��#�MFH p������2����+�L�R�ݹ+V�v������EÃ��	��j��u@�����Ն� =�\O��-&
X�� �&�2���y���K��M�4��,K�:�4O N<�e����?�&�ݾZ�n�lh�P�����hq���H��L�� �I{�~4A�EcČ�,�<�'���Mjr	C.lE�l������L�̛���<Ra�t�0��Æ�Tu�Q�!�#</�y���{�\����x<3��[	'�J�T�fKz\�HȨɩ�� �"��Ĕ��h�T��V�J p-Q�L	}g���75@�����Cf��4!P����1��[�L����Z�!�����z.zv
I1I�
 �%�L�i�	A��&����d��f��LQw��S�@�
�H�@>qs����F����#sG�pę#���%��{�[�x���W-���؈x�)$����n���t�5�����ўڢ +�f�k7���d@`�w�葶��}d�V�ˣ���j�$d�6��k�J(���ly�G� 'y4�;��-s����t��dz��A���ؼM#�м�r�O��`.p�C���_Xw6��s௠n@���*��H7 hs��n�S�h��\�Y�T�J�d�8s���y!�I�4r�-_˒�`�����Ae��۔���kl�r�=)Xr���~��)�NKx진IG0(�����O���X
O�PNC���ꥫ��1�ɰ��#���G�lH|�l�I��ɛ-�����ߵ<v7: �)֔�<.rw���"*���Uܐ;s���Y����*;ҁ�"Z+��;`�l�J�ARl'(�c��|y���)؟�p� Έ�yh�e88���S�gT(M�ds��ڈ!���Q�Å�n@"s�ǁ+�{%k�g��0�t�5ZH�;�	f4�cjN�a�|��sɑk��V��A�Y,����Ӄ��grt�)`�����T���vA���8�� 6�A��2I���[�B5`�U�#aH��46����,}]��y0J�y�v)(8����H×m�26�Ka E��j݉3`Q�YOJO�1�J��عl ��_��sYI�kvCZ�H�jY42ˍ�GSq/*rH`�w�#����_q^���=vj�et7�0��a~?!D����=�^�t�ט�P
����!6��Ű��=�*���b��H?#B�����"�Fx�\<`}'\7����e�^��0[Y�,���l��6$U_�7�۽�i��w!%V?��/≶�Z��i��k�=1
'.�Hb
ū�aF����%�qBb�H{�6�F�̕js�8�7�ЎRP��v�Qo7j�_����?#s䋱ñ�N`��#$��Kp�'��N�n?@i����Z����b��Ac�g��>>@۷~�#���bs)B�d�n�[���1�J�Z���[���������i�~y���	�iӑT��MW�g�ynVq�_��9NM���W���aI�◴\i�MǍ{P���Nh٘1I�II�R��>���`��a�R�e3�J�8�G���m�����.� :��(���+^ �m5ϩ�zB�V�W��EdՇ����Sh�뀡�m�#߈��zY�x4R��y�{�/�P˜�NM��en�j���T;���~#���YJ9��]B44/�~����8Ȯ0<�>�c��5B�be(L�Pnz��`a���d�Lnޅw�P�\���ᚫ+�#e"	\�τT���^h���z��ڮ\�ef����m��|����$<��$q^�K"�3�
7�R3N)"�2�f��G�$��	��+ż/HJ�/dKJ���0N�x�9��Ⱥ��2^���!Z/���o@f���/���>�S�4n��H�T0�<gS�O�f@Z�pG�@��L@Z�/�+U���"'7!���]��1��p)q��jdc��W��	������]�1�9O�6�ܕ����=BDi9��l�9��l����'/8B~A,T�@A[�O����SZ�Pa�=kM#���S��#G���(��o��f^!}�9�pܞ�B�n/��n��t��Ԕi�?��H8h�?q�,%F����A~<�	� ~�Q1Ja�����a�swk��~<��!�θ0/�� ����4%1`��X)���u)�_΍��2�NC�A�a��`�0[�R����r]r��-�=1#�8ؼ̄���NY:;���2�'`���/3�+3Q)�"\�
%LyfRo�֔��4'�B��0�J�	��+�a���=�;1	��\��T\�ߒ����$���t�{\��.p]�J�������� ��-���F������xݡ����o�a�Үc�p��Z_zuo�	��]5R�>С��,�3��(��櫬���#|��:R)ID�o���W�E��� ��;"�y��d�_Z�8&0��L%nE�y�K�3�H[L�Q�ll/Uu:I�fK�G����vZ�';8~LF�.+TP�XS(�Iv&8$p�~!��A�;+ٸ���i�3MU��4:�#f�{.%LX�;D�����pJ`o�c�����AS�(�Y��"F���/�1�� ��z.N�y�S�*N�Y2<�2�5b��J!��Us-N�h�Y~�.ۛ�j��ai~��jӚ�8�ž0R"0�}�<��l���"�n�*�CFp}����r^���n���91Ȅ��j�vi����y�C�"����3��k)��ݻ�'%%�����(Z���$� A��ۊ�D{n��z���1z���%ű�����8R>���vy��aC	9�3��#�	P5u�.�B���z�����F^Q�l<�?�4$����u�f��nGV�S���x}�ߩ.���Bϣr��J-���xк��$r�� t=�MIq yO"�\ ���D��{)fÙ� �3����>��̫��x-2D?t��$D@L�$d�/{��� J�b��h��j����m��1?=b����4zD,>��gЮ��Ϡ}�z��Ά�z��:��@Ha�pH�I�8у����v�� �ц�D(�@H{~�&�x��[��'[ƹ.�~���0p`��un�ԁk�y4�ʣf4у����b��<��
L�|�G��X��Scc���"j���O��K;�H�S�p0+=���y
�'\����v�t,��8��U�M$�Ȱ��&=2|Z8�|��ւ}d'_����W����
#5Y����
��UJ�9�G�G��<dT|<՝]�`E�7#I>�A&
#,�|�"��}!�-_����0k��xɢ	�<��2Hfp���9�2���N�$�������0Ց� !
������:p]�`LK4��,�!t6Ffo��RF�'C�������o�՟��r0ӵ��ã�6�+�yk�H�#dʵ��G�!Skj3C�?���;����"eA1�Pڑ[�y��2qr�)���c��<�sNǥB�/␏Yq�XݴI�QM���� ��%9���[W�]S\v�[�p���'=��y�KtU^Np�3
������&tBn.s�c�I�j�J�8�����>�U�K�y�
dp�]�7^���/"D�BU��?�
yRB=�Uo0!\/�Z͘�+T4S���5u7++g�JE!�z� �  ��F�t�i�^Z�zU5�7�y����X�M}s=Z�e�!�G���y��Q�f�+%y�zk5;�i�'���� ����#3?�+�'��G�Q4C>Bw��g�)N��
_�;�>��K�8�Z��'�^��T��Az�/�Н�4T�.�:��ǻ���-����z�H�� ���u[�ǁ�8��E�%�<�V�a���o��˶��Q�ҫ��9K�������8����q�;r[\�Jǉ1�|�y�3�L��BQǌ�J⩳OE(�	���@���t4�U��������`����7���_���^I2�,1f%�<�ES���2ٗ���R`��N�߀�lL�eh�6j�|��ވ6��^������p(��5/�!��:"��"�r ��C�ϟ�y�g,)��H�$4>����R���p�i��$��:�h���^it�n��	]�{�H�r�-�'ԅ���EXWx;�Y3��\�*�4
���JTU��G	9�26j�Sґɞ�PDr�֘�_#���p<9)����������~0a{��t��.�m�VZ��+��s�	}�e�n�#�y�(��
�I����e�lߙF+�qCF�1�Bm��H �e����\�ˊ�̔�䵳aHZ��?��؋�;R�{8>�}Z�:�%r�I2�+/�֤uLT���Q�1�s�a&#$�?d>�=k#N����)g�?�?豻J�Az1 [�Q�S�e��]<���F���h@j���J���w
�	hn�^�w��[> �W1�T��y#�`�v�xHR&HCx֣��Ai�7 +Y1Z�^%��ʵÏPFηM�hC�i{3PhD�x�@���4$Y�G�e<�Y�c1mY-Im��p^�:ߐ���x�#ܣ/�����FK.;H�I���%p�{E��+�$�ʅ��k/Ci�Y7��\�>�@�,{+	c[���P%���*k������Ra< ���ۗ��	�(|�*�P �!��B��i��}�"���WOc�����W�S�5��u��ȴ@R�{b��CQr���F�Ps��lJÍ�T��'.(�*$^`³�p𜛇all8D8�w�eP)":���2+i��:5��Z�;�0|�4�>�����K{�!榢yA�R���c��MEip�䱇����i���oU�\?[=>!��X-~˦�1������#�����Z�9�6�,��XJ�	Ә��w�@Hm�hx�AtYK޲�l��T�e�[[��9D���8I��J�45���t��C���yAC�	-F��G��i�z��@�,��G���sn�4<  ����.'U+��ܸIW)����2y�JB)P]
��~ 9��̖����HŰ����W+�j!�ZU�ę�S���s�ib��xjal�؃�7�cx��b�z�B,�ʮ�G֌� g�qC �Bfq��cHa�9��i�)�ʞ�s���[	��6��r�>�U�(�����TBJ�9�̽@9x��<�`��6
-3#ӏ� ��zXkpd~�s߄6���pJf�4�R�֙�~�����=s��X0Z�3yb�-<��]��!y�ő�A0b���.|P�n@z5o/R7�ƚ��IGb�!:�a���ӕ�(�K�EY���*G;
��D�h� OTnN#�M(���1txJ/A$Y���3�'���>���
������Xk��
jhE�#��C�z��&8Vc�v�zv+>��؀�l�ќdc�~�� x���{�����b�K��W{	"��݌��O'*do����r�-�F��^f�2�W����^�v`z����5�R�[��m�鈼<m�¨�T�l���#mZ�:Jڜ`�DR�(f���^;3�wCN�w<C8|��@Y��	s��M�G�k�k+ikÌQcX5yG�3��5�at�P�i�+-��q�R8:���T�@PU�/�XQ���0��[�����]L��+7�h~T{Ӣ��U�׺��-#�\(1��h
i�{��P�i�.����dw�VA]d�6cƲ�������g���|����|^�U�7ɂ$�sL"�4˘!+�v���ܮ����j6;%�w�/�~x6��/Ҡn#�`t�ޔ�P����f0&βz�	n6�d��(�܆�x[���@�:3;2�v1�J2��I����jB=����$7��o����0�8N����a���u����.Zc�s��������.�]�dJj�|QO�;!<7VQ$s��|/�������܄�`Z|�I��]�e�ۡD�u����sL�.{h�������S��H��9�4a+!�}�#�����T��Aƈ\yv1��ۓ"8q"��B���G��G06'�F��7�5�*n�)��3O{V�l~JJ�N��$u�C��\�n`�D��M��(=R��d���ب��> ���6�;|����62��6À�S7�k`�;�lBv�{����0�i`��ư�~,��M1�f��Uy��h�� �ý�uo8�A�-�3�=��7w8�0�'Pȅ�œ���K<Lm]{!��~�鱆��}�h��M��e�<�s)���.�?�$	.n7Ѽ�VK4䀀�.�R���i ��Șl������$<?��NM� �j�Cg<�|݌�_�����9�����ۓ�W�]VE��}�?D�IV$�����p�B��C,0���m�8"�ٛf]���Q�\��pЬF��`�^He�DO�-�HI`6�+�
9%����f�I��^T:S�&�&!G�ٱ)CE�->�<<A)��1�|ڼ(?��J`T`/��}a�i�p+����luϙ!rjB�@L-�4��2�zm�|G%�|ь�Ja8[���8Rӟ%�ߏ�(Ґ�9���S*	/ue ZC�ߥ�
Bk���M�ЈV���9|�k���B����G����H%�u��_�v'�doϑ� ���K��� I-y���(��sm�jG2�ְ����8(�G^/��z��@�f�췱bJa�X�XD�Ò���#c�:��$�#_m_�����<�� �w{Z4��ޢ���g�	6��}�j����`�T�,i0��T2&����5�T6�M';k��$�jE� /+WE�R}����;���҄�h�1��59֋?�BY�<�ޠsa��\b�G�TB���z��*u�|����.lP�K}��s �89�s:2�;dV�f[�WP�=����l���\CmB,-���q2M)!�@2����'�^���؊yP,����ru)���a�]��nP�6��Ia�Xo%�<�0��x86kM�{8?�͙:ڟ��L�<{b���F�W �jֺ�)�䍢��?m.��g���\�d�܄W����u�$���6	<l�홢�4,n�gv�YF���]G-d7�fr�g�d���Z/4�5i��+K���w�[2��b�O�Z�,,6��8�3����i���3���M�������~�\�      [      x�3�t�IM��2�,�H������� ?D,      ]      x�3�����+�2��+M�IM,����� M�       _      x������ � �      a   '   x�3���O)�I��K�2��C��a쌢�T�=... 6/^      m   3   x�3�L).*��-�MJ��4100���4�4�2���*NNE�17���qqq ��i      w   �  x���]��@�k����,�3I���V�k+�I3F]�F���]��I��Lr�&�y���>��*��TE�O��w�:5���P���٩�����lVَ���.x4Nr]N����^�ej�xΣ�$ˏ
> � �����j�1��!�M�JarH�u~�q���)�7ջ8"&@Đ`����^z�&�۾�6$G��nĴ�`��6Ζi��ER���y����B��ҟ��s��S���\�R)3Q������c� 04N(��[�>� ����u�3gA�-�qc�N>����l�Xb�bP��r��NV'h�~��0���Mn��o�a�o�c�����1��+��G�n�%6�':;J�C�[<��*̛���_���ì�y.ߪ�?ײ^Y�əX�7H�X�댿!è�+ ^�?��`���s      s      x�3��N-���4�4����� &�      c   9   x�3�,B##C]s]KC+c+#C=cc#mS+c�?NCNC�=... �	W      g   !   x�3�t�K��KM-�2�t�O.�/����� `a�      k      x�3����K)�2��J������� 6��      i   !  x�}QA��0;{S�Iُ���	������{��EQ�����G����2�F���R�H�<ЌA��H$�d�����<w��JH��rČ����N�z9���X�e�2��ȑɩ��X1�&���U�Fݝl޿uA{��AɎ�
f����E�����ivӵ0�!�����ɔ����"�gS��T�p��[�YkEţ��y�O�<pheۗ�-N��4]s�!��a�=w��	o���!�XN����k���u��%j�,��rFi�����������r      q   �   x�=�1n1k�_�\r)} ��F>�l�	.��)b�.Fʾ�&��М��=5\'�D5��E���]��!:��a�������N29uE���;��#;f����
�j�NG�pA�@ ^����ᄥY�:CS801��>�����S���]y_��c��^�^ �<��p�߶m��:�      e   J  x�UP�jA=�_��iҵ7�oq��K	�i(����Nv<Zf46���6��"����ޛ�QG�$�O�N4�zA���~�78ETC�g�D-�y�V�3g�J�%<�]Ћ��c�+���Dz�(�`~7�qR�6	;�<���#g��AĒVͷ��	ז��9�����rh}9ы8���v�x���p��B54&={'`�J��
�+�]�*�|<⠩R]���jIp^��B���0��g���X�e��L�T��8d��~�e�s�;�A�s�E\��6���G_�r�8��:>����ŷ}u�h����Yc��Y�7�����z�xӬ6ˆ��w���/ɕ�      u   *   x�3�H,J�+)�2�IML�H-*�2�.)M���qqq �0
�      x      x�3�4�4�2�4�4�2�4�4����� "e�     