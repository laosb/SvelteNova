// https://github.com/apexskier/nova-json-language-server/blob/a64f704bee06071ad6fd82062a3656669d62b0a8/src/main.ts#L18-L32
export async function makeFileExecutable(file: string) {
  return new Promise<void>((resolve, reject) => {
    const process = new Process('/usr/bin/env', {
      args: ['chmod', 'u+x', file],
    })
    process.onDidExit((status) => {
      if (status === 0) {
        resolve()
      } else {
        reject(status)
      }
    })
    process.start()
  })
}
