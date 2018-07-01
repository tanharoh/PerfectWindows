if (A_Language = "0804")
{
    global _EnableBlacklist="启用 Blacklist？"
    global _DisableWD="禁用 Windows Defender？"
    global _InstallBlacklist="安装或重新安装 Blacklist"
    global _UninstallBlacklist="卸载 Blacklist"
    global _WillBeDisabled="将被禁用。"
    global _WillBeEnabled="将被启用。"
    global _AfterRestart="重启 Windows 后："
    global _RuntimeError="注册表操作失败！"
    global _isBrowserSet="我已将我的浏览器的下载目录更改至 Blacklist 文件夹"
    global _isDownloaderSet="我已将我的下载工具的下载目录更改至 Blacklist 文件夹"
    global _isExtractorSet="我已将我的解压缩软件的临时解压目录至 Blacklist 文件夹"
    global _isMailSet="我已将我的邮件客户端的附件存储目录更改至 Blacklist 文件夹"
    global _isDisconnected="我已断开所有 U 盘、移动硬盘和虚拟光驱"
    global _MailException="（Windows 邮件 UWP、Microsoft Outlook 和 Foxmail 除外）"
    global _ExtractorException="（文件资源管理器和 7 Zip 除外）"
}
else
{
    global _EnableBlacklist="Enable Blacklist?"
    global _DisableWD="Disable Windows Defender?"
    global _WillBeDisabled="will be disabled."
    global _WillBeEnabled="will be enabled."
    global _AfterRestart="After restarting Windows:"
    global _RuntimeError="Failed to modify registry!"
}