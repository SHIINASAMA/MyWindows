# MyWindows

Windows 初始化脚本，这将自动执行 Windows 需要的绝大多数配置。

> [!NOTE]
> 只支持 Windows 11 及之后最新的系统

## 注意事项

1. 确保操作在管理员权限下执行。

2. 修改 pwsh 执行权限。

```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

## 使用

全量执行

```sh
./Start.ps1
```

1. `Install.ps1` 安装主要依赖及其软件
2. `Remove.ps1` 卸载和删除软件，例如 `Microsoft Edge`
3. `Config.ps1` 对现有的系统组件及其用户软件进行配置