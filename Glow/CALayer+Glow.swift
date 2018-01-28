//
//  CALayer+Glow.swift
//  Glow
//
//  Created by Christian Otkjær on 28/01/2018.
//  Copyright © 2018 Silverback IT. All rights reserved.
//

private let animationKey = "glow animation key"

extension CALayer
{
    /**
     Starts the layer glowing; animating fading in and out the layers shadow.
     
     - parameter color: The color of the glow
     - parameter fromIntensity: The minimum intensity (opacity) of the glow, default is 0
     - parameter toIntensity: The maximum intensity (opacity) of the glow, default is 1
     - parameter repeatCount: The number of times the glow will fade-in and out, default is `.infinity` meaning that the glow continues forever
     - parameter duration: The duration a fade-in -out of the glow will take, default is 1 second
     - parameter radius: The radius of the glow in points, values from 1 to 20 work the best, default is 10
     */
    public func startGlowing(withColor color: UIColor = .white, fromIntensity: CGFloat = 0, toIntensity: CGFloat = 1, repeatCount: Float = .infinity, duration: Double = 1, radius: CGFloat = 10)
    {
        stopGlowing()
        
        func createShadowOpacityAnimation() -> CABasicAnimation
        {
            let animation = CABasicAnimation(keyPath: "shadowOpacity")
            animation.fromValue = fromIntensity
            animation.toValue = toIntensity
            animation.repeatCount = repeatCount
            animation.duration = duration
            animation.autoreverses = true
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            return animation
        }
        
        shadowColor = color.cgColor
        shadowOffset = .zero
        shadowRadius = radius
        shadowOpacity = 1
        
        add(createShadowOpacityAnimation(), forKey: animationKey)
    }
    
    /**
     Stops any active glowing animation.
     */
    public func stopGlowing()
    {
        removeAnimation(forKey: animationKey)
        
        shadowOpacity = 0
    }
    
    public var isGlowing: Bool
    {
        return animation(forKey: animationKey) != nil
    }
}
