# wildfly-110-ant-centos7
FROM openshift/base-centos7

LABEL maintainer="Ibrahim Mohamed"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
#LABEL io.k8s.description="Platform for building xyz" \
#      io.k8s.display-name="builder x.y.z" \
#      io.openshift.expose-services="8080:http" \
#      io.openshift.tags="builder,x.y.z,etc."

# USER root
# RUN yum install -y ant wget gcc perl perl-CPAN  && yum clean all -y


RUN INSTALL_PKGS="tar unzip bc which lsof ant wget gcc perl perl-CPAN ca-certificates java-1.8.0-openjdk java-1.8.0-openjdk-devel perl-App-cpanminus perl-Config-Tiny" && \
    yum install -y --enablerepo=centosplus $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y && \
    mkdir -p /opt/openshift && \
    mkdir -p /opt/app-root/source && chmod -R a+rwX /opt/app-root/source && \
    mkdir -p /opt/s2i/destination && chmod -R a+rwX /opt/s2i/destination && \
    mkdir -p /opt/app-root/src && chmod -R a+rwX /opt/app-root/src
ENV PATH=/shared/perl-5.16.1/localperl/bin/:${PATH}
# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# Install balst
RUN wget --no-check-certificate https://ftp.nluug.nl/pub/os/Linux/distr/pclinuxos/pclinuxos/apt/pclinuxos/64bit/RPMS.x86_64/lib64pcre-compatible0-8.21-1pclos2013.x86_64.rpm && rpm -ivh lib64pcre-compatible0-8.21-1pclos2013.x86_64.rpm
RUN wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.18/ncbi-blast-2.2.18+-5.x86_64.rpm && rpm -ivh ncbi-blast-2.2.18+-5.x86_64.rpm

# RUN perl -MCPAN -e "install XML-DOM XML::DOM::XPath XML::Filter::BufferText XML::NamespaceSupport XML::Parser XML::RegExp \
#    XML::SAX XML::SAX::Base XML::SAX::Expat XML::SAX::Writer XML::Simple XML::Writer XML::XPathEngine" rm -fr root/.cpanm; exit 0
# RUN perl -MCPAN -e "install Algorithm::C3" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e "install BioPerl" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Algorithm::C3" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Algorithm::Diff" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Algorithm::Munkres" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Array::Compare" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Authen::NTLM" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install B::Hooks::OP::Check" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Bio::Phylo" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install CPAN" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install CPAN::Meta" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install CPAN::Meta::Requirements" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install CPAN::Meta::YAML" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Capture::Tiny" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Carp" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Class::C3" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Class::C3::XS" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Class::Data::Inheritable" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Class::Inspector" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Class::XSAccessor" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Clone" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Compress::Raw::Bzip2" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Compress::Raw::Zlib" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Convert::Binary::C" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Crypt::RC4" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Cwd" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install DBD::SQLite" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install DBD::mysql" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install DBI" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Data" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Data::Dumper" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Data::TemporaryBag" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Date::Parse" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Devel::CheckBin" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Devel::GlobalDestruction" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Devel::GlobalDestruction::XS" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Devel::StackTrace" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Digest::HMAC" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Digest::Perl::MD5" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Digest::SHA" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Encode::Locale" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Error" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Exception::Class" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install ExtUtils::CBuilder" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install ExtUtils::Depends" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install ExtUtils::MakeMaker" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install ExtUtils::Manifest" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install File::Listing" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install File::Path" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install File::Slurp::Tiny" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install File::Temp" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Font::TTF" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install GD" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install GD::SVG" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Graph" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTML-TableExtract" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTML::Parser" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTML::Tagset" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Cookies" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Daemon" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Date" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Message" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Negotiate" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install HTTP::Tiny" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::Compress" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::HTML" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::SessionData" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::Socket::SSL" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::String" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IO::Stringy" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install IPC::Cmd" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Import::Into" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install JSON" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install JSON::PP" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install JSON::XS" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install LWP" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install LWP::MediaTypes" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install LWP::Protocol::https" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Lexical::SealRequireHints" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Locale::Maketext::Simple" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install MRO::Compat" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Math::CDF" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Math::Complex" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Math::Derivative" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Math::Random" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Math::Spline" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::Build" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::CoreList" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::Load" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::Load::Conditional" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::Metadata" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Module::Runtime" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Mozilla::CA" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Net::HTTP" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install OLE::Storage_Lite" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install PDF::API2" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Params::Check" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Parse::CPAN::Meta" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Path::Class" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Perl" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Perl::OSType" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Pod" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Pod::Escapes" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Pod::Simple" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install PostScript::Metrics" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install SOAP::Lite" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install SVG" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install SVG::Graph" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install SWF::Builder" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install SWF::File" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Set::Scalar" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Sort::Naturally" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Spiffy" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Spreadsheet::ParseExcel" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Sub::Exporter::Progressive" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Sub::Name" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Sub::Uplevel" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Task::Weaken" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Base" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Deep" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Differences" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Exception" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Harness" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Most" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::NoWarnings" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Number::Delta" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Requires" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Simple" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::Warn" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Test::YAML" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Text::Diff" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Text::ParseWords" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Tree::DAG_Node" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install Types::Serialiser" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install URI" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install WWW::RobotRules" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML-DOM" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::DOM::XPath" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::Filter::BufferText" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::NamespaceSupport" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::Parser" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::RegExp" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::SAX" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::SAX::Base" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::SAX::Expat" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::SAX::Writer" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::Simple" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::Writer" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install XML::XPathEngine" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install YAML" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install YAML::Syck" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install bareword::filehandles" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install common::sense" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install indirect" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install libxml-perl" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install multidimensional" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install parent" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install strictures" rm -fr root/.cpanm; exit 0
   RUN perl -MCPAN -e"install version" rm -fr root/.cpanm; exit 0

RUN export PERL5LIB=/usr/lib/perl5/site_perl/5.8.8:/usr/local/share/perl5:$PERL5LIB
RUN export PATH=$PATH:$HOME/bin:/usr/java/latest/bin
RUN export BLASTDB=/data



RUN mkdir -p /opt/tomcat
RUN chown -R 1001:1001 /opt/
WORKDIR /opt/tomcat

RUN set -x \
        && mkdir /opt/tomcat/logs \
#        && apk add --update curl \
        && wget  -P /opt/tomcat https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz \
        && cd /opt/tomcat \
        && tar -zxf apache-tomcat-8.5.51.tar.gz \
        && mv /opt/tomcat/apache-tomcat-8.5.51/* /opt/tomcat \
        && rm -rf /opt/tomcat/apache-tomcat-8.5.34 \
        && rm -rf /opt/tomcat/bin/*.bat \
        && chown -R 1001:1001 /opt/tomcat \
        && chmod -R 777 /opt/tomcat/* \
        && chmod -R 777 /opt/app-root/* \
        && ls -al \
	&& ls -al /opt/tomcat/webapps/ 
#RUN cp /opt/openshift/app.war /opt/tomcat/webapps/
RUN chown -R 1001:1001 /opt/tomcat
# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
# RUN cp /s2i/bin/assemble /usr/libexec/s2i/assemble
COPY ./s2i/bin/ /usr/libexec/s2i


# RUN mkdir /tmp
# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

# TODO: Set the default CMD for the image
# CMD ["/usr/libexec/s2i/usage"]
CMD ["usage"]