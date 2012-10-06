text = ""
ARGF.each do |f|
  text+= f
end
# Automator is picky about this being on multiple lines. 
# I use Command+J in Sublime Text to combine it to one line
# before I copy it to Automator.
puts text.gsub(';', '')
      .gsub('NULL', 'nil')
      .gsub('YES', 'true')
      .gsub('NO', 'false')
      .gsub(/\n{1,}\}(\n)/, '# }\1')
      .gsub(/\n{1,}\{(\n)/, '# {\1')
      .gsub('//', '#')
      .gsub(' @"', ' "')
      .gsub(/CGAffineTransform ([\w\d]*) =/,
        '\1 =')
      .gsub(/CGColorSpaceRef ([\w\d]*) =/, 
        '\1 =')
      .gsub(/CGContextRef ([\w\d]*) =/, 
        '\1 =')
      .gsub(/CGFloat ([\w\d]*) =/, 
        '\1 =')
      .gsub(/CGGradientRef ([\w\d]*) =/, 
        '\1 =')
      .gsub(/CGRect ([\w\d]*) =/, 
        '\1 =')
      .gsub(/CGSize ([\w\d]*) =/, 
        '\1 =')
      .gsub(/NSAffineTransform\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSArray\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSBezierPath\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSColor\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSGradient\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSRect ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSShadow\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/NSString\* ([\w\d]*) =/,
        '\1 =')
      .gsub(/UIBezierPath\* ([\w\d]*) =/, 
        '\1 =')
      .gsub(/UIColor\* ([\w\d]*) =/, 
        '\1 =')
      .gsub(/\[NSColor ([\w]*)\]/,
        'NSColor.\1')
      .gsub(/\[\[([\w]*) alloc\] init\]/,
        '\1.alloc.init')
      .gsub(/\[([\w\d\.]*) addClip\]/,
        '\1.addClip')
      .gsub(/\[([\w\d\.]*) bounds\]/, 
        '\1.bounds')
      .gsub(/\[([\w\d\.]*) closePath\]/, 
        '\1.closePath')
      .gsub(/\[([\w\d\.]*) copy\]/, 
        '\1.copy')
      .gsub(/\[([\w\d\.]*) fill\]/, 
        '\1.fill')
      .gsub(/\[([\w\d\.]*) set\]/, 
        '\1.set')
      .gsub(/\[([\w\d\.]*) setFill\]/, 
        '\1.setFill')
      .gsub(/\[([\w\d\.]*) stroke\]/, 
        '\1.stroke')
      .gsub(/\[UIColor colorWithRed: (.*) green: (.*) blue: (.*) alpha: (.*)\]/,
        'UIColor.colorWithRed(\1, green:\2, blue:\3, alpha:\4)')
      .gsub(/\[\[UIColor (.*)\] ([\w]*)\]/, 
        'UIColor.\1.\2')
      .gsub(/\[UIColor (.*)\]/,
        'UIColor.\1')
      .gsub(/\[([\w\d\.]*) appendBezierPath: ([\w\d\.]*)\]/,
        '\1.appendBezierPath(\2)')
      .gsub(/\[([\w\d\.]*) highlightWithLevel: (.*)\]/,
        '\1.highlightWithLevel(\2)')
              .gsub(/\[([\w\d\.]*) setShadowColor: (.*)\]/,
        '\1.setShadowColor(\2)')
      .gsub(/\[([\w\d\.]*) setShadowOffset: (.*)\]/,
        '\1.setShadowColor(\2)')
      .gsub(/\[([\w\d\.]*) setShadowBlurRadius: (.*)\]/,
        '\1.setShadowColor(\2)')
      .gsub(/\[([\w\d\.]*) setWindingRule: (.*)\]/,
        '\1.setWindingRule(\2)')
      .gsub(/\[UIBezierPath bezierPathWithRoundedRect: (.*) cornerRadius: (.*)\]/, 
        'UIBezierPath.bezierPathWithRoundedRect(\1, cornerRadius:\2)')
      .gsub(/\[NSColor colorWithCalibratedRed: (.*) green: (.*) blue: (.*) alpha: (.*)\]/, 
        'NSColor.colorWithCalibratedRed(\1, green:\2, blue:\3, alpha:\4)')
      .gsub(/\[([\w\d\.]*) shadowWithLevel: (.*)\]/, 
        '\1.shadowWithLevel(\2)')
      .gsub(/\[\[([\w\d\.]*) highlightWithLevel: (.*)\] colorWithAlphaComponent: (.*)\]/,
        '\1.highlightWithLevel(\2, colorWithAlphaComponent:\3)')
      .gsub(/\[\[NSGradient alloc\] initWithStartingColor: (.*) endingColor: (.*)\]/,
        'NSGradient.alloc.initWithStartingColor(\1, endingColor:\2)')
      .gsub(/\[NSBezierPath bezierPathWithOvalInRect: (.*)\]/,
        'NSBezierPath.bezierPathWithOvalInRect(\1)')
      .gsub(/\[NSGraphicsContext saveGraphicsState\]/,
        'NSGraphicsContext.saveGraphicsState')
      .gsub(/\[NSGraphicsContext restoreGraphicsState\]/,
        'NSGraphicsContext.restoreGraphicsState')
      .gsub(/\[([\w\d\.]*) drawInBezierPath: (.*) angle: (.*)\]/,
        '\1.drawInBezierPath(\2, angle:\3)')
      .gsub(/\[([\w\d\.]*) drawFromCenter: (.*)[\s\n]*radius: (.*)[\s\n]*toCenter: (.*)[\s\n]*radius: (.*)[\s\n]*options: (.*)\]/,
        '\1.drawFromCenter(\2, radius:\3, toCenter:\4, radius:\5, options:\6)')
      .gsub(/\[NSBezierPath bezierPathWithRect: ([\w\d\.]*)\]/,
        'NSBezierPath.bezierPathWithRect(\1)')
      .gsub(/\[NSAffineTransform transform\]/,
        'NSAffineTransform.transform')
      .gsub(/\[([\w\d\.]*) translateXBy: (.*) yBy: (.*)\]/,
        '\1.translateXBy(\2, yBy:\3)')
      .gsub(/\[\[([\w\d\.]*) transformBezierPath: ([\w\d\.]*)\] fill\]/,
        '\1.transformBezierPath(\2).fill')
      .gsub(/\[UIBezierPath bezierPathWithOvalInRect: ([\w\d\.]*)\]/,
        'UIBezierPath.bezierPathWithOvalInRect(\1)')
      .gsub(/\[NSArray arrayWithObjects:/, 
        '[')
      .gsub('(id)', '')
      .gsub(', nil]', ']')
      .gsub(/CGFloat ([\w\d]*)\[\] = \{(.*)\}/,
        '\1Array = [\2]; \1 = Pointer.new(:float, \1Array.length); \1Array.each_index{|idx| \1[idx] = \1Array[idx] }')
      .gsub(/CGGradientCreateWithColors\((.*), (.*), (.*)\)/,
        'CGGradientCreateWithColors(\1, \2, \3)')
      .gsub(/\(__bridge CFArrayRef\)/, '')
      .gsub(/\[UIBezierPath bezierPath\]/,
        'UIBezierPath.bezierPath')
      .gsub(/\[([\w\d\.]*) moveToPoint: (.*), (.*)\]/,
        '\1.moveToPoint(\2, \3)')
      .gsub(/\[([\w\d\.]*) addCurveToPoint: (.*) controlPoint1: (.*) controlPoint2: (.*)\]/,
        '\1.addCurveToPoint(\2, controlPoint1:\3, controlPoint2:\4)')
      .gsub(/\[([\w\d\.]*) addLineToPoint: (.*)\]/,
        '\1.addLineToPoint(\2)')
      .gsub(/\[([\w\d\.]*) appendPath: (.*)\]/,
        '\1.appendPath(\2)')
      .gsub(/\[UIFont fontWithName: (.*) size: ([\w\d\.]*)\]/,
        'UIFont.fontWithName(\1, size:\2)')
      .gsub(/\[([\w\d\.]*) drawInRect: (.*) withFont: (.*) lineBreakMode: (.*) alignment: (.*)\]/,
        '\1.drawInRect(\2, withFont:\3, lineBreakMode:\4, alignment:\5)')
      .gsub(/\[UIBezierPath bezierPathWithRect: (.*)\]/,
        'UIBezierPath.bezierPathWithRect(\1)')
      .gsub(/\[([\w\d\.]*) applyTransform: (.*)\]/,
        '\1.applyTransform(\2)')
      .gsub(/round\(([\w\d\.]*)\)/,
        '\1.ceil')
