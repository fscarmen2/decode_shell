#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'acwarp.sh' encrypted at Sun Jan 21 13:45:40 UTC 2024
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
BZh91AY&SY'�/� �_�d0�����������w���������������D    5�`P`�A%M�i�jm244�M�O@�M�)�I�5l��Q�4��!�  444��hRQ�C�b4�=#M&����M0@b@hd �!��i��a��	�� CCh���h��41M2i��0&�M �H�О��#�  4i� 4 Ѡ @ h A��4�! i��i�ɐ�0�040&�� ɦ� #C��&��#hф�� � �L&�i�F�ީ������P�)�3S#�h�� �@ ��ڇ��i���t�B݉�h�b�u��A��[YF蕊�{(SR@�vt	�KF��g�T�dm��	�]Sj��џz.�q�<�)��0V�Zn�Y�,'�n�8.�������l�����h�YC���\�]��H5`�+,��f�Q�n�5�0����v�z+�*b���ȁ�@�o6eSa�D��N�E�����v�%lن�X`�&�Y�a�p}$�*C\0C�@���P����y^|�n�T7��<�a�����[6�L�k�4-�'�i�:J*��x�s0$H�Q�h�����8�5S��I!$�൰��>�����	$BIO6�R��Az��:%�z����C�o�w;e�",H���(��&��~�F����r)��au����ޠi�eK�怖=�n�ҷ\��j��b�y��utߊ���m%B1]mxF����d�M���]��+�T<¬�3C�Sڎ��>V����5�j����b�Σ�"M5�,�{��3���j��c4�5P1L1-/ ��c��yi�t���eiHGZ�d��#��l�t1i�<(!a�����ERZ��U�C�|����BZ��86��q�A�L��$�UͲr��;kLrT��x�H|��ot�w/���b/�I5G\�OSO^eFJzz��ִ8��+$����g�מ�n!��A�o&a�O�J&��c�{���N��D��m��ʼ}hq/VD�z��������3w2R�ѮIBX�3���`�q���  jD���"�B��	$��M{;�5����w���Fn�؈�D��$��>��1QR�������G(J!�'�D�(�I`�m�n�2JRÄ��J�$_ ���d�%u�­gݨz8�"M8��l��)x!k��le6V\uB�e
Km�:��-z�8�ʮ�WmR�
�������T���Ć���`��zo޴�Ɨ3�|�����Œ�2qE���f�dL|��o��^3u4mFy᱇�"��VP;�n�O�~�����ٍ�ëz�s0Y���K��{ ���� :C��L�.�Lz��%�rh�۱��O���iC�Pĝc��^8�⥆*-��˦�
B*j�b�r`#�n��'P��FkP@b�UP8��,U��ru���{zq0�$�JA��4H�`FJ*�10�=3SS�7�rWi,��z0�we�<1�Dn�iM�W�1/3��$��f�p�E��S�7]����4R������'Uu��w��C�]/A��;��<nn�}�Y�xZ�W`�5�_�'����}��4�N�wR`a�6����t��mg�0;��	pd�i����=ʞ̺Յ�A�f1q.Gs��}P�]��)�Am��vΈa��&��pD�:f[�w
Ћ�u1K{܋=��wM�̗����ѹa��O�	lL@�Ͳ�N���}�_��h��ߎ���~ZyF�֙L�Z�#��&�m}�~R���]b��7u��2�u�^o�}�<�p��i:�6�r�|��c�2h<�
)���1�3>�X���Ʉ��G���~A��/��=��Z{�a�,_��.�N���d*p'	gz ��j�0�p���(R�k��!�Ȝ{��(a	!�K��\������$j� �`��R4DKXĦ@x�� ��.�"�2��ϒ{��9(p2��a�d�K^lt�K
�d����P�[]�༳HfBvKP����z�dk�d�X��^	�t0��x %p���3TӢ�	��!�ca��4r�Z��6���ٌ 84��'�<~���|�僐�¿����G#��w@D@ƌ�R�
�hh��2(利N�c���-��r��o� �HNԌlq�H���~@WD(劄N��	ؕYq`O����xR!�� �݁/Z���y�{K�p���V{����_1�D�� ��fr��G��N5��L��Hs_��D>��@�>8�>�z å>H‱��ܷ>�st������:8��z>k�G�ew��5r^�Q�[�z�Iٰ0����L5���\�B����p�v㿌fD7������!��(_np�x,R�� XH�ꤤwc	\�)&	���Od*9���$Ī��m�06��J�p�(d��2��D��,B��@HdJ�ｖI����ᨡ�x|0Aܘ���9�D$1�
��p�حr���@���Ь��9��r�(1jlCw &t�*��I*�\)S��'f��8�.�O�f� �J$���R�S���d6��P�1# }D����i�,D��ƙۺ�B�ı9�#)�7��,�s� ��I�밚��PGt�1������w}\���t7���K����ts����'��&-Ǣ""#��,p|�x�'�����F��m]X[�g�6NJ�*���~��<����Wa�m	:">�~��$�A�1���a �@���(�B�t)����S��V�3���`w����|�γK�^M�̥I��4l4�W�T���[�`'�lų�<\��D@p)�CyM���C�5����C�ѯ��(��R�� >��Ϯ0��۶���D4a��Mm�bU�T�$	�18V�D"9B	�ڌD�(	x�Z?*U�v�j�� +�18���0 �b����,k��
�$�S�y�,r?\y׫�x/���|W��qw��RM'(�"�PGQ�B��B�0�^̔J�E��/beM�B���Y�X �XdM�"�Vj�>2�������:��־��I��Re���
�*��,K8>��Ӏ���~���m�ͯV�|J�T �����Y?��D?��+k�AV$9i�@f�W�i�t��bc'���H��|.t�bi��`��Ydd]F@.:������ҥ����2A�ʈ��<]2kA;��S�-G��{e���0�)=|�E�`��l]�C��!ROU�!;�n?z�g3'l:s	��7����_9#��z���JD$���2:CI����Z��Л���/��)a�����!x�@��l����NI�`�	6����m#8xa�V��/\M�{���:����A��l.��5��Ŵ9h����%���.�5-"d���Yُ���<Y�_/�ߥ��/L�u�	�;2�����Zva�6�9Ww��	s}qzi)�R���a+#5_�W>_,�2"��Օ���_,��0t�)�I�J�ݷ��2-��{I���h4�R��t���� P6��% � �9-�V��XkKNn�(Γ�f�5Ȑ�(kEJ6%�9Ŋ�%��xl�2᷻l���Øˤ���:���%"Q�ޙ�l��G+v���S�Z�+4���L:��%B俜�i���Z9�_2T��e㻛�71�@_h���H�
����