# Platform

case ${OSTYPE} in
	msys*)
		#alias npm=npm.cmd
		#alias gitbook=gitbook.cmd
		;;
esac

case "$MSYSTEM" in
  MINGW32)
	export GOROOT="${MINGW_MOUNT_POINT}/lib/go"
  ;;
  MINGW64)
	export GOROOT="${MINGW_MOUNT_POINT}/lib/go"
  ;;
  MSYS)
	#export GOROOT=""
  ;;
  *)
	#export GOROOT=""
  ;;
esac
