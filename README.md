# Nginx Begginer Guide

## Serving Static Content

This section explains how Nginx serves static files (such as HTML, CSS, images, and other assets) directly from the filesystem without involving any backend application.

Nginx uses the root or alias directives inside a location block to map incoming request paths to directories on the server. When a user requests a file, Nginx looks for it in the specified directory, and if it exists, the file is returned directly and efficiently. If the requested file is not found, Nginx returns a 404 Not Found error.

You can also use try_files to control how Nginx checks for files and define fallbacks. Nginx is optimized for performance when serving static content and can deliver these files very quickly with minimal resource usage.
