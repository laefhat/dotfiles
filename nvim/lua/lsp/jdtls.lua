local jdtls = os.getenv("XDG_DATA_HOME") .. "/jdtls"
vim.lsp.config("jdtls", {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    os.getenv("JAVASE_21") .. "/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jdtls .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
    "-configuration", jdtls .. "/config_mac_arm",
    "-data", os.getenv("XDG_CACHE_HOME") .. "/jdtls/workspace"
  },
  filetypes = { "java" },
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you"re using an earlier version, use: require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
  -- root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
  root_dir = vim.fn.getcwd(),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
})
