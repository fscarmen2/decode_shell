#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '1CFwarp.sh' encrypted at Tue Aug 20 09:31:45 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SYgz�6 F������������������������S���N� w�w��6��X�v���]=�K�Z�׻:ɽ�C����*�g����3yz����ft{{��V�խ�k�6����n��<�k��i^�wOyn�^���;�c^��ڍ�kV��s��XP�r�V���gZ��n�v'4�ӓ��))k"�{���-�٤�-o{�{r�֍��9VKMh�����kd�Ѯ�i��OG�����hIh����#MM��4`L!=O)�F	���'�H�5<��6��=L��G�   I h5�z�S���z����G���S�h6�4BF�     ��Oj�Pz@�                  ��jz#F�)�b$Ѷ��yL��)��0F�z�(�C�h4�5 h�@ @ �y D�	�F�&���
3&�)�����2�xOS�0� �A���4��M��@M���&M44�M�4<~�4ިha��3H=#C�H@�H4  h���?�>�Q:�������D"UUUT�@H�BA���>�|����b�ֆ�!xPi)�����D�%쨮$d�$���x�͹U|i}�p�k��vU��ͫ�{Ѽ�ior^�f"d�p���C�⣁;BRr Sn�ƃp�u����)�Cy>?�T����&��\���&NY0�Unu��=J�ܝ��f�.9����K�h��B�t;�z-�VL6%��|a����Ϥ�,���%�X�B��@6o��Pq��οN�h?t�������#�I���g@Oޓ�D	��}�z�RHgш���%�Z���ם\0~�l�j�gA4��^�w������j���z��S��'��{��+b��#x��YD����?S-9�c9�60(��ęX!��c�H�8Pݗ �N�0�{G��~�dnB�c5�9���&��H;���S�O���L�3VP�b��8��8e����K�<�}��Y�5×��=rk�o��d�p��0�q�����jBk�'7��B��Q0�WB��Y�ӷ��W�SM"f ض��s��J˂´_Q�-0����s�/r/k8�2�)��m�<�F3��ZY��Eδ�{�J�k��Rˀ�U0<vk���]#������i�- �� �,��~�-�>�uu.���Z�c�T�s�Jz���S�D��:�<�y�����S�hw9E�z���դㇸUH�1��#���e^�x��?�Nu���l$�k�~�zY7}hמM�y��9uyض����:�ǖ��e���8��|��;]{�j���5��
�Iy����#���16��k\�Nf���+��^Yެ#��>.Z���C3x��f{J�ܕ�k琂�6�d�x���a㳰�fԠ�Cf�2�54�l�����0I�#����0���J��)U�7-�N�v��ԙal҅�]��,�`cIh<H�6RZ�~w��cr7-Ҭ8ZwZ�ȼ`�c�,2Y�@��4�=?�CfF�1禘���<�i�x33���0���À\�9twLP���L`?���[тDS�A���TA���Y�J8���q���h1��G"Yo����1�K�O[1Â"Li��2�R���2���Rp=��/u�\��,����e�K��/�0gt�6�(��])�����Pq�3�s�؋�XL��bҖ�04>Wm�M�R��������Q�&£D�f^��q����u�C�&#h�2�0(ͧZr#3��l��v4h�5�8��ԙ��]$Oٝ�� �?K��~�!�+� �Q���C��T�������g��Cj�������
�H�`���Z���<a��+	T����>��M�X�����D���Q�췩���i(�)-E��3�����懭��x1ݜL#��/㝦�}�qE?����Ť)Z2>M}�ֻ֢(S�2`�*Ʌ�f
�����Ug,�zg���3���%���03���J>���~��;|$wŭ�(��@�l:.̄XRU�i�'��ND�Gy짾� �?G����N!�;��o.:�6�����/Cv��]niw��|	�n�摿���5Ý5yϩ%O�ؙ�id��41v��ﵯVµ��7��ک}��F�l�i��ƴ(Q5$�2a�8Z��X�r�}�e�a	��""GԵ��&_c㙴g?�+�f�)����v$��,� �֬��j1�I�9�"&pN#zH�G�)0l`�xvM#�����)��f��F[cX8I��9��G.=#	*LV���L�{@i�i'Ȯ;KKV廪�E��ejV݇�E!p\��*��+�!��psٽ���I��C�oDn�.V��0���Q)
IS~V��-�x;�;v�B�����CPo;�4\u=e�ob�8�2ېm_�f1(���ZVM�4�K1��@d �>^ؙ�fO�2w뛰�����	�Ƙx:[8;+|��@R�q��Sx('0ޢ�3+1�Z�
�VL��+נ��fD�GTSL�r	=��{��9���3쳇ۑ�`@vEFb��(Gd��	�	�F9���7���s�T�C�iax��5�c��SSK=b�&>t�f�On�6}�S	K=U�v�$�2=	����4�;�����N�U�l44Y]�	����Ge���:q5�p��?�k�HrP|	(ĄbE=�8��F��y�vs�0}�%�*T@zK��z\Lw�����aE��|�[{�xAJ����s�4�Q���AI�F��R�)<�=���${�#j!��J:�F@b�x��=��Y�pr8��g�Rc6��4�8]$�ϑ�W�Hc�]Aݜ;ڊ��I$��N���K6�>t���?ՙڟ�I��d���b��?���
0������%�(u[:B��0�2Y����}T���v~�����[�73��i��Zqώ�|�[�U0�e�x�a?);�U�)!C��y�%C}H;��prd#�KH5E��H%����D�{�7B�Y�
�l>��9R���j��m���v���m��[Lަ3÷3�f�NȿK�B��n˂қ�L�\�p�z��ӎ�͓�a�s�@�z����Jc3sT��\^Cs�B�֋�w6/QMQ���f�f��
,H�^�S��d�DBK�i�|��bt�G�w	��(�����M�&�%`�"ث����� o����I�Й��0�jB��������Q��)JSiⲇ|ӳO�`�#%�
 �r/��K^�m�P$������u+Ԣdf�`�� tO*C��w�=J��KZ͡��� ik��`�cQ���w�+El ��P|�3��A6 ���!��\R��ݷ��#.ޏ/pa�4T#Q)nS�o}X��C2.����S�P۵�3J�����֖����-��CI��.;��U/�7���{�s�e�W��=�졣��GD��b�Ge�!����납yT����UUJ�<�`it�C4�$��7� �������z�:2�[���$���.DϦOY�N��n;�h�Q��%&�V᧝�a��8�Py�҆��b���� 2�,�׆w(��g��Qd@`����=����C΍�mY�1D�
y�?��6X�o��8��$]ٽ�v?- �w��R�D�����[�4�B�	E`�Q�Z>���3���&���(��IR��K��O	�M*4�>J=5J�����vWп*p���$����vi�~��t�
gS1�܇�K�!�+U��o����V��*rTq��l/�^�ý��t
Q:d~��S{�O�h������0xqt���2+bئ��c��h,%���ڋ��I��J��9XŹ���􄵄���bF$5	��ă-?��u�ҦlG�M"�p���)�<���LP:
��)�j���!M�,���J�|��`��X�i[�����^���V��/8�\;eо��z�d^���K�le�y����ǃ��7�����mì�y�o>T�C����S4��c������6��?���M"t�4Q������֔��,p��l��s�3�����,^�5�Ϊ:��pC�!��{��=�qu(���E�!�F�.DR�`_5�g�.�`��0����ߘ�וv�7��DK�k�x�V�O�>�wv�#�8��:`s?��|�C=~`�`�H	�J�����$�CA��{l�u�`�/BC���ix�Fe�E�t=�ٛ���2j�1�,^e(�i����1!�{�(7�zҡ���Ʉ�$O$�Ht����JJF
[:�8�^*i}�^�ib�v��j�\Ә� T��I,�ILP��{.�AAt���p04c�2�'Ht̓7|0��`�Z��*^%L�,%=�`��%L\��"QM���t�Iʖ�Bot�к�M,�#psP���v$�Ǖ��^[����s0N43uS�� �I0$�^a$�;��,�>�|;� ����;\_p�"Q�a��}��*��v�㓖n}:�0�IV�섄�Mv�7߈�W�n��`Q9�����ʬ^��K&Qh�k/q�*�g������ZB��%)���Ħ���(JF�Dj"�=XE��A?�p���'�������\|a�Y�o%|������c�K���ٶ�Y+`n'�VzP�إ�=.��Ie	�14�����X�8P&K[��7)q���C��������O��jS�x��e�g����!#.j8wk��1g��,�}|�t��?W�E�(�$0�CM���֚[�퉅�K@3-f��l��Ä���|*�����3�Q�±�}�!���ȉ��L�1���e�r�Lϊ�a5�+@N��:��y�Q)�3�a��5��E��Ǆ�D�^_�����������;��~�'�yyֹ1��b�S&J��J����z� 3P@��R,k�Ԅ�j����|��t� ���Ͳ���8D!E433&��Ad2s:��i�N����7;��N���%؇�!_�NM�ʬ-H��|�k�>����}i� zV� ��r�
�f��c����Db먪���!�I<��va�&M,�od$�+5,8���*�����4l"{��&D�Ľ�$����ח/��`�j v��b>�D���'�3��qEdf����Õo�$���e:��h6E��rT�T��%hE*;	�zޟ�p��0*�*��>��b�=�p�U� 7u �VV��)JR�o罰p����)��OM�C�u6�
���ߖ��T�om`F�)��	4&�C��8��q}��}<�fs�:ۇ��U!E����0lŶ|5B#�-kZ���
��UPkK�t�`ѱ���m�&]u$���'�1�5s@e�#1�	##1l:K���Xc���0=VV*�ZJ*x�\���u iu�ɢ,�TPT��Y��%e�.��K��"J��p��=�����"N?�[�SC�(y� Q�.�˸�UG�g�u;��r���'�6�F\C�=���D�~��]���l�վ��	2����m1����?��&��x��"� BD}��@Z ���3L�C�d�B�*Y�~X�Q	O���/$Io����vi�E��>ɠ֞�^�AjS?.qܧ;�u9�ESH��q�E�������5��j70�F�H�q8{��\%�Ր��'D �V`���nP�N%A=w�I#i2�9|��֠J�M��d�P귕	�=���������*��.�V��
�	���S4�'鏶xS}N��=�6�^0�`�[�z���V*91��������3H�R�4��%�j�t�jR]�挝C�; L{���.,ʙ����J��x��x57��6���|9�Y�(\�@~ò�c�����eD�
 ꅩ��v��ш'��L]�=̣c��O:��{��C�TE�ɲ�M�v�uᆉV[��IJ�������`tr3����˥�eI�/�/�>�l��0���#L����,鑻��F`���������w�;=��C���[~ԩ�������6C��8N=Y���;!�#��#O��]R8��0G�cjrg��,C�����`ġ����C#K;)�7ó��{��'���Ɠf�L~u��#O6�w����]��� �C�M"+��e�������ZE>�w����7���I'G���������{F�L����?����C8U�U�l�o.�^w\��p�`�7D�?�c�+�3l��x�Y�I<�[K,)Qf)��?����M �R��Xz@D3���ð�fffk�����x,ƺ�$��cҔ���DԦ�B�w�T*x�)Wf��I��z����K���>�����>�˂F��Y�n�?����l�N)b1
�ħB��F��r�E�J5@% ��988Z8Qɀ��֎�bc�2���<x�n���A:B�� ^�P�:�F'E������g|�$4B$�_�۶��q��6J�(��[���~�K��V���窆?�,��?��D �Z��Y��G�G�Iy:y09[B���:8���[�����:��S��,��ۺ�*fW�^������0,�Ç�����}�+�+�%z�^QQd�L��-:�N���ݨڽ���~n�8EHLv��a�|��|��PA����@2��w�=��0��2&a�G����}��ZG�)d��Zx��Z'0S��1���}���i9O%��D���_uRt4#Ό�,}6�́��lp�9��]q}r
�0A�Oa*�����3��}�6��L�3���z�~w�f_���z�6���NsX��pDNa���
O��� �������P��@��Ԝ$!�%><���O�9ϐI�ێ vr�o;1t�=�]?��Lu�y��5L��O~�yVD �x�WuvD��^�G�4s�AϘH�PSE/�5���I��ą�	�g'93&�"���8:���1��v7�繽}rێ.j>6Li�8'ig�Qg�d�=E��͗+�I����������-��&�6��?A��T(����\�	x"��v�x��ǆFa��)��G�� �yg��!��̪�����
�����=������I=q��'���vq9cT�R���,()�J:��R4>9k� "�e2Ay� v�����g����f��d��m/�i>��w��0�PM��ԋ̿,T��S��4t�t�� ���\ �H���"鏝Pph9�%�(2�H�"�)07�n�?9+��C *�4<�u�^�oԲ�x���'���Q<ᨄN�M��pxE���`VIaj;F��Gﳊ�f�LOY]s��hM*~#���l�չ��{o�dL
?WÑ���lK���5����/�[�C�G♜��5�����]�_�^>vFP'+k��U�,b�T�!uČ�\��L+Ix��Xg3GXSi��v��q�L�$eĴ>��M��1��a�(t�b�I��x�nS�0F)�y�ED��K^'��)m6�b���O�~p�լ�@>`n
����'OH��Sf��HI*���ZRˮ?|�*��r0�h8J�X6vy4#�q�vtF̡5�[��vZ��Y�ϖX��JR���~Vt21�,GK~]q��0��4�D1����c�~a�T�\ ��P�L����1��>���@�p,7i+WC~稜��.&+��,~Kx�)�⋠�HďP>6�����xϗ��^#�����``�AÆ�d��A��W ���pw�[���>C�GxJ1Ff��@Io��R�|�<�DYD�,$WNT.�����VYܛ�,����z��*��)�H��@9�`P�6�������ظ}����v<G��-?zzdR�y���p̈�x�66نA�nE?Y�&��Ջ�/Y&=?�{LX�]9p|�|}���0<�;�7Є����ԯ�_Pg8m��7�H�0���')��\����=f���n#��v��(�`f�����7rxg��_c�5r�D��JgW���Po�?Tu�_=п8Hs���ǋΠg��"dB(IH@�0@��Hw�C��٣�������53#F�>��bP�@�R��B�b�~��0q�0I�H���:���!��f��rY�D:�Bb��e�(Y�j0a�<�L�Wޟh}ࡡ<��[��;ϳ����❈}T*�!����zI���\3(�h�S�52K�P�D��(�U�E2��͒C% ��G�+���]�:>�J�3�� ����(�.�i���Ю�����i�5��)�ڀ�!�c�P�c8�~��&w;	ۺ�̟C��[x��{�T�����U�D��ݪ&,d|�Nsx�����%�t�����둋b����<�hB�`ܚ��F�O|΃�I��P��c�2����͆�Ųa���!��	�Y�!��S�6<7���e��8E"���r60�U�>)A�\l�38�tګ��`���ͪ_�T8b(� b���4`���Jg.5�kj�y�B�B��rC�`�ʉ�� �}�#r]�8&S���,m��Y�^C�]b\;�&%�s�sF�x����\~Z'as��&�#4��T�F-Ш�.�v�Q�z�#�4�\��P?���12�N�4v�S�
uGͬ��wMO1�H]i����u�dA�Bp��;��nr 'I����P������x����8�T�g�Ѽ�|�	P��N��	��O��r��e"L��^�*�Id��
 k,ZIK'"��o12 ����=X��D�Fa8<��"ꊡ���&�0Gr�-(3P2�9;�6CsdȨ����gޙ�B2s#B�y蚠@P��ؙ��w��Cx1Z�x=�W;%e�Q4`��6&�\��C��X7�"LA�DA%���I�e<ݩ��(�S5�:)J�
�䔥�y[�DH�R�n���1/a��T��w4��=,���-H��=��3����]�l�@G�&x��:�!9l���uc{i�R�YᾡJ �c��]
�Z�E�d";ʆ{F�����`�������� ��pBôVH#�$J�?a�zD��'��(u��^����I���F&��WFm;@j2C#vb���2�i���4�"f!�l��D10(�dTa�\,��
���R���)��u� /l-�9ؙ�G@�]�7 �R�,l�)20u+���>ʃ_cg�^VV".R"�"Ǎ9ĕ)x�aX��K+�����S����wP��aj���?�"�A��`R>R���V�c�rX�#�)دQQ�JQP��*VB�m�O�����k�chK!%)�c6�8�!.T�D>�o^a&.���u�
Y���D>Z(]�B�E�"�E�8l��k��B��E(�����t�6��k�֋ۀ�9ȊYM�*(���J�3)h��}20�L$B�J����E�p���ry�*�q9	��H���?o\�/KcLG�D^�j�)�ܛc���8PƊS��Y'�"3��b��J��t�T[���I{�q��lb4/���𓘈�c��bd�^��{���t�Z
J��
R!:؅$� Դ�����!*��l2�E�aAie�IHR���8�F��t�0�'*p0���`�.�&��b�x+��������Ʒ�x��*�
U�h ��cCs��f�Lfj���3˔�/��9S�hD���yr���l���]�f��o����;�P�3a�͛�"wC&��q �TaгQ�|(�ix�H��D&����!��a/�6i
����!���&F����4@��B �G%��B*�]�~h8U�wq����{"���fN	@ID�x�PԱB�Ч��ļt�H�XKy��E;^=���:= 6�Bc w��))�gj��.@��ʈ���(}`:�����rN Я[����Zڀ=�gZ�s��
�`��@+b�)��(�4QE�rQ�pb� x#�>4��'���;�^eMk��� ��"|�܄ra�>���zK�00��"}�9�)DC	��5X���,���w������0�`pìC�7�}rqD3vPYX$��D	�(g��rD��N�6<����)]�N�2v�Lo�`�ۯZ!@�8��t��B����� 3�	s)�vO���R"ٜvY��o"Ҫ;'kF$���y����!�r�u)KYHkx�. ��yH�K��������0�:[�3�`��2������� =�uCM�O��k+�X���DK"Dv��p�5�pS�{���9��Ԛ���3���t��6I�hs�IR���bI�ZB�E�>ak*ƅH�r� �i �9��Z�2y���S���1s�\���U	APrP��"{jR	���4.��  �)�+���[H�j����� ��H��6q���97p�
�B�>�nP������������D`ݾ5�B����mj�� ����.��IW���0�d9��s�*�AǦ�Tx�@���N4�\�kX:e�-�K%���C�G����1k�O�&�뒚Du��}�&B��Q��_^��ͳ<������wv��ܜMlLOy����$�J^�q£�EP��ʶq"ay�z`M?Db�Xh
�����0%��������N��"�0���h�V��$��J^�n!D���fB+}��`D��{z``c����}�Ɋ����-2�KKI�]�_�&B�3k��DK��IsM�u���ͭ�Z�EŰH�C0+*(������s<�wPʸ���Y/�P���`�I��j�UO��� �-�,R&��ҪTU�T`�ܑZ�1KKO�l/����2����K�%h5����KTLA�0�^(�-B!I��℁�b���i��ɀ`j1�0����{8�,��驦Dd
�Vù�	��B.�1`X�}=�V�J��C��K��l	�A`�ؘ�\���&PC�bq���b���)�Xj"��� z;�kW���t�RM(LV��8E^w��0$dc	�0����]�&1U�� _ˇl�\H_5�7�vD09�P��P��4���3`��Mr#q���9�A y�eN��)�Xm*q�r`�ԣ����)JSd�EH����m[H��-���߯1Έ�����,sÝ�yY�$R�N�;�b��PWhm��B<����7#i$5������8�0�z��&Y��l1�h�(�Ԛ��]E�-�EFm�&�(�s�Ȃ��>�lc@f��s�e0x�Hb�`�l1��PTQ��Z�$���Mr�;��ApV��,�7�bVpX!�3'D蒽���vi6Zt�je�E{�=r�G���f�'��aܓ����RH��/�� i�k��I�󡤔�)H�L�h�to)d�Q�Cf��2�*����S���j���~�A�AJ�
�o;�l^aʾT�iw̠��:��F@��H�^� ��ti�YnL���T�UM����D��,ؤ��Q���Ju���!�3U�UzY6�(��dL�B�j$�B�ζH�9��E�M��T�'�G�L����x ��CM�����'	6L��+0���Hw�9�H�UK�L鷅�J�B�+���f�D��waQ1�{�p�!3�MHB��%�+∜퓣T���fA8�u�jK��h�S[e
�t�f��V�:	�G0y�ds��2!��Q}r�5����l"����&ܽ�灲4���ԋj	�4=�#x*1��ОZ����������gӔ�JI��B�a�a��Qv��T9�U{�ގR r^�e��d[�W{��"$�	�Sm*�t�u��&�;�j��'��	T3*s��4����4�dh��h�u,�xj�u�H盫�����H�+�J�'~�#�I��-Bo��2�:'3.y/C�S����[K��7��Xy>	ߞ��{��BD5Q՗@t#�)� ��J�A��`�w�֚��P��FZ�q2C��l`�(Zʩd��&���~g'ya�hv1E ��ڛ�y��x�������y'd��#�6�&��#��#����Φ+EQzos�&���P+v�UQH��>0 ����G>p̆���zRƠ�^�g"��N-v,��&�e����˱[��v��h�M��~=�a0���\�hi"I��l(5Ί��k�o���9K��3X�D!j�zf���Jf�����MQlV�%�RS"���Y�3=�5Ct��J�!�EN�N��&8*^�C�R�	\���� _4�6�i��3��h��)��bHQ���2h�g;� � ��I��%���0�&��XK22Ҙ!s�Rm����>!�Ue\U0hE�Q�o"Q`��nO��^.~@���!ҌR��{1��5HXgCBGJT��Jo���ãi��Nmâ��q�E5
i�������ٹ��9�@��ꠋM�\Å��R�B؜�bҷa��K��ڝ)i\�R��XG4�Hl���*�s�m������f���߫�rHSL�rQ)K^���Pk���C��//��^(I�"J�	���h��3}b�&���Aq�� S�d8 �qI�c�����v=�h���B���{���m�U�!
,Ɨ��R�y�����^v�È�ex�� fu�A����0L\��%�

��KqzS	�����t]7
4�w�td�&%�/��ȒT���L08�[(yj��T�,ɜ��E��`�E���0�2��\d�^#�p33#�4�������!5 ��ݛ�AP�h��&�L� �d.H4�7=b�^O�)C��&떵r1b��i����EJUo���\��D0j-EI-�Ng�rWZrg1P�u�SD!������y\Ҁ}�+��w�bs7�A{]�pl���"6h�R73�h(�8:�h{�jǿ�^t" |6����� �.���?�[��[�W�1���2u�~8bpz]� u�i���
-��16<�~�H�A�#	��z�8?Q��3���̋�N�]��AF�a��^_�w̆�d��������" �
��JG+HG�0���g b�.WA	d$BB�I����#�W�p��	��Xt�6�R��h]}��d\��W��@�A�0`3B��1$HJ�G <�b�5���`R��}q��寭�B��P40餠�1,�x���h-w�T��Ɋ�)�=��q'\���9;��v��|򨁡<M/B���C�Q��%kȧ��x[��ꈉ�!���U|l��.BP�ir�_����Q ,
/'��z?Q��w�",�xm�N��R�(�����r`L�	֐��/B)(r���c����8
n)�n���lI>�q��PA��zi��Ɉ�����.1.��f���h`��@>/����D_U>��HB���LA0������?�[�A��CM�@���A���t���C�
�j��ko���������?&1D~{b�1l���������SrHr�&�׬�����y?��Մ?��֑بJH�nF��%���fQ�h��`����M�?M���U��}0}H����Jhul8�t(����,�Uaw�P��^��S������EG�ꨐ,Bĉl '����C��kt0]�r�ߛI)�!P�B) w`��r���	�.a&*SL����I4�0Н�;`$�0@?J����D���:~Hx��.���.�7]rD�T��04I�*2�r��$����"'>H�������6(�Z`C�oC	e���R�	���_/afT0�QG@P q��^hd@��{��gQ΄ 30Q���
��/��f-�z���1#��B��KEXw�7�w!�1d�l�yeN��P��q�H��efp�R"�����輚�J��x	-j�R�p����3G� 4D��,d��C�μp7�mF��q�]*�X!�b<�X�� �ӡ^�4�z^��:V�P:���X\	��һ��S�z5��	����J9���%(��DB/���a�p5�G6@��۷�Bg�$�f�wN�lh�&na�ȳ��T��v�/A�/�KЈ�e̟�K����.�J�j�/�E6�� � �A뀱*����q:x��6O/HxJ� M��]bB#�\��֏�1��e��G����_צl=��o��2��(�s�^e�a���b��g��I`�$Bv!�� �q(^nS��(0�J�8�@�4DJ��m����SC�oi�c�]����Q8g�+k��hѩ[,g�!ѹ����T�hG5jT|�o	��'C`�4!��.a��Sx�2B��g�$q,��� ��2\��
R�bE{��_X�E�c<����}vG�`�-iJp�v��1�K.)^���:���%견�/��yf�'��@��S%T�R엺�z���0C�9��_���Ʃ#��"�����e��!�RN���Y'�ײ�x�*�9ф�j{�%��x�/��3��anz��rB����l��\\
=�`�@T�Fȣ:J�'���I4�=#��5�x��G>q�N��u�m>��E����4 h;��`K�DXG�[.%�/�X0�*҄J�WX'��O;��$����'��
D�iR�_��>s�7�&.�=���Ɓ�-�<��J�)��B�9�x^*2D�H`H�'Y��W�Cr|��N��?��c33 3*�?d�镘Cd&a�Hae}f}g�~�;�8����cM��{r������m���7��W1����^�ӷ�N?g�n3�cs�����ZIux�ﮣO	�}#�'3�}�ҧ-酉ǹ���9E�����;�]����-o��j�f���]��m�o��x2z�A�`���~�Qz�L����>o��*�D�SY��G�c�N��dDӅ���iіe��f3�fd̓*�B�tS'"��'��-��%8������=����R%���H=�V��r聀�_�%V��k\c��.����#���9��?���M=\�V^�MJRt��2KԲg��+Q��k��qeqyT�f��f������*9�5��^����S��;��<������&���q�u�8�p�vSlq|����]��n��xs�f��X�)f"_"�L&Z�,�C�Q�܂Ui�n���s�_��o��m3W����;������p��s�S1��ǔ	u���zOx�7�5Һ<��{�P����&nrp����&�uv�����UU��A�>'�S�2�qMP���;�cQ����:�����!�G|OEs@d�7�ڧ��ǽ��"�l��
���!��A\{��9T(���dA>�$�;@���&Ci�f�)�����(�.�P��s	>��F�0o׺U�H� ���������c�!�!~q>}&ff[L��Gt��G��E
F�볼Beʜ_6��v�q�'rǋ�W�yU
�>�c��x�.�][Z\��"J���O8��	{�dp��:�Q����& 	�7Vy䥚�KŚJ�l/Rfj)�9Tn��G�Փ}��-�Tq�1��n~g���9�˱8�>�#^�R�9�2��M�i�u�2��u�&9b�����a���3O�H%�MD��FYf(�300���� ��,��r�H		5CX�?���� �QMT�MT5�1�y?w��>�Q FJ�#٭@`)띝�n(O�Ÿ c:��� {ӽ�������p1Q��=j9��S	$Av�����p��j�P�u��n����T�UQu��*>My'_³�� a��*z4l`8p��\�@*�8 l��̌{~���U%��������;���"X��9�
��{�}�������a���B�,��֐��-��F�����hh�N��x�p�O:,x�}m��7�w�emR7�����<�����lY~�T��h'Vٮ�W4�UݹK�Ay-��.�r�L�55zk�����J;<���yg9�"��d�LQK����Tx������E*~�bR�/p�";���d�z�Z�=w�Y�Ҩ�T<T;�O��\9_���J4��d00h��dK_:#���ܭ7]oć�N�ǘ0Ϲ�����%м�S?�h3A>��z
�P�O�ba�y2��v\y�F���3*P��Ka-p] �-�\9[^��ʴ�kw���<y�㪥�~��"�g��x��P�ST S3q=>��@TcX�_d/��X<�m:[�W��¹=cx���}O���!�Oh���UC�Q3�#<H�����3뒉����,do3�����L�h�I~E�]�%� �0a��t�PN���yD��,�|a0T;Ķ>w��A�˹�ɩ|�r� ��EH�Z�u�`V�ª���x�[��#�gWW��~�H��a����YX�8��GW�х�>�%�{���{��P<]�MYl����(�T�497��C�͆����cjL!��c��Lp)
/c�L)=����Z�d�����a�3���Z�:=��rE8P�gz�6