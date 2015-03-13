#! /bin/sh -

# ユーザが個々人で記述し直す部分
# リポジトリをクローンした場所へのパスを記述する。
# リポジトリ名は補完されるので記述しなくても良い。
prefix_dir=${HOME}/src


# 以下、プログラム
symbolicLinkDir=${HOME}
srcFileDir=${prefix_dir}/my-develop-environment-for-settings-on-linux

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

