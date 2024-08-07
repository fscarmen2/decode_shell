#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2cfip.sh' encrypted at Thu Apr  4 13:27:09 UTC 2024
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
BZh91AY&SYAĀ� ~��0}����������w�������������tK�@� 4  @��ODbi�ީ�F�Cɩ�jz�C�lQ茙�� d����  h  @ �# Ɉ�L	�2b0�F�A�d2hɂ�!�#@��2d�5�窀����  ��             ¢�CR22&D@ � hh @#&�d �M 4 �# Ɉ�L	�2b0�F�A�d2hɂ�!�#@��2d�"��4 �S##F�'�O2���H�S#&���CMꌙ ��Ѡ���z�I���e6`�CF#v|�$%���g�7��R̭���t��=�d&TN�J�/��0a�m�Nd�S�	Q9VV�t��u��}��Pa�
�����f�[nIJ0�B߆rŖ˫Zಐ�-4S]T����U�E}\ �J��e}XJ�5fkĲ5�2 ��O\�m0��� ���ļ˥�ʴ�Cks���-`Pqy&�NR=P�2�n z�>x�;T�J:��h�çy�}�6�~�V���㟡2V5l�4e)�qV��!���p\�,A��� {�Z���~~ �h ���Ͳl#f׻�2\��	@#��""%�X��GQDDK*�% � ��̄�`��	 �f��Ę��B� �)�?��8�6=�(C@�t�6r�C�!}�f�<ҵ4o�K�;d�p��K��@b�s�Z�K�WuAՏ0�R	42m�����0-�&�(;.��ЃƟ��L���(=:������!ɤ��z��.P|�}���	�z����u����Em�d�yw3�{{���x��X_zF�������<�����ޔּ�#�{�<׵xb:��"" �I*��%g��,e�"CA��HP��0 ��D�[�<�HD�i1M��ۉ����_���'9Kd���"	$ȫ�%�$�X@�J P��L�;�g�<Q�\�d�$�rI �)�l�d`��0V=�2@�����Ժ���8S�N����[���@���!�t�?.���j�0�1��H`zVb��W�՜�9�s���;Z���&M>���W~T���WS�����S�����@���GU����t�P�6#6)�L��[m��m��m��m��m��m��3�Pe���h$�b�C`�5��A�'w��Ϭq�d`v4�O��0�0���ـ�!�wӼ�^�'y��)���,@��$���|�A @A�B�a�d9�&b�VDDHL�+�����N��1��/�nd�;��DDI,�&[�
�-R�@@�d,�%=2�0�� ��8�5�d I!QP߯D�a����5��$z�~�풗S��������Ԇ9�1����������L�i0
Qe�JÝ�B`KLWÈq��.��������C�'�0O�A��) :@�~9� ~D @w�?�K��#�m�B�/FOҬ���	�f�������"��@�H�.)�x9�8�����	e�Tp����Aٌ�˞Em �n	�H�����#5wkɫ_�]�fA$ف�V(D7L��˭"�dpT.����O�G'آ�������H��Ǧ00��00��00��00��1��O�Cڃ�헼��@U�Wx9���N��yW�Ⱦ��/�n��!��	z����<�N�V�8d��ٳ�MDJEt-l=�) 
H L)Yb���)�=0.O�-E&����e�	�[@��%A�Շ�M��fI��ݾb.��om��gxB�}�@ʹB!C~<�a?,�&�(�@9'^@d�S{�*0V���AHxt�e�4.�R��"����+�}*ȗ��%Nn�1�O'��b@�I$�B��fT�CZ�`�N�(V��8��4`yE7q���h$���!�!��q�j�ǹ9q��� ��e�W�)a$A�Ns�07�iL��ӡʇsq��X�sӛei_W.�DlrXm�خ�t��[�aSf
��K6��B�-2/� ��I��S@r4w�Y
\!�
,$@��jjP�KT#@`U��	Ē`7N�K�#~F����]�C%�y�7n�(�"%���p_��w��R@e����$���KC0�'�d�n-d����K�Q�A�Ȏ�aɡ�(�Xę�Q��� 垰�s�@Ft�2܌�r��,�e�rgB��AC�!�6>>+:t�EhE�]�l㠆;�ӎ"� i�Rd��a�  Sj�2$�dI����a `�`,f���Ɋh�K�� �A�@��(� �=s�@#�#��C��� o�!��<�뗝���,�Bo_��"{�!�wa�ťb<�B�<d����= ��1��_o�5���:��z��>�.�KC*�7~*�?�9�@�<��aF#A��{`A }�@P�� <Ѡ�CX�Q�0f6�C�� v��n��������@`AAG�};a�H.� $(��E��ddbB��'��}�E_	H�8{*�!B�D,�W�B$��Iq�P��/�O�? з��1��I��CY�~��
��?6�������񭕗������C1�ē]�j�B@Ձ�˯Ne��T�͆I������8��P5��b�4��!E�_q��pA���\O�\�8~1A9��z�«�8�U�������x�����m�*u�c��y���b�[����8[ ��bn4�:�C��lk��I��C�e  ���ȠLP�NZVp����gL;_?|�8�=3�P�y5�d�0w�������P~eyD�
k��G�Ț���%�Gf������H�B�����*�iG�z��B�9��E����>F�i�2�v��9:�����^k�}>�i�Z->HUZ�<��Wws'5�L9�)�k��7`���0�0�.`�u$\! :����RSA�����k��8��zkbv7�k<N`xê�<��7�d�1~�/PzT��E0U' ��R7��20n d��?�w$S�	H�