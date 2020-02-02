import { EOL } from 'os';

class TestClass {
    public format(item: string): string {

        const sb: string[] = [];

        sb.push(item);
        sb.join("jj");

        return sb.join(EOL);

    }
}

let xxx = new TestClass();

var yyy = xxx.format("123");

console.log(yyy);