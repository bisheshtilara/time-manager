const { defineConfig } = require("@vue/cli-service");
module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: "",

  pluginOptions: {
    cordovaPath: "src-cordova",
  },
  devServer: {
    proxy: {
      "^/api": {
        target: "http://localhost:4000",
        changeOrigin: true,
      },
    },
  },
});
