import { dependencyManagement } from 'nova-extension-utils'

var langServer: SvelteLanguageServer | null = null

nova.commands.register('sb.lao.svelte-nova.commands.reload', async () => {
  deactivate()
  await activate()
})
dependencyManagement.registerDependencyUnlockCommand(
  'sb.lao.svelte-nova.commands.forceClearLock'
)

export async function activate() {
  await dependencyManagement.installWrappedDependencies(nova.subscriptions)

  langServer = new SvelteLanguageServer()
}

export function deactivate() {
  if (langServer) {
    langServer.deactivate()
    langServer = null
  }
}

class DisposableLanguageClient extends LanguageClient implements Disposable {
  dispose() {
    console.log('language server disposed')
    this.stop()
  }
}

class SvelteLanguageServer {
  languageClient: DisposableLanguageClient | null = null

  constructor() {
    nova.config.observe(
      'sb.lao.svelte-nova.language-server-path',
      (path: string) => {
        this.start(path)
      }
    )
  }

  deactivate() {
    this.stop()
  }

  start(path: string) {
    if (this.languageClient) {
      this.languageClient.stop()
      nova.subscriptions.remove(this.languageClient)
    }

    if (!path) {
      path = nova.path.join(
        dependencyManagement.getDependencyDirectory(),
        'node_modules',
        'svelte-language-server',
        'bin',
        'server.js'
      )
      console.log('using server at', path)
    }

    // Create the client
    var client = new DisposableLanguageClient(
      'svelte-langserver',
      'Svelte Language Server',
      {
        type: 'stdio',
        path: nova.path.join(nova.extension.path, 'run.sh'),
        env: {
          SVELTE_SERVER: path,
          WORKDIR: nova.workspace.path || '.',
        },
      },
      { syntaxes: ['svelte'] }
    )

    try {
      console.log('starting svelte language server...')
      client.start()
      client.onDidStop((error) => {
        if (error) console.error(error)
      })
      nova.subscriptions.add(client)
      this.languageClient = client
    } catch (err) {
      if (nova.inDevMode()) {
        console.error(err)
      }
    }
  }

  stop() {
    if (this.languageClient) {
      this.languageClient.stop()
      nova.subscriptions.remove(this.languageClient)
      this.languageClient = null
    }
  }
}
