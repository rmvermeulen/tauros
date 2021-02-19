// here we can override create-elm-app's webpack config

module.exports = () => {
  configureWebpack: (config, env) => {
    // Manipulate the config object and return it
    console.log(config);
    config.devServer.open = false;
    return config;
  };
};
