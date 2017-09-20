## Ethereum two-node private network

- Node Pool
  - RPC Port 16001, Username: user, Password: pass
- Node Bob
  - RPC Port 16002, Username: user, Password: pass

### Addresses

- Pool:  0xfbecb64c03c1f2cf36f39b6bfe4024f019292cbe
- Bob:   0x3cb81ed948a6ec3eedddcf1576d406a19d44ad73

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 16001:16001 -p 16002:16002 -p 16003:16003 coinfoundry/ethereum-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/bitcoin-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16001/
```

# enode://6039b6518cd7d311587159742f3300c9f9a03947b5fa18e9b4837f6a27e5460c9e1c8bf79e04c00461ffc7e70fa833d048e0e6ee5cf35c913a8e480ee4cfe760@[::]:30304?discport=0
