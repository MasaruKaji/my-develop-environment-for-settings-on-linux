#! /bin/sh -
symbolicLinkDir=${HOME}
srcFileDir="."

bashrc=.bashrc
bash_aliases=.bash_aliases
bash_setting_path=.bash_setting_path
profile=.profile
bash_logout=.bash_logout

setting_files_list="${bashrc} ${bash_aliases} ${bash_setting_path} ${profile} ${bash_logout}"

createSymbolicLinkForFile()
{
	symbolicLinkPath=$1
	srcFilePath=$2

#	if [ -e ${symbolicLinkPath} ]; then
#		# シンボリックリンクを作成する場所に同一名のファイルがあった場合
#		# エラー処理を記述する
#		echo "error: ${symbolicLinkPath}"
#		return 1
#	fi
#
#	if [ ! -e ${srcFilePath} ]; then
#		# シンボリックリンクで関係づけたいファイルが存在していない場合
#		# エラー処理を記述する
#		echo "error: ${srcFilePath}"
#		return 1
#	fi

	echo "zzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
	echo "symbolicLink: ${symbolicLinkPath}"
	echo "FilePath: ${srcFilePath}"
	ln -s ${symbolicLinkPath} ${srcFilePath}
}

usage()
{
	return 0
}

# (エラーチェック)このファイルの先頭で記述した、シンボリックリンクを作成するディレクトリとシンボリックリンクに関係づけるファイルが存在しているディレクトリとが両方共存在しているかを確認し、もし存在していなければUsageを出力する。
test ! -d ${symbolicLinkDir} &&  usage

for file_path in ${setting_files_list} 
do
	createSymbolicLinkForFile "${srcFileDir}/${file_path}" "${symbolicLinkDir}/${file_path}"
done

