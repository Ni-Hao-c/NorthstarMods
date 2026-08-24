# SPTrainingMP — sp_training 挂载到多人模式

将单人战役地图 `sp_training`（训练关）以 `mp_training` 的名称挂载到 Northstar 多人模式。

## 原理

- **公开地图名**：HostState、多人脚本和联网协议继续使用 `mp_training`
- **虚拟资源映射**：`mod.json/VirtualMaps` 将 BSP、ENT、navmesh、STBSP、地图 VPK 和地图 RPAK 的底层读取统一映射到 `sp_training`
- **共享资源**：进入虚拟地图时额外加载 `common_sp.rpak`，离图时自动卸载
- **零地图副本**：直接读取游戏自带的 `sp_training` VPK 和 `r2/maps/sp_training.stbsp`
- **脚本隔离**：`.rson` + `mp_training.nut` 提供轻量多人初始化，不加载 SP 战役脚本

## 目录结构

```
R2Northstar/mods/SPTrainingMP/
├── mod.json                                  # VirtualMaps: mp_training → sp_training
└── mod/
    └── scripts/
        ├── levels/mp_training.rson           # 地图脚本入口
        └── vscripts/mp/levels/
            ├── mp_training.nut               # 服务器端：动态创建 MP 出生点
            └── cl_mp_training.nut            # 客户端占位
```

## 测试方法

### 1. 监听服务器（本地测试）

```bash
NorthstarLauncher.exe +map mp_training +setplaylist private_match
```

或进入游戏后在控制台：

```bash
map mp_training
```

### 2. 专用服务器

```bash
NorthstarLauncher.exe -dedicated +map mp_training +setplaylist private_match
```

### 3. 客户端

必须在客户端也安装此 mod（`RequiredOnClient: true`），否则会因 mod 不匹配被服务器拒绝连接。

## 已知限制

1. **无 SP 战役逻辑**：BT、安德森、训练流程脚本全部不加载（这是设计目标）
2. **出生点**：SP 地图无 MP 出生点实体，`mp_training.nut` 动态创建 `info_spawnpoint_human`
3. **AI**：原版 navmesh 会通过虚拟映射读取，但轻量版尚未部署 AI 模式脚本

## 排查

- 看日志：`R2Northstar/logs/nslog*.txt`
  - `Mounted virtual map VPK ...mp_training -> ...sp_training` → 地图 VPK 映射生效
  - `Resolved virtual map STBSP ...mp_training... -> ...sp_training...` → STBSP 映射生效
  - `Loaded supplemental map pak common_sp.rpak ... for mp_training` → SP 共享 RPAK 生效
