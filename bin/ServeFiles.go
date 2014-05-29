// ServeFiles.go
package main

import (
	"flag"
	"fmt"
	"net"
	"net/http"
)

var ( //Declare Command line Arguments
	port = flag.String("port", "8080", "Define what TCP port to bind to")
	root = flag.String("root", ".", "Define the root filesystem path")
)

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
	fmt.Println("listening at localhost:" + *port)

	//Serve files
	http.ListenAndServe(":"+*port, http.FileServer(http.Dir(*root)))
}
