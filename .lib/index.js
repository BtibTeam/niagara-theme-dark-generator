/************** Imports *******************/
let vorpal = require("vorpal")(),
    path = require("path"),
    fs = require("fs-extra"),
    async = require("async"),
    semver = require("semver");

const CWD = process.cwd(),
      build = require("./build")
      pack = require("./package.json");

/************** Init *******************/

vorpal.localStorage("btib-theme-generator");
let ls = vorpal.localStorage;

/*
 * ls.getItem("theme-name");
 * ls.setItem("theme-name", "themeBtib");
 */

/************** Commands *******************/

vorpal
    .command("create")
    .action(function execute(args, callback) {

        let v = this;
        let data = {
            vendor: "BTIB",
            symbol: "tgen"
        };
        // Do all the necessary processing to build a template
        async.waterfall([
            function checkExistingName(cb) {
                let name = ls.getItem("theme-name");

                if (!name) {
                    cb(null, null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Voulez-vous garder le nom: "+ name +" ? "
                }, function (result) {

                    data.name = result.continue ? name : undefined;
                    cb(null, result.continue)

                });

            },
            function askForName(keep, cb) {

                if (keep) {
                    return cb();
                }

                let def = ls.getItem("theme-name") || "themeBtib";

                v.prompt({
                    type: "input",
                    name: "name",
                    default: def,
                    message: "Quel est le nom pour votre theme ? (Doit commencer par 'theme')",
                    validate: function(input) {
                        return input.lastIndexOf("theme", 0) === 0;
                    }
                }, function (result) {

                    data.name = result.name;
                    ls.setItem("theme-name", data.name);

                    cb(null);

                });
            },
            function checkExistingDescription(cb) {
                let description = ls.getItem(data.name + "-desc");

                if (!description) {
                    return cb(null, null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Voulez-vous garder la description : "+ description +" ? "
                }, function (result) {

                    data.description = result.continue ? description : undefined;
                    cb(null, result.continue)

                });

            },
            function askForDescription(keep, cb) {
                // We want to keep the existing description, simply skip this method
                if (keep) {
                    return cb();
                }

                v.prompt({
                    type: "input",
                    name: "description",
                    default: "",
                    message: "Indiquez une courte description pour le theme : "
                }, function (result) {

                    data.description = result.description;
                    ls.setItem(data.name + "-desc", data.description);

                    cb(null);
                });
            },
            function checkExistingNiagaraHome(cb) {
                // Get the niagara home, prefered from localstorage, then in env var
                let niagara = ls.getItem("niagara-home") || process.env.NIAGARA_HOME;

                if (!niagara) {
                    cb(null, null);
                }

                v.prompt({
                    type: "confirm",
                    name: "continue",
                    default: true,
                    message: "Voulez-vous utiliser le dossier niagara : "+ niagara +" ? "
                }, function (result) {

                    data.niagara = result.continue ? niagara : undefined;
                    cb(null, result.continue)

                });

            },
            function askForNiagaraHome(keep, cb) {
                // We want to keep the existing description, simply skip this method
                if (keep) {
                    return cb();
                }

                // Try to find the last installed version of Niagara
                let def = null;
                try {
                    var folders = fs.readdirSync(path.join("C:", "Niagara"));
                    def = path.join("C:", "Niagara", folders[folders.length-1]);
                } catch(e) {
                    v.log(e);
                }

                v.prompt({
                    type: "input",
                    name: "niagara",
                    default: def,
                    message: "Indiquez le chemin d'installation de niagara : ",
                    validate: function(input) {
                        try {
                            fs.readdirSync(input);
                            return true;
                        } catch(e) {
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
                // Check if the generator version is greater than the current module version
                if (semver.gt(pack.version, data.version)) {
                    data.version = pack.version;
                }
                // Increase the patch number of the version
                data.version = semver.inc(data.version, "patch");
                ls.setItem(data.name + "-version", data.version);
                cb();
            },
            function compileTemplates(cb) {

                async.series([
                    function(c) {
                        v.log("Create Arborescence");
                        build.createArborescence(data.name, c);
                    },
                    function(c) {
                        v.log("Copy sources");
                        build.copySources(data.name, c);
                    },
                    // Build.gradle
                    function (c) {
                        v.log("Process template for build.gradle");
                        build.createTemplate("build.gradle", data, c);
                    },
                    // settings.gradle
                    function (c) {
                        v.log("Process template for settings.gradle");
                        build.createTemplate("settings.gradle", data, c);
                    },
                    // vendor.gradle
                    function (c) {
                        v.log("Process template for vendor.gradle");
                        build.createTemplate("vendor.gradle", data, c);
                    },
                    // theme.gradle
                    function (c) {
                        v.log("Process template for "+ build.addRuntime(data.name) +".gradle");
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
                        build.createTemplate(path.join(build.addRuntime(data.name), "module-include.xml"), data, c);
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

        build.deleteArborescence(callback);

    });



/************** Entry Point *******************/

vorpal
    .show()
    .parse(process.argv);
