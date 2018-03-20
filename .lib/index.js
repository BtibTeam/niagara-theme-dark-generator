/************** Imports *******************/
const vorpal = require("vorpal")();
const path = require("path");
const fs = require("fs-extra");
const async = require("async");
const semver = require("semver");

const CWD = process.cwd();
const build = require("./build");
const pack = require("./package.json");

/************** Init *******************/

vorpal.localStorage("btib-theme-generator");
let ls = vorpal.localStorage;

/************** Commands *******************/

vorpal
    .command("create")
    .option("-n --name [name]", "set the name of the theme")
    .option("-v --vendor [vendor]", "set the name of the vendor (your enterprise name)")
    .option("-d --description [description]", "set the description of the theme")
    .option("-h --niagara-home [niagara]", "set the niagara home env variable")
    .option("--no-check", "Disable the version check and the automatic increase")
    .action(function execute(args, callback) {

        let v = this;
        // set default values, make sur falsey values are undefined
        let data = {
            name: args.options.name || undefined,
            description: args.options.description || undefined,
            niagara: args.options["niagara-home"] || undefined,
            vendor: args.options.vendor || undefined,
            symbol: "thg"
        };
        // Do all the necessary processing to build a template
        async.waterfall([
            function checkExistingName(cb) {
                // skip if name already set with args
                if (data.name) {
                    return cb();
                }

                let name = ls.getItem("theme-name");
                if (!name) {
                    return cb(null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Do you want to keep the name : " + name + " ? "
                }, function (result) {

                    data.name = result.continue ? name : undefined;
                    cb(null)

                });

            },
            function askForName(cb) {
                // skip if name already set with args
                if (data.name) {
                    return cb();
                }

                let def = ls.getItem("theme-name") || "themeActive";

                v.prompt({
                    type: "input",
                    name: "name",
                    default: def,
                    message: "What is the name of the theme ? (MUST begin with 'theme')",
                    validate: function (input) {
                        return input.lastIndexOf("theme", 0) === 0;
                    }
                }, function (result) {

                    data.name = result.name;
                    ls.setItem("theme-name", data.name);

                    cb(null);

                });
            },
            function checkExistingDescription(cb) {
                // skip if description already set with args
                if (data.description) {
                    return cb();
                }

                let description = ls.getItem(data.name + "-desc");

                if (!description) {
                    return cb(null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Do you want to keep the existing description : " + description + " ? "
                }, function (result) {

                    data.description = result.continue ? description : undefined;
                    cb(null)

                });

            },
            function askForDescription(cb) {
                // We want to keep the existing description, simply skip this method
                if (data.description) {
                    return cb();
                }

                v.prompt({
                    type: "input",
                    name: "description",
                    default: "",
                    message: "Give a short description for your theme : "
                }, function (result) {

                    data.description = result.description;
                    ls.setItem(data.name + "-desc", data.description);

                    cb(null);
                });
            },
            function checkExistingVendor(cb) {
                // skip if vendor already set with args
                if (data.vendor) {
                    return cb();
                }

                let vendor = ls.getItem(data.name + "-vendor");

                if (!vendor) {
                    return cb(null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Do you want to keep the existing vendor : " + vendor + " ? "
                }, function (result) {

                    data.vendor = result.continue ? vendor : undefined;
                    cb(null)

                });

            },
            function askForVendor(cb) {
                // We want to keep the existing vendor, simply skip this method
                if (data.vendor) {
                    return cb();
                }

                v.prompt({
                    type: "input",
                    name: "vendor",
                    default: "",
                    message: "Give the name of the vendor (ie. your enterprise name) : "
                }, function (result) {

                    data.vendor = result.vendor;
                    ls.setItem(data.name + "-vendor", data.vendor);

                    cb(null);
                });
            },
            function checkExistingNiagaraHome(cb) {
                if (data.niagara) {
                    return cb();
                }
                // Get the niagara home, prefered from localstorage, then in env var
                let niagara = ls.getItem("niagara-home") || process.env.NIAGARA_HOME;

                if (!niagara) {
                    return cb();
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Use Niagara folder : " + niagara + " ? "
                }, function (result) {

                    data.niagara = result.continue ? niagara : undefined;
                    cb(null)

                });

            },
            function askForNiagaraHome(cb) {
                // We want to keep the existing description, simply skip this method
                if (data.niagara) {
                    return cb();
                }

                // Try to find the last installed version of Niagara
                let def = null;
                try {
                    var folders = fs.readdirSync(path.join("C:", "Niagara"));
                    def = path.join("C:", "Niagara", folders[folders.length - 1]);
                } catch (e) {
                    v.log(e);
                }

                v.prompt({
                    type: "input",
                    name: "niagara",
                    default: def,
                    message: "Give the filepath to the Niagara installation folder : ",
                    validate: function (input) {
                        try {
                            fs.readdirSync(input);
                            return true;
                        } catch (e) {
                            return false;
                        }
                    }
                }, function (result) {

                    data.niagara = result.niagara;
                    ls.setItem("niagara-home", data.niagara);

                    cb(null);
                });
            },
            function updateVersion(cb) {

                data.version = ls.getItem(data.name + "-version") || pack.version;

                if (args.options.check) {
                    // Check if the generator version is greater than the current module version
                    if (semver.gt(pack.version, data.version)) {
                        data.version = pack.version;
                    }
                    // Increase the patch number of the version
                    data.version = semver.inc(data.version, "patch");
                }
                ls.setItem(data.name + "-version", data.version);
                cb();
            },
            function refactorNiagaraHome(cb) {
                data.niagara = data.niagara.replace(/\\/g, "/");
                cb();
            },
            function compileTemplates(cb) {

                async.series([
                    function (c) {
                        v.log("Create Arborescence");
                        build.createArborescence(data.name, c);
                    },
                    function (c) {
                        v.log("Copy sources");
                        build.copySources(data.name, c);
                    },
                    function (c) {
                        v.log("Copy package.json");
                        build.copyFile("package.json", data.name, c);
                    },
                    function (c) {
                        v.log("Copy Gruntfile");
                        build.copyFile("Gruntfile.js", data.name, c);
                    },
                    function (c) {
                        v.log("Copy mustache template");
                        build.copyFile("cssTemplate.mustache", data.name, c);
                    },
                    function (c) {
                        v.log("Rename theme override");
                        build.moveThemeImageOverride(data.name, c);
                    },
                    // Build.gradle
                    function (c) {
                        v.log("Process template for build.gradle");
                        build.createFile("build.gradle", data, c);
                    },
                    // settings.gradle
                    function (c) {
                        v.log("Process template for settings.gradle");
                        build.createFile("settings.gradle", data, c);
                    },
                    // vendor.gradle
                    function (c) {
                        v.log("Process template for vendor.gradle");
                        build.createFile("vendor.gradle", data, c);
                    },
                    // theme.gradle
                    function (c) {
                        v.log("Process template for " + build.addRuntime(data.name) + ".gradle");
                        build.compileTemplate("theme", function (err, template) {
                            if (err) {
                                return c(err);
                            }
                            build.writeFile(template(data),
                                path.join(build.addRuntime(data.name), build.addRuntime(data.name) + ".gradle"),
                                c);
                        });
                    },
                    // module-include.xml
                    function (c) {
                        v.log("Process template on for module-include.xml");
                        build.createFile(path.join(build.addRuntime(data.name), "module-include.xml"), data, c);
                    }
                ], function done(err, res) {
                    cb(err);
                });
            },

        ], function done(err) {

            if (err) {
                v.log(err);
            }

            callback();

        });

    })

vorpal
    .command("delete")
    .action(function execute(args, callback) {

        this.log("remove temporary folder");
        build.deleteArborescence(callback);

    });

vorpal
    .command("get-folder")
    .action(function execute(args, callback) {

        let name = ls.getItem("theme-name");

        this.log(build.addRuntime(name));

    });



/************** Entry Point *******************/

// Disable interactive CLI
if (["delete", "get-folder"].lastIndexOf(process.argv[2]) === -1) {
    vorpal.show();
}

// Parse the command from the command line
vorpal.parse(process.argv);
