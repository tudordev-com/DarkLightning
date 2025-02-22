/**
 *
 * 	DarkLightning
 *
 *
 *
 *	The MIT License (MIT)
 *
 *	Copyright (c) 2017 Jens Meder
 *
 *	Permission is hereby granted, free of charge, to any person obtaining a copy of
 *	this software and associated documentation files (the "Software"), to deal in
 *	the Software without restriction, including without limitation the rights to
 *	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 *	the Software, and to permit persons to whom the Software is furnished to do so,
 *	subject to the following conditions:
 *
 *	The above copyright notice and this permission notice shall be included in all
 *	copies or substantial portions of the Software.
 *
 *	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 *	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 *	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 *	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 *	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

/**
 *
 * Represents a Daemon with which you can connect.
 *
 */
public protocol Daemon: AnyObject {
    
    /**
     *
     * Tell the daemon to start.
     *
     */
	func start()
    
    /**
     *
     * Tell the daemon to stop.
     *
     */
	func stop()
}

/**
 *
 * A fake implementation of the Daemon protocol that can be used for mocking during testing or unused parameters.
 *
 */
public final class DaemonFake: Daemon {

	// MARK: - Init
    
    public init() {
        
    }
    
    // MARK: - Daemon
    
	public func start() {
		
	}
	
	public func stop() {
		
	}
}

/**
 *
 * A decorating envelop that can be used to encapsulate a graph of objects that adopt the Daemon protocol.
 *
 */
public class DaemonWrap: Daemon {
	private let origin: Daemon
	
	// MARK: - Init
	
	public init(origin: Daemon) {
		self.origin = origin
	}
	
	// MARK: - Daemon
	
	public func start() {
		origin.start()
	}
	
	public func stop() {
		origin.stop()
	}
}
