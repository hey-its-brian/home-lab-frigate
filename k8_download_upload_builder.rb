class String
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
end

def file_pod
    welcome_msg_1 = 'This tool will build the commands needed to upload files to a pod as well as download files from a pod.'.magenta
    welcome_msg_2 = 'Do not use any quotation marks or additional slashes, only the specific information requested.'.magenta.bold
    
    top_line = welcome_msg_1.size

    top_line.times { print "-".cyan }
    puts "\n\t#{welcome_msg_1}"
    puts "\t#{welcome_msg_2}\n\n"
    
    print "    1. For local folder, if using your Desktop enter"
    print " ~/Desktop".cyan 
    print " (on Mac)".cyan.italic
    puts 
    
    print "    2. For remote folder make sure to include "
    print "enroll ".cyan
    print "before the remote folder name. "
    print "(ex: tmp would be ".italic
    print "enroll/tmp)".cyan.italic
    puts

    print "    3. Make sure to switch to the proper context before running the resulting command."
    print " (ex: ".italic
    print "kubectx ".cyan.italic
    print "to see the context you are in. ".italic
    print "\n\tThen, run ".italic
    print "kubectx __________ ".cyan.italic
    print "and fill in the context you wish to be in.".italic
    puts
    top_line.times { print "-".cyan }
    puts "\n\n"

    print "\t- Context".cyan
    print "(ex: hbxit or preprod): ".magenta.italic
    instance = gets.chomp

    print "\t- Pod Name: ".cyan
    pod_name = gets.chomp

    print "\t- Remote Folder ".cyan
    print "(ex: enroll or enroll/tmp): ".magenta.italic
    remote_folder = gets.chomp

    print "\t- Local Folder ".cyan
    print "(ex: ~/Desktop): ".magenta.italic
    local_folder = gets.chomp

    print "\t- File Name: ".cyan
    file_name = gets.chomp

    puts "\n\n\tDirection of Transfer:".cyan.bold
    print "\t    1. "
    print "Local ".magenta
    print "=> ".bold
    print "Pod".cyan
    puts

    print "\t    2. "
    print "Pod ".cyan
    print "  => ".bold
    print "Local".magenta
    puts "\n\n"

    print "\tChoose your Option ".cyan
    print "(number only): ".italic
    direction = gets.chomp

    case direction
    when '1'
        # LOCAL to POD
        puts "\n\nkubectl cp #{local_folder}/#{file_name} #{instance}/#{pod_name}:#{remote_folder}/#{file_name}".green
        puts "---------------------------------------------------------------------------------\n\n".magenta
    when '2'
        # POD to LOCAL
        puts "\n\nkubectl cp #{instance}/#{pod_name}:/#{remote_folder}/#{file_name} #{local_folder}/#{file_name}".green
        puts "---------------------------------------------------------------------------------\n\n".magenta
    else
        puts "Invalid Entry. Choose only 1 or 2".red.bold
    end
end
