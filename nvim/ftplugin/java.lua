vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

local jdtls = os.getenv("XDG_DATA_HOME") .. "/jdtls"
local workspace_dir = os.getenv("XDG_CACHE_HOME") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local config = require("lsp").make_config()
config.name = "jdtls"
-- the command that starts the language server
-- see: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
config.cmd = {
    os.getenv("JAVASE_21") .. "/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx2g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", jdtls .. "/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
    "-configuration", jdtls .. "/config_mac_arm",
    "-data", workspace_dir
}
-- root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
config.root_dir = vim.fn.getcwd()

-- here you can configure eclipse.jdt.ls specific settings
-- see https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- for a list of options
config.settings = {
    java = {
        eclipse = {
            downloadSources = true,
        },
        maven = {
            downloadSources = true,
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*"
            },
            filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
            },
            importOrder = {
                "java",
                "javax",
                "com",
                "org",
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            },
            useBlocks = true,
        },
        configuration = {
            runtimes = {
                {
                    name = "JavaSE-11",
                    path = os.getenv("JAVASE_11"),
                    default = true
                },
                {
                    name = "JavaSE-17",
                    path = os.getenv("JAVASE_17"),
                },
                {
                    name = "JavaSE-21",
                    path = os.getenv("JAVASE_21"),
                },
            }
        }
    }
}

-- language server `initializationoptions`
-- You need to extend the `bundles` with paths to jar files
-- if you want to use additional eclipse.jdt.ls plugins.
--
-- see https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--
-- if you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
config.init_options = {
    extendedClientCapabilities = {
        classFileContentsSupport = true,
        generateToStringPromptSupport = true,
        hashCodeEqualsPromptSupport = true,
        advancedExtractRefactoringSupport = true,
        advancedOrganizeImportsSupport = true,
        generateConstructorsPromptSupport = true,
        generateDelegateMethodsPromptSupport = true,
        moveRefactoringSupport = true,
        overrideMethodsPromptSupport = true,
        executeClientCommandSupport = true,
        resolveAdditionalTextEditsSupport = true,
        inferSelectionSupport = {
            "extractMethod",
            "extractVariable",
            "extractConstant",
            "extractVariableAllOccurrence"
        },
    },
    bundles = {}
}

-- this starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
