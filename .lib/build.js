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
     * @param file name of the file in the template folder
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
     *
     */
    createTemplate: function createTemplate(file, data, callback) {
        app.compileTemplate(file, function (err, template) {
            if (err) {
                return callback(err);
            }
            app.writeFile(template(data), file, callback);
        });
    },

    addRuntime: function addRuntime(file) {
        return file + RUNTIME_SUF;
    },

    /**
     * Create the temporary arborescence to compile the template
     */
    createArborescence: function createArborescence(name, callback) {
        fs.ensureDir(path.join(CWD, TEMP_DIR, name + RUNTIME_SUF), callback);
    },

    /**
     * Copy all sources inside the new src dir
     */
    copySources: function copySources(name, callback) {
        fs.copy(path.join(CWD, SRC_DIR),
                path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, SRC_DIR),
                callback);
    },

    /**
     * Wrapper around the copy function
     * Copy files in .tmp/theme<name>-ux
     */
    copyFile: function copyFile(src, dest, callback) {
        fs.copy(path.join(__dirname, "templates", src),
                path.join(CWD, TEMP_DIR, name + RUNTIME_SUF, dest),
                callback);
    },

    /**
     * Write content directly to .tmp/<dest> file
     */
    writeFile: function writeFile(data, dest, callback) {
        fs.writeFile(path.join(CWD, TEMP_DIR, dest), data, callback);
    },

    /**
     * Delete the same temporary arborescence as created above
     */
    deleteArborescence: function deleteArborescence(callback) {
        fs.remove(path.join(process.cwd(), TEMP_DIR), callback);
    },
}
