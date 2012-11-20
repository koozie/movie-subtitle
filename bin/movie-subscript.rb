#!/usr/bin/env ruby


#
# C. Stansbury    19 NOV 2012
#
# Script to parse and split German and French movie subtitles
#
# https://www.odesk.com/jobs/Write-simple-AppleScript_%7E0101d2fd504d20dcdc?tot=430&pos=39
#
#


SubtitleNode = Struct.new(:id, :time, :line_1, :line_2)


def load_subtitle_nodes(filename)
  nodes = []
  node  = []
  File.open(filename,'r') do |file|
    file.each do |line|
      if blank_line?(line)
        sn = SubtitleNode.new(* node)
        node = []
        nodes << sn
        next
      end
      node << line
    end
  end

  return nodes
end

def blank_line?(line)
  return true if line.to_s.strip.chomp.size == 0
  return false
end

def print_node(node, file_handle, line=:all)
  file_handle.print node.id
  file_handle.print node.time
  file_handle.print node.line_1 if line == 1 or line == :all
  file_handle.print node.line_2 if node.line_2 and line == 2 or line == :all
  file_handle.print "\r\n"
end

def print_files(nodes, filename_1 = 'subtitle_1.srt', filename_2 = 'subtitle_2.srt')
  File.open(filename_1, 'w') do |file_1|
    File.open(filename_2, 'w') do |file_2|
      nodes.each do |n|
        if not n.line_2 
          #print to both files
          print_node(n, file_1, :all)
          print_node(n, file_2, :all)
        else
          print_node(n, file_1, 1)
          print_node(n, file_2, 2)
        end
      end
    end
  end
end

def main
  nodes = load_subtitle_nodes(ARGV.first) if File.readable?(ARGV.first)
  print_files(nodes)
end


main

