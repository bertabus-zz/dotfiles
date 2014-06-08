// httpserver.go
package main

import (
	"flag"
	"fmt"
	"net"
	"net/http"
)

var port, root string

func init() {
	//Declare Command line Arguments
	flag.StringVar(&port, "port", "8080", "Define what TCP port to bind to")
	flag.StringVar(&root, "root", ".", "Define the root filesystem path")
}

func main() {
	flag.Parse()

	//Print out ip addresses for each interface
	interfaces, _ := net.Interfaces()
	for _, inter := range interfaces {
		fmt.Println(inter.Name, inter.HardwareAddr)
		if addrs, err := inter.Addrs(); err == nil {
			for _, addr := range addrs {
				fmt.Println(inter.Name, "->", addr)
			}
		}
	}

	//Print out help info
	fmt.Println("listening at localhost:" + port)

	//Serve files
	http.Handle("/", http.FileServer(http.Dir(root)))
	http.ListenAndServe(":"+port, nil)
}
