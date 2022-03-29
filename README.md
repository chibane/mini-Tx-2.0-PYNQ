# minitx-PYNQ

This repo contains build scripts and source code to enable PYNQ on AuresTech custom miniTX board.

PYNQ, Python productivity for Zynq is a framework developed by Xilinx Corporation.  See http://www.pynq.io

**To build the images the first time I recommend using a VM or non VM machine that is not used for critical work.  Installing the build tools will make various changes to your machine, make sure you know what you're getting into before you modify a critical work PC.  This process requires a passwordless sudo user for example.**

To rebuild your own PYNQ image you will need to complete the following pre-build steps.  If you are already setup to build v2.6 PYNQ, skip these:

* You will need at least 16GB of PC RAM and 30GB+ just for building the SD Image, not including space for the build tools
* Install Petalinux v2020.1, Vivado v2020.1 and Ubuntu 18.04 LTS on an x86 PC
* Give an Ubuntu 'build user' passwordless sudo permission
* Clone PYNQ from https://github.com/Xilinx/PYNQ **and checkout branch: image_v2.6.0**
* From the clone and proper branch **execute "./sdbuild/scripts/setup_host.sh"**
* Install any requested additonal Debian apt packages that setup_host.sh asks for
* Once setup_host.sh is successful, **reboot and re-login**
* You may also remove the just cloned PYNQ git repo
* If you are using ssh or rdp the host Ubuntu may not execute .profile which sets the path up for the crosstools.  'source ~/.profile' manually as a work around

Once the previous steps have been completed you may begin building PYNQ:

* From a cmd line bash shell terminal, make sure Vivado 2020.1 and Petalinux v2020.1 are in your path.  This is usually done with "source"
* **Clone this minitx-PYNQ** repo and **cd** into it
* **Execute "./buildfast.sh"**  
* **Wait** for the SD card image generation to complete: minitx-x-x.x.x.img
* Use Etcher to copy the .img file onto a >= 16GB micro SD card
* Boot from SD card, insert SD card, **power-up and get to work!**

THIS SOFTWARE IS PROVIDED BY 6D7 Technologies LLC AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
