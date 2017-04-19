let fs = require("fs-extra"),
    path = require("path"),
    async = require("async"),
    Handlebars = require("handlebars");

const TEMP_DIR = ".tmp",
      RUNTIME_SUF = "-ux",
      SRC_DIR = "src",
      CWD = process.cwd();


module.exports = app = {

    /**
     * Compile a template file given a name
     *
     * @param {string} file Name of the file in the template folder
     * @callback return (err, func) func is the templating function as in handlebars
     */
    compileTemplate: function compileTemplate(file, callback) {
        var basename = path.basename(file, path.extname(file)) + ".hbs";
        fs.readFile(path.join(__dirname, "templates", basename), "utf-8", function readResults(err, data) {

            if (err) {
                return callback(err, null);
            }

            callback(null, Handlebars.compile(data));

        });
    },

    /**
     * Create a file given its rendered name. It will automatically fetch the template file
     *
     * @param {string} file final Name of the file to create
     * @param {Object} data Contains the data to be processed using the template
     * @callback return (err) if an error occured
     */
    createFile: function createFile(file, data, callback) {
        app.compileTemplate(file, function (err, template) {
            if (err) {
                return callback(err);
            }
            app.writeFile(template(data), file, callback);
        });
    },

    /**
     * Add the runtime suffix to the name of the template
     *
     * @param {string} name The name of the theme
     * @return {string} <name>-ux
     */
    addRuntime: function addRuntime(name) {
        return name + RUNTIME_SUF;
    },

    /**
     * Create the temporary arborescence to compile the template
     *
     * @param {string} name The name of the theme
     * @callback return (err) if an error occured
     */
    createArborescence: function createArborescence(name, callback) {
        fs.ensureDir(path.join(CWD, TEMP_DIR, name + RUNTIME_SUF), callback);
    },

    /**
     * Copy all sources inside the new src dir
     *
     * @param {string} name The name of the theme
     * @callback return (err) if an error occured
     */
    copySources: function copySources(name, callback) {
        fs.copy(path.join(CWD, SRC_DIR),
                path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, SRC_DIR),
                callback);
    },

    /**
     * Wrapper around the copy function
     * Copy files in .tmp/theme<name>-ux
     *
     * @param {string} src the path of file to copy (inside templates dir)
     * @param {string} name The name of the theme
     * @callback return (err) if an error occured
     */
    copyFile: function copyFile(src, name, callback) {
        fs.copy(path.join(__dirname, "templates", src),
                path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, src),
                callback);
    },

    /**
     *  Rename the folder theme in imageOverrides with the real theme name
     *
     * @param {string} name The name of the theme
     * @callback return (err) if an error occured
     */
    moveThemeImageOverride: function moveThemeImageOverride(name, callback) {
        fs.move(path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, "src", "imageOverrides", "theme"),
                path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, "src", "imageOverrides", name),
                {overwrite: true},
                callback);
    },

    /**
     * Write content directly to .tmp/<dest> file
     *
     * @param {(string | Buffer)} data The content to write to the file
     * @param {string} dest The destination path of the file to write to
     * @callback return (err) if an error occured
     */
    writeFile: function writeFile(data, dest, callback) {
        fs.writeFile(path.join(CWD, TEMP_DIR, dest), data, callback);
    },

    /**
     * Delete the same temporary arborescence as created above
     *
     * @callback return (err) if an error occured
     */
    deleteArborescence: function deleteArborescence(callback) {
        fs.remove(path.join(process.cwd(), TEMP_DIR), callback);
    },
}
