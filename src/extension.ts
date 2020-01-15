import * as vscode from 'vscode';
import console = require('console');
//import terser = require('terser');

export async function activate(context: vscode.ExtensionContext) {

	let packageJson = require('../package.json');
	const ExtensionName: string = packageJson.name;

	// Use the console to output diagnostic information (console.log) and errors (console.error)
	// This line of code will only be executed once when your extension is activated
	LogWrite("activated!");

	let myOutputChannel = vscode.window.createOutputChannel(ExtensionName);

	// The command has been defined in the package.json file
	// Now provide the implementation of the command with registerCommand
	// The commandId parameter must match the command field in package.json
	const show_all_vscode_installed_extensions =
		vscode.commands.registerCommand("extension.show_all_vscode_installed_extensions", () => {

			//	vscode.window.showInformationMessage('hallo welt!');
			LogWrite("cmd: show_all_vscode_installed_extensions");

			// vscode.env.clipboard.writeText("hallo ReinRalle");

			let dbgtxt: string = "";

			// loop through installed extensions
			vscode.extensions.all.forEach(function (ext) {
				dbgtxt = `${ext.id} ==> ${ext.extensionPath}`;

				myOutputChannel.appendLine(dbgtxt);
			});

			//
			let multiworkspacefile = vscode.workspace.workspaceFile;
			if (multiworkspacefile) {
				vscode.workspace.openTextDocument(multiworkspacefile).then(doc => {
					vscode.window.showTextDocument(doc);
				});
			}

		});

	const show_all_vscode_commands = vscode.commands.registerCommand("extension.show_all_vscode_commands", () => {
		LogWrite("cmd: show_all_vscode_commands");

		showallcmds();

		// For debugging purposes
		//scode.commands.getCommands().then((commands) => {
		//	commands.forEach((command) => {
		//		//	if (/git/.test(command)) {
		//		console.log(command);
		//		//	}
		//	});
		//);

	});

	const test_generator = vscode.commands.registerCommand("extension.test_generator", () => {
		LogWrite("cmd: test_generator");

		const simpleGenerator = function* () {
			yield 5;
			yield 10;
			return 20;
		};

		const generator = simpleGenerator();

		console.log("ddd 22");
		console.warn("Warnung");
		console.error("Error");

		console.log(generator.next());
		console.log(generator.next());
		console.log(generator.next());
		console.log("ddd44");

		// var ver: any = process.version;

		return "hello from: myextension.hello_world3";
	});

	const getcommands = vscode.commands.registerCommand("extension.getcommands", () => {

		findCommand();

		LogWrite("cmd: getcommands");
	});

	const openurl = vscode.commands.registerCommand("extension.openurl", () => {

		vscode.commands.executeCommand('vscode.open', vscode.Uri.parse('http://www.google.com'));

		LogWrite("cmd: openurl");
	});


	context.subscriptions.push(show_all_vscode_installed_extensions);
	context.subscriptions.push(show_all_vscode_commands);
	context.subscriptions.push(test_generator);
	context.subscriptions.push(getcommands);
	context.subscriptions.push(openurl);

	async function showallcmds() {

		var cmd = await vscode.commands.getCommands();

		var text = cmd.sort((lhs, rhs) => lhs.localeCompare(rhs)).join("\r\n");

		myOutputChannel.append(text);

		console.log("ttt");
	}

	/** print txt to log 
	 *  @param txt  text string
	*/
	function LogWrite(txt: string): void {

		console.log("[" +
			new Date().toLocaleDateString() + "-" +
			new Date().toLocaleTimeString() + "] [" + ExtensionName + "] " + txt);
	}

	// dev helper function to dump all the command identifiers to the console
	// helps if you cannot find the command id on github.
	var findCommand = function () {
		vscode.commands.getCommands(false).then(
			function (cmds) {
				console.log("fulfilled");
				console.log(cmds);
			},
			function () {
				console.log("failed");
				console.log(arguments);
			}
		);
	};
}

/**  this method is called when your extension is deactivated */
export function deactivate(): void {
	console.log("[" + "] deactivate");
}
