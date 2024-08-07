#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '1install.sh' encrypted at Thu Apr 18 14:04:06 UTC 2024
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
BZh91AY&SY�, 6����_���������������������� `2�}7y�U�����sۼ�5�ާ�5����{�A����G�ٛ'N_ow;o�+��uz�^�����Gz�}��]����R������4 
��vi�[*�����7��9Uv�h9�   |$��4���!�jx#&��14�OAO�O�J����f�����S@�4�F@ (�1OQ�%	�ԟ�4���hF�@z���@��        4I2���S$�OP @� ���P� �  �  &�BhCI6*=4O@�S�=L�d44�h��F�4 �i�A��d�h  ��"�44M4O&���F�12Cj4A�  4M hh      �I@� �'�����Ц�zOI��hyhmF��44 �   �  ��a����)���kk6�{�vS��B-��Ro]����gEW�;����eN��a�A:}��S�9��9U�UrNƌ��Gpo秷��!���Y#$��2��1m�vF0��x˥�@0AV��2X0���y*(�%�e��@�,U�����pr:�v��y�K��k�6�=/�WnD�E7��2��6Ǌ�	���.�}�4��Ӂ��������O��e�S~˄R6R����Ĵf�:f:��D��.ܜb̈���eRqN��n�ٻN'�H������:ȉ��-��C@��HΗwV������/4�K�*���aѺ�2{Iq�;R{-��e�4�`䵌"BqG���QF�G�I!]0˱�c)����Z"a��Ұ.
6��	�)f/DZ����V����v`��L2���!;/�|�s���"��-�m5�ʲ�=��v��|�G�.A;:�ݽ�h�ڬ
�Z��e�x�/���2%`�B���Γ�4��*B�G6K$��z͕�	�SC	R)c8K����,�f(\cՄ��A��,��u��`U�(�Y@i�;������x]�;t�g���[jh������HI&�lH.u����V3G2�o0�T��a��X�,fB䥎�H<Udcު޼��˗%�"�E<��C	ɭ[>��l���N�ã1�K�����9�κ���a.��=����
y#5Z�OC�ո3#3Zϱ�e�ʌ��U2����~�D�����+���|ɾs���A-�PJ�$�6V@���k�LȆ8��p�0F |�Q �У��tB	�YG�~g�x����Ť��-O��y�wj�	�X}`~R>s�\w�S��#�4�����+�$�5���s���N���B�K$��{�	�F�@wj��.kr檛�e�+@�aV"`~�
�I���HVZ�E�X��0/x��UUı���mv�A�j�c.FQV��TP�6	A��0vT�� T`[���ʄ�T?D�#��;`#i��F��)s�Thj*2�o���'�D�KJ0Nj\9���4+I����"�8�ҽh��m룥�5�D�YK���O �~�9��,X�)�`ţ,8��P��TG5����c1XP:�g����˛���6�pH����m��t]�l�tL��	�ch�/L�ʉ)�h�'�����e�pJa�Sl�Y��эbBF6Xff)�W�`�R���r�Уa�������ǌ GK���=������|vr��s�m܅V�6�)C!.;�(�J��p��M��n��R��'np-��y�~���Xћ}D�1%'��X�I,&*��4
�� ���@���DK9�6�e�&&�:
~�@XjֱUQ�Y�ְ����$d5�5��{�,c�4zL�f�}"5E3�h�
c"3qy�6f
E��V(��|�����t�so�X���M`Z�*���Z��@�Uf�*��ŻT�d� H_WP�[c��|Q;x�&܆��*���+��9��ބ�8�7+����"�ҲLRX�
8e��;���`���x�o��m*s���D�B
T ;��㜪�{��f��*l�VXL� 6�[�ii>P�r�=;��%6�����JJ8��L�:3�s�{,Xx�)Y�HA<b�F��b�����iYFv��*VO�ʉOm�g)B�0�5.�d?	ӑ�줣2R蛮���oI��Ņ"�����.Q�ɮ����s7@�a0��]��&BR��o��a����.[t"B�K�[�-
��7�"{�����p(��įQ��t-,n�.t��y��f������E��X�bꩁʂ�~�戶2��1);���Ff/���������i�{�27�ߩߖ�5e��}���6jI:�Ԣv�/A����w,N��4#��,,3��K�Bف,b�������g`4�����(AkB�<΋�3�ϩ:1���>�YY�nN��/��m�:n.)V/y�*y�>'���`ǘ�2:��xq\p�|g��e��1��H�wɤH��_�w	�m�g�2PK&=`��#��UU$>4����O���fbf4�Q������S��I��f�߻�2��8d��Ǹ|ʥ�^��˘�ƾ|��R��۱��1��7h��94os\�:ǇU{7ͦ�ϡ�ݜ�U�&��_`�����=�hA#���Ǘ�(�����	�vk���)�����,��T)��k<q���Z���1q<����[v�h8����eDeG�E�Ṱ��6l��Ka���C��N����}��^C��oʪ�X�� �)[+�������:ȳ1�j]�0�7�h��F�j�A+�>7H�&�a�PY����#@Ү�X4b	$-@rEY�=C�*99d&��,�J�Va�UYe���TI�,dzP洈��֓���l��z!8pB�(FC�|�v_
�XU���� 4 PHɠC�����e�"$��� ����Kl-�R[9v6s.Z��]`�Ꮘ�/kVP�&e��w�q����C�6�%\R�m0�\��%�+/x`��BPz��=u����UUQ��gHR-0K�t��x�cb$,Ksm(!I�>�_ژ*�R��/t��
^�3�sba.n���bw1(:����F�F�5��7��ͮ��t����M���0y߇��oS�Nj!G��{���f��,����Hĉ��֑�����p�*�!��y<��9b�L���G��mƐ�L��[���((��]�d�p^� �A `|B@ơ�[r.ub�A������tpC����Y�����1�l:��-�XQ�X�V��~I�ŧ٨�#�,y��NM��2�fY��z(;�:b�(N%XH_d%�2H 2Ac_�8��@)��b1����R���������H
R�P*�-I�� �&��WH��x�qa
9��t���j6�9A��Iq���%�v�K|�)٤0����$�G��~*^r�OGٵjJJB��l�2�;�ĵ�,ժ�U�,"A$H86����k�X�N��?���Ù����ࡽ1����$ځ���s�&�s��]i��	Cyl����OJQ6�/����j���	h+�{�Y�9Ӹ�l���D~�ٖ�z�� i��&�(V��ä�l�}��I�s���4dR���!
��]� ��i�$��6v���2+�|���y¸�-�5�r�(ʍ&��K�I�dev�7������pd�dW"(����������Q�'��@u���"6l|�%��k�'��l�/�j�0.I6:̓����
��%I�V!4�.m�Y�sl�Aum�i �*���$�:�J+)]���t�
%��c��X�9�Z	��9pґs����U��8��o�6�5ҵ�1\��%��A6�l֤�+�QER.�y���B�H��49\�~��
7���X�\���Hv���[|S����~hjܞ:X֧�ů<��Vr	?�Ϧ(��<E]��^R�E�9z�p��V�������<�Ug����|R�\�[{	�!8*	u��hP
 @�BD`BmL2��~鯜�:{N:<{�}���<���K2�E����=y^FEeDI��ﮮ�2�
[3�l˅sni:�w���
��&;���`�Bx!WUX�neBZ������`��4k����͝�.0%��X�ڔW��M��[��4�6ŉ���m/�-��7���%�J�ߛ;O�l���f۹w��J&��L����q/��翡�^�Õs<�d�pƚ�����%(����K�ɾ�&��*�r��L�8$��6�LP���G$q�ę쎚NX�I�1�ku_�5,2yde�*V"���d�g���e;"b�^��r|;̤��d�-���Y���(��.�ّ3g����-/l��,��9�f1��̀�2 \g���%6�\��`T�RG
��dA�X�Q�/�04��
��CI��X�y�l����������-r�mX�)fm���}�Q�G��^x^��}�b���7k;>��E ��AJ�%��|ֱ!��������N�7"�y��s���&�
!IE�i1�t�
t�6	�Ç�F8���:0�)Ukua�ʥX>a�e�z)�"�!�-�I���b�c\Z����b^C��d����x��L'��R��H, (H��d��Y��5�8�0a�/�>u����[�x�?��eXiFI���N���N��1��L���l����"��}߱�_&�	�0�bQćز�
����!��ɶKW�PJ�*��9^j��"c�=���R�.�.w�����<�I�g�q�����'�HaC���U�Q0`{��3�iLi�.K1#0�kD���J-Ǫ�g��3�����aP�w�p�)���6RqNV�i�?L��i�R#ၭwL��Bs�DzUQ���,�W�4���\'ZTdb�� �"A$�����	HA�WE��"��jV�Da,����ؠ���4��Rr!ˇH��Am�X�I1��� u��e��g#�� ���gnfx9����M5�0�`�����D��g���8«Eףѡ�3u&�c
Qn�y�M�v1���p��
���� ǸE�,�dǕ�����׌�\(�Kr��޴8n��KZ�q���Aʱ'N�g�;_��S�ŏ�,6|yB��N��H�P�t�ZC���`n0�s�06��K����AA���1�&�%�v��8)�$�0�h��ܧI���\�ZX~�1�(�&g����8d/y�@�1%Ӂ�?�q����%qlv<�|X!jʈ��4�ē���
�c<�=��'N`.ДDB�A>�`����ˉ�Ehl8��������N57�����a-�P�~đ��ܽ.E�����l��bB0�B���)�4Z>�AR{n\,v��P{]�c��N�<k��\�c�q�� 7�c'�xb,�
Hr���>�& vf��&��,i�����x�Q��$\[;�^(����>a�$bQ�����;2y��C-n��� �=V�I�Ծ�35�#o1k5��5�h��2w�N��(�i���Ga��={���a��s�q/;-A�ޤ�ªp�w+� �t�K��,r��]լ��Cp��.�b�ՠ*��Md�tYJ��׭MDV��D4}AL�{v�2ж��Ku�:R����#(bPcrQű3�ک0)J�M!E��c〾<����z�X?�K��&�SG�8�!LS��,�C�k[��y���h)��0zư3q��&ĠT㬄)ּ&6<�2����f�M�#�h��� 5ǯ�f]���|�1�:%[�^�� �71�$�b���D�IU��R���Xq��8\���V*�ʾ��Ę�=3H%`á�5�������Sd�m�MM�LFƙ�e�*R�*
��I��N���f3DaFy�gep`�K��[��z�ݸ��(C�,c�_
�4!P�%�Ғ	D�f�!��(�UF�م�a��� ,����r��:��.���C:A�׮,��f��
���\�u�h7���)� Q ھ^g�8w)Y�t�7j��z��RN
,�+��M �H&�4F�z]����{A�I r���E��o��4�f��~+�uFC�k y�|t�~EB��v�'0��P�P����J��]�ֈ]Z(�r���E���*kqR���$Q0+*(nعC��l"�s$L�����0H��H��0QJ�@��p,�������)�#�15�7A���(M� k��6��Y�2�
8�@�3�"z��ư�&���Aȑ�.�V,�Ƌ Q	T�d2�b}��\X���)X�A� ���)��Ӏ�>�L,0�q���q-�'qM}N�r�nL2��£QSD �*�ՅFHH�g2z��|̸Nx���kDF}M:�0-��G`t�h�l08��n;E�����mYtG��	�0�ca��"��I"�!7�)$Y���q��%�"n�7;h� 8@�" a�vW���OP��c1.0�(Q
���KY��N���8��9`�܇0�1U��2E�����q �ύ��0lG�-I3H~X��,�^����PA��2�[�2�w7��_
�s]h޴@,6���������XE�N ZiB�_g��X�-q��� 9 iԤRBHI��<!�,La��+Y!4���Yi�
�|`���FQ�f��$���ç�	�R��?n�']��Y�d<`�[��Ws҃�i��(��J40�I��ԛ["�1KGV��.^6��H.��*��k��L1*��0�X�(3�^&��.`�$t@3�98�V,���c��`���@�V���=f͆p�Ǯj��F/@m�K,v ;�l/$N�|����[7�؆�'a͐2^zp�@w�J A`@� �� ������PC�C1�����0�[�W�79s#�΁h��=�D� �%c�j�;�ûh�ڙ��iR�Z�D��׶�'����}LL�M(h7�3N�j16��W��� x�<}@���N�w���s�2!�MF2��+�t��k0�c��/F�N��s��Ar�K�i¥�*H�t��X�SV4@m�[U)bH�6��
��R��j+X�Ye��@Ĺ
X%��(��BX�T��w�
M�
ĳ�Rd�P�?T�W�Y�CJm�	�R�1��>%��2Pӡ�t�P��1,9�a�g"8zk@p	 `g�Du�[�HD���1���RK��7�x�0g�F�#a��WMPU4PP`YC;�����T�"!�;� ��eM��2;�t��tZ�E�^�}�PĀ�2`�c,L	�i9�8hi��Ȍ�ɚ�Ŵ��CDcCJhs�+0$Kq�:�(�K���"��4�]l 0T�ū� Ph��4{K�]�=�Y���/C�q�3��N��P:`!!��Z�|�-�l��+��Wz0�Cr�~���K�:�����hS���T����Q�M(�f���4D���@�Ub�X��i5�XQ1q�h�Y�1�=^�'�Mu�T���m�L����|'�����Rsy��$�.�&$U	��Y$#�]U�ZIg�Ig���O�����DTc7�.X�~������	m���8��M��UUUUkF��`�������ՙ!�#5�S`�P*J�)�3���/��2Ȕ���>߈�s��� ;H��i6@p��)3�Ea�M�� ���
F���Bĳ$��M�0�jx�S�+�.���#$SXen�֯�'�:�%��Njlo<��| ��97���e��B.�<���#E�M��#n*`R�8"�ڪ��r(�*��Ir�@�0��t�l�A"��h}ɠT6���[[�{�{��]���Y����L
1 ��^�j �Uա�6-�ߥQ�&��T�U�k�9��
r�٥�t[iiܛ��R�$bR.k��&kfSd�c5�����Mݔj�j�7�3��ר�K+� �����G2Q��V|��cf$�RN%�M�@o��J�q�� X;�X4�Ǧu�J�h�Mݴ'�hC�l��T�����C-2����X\1CI((0��8ay:K�8Eƨ5��o��w���@9�·i�����M��/���8[ư ��0ZhyB�E��$��Hn��O*'j���f J8e}���[��G3���e�<r�ĴYPi�N�+OV�<�`Td�7U+�),aX	}:�p`�I��s+c �C�2-4�_6ȡ}�S9bdE#E�s
��^�hm�fZq��E9��-qL
v�+�T�83+���#` V26!���ou+1T%YXM�z��.j�@7�6.'*�'�+	��8��{hL��tx�}�	�,�gW���1[� _ zCYk�>��(j3�#���zS`��T�J p�6#��0��Y� �vw]��*B9^�
n@(���� 3
�N��8/R�1}9��ؚ�3y٠����A}�o0���;
�q��`Ȓ��v��f����BA$@5q�a,@BDA�I T�s�M��r 	����������7-͸��}�~o94$q+ro�_^$2�1g�lS('PI�ۭ��^�� ���p�Xץ}L���n`u��5���ZЂq��k8�$J�T�X�^צ�W7��d̲2 m��X�F�0/��M��bpOT�^���a�#��������'�����h�K��  �[��Q�dA�-*�2 [�u	���ņP@H��ykGƄi��F�=:9��"	3�	�SEmZ�S
<`^����^w������Q�n��9\iX�9ؒ���8D���<��H,y9�J�`@#�*5Q��4�;������ģ�
��Q_�,b4(������e��|�T�E&ᣘ����7?�SG���RX�aD���ȔD;;�P�6��6m�3�5K�MC�z�4(0�}	@�����zł����� O��-�. ��$`�@��
��p�	��-D��f����1�a�h�'9�
AF��*���*�X}��^d�~^9c�� ��w���ǧ����a�������į�I�:�8�1�\D�ޢv+������ ��� �����!�d�G�>8a��|CAC
������#����V>�Gr���Q<�s������賸���h����D�d��¦��'�����d}ݱ?P�����{��[8��:�A�����D<��sB,,(��'��%ڱz�/�:p����${J�l��A�ʁ�9ܒ�!r�@������D	2&�B~��?L��)�C"RIA�0����`d��Um����>�O>FX��ח1�a��'�h4�t�[�r�#�.D8$@-�O#�������r mq�,F'�RsQ���=�IJ!S�P �BDd�t4�0�p'	H[*��������g�ޱlX�@�܍������N�����Q¥J�oj 5mﺇ1ZЭL�X�҄�w�R\�`�ޚw%t����㨄�@W{��R��u\�ݛ����������ҫٌ�ub�_1'�*t��s�\�P��A��!�0uA)��m�B�q<0�����X�`,q(����8)�]����@�=BȪ�tVq~-�%����������IEQ�S�>A��1�8&it��.Gſz�6�ڔ{��L$L�gr�"y{���rT$~m~q�2�cHjC} 4=pr��d[�����12L~��:MIM�W�Q�A�]�*V�5����\hz���6��pR{��J;��.iA����yE���� ����L����D�q�xk!����\��t�]Gkc'z2���f9�1�t0�����x{���MA����tD'1�h5� �hE�Ӡ�����q����h�.&"��U��a�ύ����� ��	�iE�))�"H�)��{o��7=fS]i�C��GA:�)���dO�ئ�258��2�Z#�M1�|i��%5�#�T�.Un�n��u�
}�g*�|i^:�M�yK��gpUc	�H��Z��0�wLU���N�y!��N)�9OIZw�c�����y�O=T�V���ڋQ�C��
@�:V���<�}OD�eW��F�ݯ#7l���H��G7�]��EuxɐɁ���g�93S��<���}+^J-(η�#�ڹh��|[�a�:Ԗ�(f2�?8�Z��Lz�߰��tX��_�>�&«�4qlہ$U���ԉ�+ګc	WSo*r���.�W$k��}X��v�[��D7p�!U�u�Z"�����R4��=�d�ХYj���7zZ�Ҥ�f,K� ��q]�ʦ���f=��QX��E"����c�F������+>��r�"ד5��sY.
��zS�8ŉEY��.h��|q�h��c���;��"�}�Zt��\X�E����²��?&�1��U7N#Xv���ֺJ�6K�JuL}�a�5�Ώ���6�o�G�y���)�If�fA1�%j�~S��@��n�P�X)��p�)	�ý��i�;��]S�fI��TۤW�%��!��!���k�.�{v��s)nY��Vw;a:f�.29�����`]�r�]/�\8��-F8��cψ�R�ƨՆ���W')��1M�6sFv�����)8a�3}1�xs������+i�δ���G)�U�eYFG�uz)^�u��=��3���ܓu���Z�v0����1��g36\�c@c8��.�-M�!\��f?W)�Ր��1�Y���١5i��H�ֿ�<x���͚�bB�i�p⳨��w�ڈ�2��i1�X�*���m��e�s,��q�<�"b۶����)�}�`�