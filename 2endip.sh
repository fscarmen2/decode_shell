#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2endip.sh' encrypted at Mon Jun 24 08:46:07 UTC 2024
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
BZh91AY&SYd^�� �_�D0���m�߮����w��[�m������.�Cl  @% De6���z�MF!�4�@Ѡz� =&j =@����` � !��` �	�ɀ��0  �~�@= 4�@ C@F�  ��   & b`� 0d�2` FF&#  %yO@
��<4��MG���z�����F�di��z#�     ����TH�T*���������)
�B�
�)HR�Tx�և49��IP�OBUY�m�Uj��x�+�� ��m3�<,���R�\:ϓԩnd3�9b�i%���`�\*2�.�̑i6WT�PɁ*�H������/��x�=�M�e�!��!�.�@��8���;�_�ge}�����3��kx6�Y\����x�ROsF��`�d�H�R�..U�/-	��s�-�T+!��0\-��M'����ATC&����7��&�n��B�¶�b-5�#�H���$��<!�=7+�:LwqH^T;�)5$�ծ>�Y̊$ʒt$�o}np�7S�*J����&$��`3%��Axk����ipj��M )	�X�� ����� 0	`N ��MI�H��<R�Ea:�K�!Y�\�R& ��JUSZq4:����3nf��Y��Ԕ���7n����8p�����<�&,-V�gĩ[#���\�k�^�kꪝt��/MΫ��o.��6vV���V��U�\`��KS|~���'e���UG�8�����j�;r���gX�l���,DC̲3�\���-����f"">�H�ʥ;�"���ի�������z��om$V�P��S���!j��aȅ=�r�o����OAHr݅o�ݽ�W�!�sוsjV��D.�$<rc�frEb�ǽ�RۘϠ�(����qQ�L6K'��0��^�2-ב���ș|�r�S�I�M�K��Ydg����}l��0���cC+F�����KLd�l	�Z�-Z�$l[��Z������kM4T8��醟K!���Ʀt4:�Œ�U��:x!��n�rq���E�6�58�&�t��d$���1��y��.��"�/̤���,�&���sq�ٓj0|r.y�]��fTe$�,#hp�|�u·�r_[x��n�������:�8hMD�dV����l�j��2+�Y#�\�՜�J���V�jCFl0��Yk�H�,C�l+;اUq����ɦ�T,,64���f�w�o���e=V��o0�ӷ32�Sr����6�/s�0`���6ط�=~E:��d� C�!�)�|n)lU��v��Fy�|d�/i�n����\�6�|;R���` 
�c�k^F��F��A��C��F��Ql�?��D����$li�*e}Jq�
��ƪS���L:���l�Q�#�y/c�Ϧ�Hl�d��$qZ��֬s���]��BA�zgL