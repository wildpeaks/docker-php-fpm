/* eslint-env node, mocha */
import {strictEqual} from "assert";
import fetch from "node-fetch";
import FormData from "form-data";


it("GET: URLSearchParams", async function () {
	const data = new URLSearchParams({param1: "AAAAAA"});
	const actual = await fetch("http://proxy.local/get-urlencoded.php?" + data, {redirect: "manual"});
	strictEqual(actual.status, 200);
	strictEqual(await actual.text(), `GET is AAAAAA`);
});

it("POST: URLSearchParams", async function () {
	const data = new URLSearchParams({param2: "BBBBBB"});
	const actual = await fetch("http://proxy.local/post-urlencoded.php", {
		redirect: "manual",
		method: "POST",
		body: data
	});
	strictEqual(actual.status, 200);
	strictEqual(await actual.text(), `POST is BBBBBB`);
});

it("POST: JSON", async function () {
	const data = {param3: "CCCCCC"};
	const actual = await fetch("http://proxy.local/post-json.php", {
		redirect: "manual",
		method: "POST",
		body: JSON.stringify(data),
		headers: {"Content-Type": "application/json"}
	});
	strictEqual(actual.status, 200);
	strictEqual(await actual.text(), `POST is CCCCCC`);
});

it("POST: FormData", async function () {
	const form = new FormData();
	form.append("param4", "DDDDDD");
	const actual = await fetch("http://proxy.local/post-formdata.php", {
		redirect: "manual",
		method: "POST",
		body: form
	});
	strictEqual(actual.status, 200);
	strictEqual(await actual.text(), `POST is DDDDDD`);
});
