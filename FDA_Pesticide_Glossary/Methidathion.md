---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-4.099746, 1.225668, -1.577892, 1, 0, 0, 1,
-2.952039, -0.1654827, -3.176776, 1, 0.007843138, 0, 1,
-2.9345, -1.51321, -2.927348, 1, 0.01176471, 0, 1,
-2.767164, 0.5814438, -1.195056, 1, 0.01960784, 0, 1,
-2.742779, 1.409976, -1.38968, 1, 0.02352941, 0, 1,
-2.611773, -0.4625129, -3.414074, 1, 0.03137255, 0, 1,
-2.603898, -1.707303, -2.455692, 1, 0.03529412, 0, 1,
-2.374297, -0.07933468, -2.46553, 1, 0.04313726, 0, 1,
-2.372209, 1.140923, -0.9399828, 1, 0.04705882, 0, 1,
-2.368364, 0.9514749, -2.42357, 1, 0.05490196, 0, 1,
-2.326454, 0.1745488, -2.68319, 1, 0.05882353, 0, 1,
-2.276933, 0.3930542, -1.772845, 1, 0.06666667, 0, 1,
-2.267936, -0.5311486, -2.290105, 1, 0.07058824, 0, 1,
-2.212789, -1.088687, -0.6130676, 1, 0.07843138, 0, 1,
-2.197086, 0.7712873, -1.79783, 1, 0.08235294, 0, 1,
-2.183171, 0.5333105, -2.152401, 1, 0.09019608, 0, 1,
-2.171194, -0.7042697, -2.987688, 1, 0.09411765, 0, 1,
-2.150859, 0.0518922, -1.213939, 1, 0.1019608, 0, 1,
-2.106814, -1.880304, -2.531019, 1, 0.1098039, 0, 1,
-2.100275, 0.03426826, -1.724465, 1, 0.1137255, 0, 1,
-2.076816, 0.2331585, -1.946531, 1, 0.1215686, 0, 1,
-1.953676, -0.9476452, -1.967707, 1, 0.1254902, 0, 1,
-1.936176, 0.1855215, -2.154385, 1, 0.1333333, 0, 1,
-1.912671, -1.154585, -2.777105, 1, 0.1372549, 0, 1,
-1.904422, 0.7036454, -1.086055, 1, 0.145098, 0, 1,
-1.887273, 0.4915091, -1.066368, 1, 0.1490196, 0, 1,
-1.886087, 0.03711498, -0.3906513, 1, 0.1568628, 0, 1,
-1.882184, 1.004246, -0.5115926, 1, 0.1607843, 0, 1,
-1.879959, -1.517415, -1.979603, 1, 0.1686275, 0, 1,
-1.876992, -0.629431, -4.499119, 1, 0.172549, 0, 1,
-1.863837, -1.726211, -1.27905, 1, 0.1803922, 0, 1,
-1.842952, 0.4463522, -2.081983, 1, 0.1843137, 0, 1,
-1.831129, -0.6962526, -1.257388, 1, 0.1921569, 0, 1,
-1.802166, -0.8920965, -1.309777, 1, 0.1960784, 0, 1,
-1.801831, 1.53753, -3.209522, 1, 0.2039216, 0, 1,
-1.793317, -2.09721, -2.053186, 1, 0.2117647, 0, 1,
-1.786678, 1.719567, 1.427593, 1, 0.2156863, 0, 1,
-1.777443, -2.51256, -2.274728, 1, 0.2235294, 0, 1,
-1.769132, 0.7407274, -1.833928, 1, 0.227451, 0, 1,
-1.745703, -0.6391571, -0.6056506, 1, 0.2352941, 0, 1,
-1.731932, 0.6688452, -0.6391777, 1, 0.2392157, 0, 1,
-1.727761, 0.4168209, -1.831159, 1, 0.2470588, 0, 1,
-1.701999, 0.5919307, -0.5270134, 1, 0.2509804, 0, 1,
-1.700534, 0.3409269, -0.9210087, 1, 0.2588235, 0, 1,
-1.699245, -0.1321773, -2.685433, 1, 0.2627451, 0, 1,
-1.679261, -1.190165, -4.583988, 1, 0.2705882, 0, 1,
-1.666794, -1.220522, -0.4206053, 1, 0.2745098, 0, 1,
-1.659982, -1.45384, -0.8637881, 1, 0.282353, 0, 1,
-1.647619, 0.3129357, -0.9145738, 1, 0.2862745, 0, 1,
-1.644595, -0.337087, -2.103582, 1, 0.2941177, 0, 1,
-1.635723, -0.1959711, -3.360879, 1, 0.3019608, 0, 1,
-1.615372, 0.8539011, -0.3665176, 1, 0.3058824, 0, 1,
-1.576569, 0.2248717, -0.9890345, 1, 0.3137255, 0, 1,
-1.573009, -0.3180421, -2.284831, 1, 0.3176471, 0, 1,
-1.567327, -0.5595719, -1.578853, 1, 0.3254902, 0, 1,
-1.54775, 0.5623428, -1.749588, 1, 0.3294118, 0, 1,
-1.538324, -1.428785, -2.730589, 1, 0.3372549, 0, 1,
-1.537467, -0.06690116, -1.154964, 1, 0.3411765, 0, 1,
-1.536478, 1.034185, -1.997282, 1, 0.3490196, 0, 1,
-1.520034, 2.210333, -0.9939122, 1, 0.3529412, 0, 1,
-1.519449, -0.9516511, -1.65151, 1, 0.3607843, 0, 1,
-1.51881, 0.3409754, -2.871147, 1, 0.3647059, 0, 1,
-1.509799, 0.1156715, -3.136312, 1, 0.372549, 0, 1,
-1.507438, -1.426749, -1.47195, 1, 0.3764706, 0, 1,
-1.47917, -0.761723, -1.551203, 1, 0.3843137, 0, 1,
-1.47795, -1.281759, -3.283158, 1, 0.3882353, 0, 1,
-1.456334, -0.3820188, -0.4459487, 1, 0.3960784, 0, 1,
-1.456172, 0.6992913, -1.946422, 1, 0.4039216, 0, 1,
-1.45188, -0.2470618, -3.184883, 1, 0.4078431, 0, 1,
-1.447568, -0.94655, -2.053869, 1, 0.4156863, 0, 1,
-1.439922, -2.851351, -2.600585, 1, 0.4196078, 0, 1,
-1.437059, 0.1430012, -1.33487, 1, 0.427451, 0, 1,
-1.429877, -1.771271, -1.669891, 1, 0.4313726, 0, 1,
-1.416923, -0.8375224, -2.242189, 1, 0.4392157, 0, 1,
-1.409896, -0.3062038, -1.33009, 1, 0.4431373, 0, 1,
-1.406018, 2.083358, 0.2193188, 1, 0.4509804, 0, 1,
-1.392864, 1.974532, -2.55141, 1, 0.454902, 0, 1,
-1.388841, 0.6472301, -1.576196, 1, 0.4627451, 0, 1,
-1.360861, 0.6208262, -0.08091729, 1, 0.4666667, 0, 1,
-1.359261, 0.3460367, -1.260958, 1, 0.4745098, 0, 1,
-1.351085, 0.2596245, -0.6153578, 1, 0.4784314, 0, 1,
-1.340764, 1.414152, -0.1870227, 1, 0.4862745, 0, 1,
-1.33868, 0.08887509, -0.7620054, 1, 0.4901961, 0, 1,
-1.3329, 0.182199, -1.528123, 1, 0.4980392, 0, 1,
-1.328953, -3.347583, -2.697398, 1, 0.5058824, 0, 1,
-1.324053, 1.322236, -1.682997, 1, 0.509804, 0, 1,
-1.322243, 1.045532, -1.366066, 1, 0.5176471, 0, 1,
-1.320877, 0.4113046, -1.792531, 1, 0.5215687, 0, 1,
-1.317559, 0.4330519, -3.016291, 1, 0.5294118, 0, 1,
-1.313889, 0.5352119, -1.637159, 1, 0.5333334, 0, 1,
-1.301821, 0.2877681, -2.461152, 1, 0.5411765, 0, 1,
-1.301761, -1.572537, -4.119182, 1, 0.5450981, 0, 1,
-1.301175, -0.3185294, -1.016945, 1, 0.5529412, 0, 1,
-1.300028, -0.07437762, -2.791313, 1, 0.5568628, 0, 1,
-1.296376, -0.2506517, -1.560765, 1, 0.5647059, 0, 1,
-1.292309, -0.6195493, -0.6067087, 1, 0.5686275, 0, 1,
-1.286422, 0.7300155, -0.8861048, 1, 0.5764706, 0, 1,
-1.285139, -1.017958, -3.301689, 1, 0.5803922, 0, 1,
-1.284867, 0.943134, -1.377158, 1, 0.5882353, 0, 1,
-1.284702, -0.7760255, -2.431357, 1, 0.5921569, 0, 1,
-1.283127, 0.7028292, 2.369631, 1, 0.6, 0, 1,
-1.278909, 0.04511595, -0.7991426, 1, 0.6078432, 0, 1,
-1.275928, 1.062659, 1.367043, 1, 0.6117647, 0, 1,
-1.274593, 0.2894696, -1.528973, 1, 0.6196079, 0, 1,
-1.274059, -0.6078491, -1.765766, 1, 0.6235294, 0, 1,
-1.27289, 1.079543, -1.228665, 1, 0.6313726, 0, 1,
-1.270656, 1.642298, -1.075311, 1, 0.6352941, 0, 1,
-1.266819, 0.6075714, -0.4478921, 1, 0.6431373, 0, 1,
-1.254892, 0.3922459, -0.3031745, 1, 0.6470588, 0, 1,
-1.251521, -1.32836, -1.565799, 1, 0.654902, 0, 1,
-1.250856, 0.05013967, -0.6623264, 1, 0.6588235, 0, 1,
-1.238277, -0.2797863, -0.8259504, 1, 0.6666667, 0, 1,
-1.227262, 1.498627, -0.8269886, 1, 0.6705883, 0, 1,
-1.22048, 0.8339237, 0.7828624, 1, 0.6784314, 0, 1,
-1.208889, -1.688676, -1.256884, 1, 0.682353, 0, 1,
-1.20865, -0.3167377, -1.667614, 1, 0.6901961, 0, 1,
-1.20305, 0.06005895, -1.97463, 1, 0.6941177, 0, 1,
-1.19694, -1.293154, -2.22418, 1, 0.7019608, 0, 1,
-1.183002, -1.23207, -1.737244, 1, 0.7098039, 0, 1,
-1.176302, 2.064687, -0.6674901, 1, 0.7137255, 0, 1,
-1.165021, 0.3861658, -1.165411, 1, 0.7215686, 0, 1,
-1.148764, 1.06282, 0.2880132, 1, 0.7254902, 0, 1,
-1.14726, -1.467256, -3.538356, 1, 0.7333333, 0, 1,
-1.13018, -1.962256, -4.089815, 1, 0.7372549, 0, 1,
-1.127427, -1.119412, -2.347152, 1, 0.7450981, 0, 1,
-1.127036, 1.242133, -0.9011689, 1, 0.7490196, 0, 1,
-1.12515, 0.1239487, 0.1983659, 1, 0.7568628, 0, 1,
-1.123267, 0.3902569, -1.675333, 1, 0.7607843, 0, 1,
-1.120996, -0.9592751, -4.00004, 1, 0.7686275, 0, 1,
-1.119615, 1.332294, -2.083537, 1, 0.772549, 0, 1,
-1.108189, -1.092857, -2.277091, 1, 0.7803922, 0, 1,
-1.105283, 0.2821705, -1.17458, 1, 0.7843137, 0, 1,
-1.07987, 0.37854, -1.660479, 1, 0.7921569, 0, 1,
-1.075385, 0.4085343, -2.10315, 1, 0.7960784, 0, 1,
-1.073059, 0.8693244, -0.8131747, 1, 0.8039216, 0, 1,
-1.070351, -0.531656, -2.410968, 1, 0.8117647, 0, 1,
-1.067892, -0.4130267, -1.520183, 1, 0.8156863, 0, 1,
-1.058739, 0.4658673, -2.037274, 1, 0.8235294, 0, 1,
-1.057756, -0.7780967, -2.253078, 1, 0.827451, 0, 1,
-1.057554, -0.1331772, -2.947955, 1, 0.8352941, 0, 1,
-1.05421, 1.725417, -0.9777871, 1, 0.8392157, 0, 1,
-1.050804, -1.159831, -0.269093, 1, 0.8470588, 0, 1,
-1.032163, 0.223032, -0.6260274, 1, 0.8509804, 0, 1,
-1.031819, 1.54594, 0.06571487, 1, 0.8588235, 0, 1,
-1.026334, 1.144845, -0.4467332, 1, 0.8627451, 0, 1,
-1.026222, -2.098525, 0.02673826, 1, 0.8705882, 0, 1,
-1.025917, 0.0799862, -1.392545, 1, 0.8745098, 0, 1,
-1.025243, -0.3055896, -1.325367, 1, 0.8823529, 0, 1,
-1.023269, -0.2637862, -2.380283, 1, 0.8862745, 0, 1,
-1.020746, -0.6391376, -2.97827, 1, 0.8941177, 0, 1,
-1.020544, -1.871785, -3.973368, 1, 0.8980392, 0, 1,
-1.018046, 0.2357279, -3.181196, 1, 0.9058824, 0, 1,
-1.015339, 0.7830567, -1.457079, 1, 0.9137255, 0, 1,
-1.010414, 1.326607, -1.558668, 1, 0.9176471, 0, 1,
-1.009497, -0.3133102, -1.049141, 1, 0.9254902, 0, 1,
-1.006768, -0.598023, -1.257028, 1, 0.9294118, 0, 1,
-1.006038, -1.792304, -0.9540063, 1, 0.9372549, 0, 1,
-1.005787, 1.241586, -1.66886, 1, 0.9411765, 0, 1,
-1.004186, 0.2424698, -1.640174, 1, 0.9490196, 0, 1,
-0.9997672, 0.3679189, -0.3706903, 1, 0.9529412, 0, 1,
-0.9921948, 0.7393739, -2.724153, 1, 0.9607843, 0, 1,
-0.9909639, -0.5300934, -3.334797, 1, 0.9647059, 0, 1,
-0.9891526, -0.6343185, -0.8296241, 1, 0.972549, 0, 1,
-0.9871492, -1.102865, -3.319329, 1, 0.9764706, 0, 1,
-0.9775118, 0.4506767, -1.053518, 1, 0.9843137, 0, 1,
-0.9710415, 0.2297631, -0.3563225, 1, 0.9882353, 0, 1,
-0.9670392, 1.021519, -0.7979279, 1, 0.9960784, 0, 1,
-0.9666235, 0.6162064, -1.583537, 0.9960784, 1, 0, 1,
-0.9647323, -0.8810624, -1.528223, 0.9921569, 1, 0, 1,
-0.96427, -0.3900848, -2.028085, 0.9843137, 1, 0, 1,
-0.9565191, -1.449556, -1.85728, 0.9803922, 1, 0, 1,
-0.9541399, 1.642638, -1.012885, 0.972549, 1, 0, 1,
-0.9510264, 1.517078, -0.5743557, 0.9686275, 1, 0, 1,
-0.9508003, -1.101641, -2.833729, 0.9607843, 1, 0, 1,
-0.9471883, 0.1178459, -1.835472, 0.9568627, 1, 0, 1,
-0.9322774, 0.5252126, -0.5233608, 0.9490196, 1, 0, 1,
-0.9237888, -0.3865226, -1.643338, 0.945098, 1, 0, 1,
-0.9234905, 1.413994, -0.1712586, 0.9372549, 1, 0, 1,
-0.9172957, 0.6357591, 0.4739436, 0.9333333, 1, 0, 1,
-0.914454, -0.7179791, -2.289817, 0.9254902, 1, 0, 1,
-0.9129282, 0.7386592, -1.050407, 0.9215686, 1, 0, 1,
-0.9093495, -0.02324225, -2.195535, 0.9137255, 1, 0, 1,
-0.9082745, 0.8394732, 0.6492319, 0.9098039, 1, 0, 1,
-0.9080537, 0.5848681, 0.3658183, 0.9019608, 1, 0, 1,
-0.9079745, -0.02846092, -2.230149, 0.8941177, 1, 0, 1,
-0.9065108, -0.7966748, -2.915597, 0.8901961, 1, 0, 1,
-0.9060709, -0.2857762, -2.505087, 0.8823529, 1, 0, 1,
-0.9046938, -1.555491, -1.748851, 0.8784314, 1, 0, 1,
-0.9039603, -1.749381, -3.919247, 0.8705882, 1, 0, 1,
-0.9024142, 1.353275, -0.1483577, 0.8666667, 1, 0, 1,
-0.8993947, -0.6738036, -1.696424, 0.8588235, 1, 0, 1,
-0.8972044, -1.72036, -3.355187, 0.854902, 1, 0, 1,
-0.8896986, 0.9637486, -1.292832, 0.8470588, 1, 0, 1,
-0.8870951, -1.304112, -1.693951, 0.8431373, 1, 0, 1,
-0.8864634, 0.1337802, -1.953597, 0.8352941, 1, 0, 1,
-0.8834304, 1.395504, -2.085846, 0.8313726, 1, 0, 1,
-0.8828927, 0.2100836, 0.3326992, 0.8235294, 1, 0, 1,
-0.8791018, 2.263113, -1.94927, 0.8196079, 1, 0, 1,
-0.8749604, 1.501166, -1.492536, 0.8117647, 1, 0, 1,
-0.8596566, -0.1184522, -0.2373178, 0.8078431, 1, 0, 1,
-0.8593481, 0.1846604, -2.036928, 0.8, 1, 0, 1,
-0.8551996, 0.146762, -1.755908, 0.7921569, 1, 0, 1,
-0.8512231, -0.6881888, -1.651095, 0.7882353, 1, 0, 1,
-0.8480228, 0.3435146, -1.279227, 0.7803922, 1, 0, 1,
-0.8477518, -0.2611013, -1.018513, 0.7764706, 1, 0, 1,
-0.8464694, -0.9731568, -3.736848, 0.7686275, 1, 0, 1,
-0.8447545, -0.02302417, -2.370768, 0.7647059, 1, 0, 1,
-0.8421729, 0.6669299, -3.268014, 0.7568628, 1, 0, 1,
-0.8408505, 0.4706277, -0.6098461, 0.7529412, 1, 0, 1,
-0.83878, 0.6786983, -0.05689971, 0.7450981, 1, 0, 1,
-0.8384004, -0.5301855, -2.466901, 0.7411765, 1, 0, 1,
-0.8381881, 0.3000734, -1.298827, 0.7333333, 1, 0, 1,
-0.8371593, 0.934315, -1.534324, 0.7294118, 1, 0, 1,
-0.8296579, 1.540999, 0.3692955, 0.7215686, 1, 0, 1,
-0.8278085, 1.363656, -2.573229, 0.7176471, 1, 0, 1,
-0.8249307, -0.2679688, -0.4973629, 0.7098039, 1, 0, 1,
-0.8196388, 1.797846, -0.03879801, 0.7058824, 1, 0, 1,
-0.8089086, -0.4874445, -2.133677, 0.6980392, 1, 0, 1,
-0.7993841, 0.7568732, -1.854063, 0.6901961, 1, 0, 1,
-0.7851734, 2.176059, 0.287145, 0.6862745, 1, 0, 1,
-0.782248, -1.484344, -3.103405, 0.6784314, 1, 0, 1,
-0.7633423, 1.403852, 0.9457333, 0.6745098, 1, 0, 1,
-0.7430059, 0.5208679, -1.858654, 0.6666667, 1, 0, 1,
-0.7397113, 0.1889046, -1.362578, 0.6627451, 1, 0, 1,
-0.7384068, 1.014458, -0.2247216, 0.654902, 1, 0, 1,
-0.7369161, 0.9807315, 0.0326778, 0.6509804, 1, 0, 1,
-0.7342758, -0.7633541, -2.684077, 0.6431373, 1, 0, 1,
-0.7330915, 0.4498501, -2.864763, 0.6392157, 1, 0, 1,
-0.7273836, 0.4994216, -0.95469, 0.6313726, 1, 0, 1,
-0.7201942, 0.03311433, -2.377943, 0.627451, 1, 0, 1,
-0.7184672, -1.313549, -2.943902, 0.6196079, 1, 0, 1,
-0.7158987, -0.795481, -2.990477, 0.6156863, 1, 0, 1,
-0.7137681, -1.012691, -3.183348, 0.6078432, 1, 0, 1,
-0.7094123, -0.4918231, -1.60205, 0.6039216, 1, 0, 1,
-0.7080368, 0.3012588, -3.34923, 0.5960785, 1, 0, 1,
-0.7014231, -1.367169, -4.068583, 0.5882353, 1, 0, 1,
-0.6969447, -1.301609, -3.686279, 0.5843138, 1, 0, 1,
-0.6920526, -0.8374429, -1.678044, 0.5764706, 1, 0, 1,
-0.6896535, 0.9667965, 0.2649727, 0.572549, 1, 0, 1,
-0.687074, 0.2590117, -2.776074, 0.5647059, 1, 0, 1,
-0.6801335, 2.203933, -1.079383, 0.5607843, 1, 0, 1,
-0.6790559, -0.6921666, -2.074932, 0.5529412, 1, 0, 1,
-0.6724021, -1.215111, -4.468152, 0.5490196, 1, 0, 1,
-0.6699699, -0.785419, -1.480725, 0.5411765, 1, 0, 1,
-0.6685606, 0.60517, -0.6521409, 0.5372549, 1, 0, 1,
-0.6653202, -0.4861673, -3.323399, 0.5294118, 1, 0, 1,
-0.6649193, -0.1396091, -0.9720946, 0.5254902, 1, 0, 1,
-0.6627734, -2.111478, -3.091136, 0.5176471, 1, 0, 1,
-0.6624911, -0.4919932, -2.699085, 0.5137255, 1, 0, 1,
-0.6554195, 1.293854, -1.423312, 0.5058824, 1, 0, 1,
-0.654504, 0.04212876, -0.993109, 0.5019608, 1, 0, 1,
-0.6538985, 1.400786, -0.8634846, 0.4941176, 1, 0, 1,
-0.6472937, 0.4181142, -1.685562, 0.4862745, 1, 0, 1,
-0.635119, -0.08788201, -2.135246, 0.4823529, 1, 0, 1,
-0.6344596, 0.1115634, -1.7445, 0.4745098, 1, 0, 1,
-0.6292942, 1.026457, -0.4438734, 0.4705882, 1, 0, 1,
-0.626334, 0.4961717, -1.352638, 0.4627451, 1, 0, 1,
-0.6241131, 0.613387, -0.4564801, 0.4588235, 1, 0, 1,
-0.6132422, 0.966089, -1.043617, 0.4509804, 1, 0, 1,
-0.6122522, -1.308434, -3.471021, 0.4470588, 1, 0, 1,
-0.6082528, -1.062446, -3.321486, 0.4392157, 1, 0, 1,
-0.6066655, 0.6040674, 0.3953165, 0.4352941, 1, 0, 1,
-0.6028823, 0.1936565, -2.504672, 0.427451, 1, 0, 1,
-0.6020618, 0.3840505, -1.206229, 0.4235294, 1, 0, 1,
-0.6016161, 0.5197179, 1.379474, 0.4156863, 1, 0, 1,
-0.5985353, -0.7978622, -2.31892, 0.4117647, 1, 0, 1,
-0.5974658, -1.746525, -1.809313, 0.4039216, 1, 0, 1,
-0.5950255, -1.471156, -2.873564, 0.3960784, 1, 0, 1,
-0.5933403, 0.5229403, 0.5014519, 0.3921569, 1, 0, 1,
-0.5875693, -0.4152628, -2.418856, 0.3843137, 1, 0, 1,
-0.5774394, -1.195946, -1.764509, 0.3803922, 1, 0, 1,
-0.5757146, 0.05066855, -1.871856, 0.372549, 1, 0, 1,
-0.5748709, 3.22344, -0.7769751, 0.3686275, 1, 0, 1,
-0.5672241, 0.8316193, -1.834621, 0.3607843, 1, 0, 1,
-0.5663781, 0.774015, 1.032147, 0.3568628, 1, 0, 1,
-0.5640497, -0.3252001, -2.722094, 0.3490196, 1, 0, 1,
-0.5630921, 0.7455329, -1.293432, 0.345098, 1, 0, 1,
-0.561932, -0.8623305, -3.546415, 0.3372549, 1, 0, 1,
-0.5608891, 1.774014, -0.9410221, 0.3333333, 1, 0, 1,
-0.5515651, -0.4013244, -2.706901, 0.3254902, 1, 0, 1,
-0.5490838, 1.460062, -1.150554, 0.3215686, 1, 0, 1,
-0.5461553, 0.06066534, -1.262033, 0.3137255, 1, 0, 1,
-0.5440701, -0.728605, -2.17987, 0.3098039, 1, 0, 1,
-0.5432988, 0.1275132, -0.6610535, 0.3019608, 1, 0, 1,
-0.5430533, -0.7728505, -1.560757, 0.2941177, 1, 0, 1,
-0.5345511, 0.1336227, -1.098019, 0.2901961, 1, 0, 1,
-0.534187, 0.866665, -1.664727, 0.282353, 1, 0, 1,
-0.5266569, 2.458885, 0.18192, 0.2784314, 1, 0, 1,
-0.5231385, 0.3538616, 0.5363329, 0.2705882, 1, 0, 1,
-0.5231291, 0.5038432, -1.170246, 0.2666667, 1, 0, 1,
-0.5213727, 0.1169709, -3.003508, 0.2588235, 1, 0, 1,
-0.5183638, 1.243886, -0.3672596, 0.254902, 1, 0, 1,
-0.5158198, 1.526314, -1.146209, 0.2470588, 1, 0, 1,
-0.5153927, 0.1939785, -2.137163, 0.2431373, 1, 0, 1,
-0.5153624, 0.8648315, 0.1243125, 0.2352941, 1, 0, 1,
-0.5118954, 0.1669946, 0.4672476, 0.2313726, 1, 0, 1,
-0.5097322, -1.980031, -5.65604, 0.2235294, 1, 0, 1,
-0.5088571, -0.6020288, -1.331417, 0.2196078, 1, 0, 1,
-0.5072868, 0.8705125, 0.356622, 0.2117647, 1, 0, 1,
-0.5061004, -1.710784, -0.3763546, 0.2078431, 1, 0, 1,
-0.5054552, -0.1143178, -1.253607, 0.2, 1, 0, 1,
-0.5050961, -1.136951, -2.339544, 0.1921569, 1, 0, 1,
-0.5015177, -0.9303824, -2.453555, 0.1882353, 1, 0, 1,
-0.4897454, 0.04563715, -1.645666, 0.1803922, 1, 0, 1,
-0.4896857, -0.9030737, -3.509902, 0.1764706, 1, 0, 1,
-0.487404, 1.42548, -0.557596, 0.1686275, 1, 0, 1,
-0.486624, -0.1357437, -1.778286, 0.1647059, 1, 0, 1,
-0.4830323, 1.932625, -1.060326, 0.1568628, 1, 0, 1,
-0.4830013, -1.00816, -2.416532, 0.1529412, 1, 0, 1,
-0.481586, -0.4071583, -2.260429, 0.145098, 1, 0, 1,
-0.4801514, -0.685095, -2.259356, 0.1411765, 1, 0, 1,
-0.47962, -0.8278464, -1.900091, 0.1333333, 1, 0, 1,
-0.4788195, 1.48966, 1.922475, 0.1294118, 1, 0, 1,
-0.4666657, 0.5751476, -1.280551, 0.1215686, 1, 0, 1,
-0.4661068, -0.7075944, -2.914862, 0.1176471, 1, 0, 1,
-0.4658976, 2.752425, -0.8326268, 0.1098039, 1, 0, 1,
-0.4467879, -0.1554894, 0.2703646, 0.1058824, 1, 0, 1,
-0.4445814, 0.2549122, -1.907188, 0.09803922, 1, 0, 1,
-0.443813, 0.4244597, 0.08732037, 0.09019608, 1, 0, 1,
-0.4437482, 0.9706144, -0.4248015, 0.08627451, 1, 0, 1,
-0.4404463, 0.6870698, -0.3608532, 0.07843138, 1, 0, 1,
-0.4362318, -0.3868825, -0.9718463, 0.07450981, 1, 0, 1,
-0.4316883, 2.305169, -0.803625, 0.06666667, 1, 0, 1,
-0.4312031, -1.52383, -3.431015, 0.0627451, 1, 0, 1,
-0.4305432, -0.4829146, -1.533826, 0.05490196, 1, 0, 1,
-0.4295136, 0.1400646, -0.6015248, 0.05098039, 1, 0, 1,
-0.4241279, 0.6447936, 0.01666352, 0.04313726, 1, 0, 1,
-0.42326, 0.5001559, 0.7578104, 0.03921569, 1, 0, 1,
-0.4232363, 1.601462, -0.4848411, 0.03137255, 1, 0, 1,
-0.420572, 1.438625, 0.9300336, 0.02745098, 1, 0, 1,
-0.4193181, 0.8071671, -0.1737554, 0.01960784, 1, 0, 1,
-0.4160173, -0.2215028, -2.150941, 0.01568628, 1, 0, 1,
-0.4160068, -0.2700334, -1.053866, 0.007843138, 1, 0, 1,
-0.4133406, 0.07564555, -0.8841093, 0.003921569, 1, 0, 1,
-0.4125727, 0.8422431, 0.2828954, 0, 1, 0.003921569, 1,
-0.4119857, -0.5027174, -3.40875, 0, 1, 0.01176471, 1,
-0.4098674, 0.09883606, -2.269879, 0, 1, 0.01568628, 1,
-0.4051964, 0.03266773, -1.926425, 0, 1, 0.02352941, 1,
-0.4035527, -0.3774284, -2.423965, 0, 1, 0.02745098, 1,
-0.4031731, -0.01308503, -0.1529194, 0, 1, 0.03529412, 1,
-0.4008765, -1.277683, -2.662207, 0, 1, 0.03921569, 1,
-0.3955678, 1.336329, 0.5709385, 0, 1, 0.04705882, 1,
-0.3951119, -1.751508, -4.573749, 0, 1, 0.05098039, 1,
-0.3890728, 2.405081, -1.171404, 0, 1, 0.05882353, 1,
-0.3868948, -3.014779, -3.594728, 0, 1, 0.0627451, 1,
-0.3859158, -0.5787013, -2.956727, 0, 1, 0.07058824, 1,
-0.3847597, -1.985231, -1.227153, 0, 1, 0.07450981, 1,
-0.3698876, 0.236229, 0.1065361, 0, 1, 0.08235294, 1,
-0.3663247, -0.1942872, -2.621677, 0, 1, 0.08627451, 1,
-0.3654993, 0.882677, 0.2886184, 0, 1, 0.09411765, 1,
-0.3630171, -0.1210354, -3.027297, 0, 1, 0.1019608, 1,
-0.3563977, -0.2196466, -0.5471305, 0, 1, 0.1058824, 1,
-0.3557939, 0.6294188, 0.3869651, 0, 1, 0.1137255, 1,
-0.3523025, 0.479125, 0.1085879, 0, 1, 0.1176471, 1,
-0.349352, -0.9912593, -1.819179, 0, 1, 0.1254902, 1,
-0.349145, -2.204541, -2.481564, 0, 1, 0.1294118, 1,
-0.3452882, 0.01034402, -1.874671, 0, 1, 0.1372549, 1,
-0.3441673, 0.03803553, 0.06569714, 0, 1, 0.1411765, 1,
-0.3407573, 0.3379706, -1.575196, 0, 1, 0.1490196, 1,
-0.3367835, 0.5490503, -0.2893959, 0, 1, 0.1529412, 1,
-0.3345219, -2.275208, -2.320029, 0, 1, 0.1607843, 1,
-0.3336851, 0.2745279, -1.386991, 0, 1, 0.1647059, 1,
-0.3335722, 0.8262489, -1.285068, 0, 1, 0.172549, 1,
-0.3261573, -1.457592, -3.797623, 0, 1, 0.1764706, 1,
-0.3253119, 1.300071, -1.064542, 0, 1, 0.1843137, 1,
-0.3227053, -1.366805, -2.856665, 0, 1, 0.1882353, 1,
-0.3220778, 0.5026085, -0.5373102, 0, 1, 0.1960784, 1,
-0.3210531, -1.234457, -1.869541, 0, 1, 0.2039216, 1,
-0.3209422, 0.7451961, -2.153439, 0, 1, 0.2078431, 1,
-0.3171955, 0.3260442, -2.903641, 0, 1, 0.2156863, 1,
-0.316796, 0.1022408, 0.2660455, 0, 1, 0.2196078, 1,
-0.3165082, 0.2211201, -2.60991, 0, 1, 0.227451, 1,
-0.3110392, -0.08403192, -0.8459399, 0, 1, 0.2313726, 1,
-0.3076718, -0.4310352, -1.003789, 0, 1, 0.2392157, 1,
-0.3044228, -1.665264, -2.912851, 0, 1, 0.2431373, 1,
-0.3021794, 0.4326983, -1.067367, 0, 1, 0.2509804, 1,
-0.2987374, 0.2748594, -1.539236, 0, 1, 0.254902, 1,
-0.2933738, -1.091048, -2.600318, 0, 1, 0.2627451, 1,
-0.2875311, -0.1226947, -1.830013, 0, 1, 0.2666667, 1,
-0.284696, 0.3313217, -0.9941444, 0, 1, 0.2745098, 1,
-0.2833393, 1.566776, 0.5627494, 0, 1, 0.2784314, 1,
-0.2805987, -1.058237, -3.938138, 0, 1, 0.2862745, 1,
-0.2751308, 0.5068995, -0.9630769, 0, 1, 0.2901961, 1,
-0.2750351, -0.8376293, -3.901296, 0, 1, 0.2980392, 1,
-0.2747436, 1.503852, -1.475443, 0, 1, 0.3058824, 1,
-0.2719786, -0.2292527, -0.699157, 0, 1, 0.3098039, 1,
-0.2713323, 0.3408941, -2.767671, 0, 1, 0.3176471, 1,
-0.2711316, -1.591746, -2.23496, 0, 1, 0.3215686, 1,
-0.270625, 0.3342905, -0.4524369, 0, 1, 0.3294118, 1,
-0.2674153, -2.354579, -2.560767, 0, 1, 0.3333333, 1,
-0.262978, 0.446052, -0.1060082, 0, 1, 0.3411765, 1,
-0.2542205, -0.4321114, -2.92548, 0, 1, 0.345098, 1,
-0.2494396, 0.4930387, -1.28693, 0, 1, 0.3529412, 1,
-0.2449744, 0.01425413, -0.5981322, 0, 1, 0.3568628, 1,
-0.243894, -0.1751263, -3.258098, 0, 1, 0.3647059, 1,
-0.2431844, 0.09623235, 0.17344, 0, 1, 0.3686275, 1,
-0.2398949, -1.558893, -1.900713, 0, 1, 0.3764706, 1,
-0.2397128, -0.1595007, -2.620409, 0, 1, 0.3803922, 1,
-0.2378618, -0.1256565, -3.227495, 0, 1, 0.3882353, 1,
-0.2353243, 0.06626073, -1.22603, 0, 1, 0.3921569, 1,
-0.2320772, 0.2712276, 0.4727665, 0, 1, 0.4, 1,
-0.2299992, -2.481263, -2.336095, 0, 1, 0.4078431, 1,
-0.227567, 0.6963085, -1.161335, 0, 1, 0.4117647, 1,
-0.2271797, 0.6177624, -2.041781, 0, 1, 0.4196078, 1,
-0.2271749, -0.8739418, -1.461467, 0, 1, 0.4235294, 1,
-0.2244706, -1.34218, -3.98595, 0, 1, 0.4313726, 1,
-0.2234216, 1.644638, -1.044614, 0, 1, 0.4352941, 1,
-0.223409, -0.4641786, -2.261351, 0, 1, 0.4431373, 1,
-0.2220162, -0.003619037, -2.254838, 0, 1, 0.4470588, 1,
-0.2181728, 0.08865667, -1.030684, 0, 1, 0.454902, 1,
-0.2127023, -0.002818932, -2.140891, 0, 1, 0.4588235, 1,
-0.2086513, 1.489583, 0.2109456, 0, 1, 0.4666667, 1,
-0.2069837, -0.5299329, -2.573012, 0, 1, 0.4705882, 1,
-0.2027736, 0.5005895, -1.673941, 0, 1, 0.4784314, 1,
-0.2014914, -0.1555873, -1.302437, 0, 1, 0.4823529, 1,
-0.1996539, -0.5593376, -3.004309, 0, 1, 0.4901961, 1,
-0.1956087, 0.2086321, -0.4957975, 0, 1, 0.4941176, 1,
-0.1889754, -1.413954, -4.043545, 0, 1, 0.5019608, 1,
-0.18894, -1.420373, -2.82618, 0, 1, 0.509804, 1,
-0.1878268, -1.255351, -3.637886, 0, 1, 0.5137255, 1,
-0.1869043, -1.962813, -2.6977, 0, 1, 0.5215687, 1,
-0.1867589, -0.6878091, -3.46458, 0, 1, 0.5254902, 1,
-0.1856512, 0.0008947882, 1.23519, 0, 1, 0.5333334, 1,
-0.1842404, 1.688469, 1.336045, 0, 1, 0.5372549, 1,
-0.1838709, 0.3256057, -0.2138337, 0, 1, 0.5450981, 1,
-0.181726, -0.3828924, -2.237326, 0, 1, 0.5490196, 1,
-0.1764088, -0.553955, -3.063356, 0, 1, 0.5568628, 1,
-0.1763204, -0.5475062, -2.688493, 0, 1, 0.5607843, 1,
-0.1717649, -0.5852802, -5.384701, 0, 1, 0.5686275, 1,
-0.1698659, 0.3991136, -1.413291, 0, 1, 0.572549, 1,
-0.1676853, -1.034562, -1.716368, 0, 1, 0.5803922, 1,
-0.166556, -0.003860919, -3.074328, 0, 1, 0.5843138, 1,
-0.1632933, 0.2340519, -2.280151, 0, 1, 0.5921569, 1,
-0.161237, -0.6223705, -1.935944, 0, 1, 0.5960785, 1,
-0.159861, -1.0184, -3.559496, 0, 1, 0.6039216, 1,
-0.1566874, -0.5804424, -3.341978, 0, 1, 0.6117647, 1,
-0.1555595, -0.8361328, -2.65163, 0, 1, 0.6156863, 1,
-0.1525285, 0.1859113, -0.1790048, 0, 1, 0.6235294, 1,
-0.1516043, -0.1381827, -2.745315, 0, 1, 0.627451, 1,
-0.1500385, -0.4314599, -1.417649, 0, 1, 0.6352941, 1,
-0.1441384, -0.05254174, -2.895282, 0, 1, 0.6392157, 1,
-0.1411195, -0.5496556, -2.014466, 0, 1, 0.6470588, 1,
-0.1382917, 1.674951, 0.8947625, 0, 1, 0.6509804, 1,
-0.1366125, 1.785944, -1.396468, 0, 1, 0.6588235, 1,
-0.1313224, 1.566727, -1.430004, 0, 1, 0.6627451, 1,
-0.1287035, 0.4277653, -0.08911628, 0, 1, 0.6705883, 1,
-0.126431, -1.067773, -3.335646, 0, 1, 0.6745098, 1,
-0.1248679, 1.951412, -0.7200952, 0, 1, 0.682353, 1,
-0.1242618, -1.705364, -2.23929, 0, 1, 0.6862745, 1,
-0.1238937, 1.212146, -1.036482, 0, 1, 0.6941177, 1,
-0.1230245, 1.995546, 0.9828396, 0, 1, 0.7019608, 1,
-0.1224925, -0.9264219, -2.911047, 0, 1, 0.7058824, 1,
-0.1220039, 0.6899648, -0.2482636, 0, 1, 0.7137255, 1,
-0.1211575, 2.479291, -0.01097771, 0, 1, 0.7176471, 1,
-0.1191556, 1.2277, -0.1846645, 0, 1, 0.7254902, 1,
-0.1157621, 1.197591, -0.5057421, 0, 1, 0.7294118, 1,
-0.1141992, 1.561939, -1.816746, 0, 1, 0.7372549, 1,
-0.1138643, -0.82108, -2.763236, 0, 1, 0.7411765, 1,
-0.1110441, 0.3829814, 0.0291473, 0, 1, 0.7490196, 1,
-0.1094833, -0.2543607, -2.362679, 0, 1, 0.7529412, 1,
-0.1073687, -0.281023, -1.642558, 0, 1, 0.7607843, 1,
-0.1066218, 0.3182512, -0.7825029, 0, 1, 0.7647059, 1,
-0.1053034, -1.457258, -3.736076, 0, 1, 0.772549, 1,
-0.1051891, -0.5704717, -3.407033, 0, 1, 0.7764706, 1,
-0.09786346, 0.802305, 0.7521702, 0, 1, 0.7843137, 1,
-0.0932048, 0.22215, -1.926276, 0, 1, 0.7882353, 1,
-0.08859482, 0.4608913, 0.8248426, 0, 1, 0.7960784, 1,
-0.08737814, -0.3120671, -2.607378, 0, 1, 0.8039216, 1,
-0.08561438, 0.1832238, 0.7760402, 0, 1, 0.8078431, 1,
-0.07649202, -1.29298, -3.908526, 0, 1, 0.8156863, 1,
-0.07308891, 0.5566125, -0.73014, 0, 1, 0.8196079, 1,
-0.07106107, -0.5024263, -2.054702, 0, 1, 0.827451, 1,
-0.06720654, -1.683839, -3.466012, 0, 1, 0.8313726, 1,
-0.06686669, -0.8807455, -2.353148, 0, 1, 0.8392157, 1,
-0.06501921, -0.8219756, -2.116306, 0, 1, 0.8431373, 1,
-0.06268034, -0.1565961, -3.123042, 0, 1, 0.8509804, 1,
-0.06155951, 1.21202, -0.004284748, 0, 1, 0.854902, 1,
-0.06037404, -1.501838, -3.706481, 0, 1, 0.8627451, 1,
-0.05365527, -0.6510029, -3.073274, 0, 1, 0.8666667, 1,
-0.05354584, 1.592392, 0.6373192, 0, 1, 0.8745098, 1,
-0.05081958, 0.07398811, -0.5833827, 0, 1, 0.8784314, 1,
-0.03753218, -0.7051863, -4.021898, 0, 1, 0.8862745, 1,
-0.03737569, 2.739287, -0.2892661, 0, 1, 0.8901961, 1,
-0.03735559, -0.2871743, -3.065679, 0, 1, 0.8980392, 1,
-0.03703654, 0.02579968, -0.6373686, 0, 1, 0.9058824, 1,
-0.0369888, -0.5891145, -2.616974, 0, 1, 0.9098039, 1,
-0.03486779, -1.445424, -4.579189, 0, 1, 0.9176471, 1,
-0.02986448, -0.07379564, -0.882795, 0, 1, 0.9215686, 1,
-0.02828445, 0.1421511, 0.6697671, 0, 1, 0.9294118, 1,
-0.02759365, 0.6878692, 1.908376, 0, 1, 0.9333333, 1,
-0.02562427, -1.117054, -3.226836, 0, 1, 0.9411765, 1,
-0.02554325, -0.2464118, -1.404709, 0, 1, 0.945098, 1,
-0.02233621, -0.1563477, -2.544443, 0, 1, 0.9529412, 1,
-0.0201655, -0.1011652, -5.379566, 0, 1, 0.9568627, 1,
-0.01902647, 1.569929, 1.701585, 0, 1, 0.9647059, 1,
-0.01902381, -2.671019, -3.653841, 0, 1, 0.9686275, 1,
-0.01895996, 1.707443, -0.6518909, 0, 1, 0.9764706, 1,
-0.01705697, 0.4768111, -0.6005113, 0, 1, 0.9803922, 1,
-0.009137737, 0.1817784, -0.03808112, 0, 1, 0.9882353, 1,
-0.0085973, -1.291234, -3.63426, 0, 1, 0.9921569, 1,
-0.005969692, -1.185689, -2.479407, 0, 1, 1, 1,
-0.005500405, -0.415547, -2.379476, 0, 0.9921569, 1, 1,
-0.005196638, 1.650743, 0.471845, 0, 0.9882353, 1, 1,
-0.00375125, -1.395871, -3.730999, 0, 0.9803922, 1, 1,
-0.0009592441, 0.6314402, -0.9513842, 0, 0.9764706, 1, 1,
-0.0002100388, 0.04895295, 1.270312, 0, 0.9686275, 1, 1,
0.001168728, 2.389878, 0.3705979, 0, 0.9647059, 1, 1,
0.002867116, -0.8132021, 5.332188, 0, 0.9568627, 1, 1,
0.006760677, -0.1589846, 4.611835, 0, 0.9529412, 1, 1,
0.006809561, -0.1077031, 3.080717, 0, 0.945098, 1, 1,
0.00689836, 0.6650454, -2.217113, 0, 0.9411765, 1, 1,
0.01258008, -1.043805, 2.254641, 0, 0.9333333, 1, 1,
0.01262739, -1.041707, 3.10817, 0, 0.9294118, 1, 1,
0.01320062, 0.01757885, 0.4440316, 0, 0.9215686, 1, 1,
0.01551993, -0.07080181, 1.888267, 0, 0.9176471, 1, 1,
0.01637567, -1.196461, 2.338208, 0, 0.9098039, 1, 1,
0.02066401, -0.2390877, 2.367293, 0, 0.9058824, 1, 1,
0.02067434, 0.4198501, -1.037542, 0, 0.8980392, 1, 1,
0.02678342, -0.328643, 4.829726, 0, 0.8901961, 1, 1,
0.02793838, 0.006986544, 0.9405669, 0, 0.8862745, 1, 1,
0.02819071, -0.9726049, 2.47759, 0, 0.8784314, 1, 1,
0.0320567, 1.606483, 0.07170536, 0, 0.8745098, 1, 1,
0.03507604, 1.253457, -0.4276536, 0, 0.8666667, 1, 1,
0.03555297, 1.703193, 0.9746485, 0, 0.8627451, 1, 1,
0.0371605, -0.3755068, 3.000814, 0, 0.854902, 1, 1,
0.04541659, 0.4989233, -1.096393, 0, 0.8509804, 1, 1,
0.04797201, -2.385729, 3.505627, 0, 0.8431373, 1, 1,
0.0482, -1.104207, 2.449346, 0, 0.8392157, 1, 1,
0.05076247, 0.9107274, -0.7836374, 0, 0.8313726, 1, 1,
0.05160958, -0.5492526, 3.211654, 0, 0.827451, 1, 1,
0.0567766, -1.22763, 2.200086, 0, 0.8196079, 1, 1,
0.06981933, 0.008548153, 3.073594, 0, 0.8156863, 1, 1,
0.07029694, -0.4014613, 0.9256064, 0, 0.8078431, 1, 1,
0.0738892, 0.5968311, 0.01518246, 0, 0.8039216, 1, 1,
0.07791567, 0.6403775, -0.2633756, 0, 0.7960784, 1, 1,
0.0794593, -0.1227136, 1.108506, 0, 0.7882353, 1, 1,
0.08380228, 0.04301971, 1.574677, 0, 0.7843137, 1, 1,
0.08714388, 0.3213704, 0.9812644, 0, 0.7764706, 1, 1,
0.08908324, -0.02069838, 0.5789717, 0, 0.772549, 1, 1,
0.08933846, 0.01251024, 0.150799, 0, 0.7647059, 1, 1,
0.09166354, -0.3128322, 2.850784, 0, 0.7607843, 1, 1,
0.09191153, 0.512641, 0.8364969, 0, 0.7529412, 1, 1,
0.09255426, -0.5489824, 2.350679, 0, 0.7490196, 1, 1,
0.09375218, 0.6340826, 1.487214, 0, 0.7411765, 1, 1,
0.0952065, -0.7866483, 3.994668, 0, 0.7372549, 1, 1,
0.09522642, -0.09897264, 1.713043, 0, 0.7294118, 1, 1,
0.09542982, -0.256497, 2.682508, 0, 0.7254902, 1, 1,
0.1026122, -2.298363, 2.996357, 0, 0.7176471, 1, 1,
0.1039196, -0.5651786, 2.331711, 0, 0.7137255, 1, 1,
0.1051059, 0.5143923, 0.1071141, 0, 0.7058824, 1, 1,
0.1084425, -0.3462002, 1.990804, 0, 0.6980392, 1, 1,
0.1085924, -0.370095, 0.8661171, 0, 0.6941177, 1, 1,
0.1098678, 0.7992445, 1.500367, 0, 0.6862745, 1, 1,
0.1186263, -1.352527, 2.840396, 0, 0.682353, 1, 1,
0.1192903, 1.196346, 0.3007117, 0, 0.6745098, 1, 1,
0.1203359, 0.5318786, -1.488075, 0, 0.6705883, 1, 1,
0.1244448, 1.179429, 0.4393904, 0, 0.6627451, 1, 1,
0.1244593, 0.3423874, 1.142976, 0, 0.6588235, 1, 1,
0.1247057, 0.09270878, 0.5761389, 0, 0.6509804, 1, 1,
0.1270869, -1.395502, 3.951279, 0, 0.6470588, 1, 1,
0.1270969, 0.5990895, -1.376766, 0, 0.6392157, 1, 1,
0.1295613, -0.8272246, 2.244342, 0, 0.6352941, 1, 1,
0.1302377, 1.042291, -0.8491981, 0, 0.627451, 1, 1,
0.1480925, 1.322225, 1.458247, 0, 0.6235294, 1, 1,
0.1504576, 0.4300484, 0.8313931, 0, 0.6156863, 1, 1,
0.1525378, 1.245715, -0.3377921, 0, 0.6117647, 1, 1,
0.1545367, 0.6606933, 1.295173, 0, 0.6039216, 1, 1,
0.1555922, -0.7319385, 3.669308, 0, 0.5960785, 1, 1,
0.1617098, 0.9674687, -0.03403265, 0, 0.5921569, 1, 1,
0.1633448, -0.9498416, 4.481635, 0, 0.5843138, 1, 1,
0.1665062, -0.7058557, 3.45798, 0, 0.5803922, 1, 1,
0.1669685, 0.7256803, 2.25779, 0, 0.572549, 1, 1,
0.1673245, 0.6192484, 0.2000981, 0, 0.5686275, 1, 1,
0.1685554, -1.128148, 2.667668, 0, 0.5607843, 1, 1,
0.1744752, 0.569099, -1.605752, 0, 0.5568628, 1, 1,
0.1821579, 0.7090704, 1.81414, 0, 0.5490196, 1, 1,
0.1833762, -1.309996, 1.295691, 0, 0.5450981, 1, 1,
0.1850238, 1.081655, -0.8939786, 0, 0.5372549, 1, 1,
0.1868445, -1.479108, 3.909714, 0, 0.5333334, 1, 1,
0.1876855, -0.1142153, 3.121334, 0, 0.5254902, 1, 1,
0.1890153, -0.7944409, 2.183536, 0, 0.5215687, 1, 1,
0.1959522, -0.4986766, 2.846877, 0, 0.5137255, 1, 1,
0.1972961, -0.7772549, 3.449152, 0, 0.509804, 1, 1,
0.1978662, -1.284617, 3.23554, 0, 0.5019608, 1, 1,
0.2005837, 0.5375293, 0.4940343, 0, 0.4941176, 1, 1,
0.2031305, 0.4003153, 0.5058725, 0, 0.4901961, 1, 1,
0.2048956, 0.4478857, -0.9830645, 0, 0.4823529, 1, 1,
0.2054346, 0.9611145, 0.739195, 0, 0.4784314, 1, 1,
0.2083424, 0.6739843, 0.05946126, 0, 0.4705882, 1, 1,
0.2107592, -1.261602, 4.017892, 0, 0.4666667, 1, 1,
0.2116059, 0.1849337, -0.1675895, 0, 0.4588235, 1, 1,
0.2138307, 0.1004882, 2.495276, 0, 0.454902, 1, 1,
0.2187928, -0.03285968, 2.386077, 0, 0.4470588, 1, 1,
0.2194443, -1.805327, 3.149743, 0, 0.4431373, 1, 1,
0.2231652, -0.5139554, 3.534955, 0, 0.4352941, 1, 1,
0.2248128, 0.4952213, 1.032175, 0, 0.4313726, 1, 1,
0.2264411, 0.9440561, -0.1394422, 0, 0.4235294, 1, 1,
0.2277096, -1.224284, 4.966169, 0, 0.4196078, 1, 1,
0.2286051, -1.073406, 2.167502, 0, 0.4117647, 1, 1,
0.2318092, 0.07210265, 2.368975, 0, 0.4078431, 1, 1,
0.2403867, 1.392531, 0.0430753, 0, 0.4, 1, 1,
0.2432324, 0.1871345, -0.383129, 0, 0.3921569, 1, 1,
0.2447347, -1.415994, 4.035364, 0, 0.3882353, 1, 1,
0.2465103, 1.736399, -1.210966, 0, 0.3803922, 1, 1,
0.2471133, 0.8235518, -0.6760561, 0, 0.3764706, 1, 1,
0.2477942, 0.2707878, -0.7152158, 0, 0.3686275, 1, 1,
0.2481984, -0.7184047, 3.168241, 0, 0.3647059, 1, 1,
0.2558362, 0.2727885, 2.405803, 0, 0.3568628, 1, 1,
0.2620781, 0.05370411, 0.1787604, 0, 0.3529412, 1, 1,
0.2682759, -1.181426, 2.084794, 0, 0.345098, 1, 1,
0.2703119, -0.2363962, 1.193449, 0, 0.3411765, 1, 1,
0.2716498, -0.2360365, 3.296412, 0, 0.3333333, 1, 1,
0.2723882, 0.007506336, -0.1634894, 0, 0.3294118, 1, 1,
0.2726284, 1.402515, -0.6893505, 0, 0.3215686, 1, 1,
0.2738173, -0.108623, 3.466286, 0, 0.3176471, 1, 1,
0.2753312, 0.6411306, -1.675532, 0, 0.3098039, 1, 1,
0.2795558, 1.416944, -0.2118624, 0, 0.3058824, 1, 1,
0.2833642, -1.615778, 2.651989, 0, 0.2980392, 1, 1,
0.2842122, -1.227952, 3.202418, 0, 0.2901961, 1, 1,
0.2910267, -0.631443, 2.821959, 0, 0.2862745, 1, 1,
0.2953242, 0.7258797, 1.033699, 0, 0.2784314, 1, 1,
0.2980082, -2.277258, 2.333211, 0, 0.2745098, 1, 1,
0.2984296, 0.5709785, 1.496142, 0, 0.2666667, 1, 1,
0.2994133, -0.1616651, 0.4786546, 0, 0.2627451, 1, 1,
0.3040796, 0.2380014, 2.121104, 0, 0.254902, 1, 1,
0.3073662, -0.3676683, 2.354195, 0, 0.2509804, 1, 1,
0.3087296, -0.2780848, 2.122977, 0, 0.2431373, 1, 1,
0.3103026, 1.385208, 0.4625177, 0, 0.2392157, 1, 1,
0.3113667, -0.7134951, 1.713578, 0, 0.2313726, 1, 1,
0.3114122, -0.9392125, 2.83837, 0, 0.227451, 1, 1,
0.3115608, -0.5578076, 1.854641, 0, 0.2196078, 1, 1,
0.3123723, -0.1362001, 2.042743, 0, 0.2156863, 1, 1,
0.3134487, -0.9440858, 1.925518, 0, 0.2078431, 1, 1,
0.314531, -0.4429689, 2.21588, 0, 0.2039216, 1, 1,
0.3149918, 1.343912, 0.136595, 0, 0.1960784, 1, 1,
0.3176999, -0.8257982, 3.689362, 0, 0.1882353, 1, 1,
0.3196186, 0.02737108, -0.8477192, 0, 0.1843137, 1, 1,
0.3200642, -0.1838468, 2.059365, 0, 0.1764706, 1, 1,
0.3237268, -2.385056, 3.186002, 0, 0.172549, 1, 1,
0.3247423, 1.101004, -1.270014, 0, 0.1647059, 1, 1,
0.3271309, -0.1170106, 2.739252, 0, 0.1607843, 1, 1,
0.3293858, 0.9061963, -0.8739954, 0, 0.1529412, 1, 1,
0.3321159, 0.2087745, -0.2891381, 0, 0.1490196, 1, 1,
0.3340676, -0.3944644, 0.6258333, 0, 0.1411765, 1, 1,
0.3385151, 0.6221772, 1.05148, 0, 0.1372549, 1, 1,
0.3417409, -2.091121, 0.9066109, 0, 0.1294118, 1, 1,
0.345413, 0.4641647, -0.617972, 0, 0.1254902, 1, 1,
0.3463997, 0.9718951, 2.957826, 0, 0.1176471, 1, 1,
0.3521255, 0.08061567, 1.343498, 0, 0.1137255, 1, 1,
0.3523213, -0.2541997, 3.624406, 0, 0.1058824, 1, 1,
0.3557358, -2.042672, 4.113467, 0, 0.09803922, 1, 1,
0.3581696, 1.441301, -1.2627, 0, 0.09411765, 1, 1,
0.3601338, 0.7231954, 0.9940362, 0, 0.08627451, 1, 1,
0.360283, 0.01040349, 2.316705, 0, 0.08235294, 1, 1,
0.3603459, -1.000042, 2.612276, 0, 0.07450981, 1, 1,
0.3689908, -0.9747829, 2.371987, 0, 0.07058824, 1, 1,
0.3708307, -0.2865638, 0.2653832, 0, 0.0627451, 1, 1,
0.3713923, 1.324501, -0.9111105, 0, 0.05882353, 1, 1,
0.3729577, -0.4694, 4.544257, 0, 0.05098039, 1, 1,
0.3729996, 1.530722, 0.2656584, 0, 0.04705882, 1, 1,
0.376156, -1.320996, 5.135185, 0, 0.03921569, 1, 1,
0.3774377, -0.09101882, 2.317537, 0, 0.03529412, 1, 1,
0.3781143, 0.966594, 1.244032, 0, 0.02745098, 1, 1,
0.381601, 0.6662791, -0.3078857, 0, 0.02352941, 1, 1,
0.3854967, 1.211691, 0.3457492, 0, 0.01568628, 1, 1,
0.3906059, -0.2130053, 1.901475, 0, 0.01176471, 1, 1,
0.3962736, -0.3430403, 3.312637, 0, 0.003921569, 1, 1,
0.3968342, 0.6036213, 1.600552, 0.003921569, 0, 1, 1,
0.406799, -1.950079, 0.8433106, 0.007843138, 0, 1, 1,
0.4088515, -0.03018188, 3.340751, 0.01568628, 0, 1, 1,
0.4132334, -2.461195, 2.864471, 0.01960784, 0, 1, 1,
0.4154356, -1.204672, 3.472116, 0.02745098, 0, 1, 1,
0.419958, 1.405854, 0.2524296, 0.03137255, 0, 1, 1,
0.4203857, -1.646603, 1.948421, 0.03921569, 0, 1, 1,
0.4239474, 0.5252876, 0.437439, 0.04313726, 0, 1, 1,
0.4296814, 0.2930591, -1.308523, 0.05098039, 0, 1, 1,
0.4319977, 1.345539, 0.007298518, 0.05490196, 0, 1, 1,
0.4329475, -0.8316784, 3.263326, 0.0627451, 0, 1, 1,
0.4355354, -3.118554, 2.917106, 0.06666667, 0, 1, 1,
0.4357361, 1.128996, 1.116922, 0.07450981, 0, 1, 1,
0.43584, -0.4576078, 1.42921, 0.07843138, 0, 1, 1,
0.4372947, 1.310231, -0.3176619, 0.08627451, 0, 1, 1,
0.4435708, -0.721185, 1.86918, 0.09019608, 0, 1, 1,
0.4457617, -0.1088705, 1.439097, 0.09803922, 0, 1, 1,
0.4458193, -0.2193567, 2.104256, 0.1058824, 0, 1, 1,
0.4465737, -0.5591176, 1.47659, 0.1098039, 0, 1, 1,
0.4471916, -0.9881561, 3.992735, 0.1176471, 0, 1, 1,
0.4545169, 1.389845, 1.899791, 0.1215686, 0, 1, 1,
0.4567357, -0.258139, 1.496296, 0.1294118, 0, 1, 1,
0.461901, -1.5279, 2.584126, 0.1333333, 0, 1, 1,
0.4673231, -0.1089362, 2.849671, 0.1411765, 0, 1, 1,
0.4677093, 1.950355, 1.39922, 0.145098, 0, 1, 1,
0.4722634, 0.9753289, 1.338376, 0.1529412, 0, 1, 1,
0.4747719, 0.3040501, 1.264042, 0.1568628, 0, 1, 1,
0.4753262, -0.7010715, 3.684518, 0.1647059, 0, 1, 1,
0.4762037, 0.6456402, 0.8571831, 0.1686275, 0, 1, 1,
0.4810003, -0.6445771, 3.101135, 0.1764706, 0, 1, 1,
0.4818232, -0.3166121, 2.85372, 0.1803922, 0, 1, 1,
0.4889677, 1.202486, 2.464316, 0.1882353, 0, 1, 1,
0.4920627, 0.6918268, -0.3288425, 0.1921569, 0, 1, 1,
0.4963447, -1.431276, 3.356353, 0.2, 0, 1, 1,
0.4974433, -0.01507981, 2.521134, 0.2078431, 0, 1, 1,
0.5009639, -0.6239599, 2.21618, 0.2117647, 0, 1, 1,
0.5032007, -1.12837, 3.124356, 0.2196078, 0, 1, 1,
0.5037304, -2.108763, 3.016857, 0.2235294, 0, 1, 1,
0.5070046, 0.6839412, 2.481593, 0.2313726, 0, 1, 1,
0.5082153, 0.8652251, 0.3556329, 0.2352941, 0, 1, 1,
0.5115814, 0.8142323, 0.5226399, 0.2431373, 0, 1, 1,
0.5117286, 0.1896394, 0.9060768, 0.2470588, 0, 1, 1,
0.5239901, -0.1039557, 1.317296, 0.254902, 0, 1, 1,
0.5246543, 0.2134465, -0.05305776, 0.2588235, 0, 1, 1,
0.5281503, 1.044058, 0.384589, 0.2666667, 0, 1, 1,
0.5321504, 0.4715721, 1.093014, 0.2705882, 0, 1, 1,
0.5332714, 0.7273882, -0.2334613, 0.2784314, 0, 1, 1,
0.5335323, 1.410951, 0.6162775, 0.282353, 0, 1, 1,
0.5350561, -0.3754437, 1.799137, 0.2901961, 0, 1, 1,
0.5389442, 0.6932701, 3.057563, 0.2941177, 0, 1, 1,
0.5433087, 1.022981, 0.7534775, 0.3019608, 0, 1, 1,
0.5453714, -1.213131, 3.765202, 0.3098039, 0, 1, 1,
0.5459728, -0.4602633, 0.3476788, 0.3137255, 0, 1, 1,
0.5481691, -0.1855945, 2.692417, 0.3215686, 0, 1, 1,
0.5558032, -1.725415, 2.721304, 0.3254902, 0, 1, 1,
0.5566995, 0.05026202, 1.607243, 0.3333333, 0, 1, 1,
0.55791, 0.8736511, 1.476701, 0.3372549, 0, 1, 1,
0.5599875, -1.068948, 2.66558, 0.345098, 0, 1, 1,
0.5702574, -0.03519092, 3.488426, 0.3490196, 0, 1, 1,
0.5831148, -0.302073, 1.687245, 0.3568628, 0, 1, 1,
0.583178, -0.5483221, 0.3593169, 0.3607843, 0, 1, 1,
0.5833013, 0.06787332, 1.781409, 0.3686275, 0, 1, 1,
0.5839815, -1.219932, 2.016998, 0.372549, 0, 1, 1,
0.5850437, -0.1115137, 0.9464043, 0.3803922, 0, 1, 1,
0.586148, 0.7038115, 0.6007185, 0.3843137, 0, 1, 1,
0.5872294, -0.151564, 1.262207, 0.3921569, 0, 1, 1,
0.5968734, 0.3667184, -0.286428, 0.3960784, 0, 1, 1,
0.605978, -0.4004358, 2.359133, 0.4039216, 0, 1, 1,
0.6241856, -0.7356979, 1.876447, 0.4117647, 0, 1, 1,
0.6245673, -0.114022, 0.5001416, 0.4156863, 0, 1, 1,
0.6365055, 0.1578237, 0.5099446, 0.4235294, 0, 1, 1,
0.6510746, -0.7423104, 2.127035, 0.427451, 0, 1, 1,
0.6557186, -0.5036883, 2.262918, 0.4352941, 0, 1, 1,
0.6600113, -0.2124909, 1.136221, 0.4392157, 0, 1, 1,
0.6666298, 0.06925215, 2.056146, 0.4470588, 0, 1, 1,
0.6786965, 0.9630929, -0.1022532, 0.4509804, 0, 1, 1,
0.6797913, 0.332921, 2.912189, 0.4588235, 0, 1, 1,
0.6800526, 1.321357, 0.4280468, 0.4627451, 0, 1, 1,
0.6825981, -0.4018948, 3.355908, 0.4705882, 0, 1, 1,
0.6838968, 0.06068967, 2.10355, 0.4745098, 0, 1, 1,
0.6910166, 0.1083493, 2.592897, 0.4823529, 0, 1, 1,
0.692149, 1.376356, 1.640099, 0.4862745, 0, 1, 1,
0.6939362, 0.5106676, 2.228221, 0.4941176, 0, 1, 1,
0.6939934, 0.8835521, 0.4300261, 0.5019608, 0, 1, 1,
0.6961281, 0.1923648, 1.219264, 0.5058824, 0, 1, 1,
0.7018178, -1.348148, 3.219182, 0.5137255, 0, 1, 1,
0.7047003, 1.288433, -0.5404849, 0.5176471, 0, 1, 1,
0.7062344, -1.069239, 2.924433, 0.5254902, 0, 1, 1,
0.7093587, -0.06785183, 3.207929, 0.5294118, 0, 1, 1,
0.7137939, 1.031191, 0.3848193, 0.5372549, 0, 1, 1,
0.7139994, -0.7701179, 2.555335, 0.5411765, 0, 1, 1,
0.7144992, -0.9872611, 4.130095, 0.5490196, 0, 1, 1,
0.720008, -0.543604, 3.206566, 0.5529412, 0, 1, 1,
0.7216714, 0.2580519, -0.3524027, 0.5607843, 0, 1, 1,
0.7243719, 0.3235443, 1.664849, 0.5647059, 0, 1, 1,
0.72468, 0.4567538, -0.2781715, 0.572549, 0, 1, 1,
0.7248189, -1.333771, 2.66552, 0.5764706, 0, 1, 1,
0.7257593, 0.849324, 0.08876445, 0.5843138, 0, 1, 1,
0.7301541, 0.5187525, 1.150738, 0.5882353, 0, 1, 1,
0.7396284, 1.847029, -0.09626945, 0.5960785, 0, 1, 1,
0.7403733, -0.940614, 3.911025, 0.6039216, 0, 1, 1,
0.7412254, -1.430364, 3.193614, 0.6078432, 0, 1, 1,
0.7415594, 0.3362433, 1.317649, 0.6156863, 0, 1, 1,
0.7420105, -0.4597919, 0.6577647, 0.6196079, 0, 1, 1,
0.7437185, 0.6575777, -0.1011927, 0.627451, 0, 1, 1,
0.7554197, 0.3838661, -0.5660827, 0.6313726, 0, 1, 1,
0.7567719, -1.788932, 1.979176, 0.6392157, 0, 1, 1,
0.7583666, -0.3830644, 1.651388, 0.6431373, 0, 1, 1,
0.7587497, -0.1635949, 2.317406, 0.6509804, 0, 1, 1,
0.7608009, -0.8975784, 3.383842, 0.654902, 0, 1, 1,
0.7612731, -0.5909885, 3.563241, 0.6627451, 0, 1, 1,
0.7636338, -1.294519, 4.684682, 0.6666667, 0, 1, 1,
0.7638383, 0.4136737, 1.189476, 0.6745098, 0, 1, 1,
0.776137, -0.4347525, 3.302708, 0.6784314, 0, 1, 1,
0.7793847, -0.7146789, 4.017697, 0.6862745, 0, 1, 1,
0.7824038, 0.8525114, 1.126948, 0.6901961, 0, 1, 1,
0.7839701, 0.5293517, -0.1066896, 0.6980392, 0, 1, 1,
0.7855394, -0.1359863, 2.72012, 0.7058824, 0, 1, 1,
0.7866765, 0.009987358, 2.06721, 0.7098039, 0, 1, 1,
0.7879247, 0.9687038, 1.07436, 0.7176471, 0, 1, 1,
0.7893475, 0.2016876, 0.7150973, 0.7215686, 0, 1, 1,
0.7897744, 0.6458188, 1.07119, 0.7294118, 0, 1, 1,
0.7936849, 2.483235, 0.5649219, 0.7333333, 0, 1, 1,
0.7954751, 0.3775798, 3.001533, 0.7411765, 0, 1, 1,
0.796151, -1.431972, 1.72123, 0.7450981, 0, 1, 1,
0.7997228, -0.9963988, 5.140952, 0.7529412, 0, 1, 1,
0.8011833, -1.273192, 1.339764, 0.7568628, 0, 1, 1,
0.8097757, 0.9037499, 0.9868054, 0.7647059, 0, 1, 1,
0.8137297, 0.6813475, 1.206482, 0.7686275, 0, 1, 1,
0.8181129, -0.3686314, 0.4991332, 0.7764706, 0, 1, 1,
0.8198295, 0.5016134, 0.8515208, 0.7803922, 0, 1, 1,
0.8199216, -0.1797357, 1.472543, 0.7882353, 0, 1, 1,
0.8214822, 0.9734585, 0.1128839, 0.7921569, 0, 1, 1,
0.831866, 1.196314, -0.9458336, 0.8, 0, 1, 1,
0.8548247, 1.813124, 0.7402737, 0.8078431, 0, 1, 1,
0.8558256, -0.6175072, 3.644621, 0.8117647, 0, 1, 1,
0.860938, -0.8060099, 2.154148, 0.8196079, 0, 1, 1,
0.8663856, -0.0361969, 2.156678, 0.8235294, 0, 1, 1,
0.8724713, 0.6302729, 0.3927624, 0.8313726, 0, 1, 1,
0.8807708, 0.676488, 0.4750846, 0.8352941, 0, 1, 1,
0.8836135, 2.159321, -0.5147742, 0.8431373, 0, 1, 1,
0.8872451, -0.3915916, 3.428196, 0.8470588, 0, 1, 1,
0.8882837, 0.3224026, 1.322886, 0.854902, 0, 1, 1,
0.8884781, -1.380858, 2.738538, 0.8588235, 0, 1, 1,
0.8908607, 0.07225278, 2.939431, 0.8666667, 0, 1, 1,
0.8930241, -0.07604311, 3.400876, 0.8705882, 0, 1, 1,
0.8997207, 0.544346, 1.893943, 0.8784314, 0, 1, 1,
0.9011109, -0.5933682, 1.655737, 0.8823529, 0, 1, 1,
0.9028138, -1.135515, 2.764709, 0.8901961, 0, 1, 1,
0.9041235, 0.02315052, 2.733498, 0.8941177, 0, 1, 1,
0.9167762, -0.4154266, 3.423295, 0.9019608, 0, 1, 1,
0.917147, -0.09700694, 1.733322, 0.9098039, 0, 1, 1,
0.9187282, 0.4727197, 1.258678, 0.9137255, 0, 1, 1,
0.9187917, -0.1454164, 1.538243, 0.9215686, 0, 1, 1,
0.919199, -0.7724941, 1.580487, 0.9254902, 0, 1, 1,
0.9216576, -0.4221366, 2.206497, 0.9333333, 0, 1, 1,
0.9336329, -0.544303, 1.720369, 0.9372549, 0, 1, 1,
0.9339756, 0.2462635, 0.8699595, 0.945098, 0, 1, 1,
0.9351519, -0.01352785, 1.555352, 0.9490196, 0, 1, 1,
0.9365696, -0.5266143, 1.509239, 0.9568627, 0, 1, 1,
0.9391266, -1.714156, 3.538468, 0.9607843, 0, 1, 1,
0.9404033, -0.3835503, 0.5212675, 0.9686275, 0, 1, 1,
0.9477952, -0.5236079, 3.362357, 0.972549, 0, 1, 1,
0.95915, 1.113096, 1.93282, 0.9803922, 0, 1, 1,
0.9623759, -0.5967289, 2.266957, 0.9843137, 0, 1, 1,
0.9680724, 0.8453873, 2.267878, 0.9921569, 0, 1, 1,
0.971346, -0.05273408, 2.196192, 0.9960784, 0, 1, 1,
0.9724145, 0.1831407, 2.355712, 1, 0, 0.9960784, 1,
0.9726402, -0.04404867, 2.653486, 1, 0, 0.9882353, 1,
0.9737976, -2.063297, 2.018236, 1, 0, 0.9843137, 1,
0.9747728, 0.4981931, 2.516207, 1, 0, 0.9764706, 1,
0.975854, -1.220981, 2.827955, 1, 0, 0.972549, 1,
0.985778, -0.4898989, 2.329426, 1, 0, 0.9647059, 1,
1.000208, 0.2441243, 0.3922731, 1, 0, 0.9607843, 1,
1.000279, -0.3813585, 1.482578, 1, 0, 0.9529412, 1,
1.010016, 0.154677, 1.53801, 1, 0, 0.9490196, 1,
1.010205, -1.450954, 1.592855, 1, 0, 0.9411765, 1,
1.011911, -0.4120535, 1.101804, 1, 0, 0.9372549, 1,
1.011977, -0.5641865, 2.841594, 1, 0, 0.9294118, 1,
1.012358, -0.07160613, -0.8015503, 1, 0, 0.9254902, 1,
1.013095, 2.00008, 1.378878, 1, 0, 0.9176471, 1,
1.017099, 0.08823453, 2.654391, 1, 0, 0.9137255, 1,
1.01866, 0.1440321, 0.7194363, 1, 0, 0.9058824, 1,
1.029117, -0.4285977, 1.367145, 1, 0, 0.9019608, 1,
1.032238, 0.1728883, 1.012671, 1, 0, 0.8941177, 1,
1.048745, -1.38313, 2.45452, 1, 0, 0.8862745, 1,
1.050288, 0.06965474, 0.8240704, 1, 0, 0.8823529, 1,
1.050971, 0.3773831, 0.08586088, 1, 0, 0.8745098, 1,
1.059023, -0.9346361, 2.047664, 1, 0, 0.8705882, 1,
1.06224, 1.805958, 0.4202898, 1, 0, 0.8627451, 1,
1.065439, 0.02329841, 1.742757, 1, 0, 0.8588235, 1,
1.068541, -0.7089095, 2.435788, 1, 0, 0.8509804, 1,
1.077062, -0.9050782, 2.061097, 1, 0, 0.8470588, 1,
1.086662, 1.992041, 0.8222383, 1, 0, 0.8392157, 1,
1.094037, -3.712526, 4.669016, 1, 0, 0.8352941, 1,
1.097792, -0.6553072, 0.6061262, 1, 0, 0.827451, 1,
1.099651, 1.02263, 0.1149889, 1, 0, 0.8235294, 1,
1.106296, -1.608617, 2.640271, 1, 0, 0.8156863, 1,
1.10783, 1.207147, -0.6095957, 1, 0, 0.8117647, 1,
1.122333, -1.913832, 2.836873, 1, 0, 0.8039216, 1,
1.123812, -1.368496, 1.497158, 1, 0, 0.7960784, 1,
1.124553, -0.001553096, 1.735536, 1, 0, 0.7921569, 1,
1.125754, -1.497259, 1.826182, 1, 0, 0.7843137, 1,
1.130032, -1.546384, 3.106659, 1, 0, 0.7803922, 1,
1.131617, 0.8606443, -0.5121958, 1, 0, 0.772549, 1,
1.136185, 0.9815926, 2.311851, 1, 0, 0.7686275, 1,
1.137583, 0.434627, 1.821392, 1, 0, 0.7607843, 1,
1.155745, -0.7811223, 0.4357459, 1, 0, 0.7568628, 1,
1.15585, 0.2740848, 1.400859, 1, 0, 0.7490196, 1,
1.155978, 1.160876, -0.6033472, 1, 0, 0.7450981, 1,
1.156915, -0.5754401, 0.3767579, 1, 0, 0.7372549, 1,
1.160935, -0.9768486, 2.498824, 1, 0, 0.7333333, 1,
1.17341, 1.363359, 2.16485, 1, 0, 0.7254902, 1,
1.173551, 0.003168374, 2.893044, 1, 0, 0.7215686, 1,
1.175918, 1.423832, 1.455733, 1, 0, 0.7137255, 1,
1.176178, 0.4963275, 2.515274, 1, 0, 0.7098039, 1,
1.177696, -0.1093548, 1.563191, 1, 0, 0.7019608, 1,
1.178275, -0.7979774, 1.878049, 1, 0, 0.6941177, 1,
1.190451, 0.3890925, 1.322947, 1, 0, 0.6901961, 1,
1.190877, -0.8045846, 0.04966221, 1, 0, 0.682353, 1,
1.206492, 0.4365768, 0.4262816, 1, 0, 0.6784314, 1,
1.210189, 1.773901, 0.1351087, 1, 0, 0.6705883, 1,
1.213832, 2.519601, -0.2962444, 1, 0, 0.6666667, 1,
1.225861, -0.6408013, 2.411995, 1, 0, 0.6588235, 1,
1.228476, 0.1494047, 0.8833936, 1, 0, 0.654902, 1,
1.235359, 0.5271423, 1.675091, 1, 0, 0.6470588, 1,
1.245522, 0.3048901, 2.099362, 1, 0, 0.6431373, 1,
1.248982, 1.20968, 0.4085617, 1, 0, 0.6352941, 1,
1.249091, 1.664878, 1.272115, 1, 0, 0.6313726, 1,
1.255161, 0.4601397, 1.066138, 1, 0, 0.6235294, 1,
1.256272, 0.9430296, -0.3965776, 1, 0, 0.6196079, 1,
1.257096, -1.182889, 1.917615, 1, 0, 0.6117647, 1,
1.265402, 0.8753736, -0.2011199, 1, 0, 0.6078432, 1,
1.26692, -0.3370508, 1.288119, 1, 0, 0.6, 1,
1.280868, 0.2680683, 1.084116, 1, 0, 0.5921569, 1,
1.280926, 2.224626, -0.3371185, 1, 0, 0.5882353, 1,
1.301243, -0.2887324, 2.14955, 1, 0, 0.5803922, 1,
1.309001, 2.610344, 2.917317, 1, 0, 0.5764706, 1,
1.312032, -0.02831085, 2.389336, 1, 0, 0.5686275, 1,
1.316042, -0.4929194, 2.574842, 1, 0, 0.5647059, 1,
1.317558, -1.469118, 2.619295, 1, 0, 0.5568628, 1,
1.320596, 0.1331965, 2.758688, 1, 0, 0.5529412, 1,
1.327249, -0.2947503, 2.821601, 1, 0, 0.5450981, 1,
1.328146, 0.2460353, 2.564159, 1, 0, 0.5411765, 1,
1.332724, -0.3411757, 2.520029, 1, 0, 0.5333334, 1,
1.34522, -0.1278948, 4.110285, 1, 0, 0.5294118, 1,
1.353889, 0.1611817, 2.444881, 1, 0, 0.5215687, 1,
1.360338, 0.408616, 2.222549, 1, 0, 0.5176471, 1,
1.36308, 0.3700027, 2.181132, 1, 0, 0.509804, 1,
1.365655, -0.1706706, 2.164559, 1, 0, 0.5058824, 1,
1.368098, 1.18235, -0.3728746, 1, 0, 0.4980392, 1,
1.368687, -0.2876065, 0.396367, 1, 0, 0.4901961, 1,
1.370147, -1.309136, 1.865756, 1, 0, 0.4862745, 1,
1.376398, 0.2262913, 1.303086, 1, 0, 0.4784314, 1,
1.377689, -1.552155, 1.194223, 1, 0, 0.4745098, 1,
1.380172, 2.355787, 0.9347163, 1, 0, 0.4666667, 1,
1.38239, 0.1635837, 1.723388, 1, 0, 0.4627451, 1,
1.391939, -0.4058513, 2.083761, 1, 0, 0.454902, 1,
1.397153, -1.236998, 2.724595, 1, 0, 0.4509804, 1,
1.407801, -0.8401486, 3.224803, 1, 0, 0.4431373, 1,
1.430152, 1.116505, 2.105293, 1, 0, 0.4392157, 1,
1.450348, 2.526733, -0.7148839, 1, 0, 0.4313726, 1,
1.463264, 0.4564026, 0.4271378, 1, 0, 0.427451, 1,
1.467576, 0.3287556, 0.9939356, 1, 0, 0.4196078, 1,
1.468337, -0.002874337, 1.584904, 1, 0, 0.4156863, 1,
1.502016, -0.144431, 1.144403, 1, 0, 0.4078431, 1,
1.504916, -1.380112, 2.348299, 1, 0, 0.4039216, 1,
1.509831, 0.7870911, 1.321757, 1, 0, 0.3960784, 1,
1.519163, 0.6426501, 0.2020419, 1, 0, 0.3882353, 1,
1.529084, -2.504713, 3.227512, 1, 0, 0.3843137, 1,
1.546232, -0.1453339, 1.990864, 1, 0, 0.3764706, 1,
1.547278, -0.4540138, 1.25748, 1, 0, 0.372549, 1,
1.54819, 0.1123077, -0.1306579, 1, 0, 0.3647059, 1,
1.556272, 0.3112015, 2.497127, 1, 0, 0.3607843, 1,
1.557914, 1.463233, 0.0804243, 1, 0, 0.3529412, 1,
1.560935, -0.36611, -0.2834123, 1, 0, 0.3490196, 1,
1.563158, 1.312956, 0.9621958, 1, 0, 0.3411765, 1,
1.567772, 0.2279758, 1.39404, 1, 0, 0.3372549, 1,
1.584831, 0.3341986, 0.6328312, 1, 0, 0.3294118, 1,
1.586696, 1.937303, 2.114526, 1, 0, 0.3254902, 1,
1.591511, -1.665779, 3.018586, 1, 0, 0.3176471, 1,
1.601688, 0.3245997, 0.1846739, 1, 0, 0.3137255, 1,
1.602993, -0.3258629, 1.226292, 1, 0, 0.3058824, 1,
1.607272, 0.02917024, 1.135777, 1, 0, 0.2980392, 1,
1.62393, -0.2560916, 1.639674, 1, 0, 0.2941177, 1,
1.630052, 0.4460433, 1.74897, 1, 0, 0.2862745, 1,
1.638409, -0.6685041, 1.316112, 1, 0, 0.282353, 1,
1.649518, 0.3069409, 1.791985, 1, 0, 0.2745098, 1,
1.683762, 1.398114, 0.8061986, 1, 0, 0.2705882, 1,
1.711431, 0.6919664, 0.6234125, 1, 0, 0.2627451, 1,
1.718989, -1.121732, 2.576057, 1, 0, 0.2588235, 1,
1.736166, -1.308825, 2.162502, 1, 0, 0.2509804, 1,
1.747806, 0.0822103, 0.02601533, 1, 0, 0.2470588, 1,
1.783997, -0.7293995, 2.863855, 1, 0, 0.2392157, 1,
1.784137, 0.3036849, 2.308101, 1, 0, 0.2352941, 1,
1.790176, 0.4892226, 1.017874, 1, 0, 0.227451, 1,
1.826445, 1.843455, 0.7832305, 1, 0, 0.2235294, 1,
1.839171, 0.3140682, 1.645038, 1, 0, 0.2156863, 1,
1.844369, -0.8701785, 2.488457, 1, 0, 0.2117647, 1,
1.848401, 0.3017701, 1.79926, 1, 0, 0.2039216, 1,
1.850453, -1.851967, 1.75427, 1, 0, 0.1960784, 1,
1.851862, -0.1355194, 3.246277, 1, 0, 0.1921569, 1,
1.856736, -1.597495, 2.452376, 1, 0, 0.1843137, 1,
1.879514, -0.4918113, 1.557688, 1, 0, 0.1803922, 1,
1.881167, -2.061552, 2.278982, 1, 0, 0.172549, 1,
1.900325, -0.786618, 3.164647, 1, 0, 0.1686275, 1,
1.926035, 0.4891556, 0.6988958, 1, 0, 0.1607843, 1,
1.945298, 2.540771, 0.2412408, 1, 0, 0.1568628, 1,
1.975738, 2.296927, 0.9287175, 1, 0, 0.1490196, 1,
1.996362, 0.5945276, 0.88312, 1, 0, 0.145098, 1,
2.00953, -0.213615, -0.722474, 1, 0, 0.1372549, 1,
2.020749, -0.3973463, 1.443872, 1, 0, 0.1333333, 1,
2.029213, -0.6131238, 2.970145, 1, 0, 0.1254902, 1,
2.036372, 1.538039, 0.3199668, 1, 0, 0.1215686, 1,
2.076899, -0.03604415, 0.1676934, 1, 0, 0.1137255, 1,
2.116789, 0.8975091, 0.7243624, 1, 0, 0.1098039, 1,
2.12631, 1.331029, 2.512078, 1, 0, 0.1019608, 1,
2.18904, -1.066157, 2.549275, 1, 0, 0.09411765, 1,
2.208679, 0.2681022, 3.115375, 1, 0, 0.09019608, 1,
2.240632, -0.9342774, 2.734476, 1, 0, 0.08235294, 1,
2.243164, -0.8469604, 2.571723, 1, 0, 0.07843138, 1,
2.309984, 0.05117841, -0.005953519, 1, 0, 0.07058824, 1,
2.326184, -2.037915, 1.892652, 1, 0, 0.06666667, 1,
2.370998, 1.001469, 2.055203, 1, 0, 0.05882353, 1,
2.374067, 0.08158917, 0.07123584, 1, 0, 0.05490196, 1,
2.412606, -0.03562161, 1.852846, 1, 0, 0.04705882, 1,
2.422085, -0.942412, 1.221037, 1, 0, 0.04313726, 1,
2.482972, -0.8466117, 1.20648, 1, 0, 0.03529412, 1,
2.510372, 0.4497072, 1.343683, 1, 0, 0.03137255, 1,
2.515024, 2.068379, 0.9289787, 1, 0, 0.02352941, 1,
2.852682, 0.1148758, 0.2724224, 1, 0, 0.01960784, 1,
2.919337, -0.2930255, 0.6314237, 1, 0, 0.01176471, 1,
3.25198, -1.887785, 2.587635, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.4238827, -4.888173, -7.518545, 0, -0.5, 0.5, 0.5,
-0.4238827, -4.888173, -7.518545, 1, -0.5, 0.5, 0.5,
-0.4238827, -4.888173, -7.518545, 1, 1.5, 0.5, 0.5,
-0.4238827, -4.888173, -7.518545, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.345863, -0.2445433, -7.518545, 0, -0.5, 0.5, 0.5,
-5.345863, -0.2445433, -7.518545, 1, -0.5, 0.5, 0.5,
-5.345863, -0.2445433, -7.518545, 1, 1.5, 0.5, 0.5,
-5.345863, -0.2445433, -7.518545, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.345863, -4.888173, -0.161926, 0, -0.5, 0.5, 0.5,
-5.345863, -4.888173, -0.161926, 1, -0.5, 0.5, 0.5,
-5.345863, -4.888173, -0.161926, 1, 1.5, 0.5, 0.5,
-5.345863, -4.888173, -0.161926, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-4, -3.816566, -5.820864,
2, -3.816566, -5.820864,
-4, -3.816566, -5.820864,
-4, -3.995167, -6.10381,
-2, -3.816566, -5.820864,
-2, -3.995167, -6.10381,
0, -3.816566, -5.820864,
0, -3.995167, -6.10381,
2, -3.816566, -5.820864,
2, -3.995167, -6.10381
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-4",
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4, -4.352369, -6.669704, 0, -0.5, 0.5, 0.5,
-4, -4.352369, -6.669704, 1, -0.5, 0.5, 0.5,
-4, -4.352369, -6.669704, 1, 1.5, 0.5, 0.5,
-4, -4.352369, -6.669704, 0, 1.5, 0.5, 0.5,
-2, -4.352369, -6.669704, 0, -0.5, 0.5, 0.5,
-2, -4.352369, -6.669704, 1, -0.5, 0.5, 0.5,
-2, -4.352369, -6.669704, 1, 1.5, 0.5, 0.5,
-2, -4.352369, -6.669704, 0, 1.5, 0.5, 0.5,
0, -4.352369, -6.669704, 0, -0.5, 0.5, 0.5,
0, -4.352369, -6.669704, 1, -0.5, 0.5, 0.5,
0, -4.352369, -6.669704, 1, 1.5, 0.5, 0.5,
0, -4.352369, -6.669704, 0, 1.5, 0.5, 0.5,
2, -4.352369, -6.669704, 0, -0.5, 0.5, 0.5,
2, -4.352369, -6.669704, 1, -0.5, 0.5, 0.5,
2, -4.352369, -6.669704, 1, 1.5, 0.5, 0.5,
2, -4.352369, -6.669704, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-4.210021, -3, -5.820864,
-4.210021, 3, -5.820864,
-4.210021, -3, -5.820864,
-4.399329, -3, -6.10381,
-4.210021, -2, -5.820864,
-4.399329, -2, -6.10381,
-4.210021, -1, -5.820864,
-4.399329, -1, -6.10381,
-4.210021, 0, -5.820864,
-4.399329, 0, -6.10381,
-4.210021, 1, -5.820864,
-4.399329, 1, -6.10381,
-4.210021, 2, -5.820864,
-4.399329, 2, -6.10381,
-4.210021, 3, -5.820864,
-4.399329, 3, -6.10381
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.777943, -3, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, -3, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, -3, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, -3, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, -2, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, -2, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, -2, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, -2, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, -1, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, -1, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, -1, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, -1, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, 0, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, 0, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, 0, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, 0, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, 1, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, 1, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, 1, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, 1, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, 2, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, 2, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, 2, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, 2, -6.669704, 0, 1.5, 0.5, 0.5,
-4.777943, 3, -6.669704, 0, -0.5, 0.5, 0.5,
-4.777943, 3, -6.669704, 1, -0.5, 0.5, 0.5,
-4.777943, 3, -6.669704, 1, 1.5, 0.5, 0.5,
-4.777943, 3, -6.669704, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-4.210021, -3.816566, -4,
-4.210021, -3.816566, 4,
-4.210021, -3.816566, -4,
-4.399329, -3.995167, -4,
-4.210021, -3.816566, -2,
-4.399329, -3.995167, -2,
-4.210021, -3.816566, 0,
-4.399329, -3.995167, 0,
-4.210021, -3.816566, 2,
-4.399329, -3.995167, 2,
-4.210021, -3.816566, 4,
-4.399329, -3.995167, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.777943, -4.352369, -4, 0, -0.5, 0.5, 0.5,
-4.777943, -4.352369, -4, 1, -0.5, 0.5, 0.5,
-4.777943, -4.352369, -4, 1, 1.5, 0.5, 0.5,
-4.777943, -4.352369, -4, 0, 1.5, 0.5, 0.5,
-4.777943, -4.352369, -2, 0, -0.5, 0.5, 0.5,
-4.777943, -4.352369, -2, 1, -0.5, 0.5, 0.5,
-4.777943, -4.352369, -2, 1, 1.5, 0.5, 0.5,
-4.777943, -4.352369, -2, 0, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 0, 0, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 0, 1, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 0, 1, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 0, 0, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 2, 0, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 2, 1, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 2, 1, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 2, 0, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 4, 0, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 4, 1, -0.5, 0.5, 0.5,
-4.777943, -4.352369, 4, 1, 1.5, 0.5, 0.5,
-4.777943, -4.352369, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-4.210021, -3.816566, -5.820864,
-4.210021, 3.327479, -5.820864,
-4.210021, -3.816566, 5.497012,
-4.210021, 3.327479, 5.497012,
-4.210021, -3.816566, -5.820864,
-4.210021, -3.816566, 5.497012,
-4.210021, 3.327479, -5.820864,
-4.210021, 3.327479, 5.497012,
-4.210021, -3.816566, -5.820864,
3.362256, -3.816566, -5.820864,
-4.210021, -3.816566, 5.497012,
3.362256, -3.816566, 5.497012,
-4.210021, 3.327479, -5.820864,
3.362256, 3.327479, -5.820864,
-4.210021, 3.327479, 5.497012,
3.362256, 3.327479, 5.497012,
3.362256, -3.816566, -5.820864,
3.362256, 3.327479, -5.820864,
3.362256, -3.816566, 5.497012,
3.362256, 3.327479, 5.497012,
3.362256, -3.816566, -5.820864,
3.362256, -3.816566, 5.497012,
3.362256, 3.327479, -5.820864,
3.362256, 3.327479, 5.497012
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.211348;
var distance = 36.53321;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.4238827, 0.2445433, 0.161926 );
mvMatrix.scale( 1.17247, 1.242751, 0.7844468 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.53321);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methidathion<-read.table("Methidathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methidathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
y<-Methidathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
z<-Methidathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-4.099746, 1.225668, -1.577892, 0, 0, 1, 1, 1,
-2.952039, -0.1654827, -3.176776, 1, 0, 0, 1, 1,
-2.9345, -1.51321, -2.927348, 1, 0, 0, 1, 1,
-2.767164, 0.5814438, -1.195056, 1, 0, 0, 1, 1,
-2.742779, 1.409976, -1.38968, 1, 0, 0, 1, 1,
-2.611773, -0.4625129, -3.414074, 1, 0, 0, 1, 1,
-2.603898, -1.707303, -2.455692, 0, 0, 0, 1, 1,
-2.374297, -0.07933468, -2.46553, 0, 0, 0, 1, 1,
-2.372209, 1.140923, -0.9399828, 0, 0, 0, 1, 1,
-2.368364, 0.9514749, -2.42357, 0, 0, 0, 1, 1,
-2.326454, 0.1745488, -2.68319, 0, 0, 0, 1, 1,
-2.276933, 0.3930542, -1.772845, 0, 0, 0, 1, 1,
-2.267936, -0.5311486, -2.290105, 0, 0, 0, 1, 1,
-2.212789, -1.088687, -0.6130676, 1, 1, 1, 1, 1,
-2.197086, 0.7712873, -1.79783, 1, 1, 1, 1, 1,
-2.183171, 0.5333105, -2.152401, 1, 1, 1, 1, 1,
-2.171194, -0.7042697, -2.987688, 1, 1, 1, 1, 1,
-2.150859, 0.0518922, -1.213939, 1, 1, 1, 1, 1,
-2.106814, -1.880304, -2.531019, 1, 1, 1, 1, 1,
-2.100275, 0.03426826, -1.724465, 1, 1, 1, 1, 1,
-2.076816, 0.2331585, -1.946531, 1, 1, 1, 1, 1,
-1.953676, -0.9476452, -1.967707, 1, 1, 1, 1, 1,
-1.936176, 0.1855215, -2.154385, 1, 1, 1, 1, 1,
-1.912671, -1.154585, -2.777105, 1, 1, 1, 1, 1,
-1.904422, 0.7036454, -1.086055, 1, 1, 1, 1, 1,
-1.887273, 0.4915091, -1.066368, 1, 1, 1, 1, 1,
-1.886087, 0.03711498, -0.3906513, 1, 1, 1, 1, 1,
-1.882184, 1.004246, -0.5115926, 1, 1, 1, 1, 1,
-1.879959, -1.517415, -1.979603, 0, 0, 1, 1, 1,
-1.876992, -0.629431, -4.499119, 1, 0, 0, 1, 1,
-1.863837, -1.726211, -1.27905, 1, 0, 0, 1, 1,
-1.842952, 0.4463522, -2.081983, 1, 0, 0, 1, 1,
-1.831129, -0.6962526, -1.257388, 1, 0, 0, 1, 1,
-1.802166, -0.8920965, -1.309777, 1, 0, 0, 1, 1,
-1.801831, 1.53753, -3.209522, 0, 0, 0, 1, 1,
-1.793317, -2.09721, -2.053186, 0, 0, 0, 1, 1,
-1.786678, 1.719567, 1.427593, 0, 0, 0, 1, 1,
-1.777443, -2.51256, -2.274728, 0, 0, 0, 1, 1,
-1.769132, 0.7407274, -1.833928, 0, 0, 0, 1, 1,
-1.745703, -0.6391571, -0.6056506, 0, 0, 0, 1, 1,
-1.731932, 0.6688452, -0.6391777, 0, 0, 0, 1, 1,
-1.727761, 0.4168209, -1.831159, 1, 1, 1, 1, 1,
-1.701999, 0.5919307, -0.5270134, 1, 1, 1, 1, 1,
-1.700534, 0.3409269, -0.9210087, 1, 1, 1, 1, 1,
-1.699245, -0.1321773, -2.685433, 1, 1, 1, 1, 1,
-1.679261, -1.190165, -4.583988, 1, 1, 1, 1, 1,
-1.666794, -1.220522, -0.4206053, 1, 1, 1, 1, 1,
-1.659982, -1.45384, -0.8637881, 1, 1, 1, 1, 1,
-1.647619, 0.3129357, -0.9145738, 1, 1, 1, 1, 1,
-1.644595, -0.337087, -2.103582, 1, 1, 1, 1, 1,
-1.635723, -0.1959711, -3.360879, 1, 1, 1, 1, 1,
-1.615372, 0.8539011, -0.3665176, 1, 1, 1, 1, 1,
-1.576569, 0.2248717, -0.9890345, 1, 1, 1, 1, 1,
-1.573009, -0.3180421, -2.284831, 1, 1, 1, 1, 1,
-1.567327, -0.5595719, -1.578853, 1, 1, 1, 1, 1,
-1.54775, 0.5623428, -1.749588, 1, 1, 1, 1, 1,
-1.538324, -1.428785, -2.730589, 0, 0, 1, 1, 1,
-1.537467, -0.06690116, -1.154964, 1, 0, 0, 1, 1,
-1.536478, 1.034185, -1.997282, 1, 0, 0, 1, 1,
-1.520034, 2.210333, -0.9939122, 1, 0, 0, 1, 1,
-1.519449, -0.9516511, -1.65151, 1, 0, 0, 1, 1,
-1.51881, 0.3409754, -2.871147, 1, 0, 0, 1, 1,
-1.509799, 0.1156715, -3.136312, 0, 0, 0, 1, 1,
-1.507438, -1.426749, -1.47195, 0, 0, 0, 1, 1,
-1.47917, -0.761723, -1.551203, 0, 0, 0, 1, 1,
-1.47795, -1.281759, -3.283158, 0, 0, 0, 1, 1,
-1.456334, -0.3820188, -0.4459487, 0, 0, 0, 1, 1,
-1.456172, 0.6992913, -1.946422, 0, 0, 0, 1, 1,
-1.45188, -0.2470618, -3.184883, 0, 0, 0, 1, 1,
-1.447568, -0.94655, -2.053869, 1, 1, 1, 1, 1,
-1.439922, -2.851351, -2.600585, 1, 1, 1, 1, 1,
-1.437059, 0.1430012, -1.33487, 1, 1, 1, 1, 1,
-1.429877, -1.771271, -1.669891, 1, 1, 1, 1, 1,
-1.416923, -0.8375224, -2.242189, 1, 1, 1, 1, 1,
-1.409896, -0.3062038, -1.33009, 1, 1, 1, 1, 1,
-1.406018, 2.083358, 0.2193188, 1, 1, 1, 1, 1,
-1.392864, 1.974532, -2.55141, 1, 1, 1, 1, 1,
-1.388841, 0.6472301, -1.576196, 1, 1, 1, 1, 1,
-1.360861, 0.6208262, -0.08091729, 1, 1, 1, 1, 1,
-1.359261, 0.3460367, -1.260958, 1, 1, 1, 1, 1,
-1.351085, 0.2596245, -0.6153578, 1, 1, 1, 1, 1,
-1.340764, 1.414152, -0.1870227, 1, 1, 1, 1, 1,
-1.33868, 0.08887509, -0.7620054, 1, 1, 1, 1, 1,
-1.3329, 0.182199, -1.528123, 1, 1, 1, 1, 1,
-1.328953, -3.347583, -2.697398, 0, 0, 1, 1, 1,
-1.324053, 1.322236, -1.682997, 1, 0, 0, 1, 1,
-1.322243, 1.045532, -1.366066, 1, 0, 0, 1, 1,
-1.320877, 0.4113046, -1.792531, 1, 0, 0, 1, 1,
-1.317559, 0.4330519, -3.016291, 1, 0, 0, 1, 1,
-1.313889, 0.5352119, -1.637159, 1, 0, 0, 1, 1,
-1.301821, 0.2877681, -2.461152, 0, 0, 0, 1, 1,
-1.301761, -1.572537, -4.119182, 0, 0, 0, 1, 1,
-1.301175, -0.3185294, -1.016945, 0, 0, 0, 1, 1,
-1.300028, -0.07437762, -2.791313, 0, 0, 0, 1, 1,
-1.296376, -0.2506517, -1.560765, 0, 0, 0, 1, 1,
-1.292309, -0.6195493, -0.6067087, 0, 0, 0, 1, 1,
-1.286422, 0.7300155, -0.8861048, 0, 0, 0, 1, 1,
-1.285139, -1.017958, -3.301689, 1, 1, 1, 1, 1,
-1.284867, 0.943134, -1.377158, 1, 1, 1, 1, 1,
-1.284702, -0.7760255, -2.431357, 1, 1, 1, 1, 1,
-1.283127, 0.7028292, 2.369631, 1, 1, 1, 1, 1,
-1.278909, 0.04511595, -0.7991426, 1, 1, 1, 1, 1,
-1.275928, 1.062659, 1.367043, 1, 1, 1, 1, 1,
-1.274593, 0.2894696, -1.528973, 1, 1, 1, 1, 1,
-1.274059, -0.6078491, -1.765766, 1, 1, 1, 1, 1,
-1.27289, 1.079543, -1.228665, 1, 1, 1, 1, 1,
-1.270656, 1.642298, -1.075311, 1, 1, 1, 1, 1,
-1.266819, 0.6075714, -0.4478921, 1, 1, 1, 1, 1,
-1.254892, 0.3922459, -0.3031745, 1, 1, 1, 1, 1,
-1.251521, -1.32836, -1.565799, 1, 1, 1, 1, 1,
-1.250856, 0.05013967, -0.6623264, 1, 1, 1, 1, 1,
-1.238277, -0.2797863, -0.8259504, 1, 1, 1, 1, 1,
-1.227262, 1.498627, -0.8269886, 0, 0, 1, 1, 1,
-1.22048, 0.8339237, 0.7828624, 1, 0, 0, 1, 1,
-1.208889, -1.688676, -1.256884, 1, 0, 0, 1, 1,
-1.20865, -0.3167377, -1.667614, 1, 0, 0, 1, 1,
-1.20305, 0.06005895, -1.97463, 1, 0, 0, 1, 1,
-1.19694, -1.293154, -2.22418, 1, 0, 0, 1, 1,
-1.183002, -1.23207, -1.737244, 0, 0, 0, 1, 1,
-1.176302, 2.064687, -0.6674901, 0, 0, 0, 1, 1,
-1.165021, 0.3861658, -1.165411, 0, 0, 0, 1, 1,
-1.148764, 1.06282, 0.2880132, 0, 0, 0, 1, 1,
-1.14726, -1.467256, -3.538356, 0, 0, 0, 1, 1,
-1.13018, -1.962256, -4.089815, 0, 0, 0, 1, 1,
-1.127427, -1.119412, -2.347152, 0, 0, 0, 1, 1,
-1.127036, 1.242133, -0.9011689, 1, 1, 1, 1, 1,
-1.12515, 0.1239487, 0.1983659, 1, 1, 1, 1, 1,
-1.123267, 0.3902569, -1.675333, 1, 1, 1, 1, 1,
-1.120996, -0.9592751, -4.00004, 1, 1, 1, 1, 1,
-1.119615, 1.332294, -2.083537, 1, 1, 1, 1, 1,
-1.108189, -1.092857, -2.277091, 1, 1, 1, 1, 1,
-1.105283, 0.2821705, -1.17458, 1, 1, 1, 1, 1,
-1.07987, 0.37854, -1.660479, 1, 1, 1, 1, 1,
-1.075385, 0.4085343, -2.10315, 1, 1, 1, 1, 1,
-1.073059, 0.8693244, -0.8131747, 1, 1, 1, 1, 1,
-1.070351, -0.531656, -2.410968, 1, 1, 1, 1, 1,
-1.067892, -0.4130267, -1.520183, 1, 1, 1, 1, 1,
-1.058739, 0.4658673, -2.037274, 1, 1, 1, 1, 1,
-1.057756, -0.7780967, -2.253078, 1, 1, 1, 1, 1,
-1.057554, -0.1331772, -2.947955, 1, 1, 1, 1, 1,
-1.05421, 1.725417, -0.9777871, 0, 0, 1, 1, 1,
-1.050804, -1.159831, -0.269093, 1, 0, 0, 1, 1,
-1.032163, 0.223032, -0.6260274, 1, 0, 0, 1, 1,
-1.031819, 1.54594, 0.06571487, 1, 0, 0, 1, 1,
-1.026334, 1.144845, -0.4467332, 1, 0, 0, 1, 1,
-1.026222, -2.098525, 0.02673826, 1, 0, 0, 1, 1,
-1.025917, 0.0799862, -1.392545, 0, 0, 0, 1, 1,
-1.025243, -0.3055896, -1.325367, 0, 0, 0, 1, 1,
-1.023269, -0.2637862, -2.380283, 0, 0, 0, 1, 1,
-1.020746, -0.6391376, -2.97827, 0, 0, 0, 1, 1,
-1.020544, -1.871785, -3.973368, 0, 0, 0, 1, 1,
-1.018046, 0.2357279, -3.181196, 0, 0, 0, 1, 1,
-1.015339, 0.7830567, -1.457079, 0, 0, 0, 1, 1,
-1.010414, 1.326607, -1.558668, 1, 1, 1, 1, 1,
-1.009497, -0.3133102, -1.049141, 1, 1, 1, 1, 1,
-1.006768, -0.598023, -1.257028, 1, 1, 1, 1, 1,
-1.006038, -1.792304, -0.9540063, 1, 1, 1, 1, 1,
-1.005787, 1.241586, -1.66886, 1, 1, 1, 1, 1,
-1.004186, 0.2424698, -1.640174, 1, 1, 1, 1, 1,
-0.9997672, 0.3679189, -0.3706903, 1, 1, 1, 1, 1,
-0.9921948, 0.7393739, -2.724153, 1, 1, 1, 1, 1,
-0.9909639, -0.5300934, -3.334797, 1, 1, 1, 1, 1,
-0.9891526, -0.6343185, -0.8296241, 1, 1, 1, 1, 1,
-0.9871492, -1.102865, -3.319329, 1, 1, 1, 1, 1,
-0.9775118, 0.4506767, -1.053518, 1, 1, 1, 1, 1,
-0.9710415, 0.2297631, -0.3563225, 1, 1, 1, 1, 1,
-0.9670392, 1.021519, -0.7979279, 1, 1, 1, 1, 1,
-0.9666235, 0.6162064, -1.583537, 1, 1, 1, 1, 1,
-0.9647323, -0.8810624, -1.528223, 0, 0, 1, 1, 1,
-0.96427, -0.3900848, -2.028085, 1, 0, 0, 1, 1,
-0.9565191, -1.449556, -1.85728, 1, 0, 0, 1, 1,
-0.9541399, 1.642638, -1.012885, 1, 0, 0, 1, 1,
-0.9510264, 1.517078, -0.5743557, 1, 0, 0, 1, 1,
-0.9508003, -1.101641, -2.833729, 1, 0, 0, 1, 1,
-0.9471883, 0.1178459, -1.835472, 0, 0, 0, 1, 1,
-0.9322774, 0.5252126, -0.5233608, 0, 0, 0, 1, 1,
-0.9237888, -0.3865226, -1.643338, 0, 0, 0, 1, 1,
-0.9234905, 1.413994, -0.1712586, 0, 0, 0, 1, 1,
-0.9172957, 0.6357591, 0.4739436, 0, 0, 0, 1, 1,
-0.914454, -0.7179791, -2.289817, 0, 0, 0, 1, 1,
-0.9129282, 0.7386592, -1.050407, 0, 0, 0, 1, 1,
-0.9093495, -0.02324225, -2.195535, 1, 1, 1, 1, 1,
-0.9082745, 0.8394732, 0.6492319, 1, 1, 1, 1, 1,
-0.9080537, 0.5848681, 0.3658183, 1, 1, 1, 1, 1,
-0.9079745, -0.02846092, -2.230149, 1, 1, 1, 1, 1,
-0.9065108, -0.7966748, -2.915597, 1, 1, 1, 1, 1,
-0.9060709, -0.2857762, -2.505087, 1, 1, 1, 1, 1,
-0.9046938, -1.555491, -1.748851, 1, 1, 1, 1, 1,
-0.9039603, -1.749381, -3.919247, 1, 1, 1, 1, 1,
-0.9024142, 1.353275, -0.1483577, 1, 1, 1, 1, 1,
-0.8993947, -0.6738036, -1.696424, 1, 1, 1, 1, 1,
-0.8972044, -1.72036, -3.355187, 1, 1, 1, 1, 1,
-0.8896986, 0.9637486, -1.292832, 1, 1, 1, 1, 1,
-0.8870951, -1.304112, -1.693951, 1, 1, 1, 1, 1,
-0.8864634, 0.1337802, -1.953597, 1, 1, 1, 1, 1,
-0.8834304, 1.395504, -2.085846, 1, 1, 1, 1, 1,
-0.8828927, 0.2100836, 0.3326992, 0, 0, 1, 1, 1,
-0.8791018, 2.263113, -1.94927, 1, 0, 0, 1, 1,
-0.8749604, 1.501166, -1.492536, 1, 0, 0, 1, 1,
-0.8596566, -0.1184522, -0.2373178, 1, 0, 0, 1, 1,
-0.8593481, 0.1846604, -2.036928, 1, 0, 0, 1, 1,
-0.8551996, 0.146762, -1.755908, 1, 0, 0, 1, 1,
-0.8512231, -0.6881888, -1.651095, 0, 0, 0, 1, 1,
-0.8480228, 0.3435146, -1.279227, 0, 0, 0, 1, 1,
-0.8477518, -0.2611013, -1.018513, 0, 0, 0, 1, 1,
-0.8464694, -0.9731568, -3.736848, 0, 0, 0, 1, 1,
-0.8447545, -0.02302417, -2.370768, 0, 0, 0, 1, 1,
-0.8421729, 0.6669299, -3.268014, 0, 0, 0, 1, 1,
-0.8408505, 0.4706277, -0.6098461, 0, 0, 0, 1, 1,
-0.83878, 0.6786983, -0.05689971, 1, 1, 1, 1, 1,
-0.8384004, -0.5301855, -2.466901, 1, 1, 1, 1, 1,
-0.8381881, 0.3000734, -1.298827, 1, 1, 1, 1, 1,
-0.8371593, 0.934315, -1.534324, 1, 1, 1, 1, 1,
-0.8296579, 1.540999, 0.3692955, 1, 1, 1, 1, 1,
-0.8278085, 1.363656, -2.573229, 1, 1, 1, 1, 1,
-0.8249307, -0.2679688, -0.4973629, 1, 1, 1, 1, 1,
-0.8196388, 1.797846, -0.03879801, 1, 1, 1, 1, 1,
-0.8089086, -0.4874445, -2.133677, 1, 1, 1, 1, 1,
-0.7993841, 0.7568732, -1.854063, 1, 1, 1, 1, 1,
-0.7851734, 2.176059, 0.287145, 1, 1, 1, 1, 1,
-0.782248, -1.484344, -3.103405, 1, 1, 1, 1, 1,
-0.7633423, 1.403852, 0.9457333, 1, 1, 1, 1, 1,
-0.7430059, 0.5208679, -1.858654, 1, 1, 1, 1, 1,
-0.7397113, 0.1889046, -1.362578, 1, 1, 1, 1, 1,
-0.7384068, 1.014458, -0.2247216, 0, 0, 1, 1, 1,
-0.7369161, 0.9807315, 0.0326778, 1, 0, 0, 1, 1,
-0.7342758, -0.7633541, -2.684077, 1, 0, 0, 1, 1,
-0.7330915, 0.4498501, -2.864763, 1, 0, 0, 1, 1,
-0.7273836, 0.4994216, -0.95469, 1, 0, 0, 1, 1,
-0.7201942, 0.03311433, -2.377943, 1, 0, 0, 1, 1,
-0.7184672, -1.313549, -2.943902, 0, 0, 0, 1, 1,
-0.7158987, -0.795481, -2.990477, 0, 0, 0, 1, 1,
-0.7137681, -1.012691, -3.183348, 0, 0, 0, 1, 1,
-0.7094123, -0.4918231, -1.60205, 0, 0, 0, 1, 1,
-0.7080368, 0.3012588, -3.34923, 0, 0, 0, 1, 1,
-0.7014231, -1.367169, -4.068583, 0, 0, 0, 1, 1,
-0.6969447, -1.301609, -3.686279, 0, 0, 0, 1, 1,
-0.6920526, -0.8374429, -1.678044, 1, 1, 1, 1, 1,
-0.6896535, 0.9667965, 0.2649727, 1, 1, 1, 1, 1,
-0.687074, 0.2590117, -2.776074, 1, 1, 1, 1, 1,
-0.6801335, 2.203933, -1.079383, 1, 1, 1, 1, 1,
-0.6790559, -0.6921666, -2.074932, 1, 1, 1, 1, 1,
-0.6724021, -1.215111, -4.468152, 1, 1, 1, 1, 1,
-0.6699699, -0.785419, -1.480725, 1, 1, 1, 1, 1,
-0.6685606, 0.60517, -0.6521409, 1, 1, 1, 1, 1,
-0.6653202, -0.4861673, -3.323399, 1, 1, 1, 1, 1,
-0.6649193, -0.1396091, -0.9720946, 1, 1, 1, 1, 1,
-0.6627734, -2.111478, -3.091136, 1, 1, 1, 1, 1,
-0.6624911, -0.4919932, -2.699085, 1, 1, 1, 1, 1,
-0.6554195, 1.293854, -1.423312, 1, 1, 1, 1, 1,
-0.654504, 0.04212876, -0.993109, 1, 1, 1, 1, 1,
-0.6538985, 1.400786, -0.8634846, 1, 1, 1, 1, 1,
-0.6472937, 0.4181142, -1.685562, 0, 0, 1, 1, 1,
-0.635119, -0.08788201, -2.135246, 1, 0, 0, 1, 1,
-0.6344596, 0.1115634, -1.7445, 1, 0, 0, 1, 1,
-0.6292942, 1.026457, -0.4438734, 1, 0, 0, 1, 1,
-0.626334, 0.4961717, -1.352638, 1, 0, 0, 1, 1,
-0.6241131, 0.613387, -0.4564801, 1, 0, 0, 1, 1,
-0.6132422, 0.966089, -1.043617, 0, 0, 0, 1, 1,
-0.6122522, -1.308434, -3.471021, 0, 0, 0, 1, 1,
-0.6082528, -1.062446, -3.321486, 0, 0, 0, 1, 1,
-0.6066655, 0.6040674, 0.3953165, 0, 0, 0, 1, 1,
-0.6028823, 0.1936565, -2.504672, 0, 0, 0, 1, 1,
-0.6020618, 0.3840505, -1.206229, 0, 0, 0, 1, 1,
-0.6016161, 0.5197179, 1.379474, 0, 0, 0, 1, 1,
-0.5985353, -0.7978622, -2.31892, 1, 1, 1, 1, 1,
-0.5974658, -1.746525, -1.809313, 1, 1, 1, 1, 1,
-0.5950255, -1.471156, -2.873564, 1, 1, 1, 1, 1,
-0.5933403, 0.5229403, 0.5014519, 1, 1, 1, 1, 1,
-0.5875693, -0.4152628, -2.418856, 1, 1, 1, 1, 1,
-0.5774394, -1.195946, -1.764509, 1, 1, 1, 1, 1,
-0.5757146, 0.05066855, -1.871856, 1, 1, 1, 1, 1,
-0.5748709, 3.22344, -0.7769751, 1, 1, 1, 1, 1,
-0.5672241, 0.8316193, -1.834621, 1, 1, 1, 1, 1,
-0.5663781, 0.774015, 1.032147, 1, 1, 1, 1, 1,
-0.5640497, -0.3252001, -2.722094, 1, 1, 1, 1, 1,
-0.5630921, 0.7455329, -1.293432, 1, 1, 1, 1, 1,
-0.561932, -0.8623305, -3.546415, 1, 1, 1, 1, 1,
-0.5608891, 1.774014, -0.9410221, 1, 1, 1, 1, 1,
-0.5515651, -0.4013244, -2.706901, 1, 1, 1, 1, 1,
-0.5490838, 1.460062, -1.150554, 0, 0, 1, 1, 1,
-0.5461553, 0.06066534, -1.262033, 1, 0, 0, 1, 1,
-0.5440701, -0.728605, -2.17987, 1, 0, 0, 1, 1,
-0.5432988, 0.1275132, -0.6610535, 1, 0, 0, 1, 1,
-0.5430533, -0.7728505, -1.560757, 1, 0, 0, 1, 1,
-0.5345511, 0.1336227, -1.098019, 1, 0, 0, 1, 1,
-0.534187, 0.866665, -1.664727, 0, 0, 0, 1, 1,
-0.5266569, 2.458885, 0.18192, 0, 0, 0, 1, 1,
-0.5231385, 0.3538616, 0.5363329, 0, 0, 0, 1, 1,
-0.5231291, 0.5038432, -1.170246, 0, 0, 0, 1, 1,
-0.5213727, 0.1169709, -3.003508, 0, 0, 0, 1, 1,
-0.5183638, 1.243886, -0.3672596, 0, 0, 0, 1, 1,
-0.5158198, 1.526314, -1.146209, 0, 0, 0, 1, 1,
-0.5153927, 0.1939785, -2.137163, 1, 1, 1, 1, 1,
-0.5153624, 0.8648315, 0.1243125, 1, 1, 1, 1, 1,
-0.5118954, 0.1669946, 0.4672476, 1, 1, 1, 1, 1,
-0.5097322, -1.980031, -5.65604, 1, 1, 1, 1, 1,
-0.5088571, -0.6020288, -1.331417, 1, 1, 1, 1, 1,
-0.5072868, 0.8705125, 0.356622, 1, 1, 1, 1, 1,
-0.5061004, -1.710784, -0.3763546, 1, 1, 1, 1, 1,
-0.5054552, -0.1143178, -1.253607, 1, 1, 1, 1, 1,
-0.5050961, -1.136951, -2.339544, 1, 1, 1, 1, 1,
-0.5015177, -0.9303824, -2.453555, 1, 1, 1, 1, 1,
-0.4897454, 0.04563715, -1.645666, 1, 1, 1, 1, 1,
-0.4896857, -0.9030737, -3.509902, 1, 1, 1, 1, 1,
-0.487404, 1.42548, -0.557596, 1, 1, 1, 1, 1,
-0.486624, -0.1357437, -1.778286, 1, 1, 1, 1, 1,
-0.4830323, 1.932625, -1.060326, 1, 1, 1, 1, 1,
-0.4830013, -1.00816, -2.416532, 0, 0, 1, 1, 1,
-0.481586, -0.4071583, -2.260429, 1, 0, 0, 1, 1,
-0.4801514, -0.685095, -2.259356, 1, 0, 0, 1, 1,
-0.47962, -0.8278464, -1.900091, 1, 0, 0, 1, 1,
-0.4788195, 1.48966, 1.922475, 1, 0, 0, 1, 1,
-0.4666657, 0.5751476, -1.280551, 1, 0, 0, 1, 1,
-0.4661068, -0.7075944, -2.914862, 0, 0, 0, 1, 1,
-0.4658976, 2.752425, -0.8326268, 0, 0, 0, 1, 1,
-0.4467879, -0.1554894, 0.2703646, 0, 0, 0, 1, 1,
-0.4445814, 0.2549122, -1.907188, 0, 0, 0, 1, 1,
-0.443813, 0.4244597, 0.08732037, 0, 0, 0, 1, 1,
-0.4437482, 0.9706144, -0.4248015, 0, 0, 0, 1, 1,
-0.4404463, 0.6870698, -0.3608532, 0, 0, 0, 1, 1,
-0.4362318, -0.3868825, -0.9718463, 1, 1, 1, 1, 1,
-0.4316883, 2.305169, -0.803625, 1, 1, 1, 1, 1,
-0.4312031, -1.52383, -3.431015, 1, 1, 1, 1, 1,
-0.4305432, -0.4829146, -1.533826, 1, 1, 1, 1, 1,
-0.4295136, 0.1400646, -0.6015248, 1, 1, 1, 1, 1,
-0.4241279, 0.6447936, 0.01666352, 1, 1, 1, 1, 1,
-0.42326, 0.5001559, 0.7578104, 1, 1, 1, 1, 1,
-0.4232363, 1.601462, -0.4848411, 1, 1, 1, 1, 1,
-0.420572, 1.438625, 0.9300336, 1, 1, 1, 1, 1,
-0.4193181, 0.8071671, -0.1737554, 1, 1, 1, 1, 1,
-0.4160173, -0.2215028, -2.150941, 1, 1, 1, 1, 1,
-0.4160068, -0.2700334, -1.053866, 1, 1, 1, 1, 1,
-0.4133406, 0.07564555, -0.8841093, 1, 1, 1, 1, 1,
-0.4125727, 0.8422431, 0.2828954, 1, 1, 1, 1, 1,
-0.4119857, -0.5027174, -3.40875, 1, 1, 1, 1, 1,
-0.4098674, 0.09883606, -2.269879, 0, 0, 1, 1, 1,
-0.4051964, 0.03266773, -1.926425, 1, 0, 0, 1, 1,
-0.4035527, -0.3774284, -2.423965, 1, 0, 0, 1, 1,
-0.4031731, -0.01308503, -0.1529194, 1, 0, 0, 1, 1,
-0.4008765, -1.277683, -2.662207, 1, 0, 0, 1, 1,
-0.3955678, 1.336329, 0.5709385, 1, 0, 0, 1, 1,
-0.3951119, -1.751508, -4.573749, 0, 0, 0, 1, 1,
-0.3890728, 2.405081, -1.171404, 0, 0, 0, 1, 1,
-0.3868948, -3.014779, -3.594728, 0, 0, 0, 1, 1,
-0.3859158, -0.5787013, -2.956727, 0, 0, 0, 1, 1,
-0.3847597, -1.985231, -1.227153, 0, 0, 0, 1, 1,
-0.3698876, 0.236229, 0.1065361, 0, 0, 0, 1, 1,
-0.3663247, -0.1942872, -2.621677, 0, 0, 0, 1, 1,
-0.3654993, 0.882677, 0.2886184, 1, 1, 1, 1, 1,
-0.3630171, -0.1210354, -3.027297, 1, 1, 1, 1, 1,
-0.3563977, -0.2196466, -0.5471305, 1, 1, 1, 1, 1,
-0.3557939, 0.6294188, 0.3869651, 1, 1, 1, 1, 1,
-0.3523025, 0.479125, 0.1085879, 1, 1, 1, 1, 1,
-0.349352, -0.9912593, -1.819179, 1, 1, 1, 1, 1,
-0.349145, -2.204541, -2.481564, 1, 1, 1, 1, 1,
-0.3452882, 0.01034402, -1.874671, 1, 1, 1, 1, 1,
-0.3441673, 0.03803553, 0.06569714, 1, 1, 1, 1, 1,
-0.3407573, 0.3379706, -1.575196, 1, 1, 1, 1, 1,
-0.3367835, 0.5490503, -0.2893959, 1, 1, 1, 1, 1,
-0.3345219, -2.275208, -2.320029, 1, 1, 1, 1, 1,
-0.3336851, 0.2745279, -1.386991, 1, 1, 1, 1, 1,
-0.3335722, 0.8262489, -1.285068, 1, 1, 1, 1, 1,
-0.3261573, -1.457592, -3.797623, 1, 1, 1, 1, 1,
-0.3253119, 1.300071, -1.064542, 0, 0, 1, 1, 1,
-0.3227053, -1.366805, -2.856665, 1, 0, 0, 1, 1,
-0.3220778, 0.5026085, -0.5373102, 1, 0, 0, 1, 1,
-0.3210531, -1.234457, -1.869541, 1, 0, 0, 1, 1,
-0.3209422, 0.7451961, -2.153439, 1, 0, 0, 1, 1,
-0.3171955, 0.3260442, -2.903641, 1, 0, 0, 1, 1,
-0.316796, 0.1022408, 0.2660455, 0, 0, 0, 1, 1,
-0.3165082, 0.2211201, -2.60991, 0, 0, 0, 1, 1,
-0.3110392, -0.08403192, -0.8459399, 0, 0, 0, 1, 1,
-0.3076718, -0.4310352, -1.003789, 0, 0, 0, 1, 1,
-0.3044228, -1.665264, -2.912851, 0, 0, 0, 1, 1,
-0.3021794, 0.4326983, -1.067367, 0, 0, 0, 1, 1,
-0.2987374, 0.2748594, -1.539236, 0, 0, 0, 1, 1,
-0.2933738, -1.091048, -2.600318, 1, 1, 1, 1, 1,
-0.2875311, -0.1226947, -1.830013, 1, 1, 1, 1, 1,
-0.284696, 0.3313217, -0.9941444, 1, 1, 1, 1, 1,
-0.2833393, 1.566776, 0.5627494, 1, 1, 1, 1, 1,
-0.2805987, -1.058237, -3.938138, 1, 1, 1, 1, 1,
-0.2751308, 0.5068995, -0.9630769, 1, 1, 1, 1, 1,
-0.2750351, -0.8376293, -3.901296, 1, 1, 1, 1, 1,
-0.2747436, 1.503852, -1.475443, 1, 1, 1, 1, 1,
-0.2719786, -0.2292527, -0.699157, 1, 1, 1, 1, 1,
-0.2713323, 0.3408941, -2.767671, 1, 1, 1, 1, 1,
-0.2711316, -1.591746, -2.23496, 1, 1, 1, 1, 1,
-0.270625, 0.3342905, -0.4524369, 1, 1, 1, 1, 1,
-0.2674153, -2.354579, -2.560767, 1, 1, 1, 1, 1,
-0.262978, 0.446052, -0.1060082, 1, 1, 1, 1, 1,
-0.2542205, -0.4321114, -2.92548, 1, 1, 1, 1, 1,
-0.2494396, 0.4930387, -1.28693, 0, 0, 1, 1, 1,
-0.2449744, 0.01425413, -0.5981322, 1, 0, 0, 1, 1,
-0.243894, -0.1751263, -3.258098, 1, 0, 0, 1, 1,
-0.2431844, 0.09623235, 0.17344, 1, 0, 0, 1, 1,
-0.2398949, -1.558893, -1.900713, 1, 0, 0, 1, 1,
-0.2397128, -0.1595007, -2.620409, 1, 0, 0, 1, 1,
-0.2378618, -0.1256565, -3.227495, 0, 0, 0, 1, 1,
-0.2353243, 0.06626073, -1.22603, 0, 0, 0, 1, 1,
-0.2320772, 0.2712276, 0.4727665, 0, 0, 0, 1, 1,
-0.2299992, -2.481263, -2.336095, 0, 0, 0, 1, 1,
-0.227567, 0.6963085, -1.161335, 0, 0, 0, 1, 1,
-0.2271797, 0.6177624, -2.041781, 0, 0, 0, 1, 1,
-0.2271749, -0.8739418, -1.461467, 0, 0, 0, 1, 1,
-0.2244706, -1.34218, -3.98595, 1, 1, 1, 1, 1,
-0.2234216, 1.644638, -1.044614, 1, 1, 1, 1, 1,
-0.223409, -0.4641786, -2.261351, 1, 1, 1, 1, 1,
-0.2220162, -0.003619037, -2.254838, 1, 1, 1, 1, 1,
-0.2181728, 0.08865667, -1.030684, 1, 1, 1, 1, 1,
-0.2127023, -0.002818932, -2.140891, 1, 1, 1, 1, 1,
-0.2086513, 1.489583, 0.2109456, 1, 1, 1, 1, 1,
-0.2069837, -0.5299329, -2.573012, 1, 1, 1, 1, 1,
-0.2027736, 0.5005895, -1.673941, 1, 1, 1, 1, 1,
-0.2014914, -0.1555873, -1.302437, 1, 1, 1, 1, 1,
-0.1996539, -0.5593376, -3.004309, 1, 1, 1, 1, 1,
-0.1956087, 0.2086321, -0.4957975, 1, 1, 1, 1, 1,
-0.1889754, -1.413954, -4.043545, 1, 1, 1, 1, 1,
-0.18894, -1.420373, -2.82618, 1, 1, 1, 1, 1,
-0.1878268, -1.255351, -3.637886, 1, 1, 1, 1, 1,
-0.1869043, -1.962813, -2.6977, 0, 0, 1, 1, 1,
-0.1867589, -0.6878091, -3.46458, 1, 0, 0, 1, 1,
-0.1856512, 0.0008947882, 1.23519, 1, 0, 0, 1, 1,
-0.1842404, 1.688469, 1.336045, 1, 0, 0, 1, 1,
-0.1838709, 0.3256057, -0.2138337, 1, 0, 0, 1, 1,
-0.181726, -0.3828924, -2.237326, 1, 0, 0, 1, 1,
-0.1764088, -0.553955, -3.063356, 0, 0, 0, 1, 1,
-0.1763204, -0.5475062, -2.688493, 0, 0, 0, 1, 1,
-0.1717649, -0.5852802, -5.384701, 0, 0, 0, 1, 1,
-0.1698659, 0.3991136, -1.413291, 0, 0, 0, 1, 1,
-0.1676853, -1.034562, -1.716368, 0, 0, 0, 1, 1,
-0.166556, -0.003860919, -3.074328, 0, 0, 0, 1, 1,
-0.1632933, 0.2340519, -2.280151, 0, 0, 0, 1, 1,
-0.161237, -0.6223705, -1.935944, 1, 1, 1, 1, 1,
-0.159861, -1.0184, -3.559496, 1, 1, 1, 1, 1,
-0.1566874, -0.5804424, -3.341978, 1, 1, 1, 1, 1,
-0.1555595, -0.8361328, -2.65163, 1, 1, 1, 1, 1,
-0.1525285, 0.1859113, -0.1790048, 1, 1, 1, 1, 1,
-0.1516043, -0.1381827, -2.745315, 1, 1, 1, 1, 1,
-0.1500385, -0.4314599, -1.417649, 1, 1, 1, 1, 1,
-0.1441384, -0.05254174, -2.895282, 1, 1, 1, 1, 1,
-0.1411195, -0.5496556, -2.014466, 1, 1, 1, 1, 1,
-0.1382917, 1.674951, 0.8947625, 1, 1, 1, 1, 1,
-0.1366125, 1.785944, -1.396468, 1, 1, 1, 1, 1,
-0.1313224, 1.566727, -1.430004, 1, 1, 1, 1, 1,
-0.1287035, 0.4277653, -0.08911628, 1, 1, 1, 1, 1,
-0.126431, -1.067773, -3.335646, 1, 1, 1, 1, 1,
-0.1248679, 1.951412, -0.7200952, 1, 1, 1, 1, 1,
-0.1242618, -1.705364, -2.23929, 0, 0, 1, 1, 1,
-0.1238937, 1.212146, -1.036482, 1, 0, 0, 1, 1,
-0.1230245, 1.995546, 0.9828396, 1, 0, 0, 1, 1,
-0.1224925, -0.9264219, -2.911047, 1, 0, 0, 1, 1,
-0.1220039, 0.6899648, -0.2482636, 1, 0, 0, 1, 1,
-0.1211575, 2.479291, -0.01097771, 1, 0, 0, 1, 1,
-0.1191556, 1.2277, -0.1846645, 0, 0, 0, 1, 1,
-0.1157621, 1.197591, -0.5057421, 0, 0, 0, 1, 1,
-0.1141992, 1.561939, -1.816746, 0, 0, 0, 1, 1,
-0.1138643, -0.82108, -2.763236, 0, 0, 0, 1, 1,
-0.1110441, 0.3829814, 0.0291473, 0, 0, 0, 1, 1,
-0.1094833, -0.2543607, -2.362679, 0, 0, 0, 1, 1,
-0.1073687, -0.281023, -1.642558, 0, 0, 0, 1, 1,
-0.1066218, 0.3182512, -0.7825029, 1, 1, 1, 1, 1,
-0.1053034, -1.457258, -3.736076, 1, 1, 1, 1, 1,
-0.1051891, -0.5704717, -3.407033, 1, 1, 1, 1, 1,
-0.09786346, 0.802305, 0.7521702, 1, 1, 1, 1, 1,
-0.0932048, 0.22215, -1.926276, 1, 1, 1, 1, 1,
-0.08859482, 0.4608913, 0.8248426, 1, 1, 1, 1, 1,
-0.08737814, -0.3120671, -2.607378, 1, 1, 1, 1, 1,
-0.08561438, 0.1832238, 0.7760402, 1, 1, 1, 1, 1,
-0.07649202, -1.29298, -3.908526, 1, 1, 1, 1, 1,
-0.07308891, 0.5566125, -0.73014, 1, 1, 1, 1, 1,
-0.07106107, -0.5024263, -2.054702, 1, 1, 1, 1, 1,
-0.06720654, -1.683839, -3.466012, 1, 1, 1, 1, 1,
-0.06686669, -0.8807455, -2.353148, 1, 1, 1, 1, 1,
-0.06501921, -0.8219756, -2.116306, 1, 1, 1, 1, 1,
-0.06268034, -0.1565961, -3.123042, 1, 1, 1, 1, 1,
-0.06155951, 1.21202, -0.004284748, 0, 0, 1, 1, 1,
-0.06037404, -1.501838, -3.706481, 1, 0, 0, 1, 1,
-0.05365527, -0.6510029, -3.073274, 1, 0, 0, 1, 1,
-0.05354584, 1.592392, 0.6373192, 1, 0, 0, 1, 1,
-0.05081958, 0.07398811, -0.5833827, 1, 0, 0, 1, 1,
-0.03753218, -0.7051863, -4.021898, 1, 0, 0, 1, 1,
-0.03737569, 2.739287, -0.2892661, 0, 0, 0, 1, 1,
-0.03735559, -0.2871743, -3.065679, 0, 0, 0, 1, 1,
-0.03703654, 0.02579968, -0.6373686, 0, 0, 0, 1, 1,
-0.0369888, -0.5891145, -2.616974, 0, 0, 0, 1, 1,
-0.03486779, -1.445424, -4.579189, 0, 0, 0, 1, 1,
-0.02986448, -0.07379564, -0.882795, 0, 0, 0, 1, 1,
-0.02828445, 0.1421511, 0.6697671, 0, 0, 0, 1, 1,
-0.02759365, 0.6878692, 1.908376, 1, 1, 1, 1, 1,
-0.02562427, -1.117054, -3.226836, 1, 1, 1, 1, 1,
-0.02554325, -0.2464118, -1.404709, 1, 1, 1, 1, 1,
-0.02233621, -0.1563477, -2.544443, 1, 1, 1, 1, 1,
-0.0201655, -0.1011652, -5.379566, 1, 1, 1, 1, 1,
-0.01902647, 1.569929, 1.701585, 1, 1, 1, 1, 1,
-0.01902381, -2.671019, -3.653841, 1, 1, 1, 1, 1,
-0.01895996, 1.707443, -0.6518909, 1, 1, 1, 1, 1,
-0.01705697, 0.4768111, -0.6005113, 1, 1, 1, 1, 1,
-0.009137737, 0.1817784, -0.03808112, 1, 1, 1, 1, 1,
-0.0085973, -1.291234, -3.63426, 1, 1, 1, 1, 1,
-0.005969692, -1.185689, -2.479407, 1, 1, 1, 1, 1,
-0.005500405, -0.415547, -2.379476, 1, 1, 1, 1, 1,
-0.005196638, 1.650743, 0.471845, 1, 1, 1, 1, 1,
-0.00375125, -1.395871, -3.730999, 1, 1, 1, 1, 1,
-0.0009592441, 0.6314402, -0.9513842, 0, 0, 1, 1, 1,
-0.0002100388, 0.04895295, 1.270312, 1, 0, 0, 1, 1,
0.001168728, 2.389878, 0.3705979, 1, 0, 0, 1, 1,
0.002867116, -0.8132021, 5.332188, 1, 0, 0, 1, 1,
0.006760677, -0.1589846, 4.611835, 1, 0, 0, 1, 1,
0.006809561, -0.1077031, 3.080717, 1, 0, 0, 1, 1,
0.00689836, 0.6650454, -2.217113, 0, 0, 0, 1, 1,
0.01258008, -1.043805, 2.254641, 0, 0, 0, 1, 1,
0.01262739, -1.041707, 3.10817, 0, 0, 0, 1, 1,
0.01320062, 0.01757885, 0.4440316, 0, 0, 0, 1, 1,
0.01551993, -0.07080181, 1.888267, 0, 0, 0, 1, 1,
0.01637567, -1.196461, 2.338208, 0, 0, 0, 1, 1,
0.02066401, -0.2390877, 2.367293, 0, 0, 0, 1, 1,
0.02067434, 0.4198501, -1.037542, 1, 1, 1, 1, 1,
0.02678342, -0.328643, 4.829726, 1, 1, 1, 1, 1,
0.02793838, 0.006986544, 0.9405669, 1, 1, 1, 1, 1,
0.02819071, -0.9726049, 2.47759, 1, 1, 1, 1, 1,
0.0320567, 1.606483, 0.07170536, 1, 1, 1, 1, 1,
0.03507604, 1.253457, -0.4276536, 1, 1, 1, 1, 1,
0.03555297, 1.703193, 0.9746485, 1, 1, 1, 1, 1,
0.0371605, -0.3755068, 3.000814, 1, 1, 1, 1, 1,
0.04541659, 0.4989233, -1.096393, 1, 1, 1, 1, 1,
0.04797201, -2.385729, 3.505627, 1, 1, 1, 1, 1,
0.0482, -1.104207, 2.449346, 1, 1, 1, 1, 1,
0.05076247, 0.9107274, -0.7836374, 1, 1, 1, 1, 1,
0.05160958, -0.5492526, 3.211654, 1, 1, 1, 1, 1,
0.0567766, -1.22763, 2.200086, 1, 1, 1, 1, 1,
0.06981933, 0.008548153, 3.073594, 1, 1, 1, 1, 1,
0.07029694, -0.4014613, 0.9256064, 0, 0, 1, 1, 1,
0.0738892, 0.5968311, 0.01518246, 1, 0, 0, 1, 1,
0.07791567, 0.6403775, -0.2633756, 1, 0, 0, 1, 1,
0.0794593, -0.1227136, 1.108506, 1, 0, 0, 1, 1,
0.08380228, 0.04301971, 1.574677, 1, 0, 0, 1, 1,
0.08714388, 0.3213704, 0.9812644, 1, 0, 0, 1, 1,
0.08908324, -0.02069838, 0.5789717, 0, 0, 0, 1, 1,
0.08933846, 0.01251024, 0.150799, 0, 0, 0, 1, 1,
0.09166354, -0.3128322, 2.850784, 0, 0, 0, 1, 1,
0.09191153, 0.512641, 0.8364969, 0, 0, 0, 1, 1,
0.09255426, -0.5489824, 2.350679, 0, 0, 0, 1, 1,
0.09375218, 0.6340826, 1.487214, 0, 0, 0, 1, 1,
0.0952065, -0.7866483, 3.994668, 0, 0, 0, 1, 1,
0.09522642, -0.09897264, 1.713043, 1, 1, 1, 1, 1,
0.09542982, -0.256497, 2.682508, 1, 1, 1, 1, 1,
0.1026122, -2.298363, 2.996357, 1, 1, 1, 1, 1,
0.1039196, -0.5651786, 2.331711, 1, 1, 1, 1, 1,
0.1051059, 0.5143923, 0.1071141, 1, 1, 1, 1, 1,
0.1084425, -0.3462002, 1.990804, 1, 1, 1, 1, 1,
0.1085924, -0.370095, 0.8661171, 1, 1, 1, 1, 1,
0.1098678, 0.7992445, 1.500367, 1, 1, 1, 1, 1,
0.1186263, -1.352527, 2.840396, 1, 1, 1, 1, 1,
0.1192903, 1.196346, 0.3007117, 1, 1, 1, 1, 1,
0.1203359, 0.5318786, -1.488075, 1, 1, 1, 1, 1,
0.1244448, 1.179429, 0.4393904, 1, 1, 1, 1, 1,
0.1244593, 0.3423874, 1.142976, 1, 1, 1, 1, 1,
0.1247057, 0.09270878, 0.5761389, 1, 1, 1, 1, 1,
0.1270869, -1.395502, 3.951279, 1, 1, 1, 1, 1,
0.1270969, 0.5990895, -1.376766, 0, 0, 1, 1, 1,
0.1295613, -0.8272246, 2.244342, 1, 0, 0, 1, 1,
0.1302377, 1.042291, -0.8491981, 1, 0, 0, 1, 1,
0.1480925, 1.322225, 1.458247, 1, 0, 0, 1, 1,
0.1504576, 0.4300484, 0.8313931, 1, 0, 0, 1, 1,
0.1525378, 1.245715, -0.3377921, 1, 0, 0, 1, 1,
0.1545367, 0.6606933, 1.295173, 0, 0, 0, 1, 1,
0.1555922, -0.7319385, 3.669308, 0, 0, 0, 1, 1,
0.1617098, 0.9674687, -0.03403265, 0, 0, 0, 1, 1,
0.1633448, -0.9498416, 4.481635, 0, 0, 0, 1, 1,
0.1665062, -0.7058557, 3.45798, 0, 0, 0, 1, 1,
0.1669685, 0.7256803, 2.25779, 0, 0, 0, 1, 1,
0.1673245, 0.6192484, 0.2000981, 0, 0, 0, 1, 1,
0.1685554, -1.128148, 2.667668, 1, 1, 1, 1, 1,
0.1744752, 0.569099, -1.605752, 1, 1, 1, 1, 1,
0.1821579, 0.7090704, 1.81414, 1, 1, 1, 1, 1,
0.1833762, -1.309996, 1.295691, 1, 1, 1, 1, 1,
0.1850238, 1.081655, -0.8939786, 1, 1, 1, 1, 1,
0.1868445, -1.479108, 3.909714, 1, 1, 1, 1, 1,
0.1876855, -0.1142153, 3.121334, 1, 1, 1, 1, 1,
0.1890153, -0.7944409, 2.183536, 1, 1, 1, 1, 1,
0.1959522, -0.4986766, 2.846877, 1, 1, 1, 1, 1,
0.1972961, -0.7772549, 3.449152, 1, 1, 1, 1, 1,
0.1978662, -1.284617, 3.23554, 1, 1, 1, 1, 1,
0.2005837, 0.5375293, 0.4940343, 1, 1, 1, 1, 1,
0.2031305, 0.4003153, 0.5058725, 1, 1, 1, 1, 1,
0.2048956, 0.4478857, -0.9830645, 1, 1, 1, 1, 1,
0.2054346, 0.9611145, 0.739195, 1, 1, 1, 1, 1,
0.2083424, 0.6739843, 0.05946126, 0, 0, 1, 1, 1,
0.2107592, -1.261602, 4.017892, 1, 0, 0, 1, 1,
0.2116059, 0.1849337, -0.1675895, 1, 0, 0, 1, 1,
0.2138307, 0.1004882, 2.495276, 1, 0, 0, 1, 1,
0.2187928, -0.03285968, 2.386077, 1, 0, 0, 1, 1,
0.2194443, -1.805327, 3.149743, 1, 0, 0, 1, 1,
0.2231652, -0.5139554, 3.534955, 0, 0, 0, 1, 1,
0.2248128, 0.4952213, 1.032175, 0, 0, 0, 1, 1,
0.2264411, 0.9440561, -0.1394422, 0, 0, 0, 1, 1,
0.2277096, -1.224284, 4.966169, 0, 0, 0, 1, 1,
0.2286051, -1.073406, 2.167502, 0, 0, 0, 1, 1,
0.2318092, 0.07210265, 2.368975, 0, 0, 0, 1, 1,
0.2403867, 1.392531, 0.0430753, 0, 0, 0, 1, 1,
0.2432324, 0.1871345, -0.383129, 1, 1, 1, 1, 1,
0.2447347, -1.415994, 4.035364, 1, 1, 1, 1, 1,
0.2465103, 1.736399, -1.210966, 1, 1, 1, 1, 1,
0.2471133, 0.8235518, -0.6760561, 1, 1, 1, 1, 1,
0.2477942, 0.2707878, -0.7152158, 1, 1, 1, 1, 1,
0.2481984, -0.7184047, 3.168241, 1, 1, 1, 1, 1,
0.2558362, 0.2727885, 2.405803, 1, 1, 1, 1, 1,
0.2620781, 0.05370411, 0.1787604, 1, 1, 1, 1, 1,
0.2682759, -1.181426, 2.084794, 1, 1, 1, 1, 1,
0.2703119, -0.2363962, 1.193449, 1, 1, 1, 1, 1,
0.2716498, -0.2360365, 3.296412, 1, 1, 1, 1, 1,
0.2723882, 0.007506336, -0.1634894, 1, 1, 1, 1, 1,
0.2726284, 1.402515, -0.6893505, 1, 1, 1, 1, 1,
0.2738173, -0.108623, 3.466286, 1, 1, 1, 1, 1,
0.2753312, 0.6411306, -1.675532, 1, 1, 1, 1, 1,
0.2795558, 1.416944, -0.2118624, 0, 0, 1, 1, 1,
0.2833642, -1.615778, 2.651989, 1, 0, 0, 1, 1,
0.2842122, -1.227952, 3.202418, 1, 0, 0, 1, 1,
0.2910267, -0.631443, 2.821959, 1, 0, 0, 1, 1,
0.2953242, 0.7258797, 1.033699, 1, 0, 0, 1, 1,
0.2980082, -2.277258, 2.333211, 1, 0, 0, 1, 1,
0.2984296, 0.5709785, 1.496142, 0, 0, 0, 1, 1,
0.2994133, -0.1616651, 0.4786546, 0, 0, 0, 1, 1,
0.3040796, 0.2380014, 2.121104, 0, 0, 0, 1, 1,
0.3073662, -0.3676683, 2.354195, 0, 0, 0, 1, 1,
0.3087296, -0.2780848, 2.122977, 0, 0, 0, 1, 1,
0.3103026, 1.385208, 0.4625177, 0, 0, 0, 1, 1,
0.3113667, -0.7134951, 1.713578, 0, 0, 0, 1, 1,
0.3114122, -0.9392125, 2.83837, 1, 1, 1, 1, 1,
0.3115608, -0.5578076, 1.854641, 1, 1, 1, 1, 1,
0.3123723, -0.1362001, 2.042743, 1, 1, 1, 1, 1,
0.3134487, -0.9440858, 1.925518, 1, 1, 1, 1, 1,
0.314531, -0.4429689, 2.21588, 1, 1, 1, 1, 1,
0.3149918, 1.343912, 0.136595, 1, 1, 1, 1, 1,
0.3176999, -0.8257982, 3.689362, 1, 1, 1, 1, 1,
0.3196186, 0.02737108, -0.8477192, 1, 1, 1, 1, 1,
0.3200642, -0.1838468, 2.059365, 1, 1, 1, 1, 1,
0.3237268, -2.385056, 3.186002, 1, 1, 1, 1, 1,
0.3247423, 1.101004, -1.270014, 1, 1, 1, 1, 1,
0.3271309, -0.1170106, 2.739252, 1, 1, 1, 1, 1,
0.3293858, 0.9061963, -0.8739954, 1, 1, 1, 1, 1,
0.3321159, 0.2087745, -0.2891381, 1, 1, 1, 1, 1,
0.3340676, -0.3944644, 0.6258333, 1, 1, 1, 1, 1,
0.3385151, 0.6221772, 1.05148, 0, 0, 1, 1, 1,
0.3417409, -2.091121, 0.9066109, 1, 0, 0, 1, 1,
0.345413, 0.4641647, -0.617972, 1, 0, 0, 1, 1,
0.3463997, 0.9718951, 2.957826, 1, 0, 0, 1, 1,
0.3521255, 0.08061567, 1.343498, 1, 0, 0, 1, 1,
0.3523213, -0.2541997, 3.624406, 1, 0, 0, 1, 1,
0.3557358, -2.042672, 4.113467, 0, 0, 0, 1, 1,
0.3581696, 1.441301, -1.2627, 0, 0, 0, 1, 1,
0.3601338, 0.7231954, 0.9940362, 0, 0, 0, 1, 1,
0.360283, 0.01040349, 2.316705, 0, 0, 0, 1, 1,
0.3603459, -1.000042, 2.612276, 0, 0, 0, 1, 1,
0.3689908, -0.9747829, 2.371987, 0, 0, 0, 1, 1,
0.3708307, -0.2865638, 0.2653832, 0, 0, 0, 1, 1,
0.3713923, 1.324501, -0.9111105, 1, 1, 1, 1, 1,
0.3729577, -0.4694, 4.544257, 1, 1, 1, 1, 1,
0.3729996, 1.530722, 0.2656584, 1, 1, 1, 1, 1,
0.376156, -1.320996, 5.135185, 1, 1, 1, 1, 1,
0.3774377, -0.09101882, 2.317537, 1, 1, 1, 1, 1,
0.3781143, 0.966594, 1.244032, 1, 1, 1, 1, 1,
0.381601, 0.6662791, -0.3078857, 1, 1, 1, 1, 1,
0.3854967, 1.211691, 0.3457492, 1, 1, 1, 1, 1,
0.3906059, -0.2130053, 1.901475, 1, 1, 1, 1, 1,
0.3962736, -0.3430403, 3.312637, 1, 1, 1, 1, 1,
0.3968342, 0.6036213, 1.600552, 1, 1, 1, 1, 1,
0.406799, -1.950079, 0.8433106, 1, 1, 1, 1, 1,
0.4088515, -0.03018188, 3.340751, 1, 1, 1, 1, 1,
0.4132334, -2.461195, 2.864471, 1, 1, 1, 1, 1,
0.4154356, -1.204672, 3.472116, 1, 1, 1, 1, 1,
0.419958, 1.405854, 0.2524296, 0, 0, 1, 1, 1,
0.4203857, -1.646603, 1.948421, 1, 0, 0, 1, 1,
0.4239474, 0.5252876, 0.437439, 1, 0, 0, 1, 1,
0.4296814, 0.2930591, -1.308523, 1, 0, 0, 1, 1,
0.4319977, 1.345539, 0.007298518, 1, 0, 0, 1, 1,
0.4329475, -0.8316784, 3.263326, 1, 0, 0, 1, 1,
0.4355354, -3.118554, 2.917106, 0, 0, 0, 1, 1,
0.4357361, 1.128996, 1.116922, 0, 0, 0, 1, 1,
0.43584, -0.4576078, 1.42921, 0, 0, 0, 1, 1,
0.4372947, 1.310231, -0.3176619, 0, 0, 0, 1, 1,
0.4435708, -0.721185, 1.86918, 0, 0, 0, 1, 1,
0.4457617, -0.1088705, 1.439097, 0, 0, 0, 1, 1,
0.4458193, -0.2193567, 2.104256, 0, 0, 0, 1, 1,
0.4465737, -0.5591176, 1.47659, 1, 1, 1, 1, 1,
0.4471916, -0.9881561, 3.992735, 1, 1, 1, 1, 1,
0.4545169, 1.389845, 1.899791, 1, 1, 1, 1, 1,
0.4567357, -0.258139, 1.496296, 1, 1, 1, 1, 1,
0.461901, -1.5279, 2.584126, 1, 1, 1, 1, 1,
0.4673231, -0.1089362, 2.849671, 1, 1, 1, 1, 1,
0.4677093, 1.950355, 1.39922, 1, 1, 1, 1, 1,
0.4722634, 0.9753289, 1.338376, 1, 1, 1, 1, 1,
0.4747719, 0.3040501, 1.264042, 1, 1, 1, 1, 1,
0.4753262, -0.7010715, 3.684518, 1, 1, 1, 1, 1,
0.4762037, 0.6456402, 0.8571831, 1, 1, 1, 1, 1,
0.4810003, -0.6445771, 3.101135, 1, 1, 1, 1, 1,
0.4818232, -0.3166121, 2.85372, 1, 1, 1, 1, 1,
0.4889677, 1.202486, 2.464316, 1, 1, 1, 1, 1,
0.4920627, 0.6918268, -0.3288425, 1, 1, 1, 1, 1,
0.4963447, -1.431276, 3.356353, 0, 0, 1, 1, 1,
0.4974433, -0.01507981, 2.521134, 1, 0, 0, 1, 1,
0.5009639, -0.6239599, 2.21618, 1, 0, 0, 1, 1,
0.5032007, -1.12837, 3.124356, 1, 0, 0, 1, 1,
0.5037304, -2.108763, 3.016857, 1, 0, 0, 1, 1,
0.5070046, 0.6839412, 2.481593, 1, 0, 0, 1, 1,
0.5082153, 0.8652251, 0.3556329, 0, 0, 0, 1, 1,
0.5115814, 0.8142323, 0.5226399, 0, 0, 0, 1, 1,
0.5117286, 0.1896394, 0.9060768, 0, 0, 0, 1, 1,
0.5239901, -0.1039557, 1.317296, 0, 0, 0, 1, 1,
0.5246543, 0.2134465, -0.05305776, 0, 0, 0, 1, 1,
0.5281503, 1.044058, 0.384589, 0, 0, 0, 1, 1,
0.5321504, 0.4715721, 1.093014, 0, 0, 0, 1, 1,
0.5332714, 0.7273882, -0.2334613, 1, 1, 1, 1, 1,
0.5335323, 1.410951, 0.6162775, 1, 1, 1, 1, 1,
0.5350561, -0.3754437, 1.799137, 1, 1, 1, 1, 1,
0.5389442, 0.6932701, 3.057563, 1, 1, 1, 1, 1,
0.5433087, 1.022981, 0.7534775, 1, 1, 1, 1, 1,
0.5453714, -1.213131, 3.765202, 1, 1, 1, 1, 1,
0.5459728, -0.4602633, 0.3476788, 1, 1, 1, 1, 1,
0.5481691, -0.1855945, 2.692417, 1, 1, 1, 1, 1,
0.5558032, -1.725415, 2.721304, 1, 1, 1, 1, 1,
0.5566995, 0.05026202, 1.607243, 1, 1, 1, 1, 1,
0.55791, 0.8736511, 1.476701, 1, 1, 1, 1, 1,
0.5599875, -1.068948, 2.66558, 1, 1, 1, 1, 1,
0.5702574, -0.03519092, 3.488426, 1, 1, 1, 1, 1,
0.5831148, -0.302073, 1.687245, 1, 1, 1, 1, 1,
0.583178, -0.5483221, 0.3593169, 1, 1, 1, 1, 1,
0.5833013, 0.06787332, 1.781409, 0, 0, 1, 1, 1,
0.5839815, -1.219932, 2.016998, 1, 0, 0, 1, 1,
0.5850437, -0.1115137, 0.9464043, 1, 0, 0, 1, 1,
0.586148, 0.7038115, 0.6007185, 1, 0, 0, 1, 1,
0.5872294, -0.151564, 1.262207, 1, 0, 0, 1, 1,
0.5968734, 0.3667184, -0.286428, 1, 0, 0, 1, 1,
0.605978, -0.4004358, 2.359133, 0, 0, 0, 1, 1,
0.6241856, -0.7356979, 1.876447, 0, 0, 0, 1, 1,
0.6245673, -0.114022, 0.5001416, 0, 0, 0, 1, 1,
0.6365055, 0.1578237, 0.5099446, 0, 0, 0, 1, 1,
0.6510746, -0.7423104, 2.127035, 0, 0, 0, 1, 1,
0.6557186, -0.5036883, 2.262918, 0, 0, 0, 1, 1,
0.6600113, -0.2124909, 1.136221, 0, 0, 0, 1, 1,
0.6666298, 0.06925215, 2.056146, 1, 1, 1, 1, 1,
0.6786965, 0.9630929, -0.1022532, 1, 1, 1, 1, 1,
0.6797913, 0.332921, 2.912189, 1, 1, 1, 1, 1,
0.6800526, 1.321357, 0.4280468, 1, 1, 1, 1, 1,
0.6825981, -0.4018948, 3.355908, 1, 1, 1, 1, 1,
0.6838968, 0.06068967, 2.10355, 1, 1, 1, 1, 1,
0.6910166, 0.1083493, 2.592897, 1, 1, 1, 1, 1,
0.692149, 1.376356, 1.640099, 1, 1, 1, 1, 1,
0.6939362, 0.5106676, 2.228221, 1, 1, 1, 1, 1,
0.6939934, 0.8835521, 0.4300261, 1, 1, 1, 1, 1,
0.6961281, 0.1923648, 1.219264, 1, 1, 1, 1, 1,
0.7018178, -1.348148, 3.219182, 1, 1, 1, 1, 1,
0.7047003, 1.288433, -0.5404849, 1, 1, 1, 1, 1,
0.7062344, -1.069239, 2.924433, 1, 1, 1, 1, 1,
0.7093587, -0.06785183, 3.207929, 1, 1, 1, 1, 1,
0.7137939, 1.031191, 0.3848193, 0, 0, 1, 1, 1,
0.7139994, -0.7701179, 2.555335, 1, 0, 0, 1, 1,
0.7144992, -0.9872611, 4.130095, 1, 0, 0, 1, 1,
0.720008, -0.543604, 3.206566, 1, 0, 0, 1, 1,
0.7216714, 0.2580519, -0.3524027, 1, 0, 0, 1, 1,
0.7243719, 0.3235443, 1.664849, 1, 0, 0, 1, 1,
0.72468, 0.4567538, -0.2781715, 0, 0, 0, 1, 1,
0.7248189, -1.333771, 2.66552, 0, 0, 0, 1, 1,
0.7257593, 0.849324, 0.08876445, 0, 0, 0, 1, 1,
0.7301541, 0.5187525, 1.150738, 0, 0, 0, 1, 1,
0.7396284, 1.847029, -0.09626945, 0, 0, 0, 1, 1,
0.7403733, -0.940614, 3.911025, 0, 0, 0, 1, 1,
0.7412254, -1.430364, 3.193614, 0, 0, 0, 1, 1,
0.7415594, 0.3362433, 1.317649, 1, 1, 1, 1, 1,
0.7420105, -0.4597919, 0.6577647, 1, 1, 1, 1, 1,
0.7437185, 0.6575777, -0.1011927, 1, 1, 1, 1, 1,
0.7554197, 0.3838661, -0.5660827, 1, 1, 1, 1, 1,
0.7567719, -1.788932, 1.979176, 1, 1, 1, 1, 1,
0.7583666, -0.3830644, 1.651388, 1, 1, 1, 1, 1,
0.7587497, -0.1635949, 2.317406, 1, 1, 1, 1, 1,
0.7608009, -0.8975784, 3.383842, 1, 1, 1, 1, 1,
0.7612731, -0.5909885, 3.563241, 1, 1, 1, 1, 1,
0.7636338, -1.294519, 4.684682, 1, 1, 1, 1, 1,
0.7638383, 0.4136737, 1.189476, 1, 1, 1, 1, 1,
0.776137, -0.4347525, 3.302708, 1, 1, 1, 1, 1,
0.7793847, -0.7146789, 4.017697, 1, 1, 1, 1, 1,
0.7824038, 0.8525114, 1.126948, 1, 1, 1, 1, 1,
0.7839701, 0.5293517, -0.1066896, 1, 1, 1, 1, 1,
0.7855394, -0.1359863, 2.72012, 0, 0, 1, 1, 1,
0.7866765, 0.009987358, 2.06721, 1, 0, 0, 1, 1,
0.7879247, 0.9687038, 1.07436, 1, 0, 0, 1, 1,
0.7893475, 0.2016876, 0.7150973, 1, 0, 0, 1, 1,
0.7897744, 0.6458188, 1.07119, 1, 0, 0, 1, 1,
0.7936849, 2.483235, 0.5649219, 1, 0, 0, 1, 1,
0.7954751, 0.3775798, 3.001533, 0, 0, 0, 1, 1,
0.796151, -1.431972, 1.72123, 0, 0, 0, 1, 1,
0.7997228, -0.9963988, 5.140952, 0, 0, 0, 1, 1,
0.8011833, -1.273192, 1.339764, 0, 0, 0, 1, 1,
0.8097757, 0.9037499, 0.9868054, 0, 0, 0, 1, 1,
0.8137297, 0.6813475, 1.206482, 0, 0, 0, 1, 1,
0.8181129, -0.3686314, 0.4991332, 0, 0, 0, 1, 1,
0.8198295, 0.5016134, 0.8515208, 1, 1, 1, 1, 1,
0.8199216, -0.1797357, 1.472543, 1, 1, 1, 1, 1,
0.8214822, 0.9734585, 0.1128839, 1, 1, 1, 1, 1,
0.831866, 1.196314, -0.9458336, 1, 1, 1, 1, 1,
0.8548247, 1.813124, 0.7402737, 1, 1, 1, 1, 1,
0.8558256, -0.6175072, 3.644621, 1, 1, 1, 1, 1,
0.860938, -0.8060099, 2.154148, 1, 1, 1, 1, 1,
0.8663856, -0.0361969, 2.156678, 1, 1, 1, 1, 1,
0.8724713, 0.6302729, 0.3927624, 1, 1, 1, 1, 1,
0.8807708, 0.676488, 0.4750846, 1, 1, 1, 1, 1,
0.8836135, 2.159321, -0.5147742, 1, 1, 1, 1, 1,
0.8872451, -0.3915916, 3.428196, 1, 1, 1, 1, 1,
0.8882837, 0.3224026, 1.322886, 1, 1, 1, 1, 1,
0.8884781, -1.380858, 2.738538, 1, 1, 1, 1, 1,
0.8908607, 0.07225278, 2.939431, 1, 1, 1, 1, 1,
0.8930241, -0.07604311, 3.400876, 0, 0, 1, 1, 1,
0.8997207, 0.544346, 1.893943, 1, 0, 0, 1, 1,
0.9011109, -0.5933682, 1.655737, 1, 0, 0, 1, 1,
0.9028138, -1.135515, 2.764709, 1, 0, 0, 1, 1,
0.9041235, 0.02315052, 2.733498, 1, 0, 0, 1, 1,
0.9167762, -0.4154266, 3.423295, 1, 0, 0, 1, 1,
0.917147, -0.09700694, 1.733322, 0, 0, 0, 1, 1,
0.9187282, 0.4727197, 1.258678, 0, 0, 0, 1, 1,
0.9187917, -0.1454164, 1.538243, 0, 0, 0, 1, 1,
0.919199, -0.7724941, 1.580487, 0, 0, 0, 1, 1,
0.9216576, -0.4221366, 2.206497, 0, 0, 0, 1, 1,
0.9336329, -0.544303, 1.720369, 0, 0, 0, 1, 1,
0.9339756, 0.2462635, 0.8699595, 0, 0, 0, 1, 1,
0.9351519, -0.01352785, 1.555352, 1, 1, 1, 1, 1,
0.9365696, -0.5266143, 1.509239, 1, 1, 1, 1, 1,
0.9391266, -1.714156, 3.538468, 1, 1, 1, 1, 1,
0.9404033, -0.3835503, 0.5212675, 1, 1, 1, 1, 1,
0.9477952, -0.5236079, 3.362357, 1, 1, 1, 1, 1,
0.95915, 1.113096, 1.93282, 1, 1, 1, 1, 1,
0.9623759, -0.5967289, 2.266957, 1, 1, 1, 1, 1,
0.9680724, 0.8453873, 2.267878, 1, 1, 1, 1, 1,
0.971346, -0.05273408, 2.196192, 1, 1, 1, 1, 1,
0.9724145, 0.1831407, 2.355712, 1, 1, 1, 1, 1,
0.9726402, -0.04404867, 2.653486, 1, 1, 1, 1, 1,
0.9737976, -2.063297, 2.018236, 1, 1, 1, 1, 1,
0.9747728, 0.4981931, 2.516207, 1, 1, 1, 1, 1,
0.975854, -1.220981, 2.827955, 1, 1, 1, 1, 1,
0.985778, -0.4898989, 2.329426, 1, 1, 1, 1, 1,
1.000208, 0.2441243, 0.3922731, 0, 0, 1, 1, 1,
1.000279, -0.3813585, 1.482578, 1, 0, 0, 1, 1,
1.010016, 0.154677, 1.53801, 1, 0, 0, 1, 1,
1.010205, -1.450954, 1.592855, 1, 0, 0, 1, 1,
1.011911, -0.4120535, 1.101804, 1, 0, 0, 1, 1,
1.011977, -0.5641865, 2.841594, 1, 0, 0, 1, 1,
1.012358, -0.07160613, -0.8015503, 0, 0, 0, 1, 1,
1.013095, 2.00008, 1.378878, 0, 0, 0, 1, 1,
1.017099, 0.08823453, 2.654391, 0, 0, 0, 1, 1,
1.01866, 0.1440321, 0.7194363, 0, 0, 0, 1, 1,
1.029117, -0.4285977, 1.367145, 0, 0, 0, 1, 1,
1.032238, 0.1728883, 1.012671, 0, 0, 0, 1, 1,
1.048745, -1.38313, 2.45452, 0, 0, 0, 1, 1,
1.050288, 0.06965474, 0.8240704, 1, 1, 1, 1, 1,
1.050971, 0.3773831, 0.08586088, 1, 1, 1, 1, 1,
1.059023, -0.9346361, 2.047664, 1, 1, 1, 1, 1,
1.06224, 1.805958, 0.4202898, 1, 1, 1, 1, 1,
1.065439, 0.02329841, 1.742757, 1, 1, 1, 1, 1,
1.068541, -0.7089095, 2.435788, 1, 1, 1, 1, 1,
1.077062, -0.9050782, 2.061097, 1, 1, 1, 1, 1,
1.086662, 1.992041, 0.8222383, 1, 1, 1, 1, 1,
1.094037, -3.712526, 4.669016, 1, 1, 1, 1, 1,
1.097792, -0.6553072, 0.6061262, 1, 1, 1, 1, 1,
1.099651, 1.02263, 0.1149889, 1, 1, 1, 1, 1,
1.106296, -1.608617, 2.640271, 1, 1, 1, 1, 1,
1.10783, 1.207147, -0.6095957, 1, 1, 1, 1, 1,
1.122333, -1.913832, 2.836873, 1, 1, 1, 1, 1,
1.123812, -1.368496, 1.497158, 1, 1, 1, 1, 1,
1.124553, -0.001553096, 1.735536, 0, 0, 1, 1, 1,
1.125754, -1.497259, 1.826182, 1, 0, 0, 1, 1,
1.130032, -1.546384, 3.106659, 1, 0, 0, 1, 1,
1.131617, 0.8606443, -0.5121958, 1, 0, 0, 1, 1,
1.136185, 0.9815926, 2.311851, 1, 0, 0, 1, 1,
1.137583, 0.434627, 1.821392, 1, 0, 0, 1, 1,
1.155745, -0.7811223, 0.4357459, 0, 0, 0, 1, 1,
1.15585, 0.2740848, 1.400859, 0, 0, 0, 1, 1,
1.155978, 1.160876, -0.6033472, 0, 0, 0, 1, 1,
1.156915, -0.5754401, 0.3767579, 0, 0, 0, 1, 1,
1.160935, -0.9768486, 2.498824, 0, 0, 0, 1, 1,
1.17341, 1.363359, 2.16485, 0, 0, 0, 1, 1,
1.173551, 0.003168374, 2.893044, 0, 0, 0, 1, 1,
1.175918, 1.423832, 1.455733, 1, 1, 1, 1, 1,
1.176178, 0.4963275, 2.515274, 1, 1, 1, 1, 1,
1.177696, -0.1093548, 1.563191, 1, 1, 1, 1, 1,
1.178275, -0.7979774, 1.878049, 1, 1, 1, 1, 1,
1.190451, 0.3890925, 1.322947, 1, 1, 1, 1, 1,
1.190877, -0.8045846, 0.04966221, 1, 1, 1, 1, 1,
1.206492, 0.4365768, 0.4262816, 1, 1, 1, 1, 1,
1.210189, 1.773901, 0.1351087, 1, 1, 1, 1, 1,
1.213832, 2.519601, -0.2962444, 1, 1, 1, 1, 1,
1.225861, -0.6408013, 2.411995, 1, 1, 1, 1, 1,
1.228476, 0.1494047, 0.8833936, 1, 1, 1, 1, 1,
1.235359, 0.5271423, 1.675091, 1, 1, 1, 1, 1,
1.245522, 0.3048901, 2.099362, 1, 1, 1, 1, 1,
1.248982, 1.20968, 0.4085617, 1, 1, 1, 1, 1,
1.249091, 1.664878, 1.272115, 1, 1, 1, 1, 1,
1.255161, 0.4601397, 1.066138, 0, 0, 1, 1, 1,
1.256272, 0.9430296, -0.3965776, 1, 0, 0, 1, 1,
1.257096, -1.182889, 1.917615, 1, 0, 0, 1, 1,
1.265402, 0.8753736, -0.2011199, 1, 0, 0, 1, 1,
1.26692, -0.3370508, 1.288119, 1, 0, 0, 1, 1,
1.280868, 0.2680683, 1.084116, 1, 0, 0, 1, 1,
1.280926, 2.224626, -0.3371185, 0, 0, 0, 1, 1,
1.301243, -0.2887324, 2.14955, 0, 0, 0, 1, 1,
1.309001, 2.610344, 2.917317, 0, 0, 0, 1, 1,
1.312032, -0.02831085, 2.389336, 0, 0, 0, 1, 1,
1.316042, -0.4929194, 2.574842, 0, 0, 0, 1, 1,
1.317558, -1.469118, 2.619295, 0, 0, 0, 1, 1,
1.320596, 0.1331965, 2.758688, 0, 0, 0, 1, 1,
1.327249, -0.2947503, 2.821601, 1, 1, 1, 1, 1,
1.328146, 0.2460353, 2.564159, 1, 1, 1, 1, 1,
1.332724, -0.3411757, 2.520029, 1, 1, 1, 1, 1,
1.34522, -0.1278948, 4.110285, 1, 1, 1, 1, 1,
1.353889, 0.1611817, 2.444881, 1, 1, 1, 1, 1,
1.360338, 0.408616, 2.222549, 1, 1, 1, 1, 1,
1.36308, 0.3700027, 2.181132, 1, 1, 1, 1, 1,
1.365655, -0.1706706, 2.164559, 1, 1, 1, 1, 1,
1.368098, 1.18235, -0.3728746, 1, 1, 1, 1, 1,
1.368687, -0.2876065, 0.396367, 1, 1, 1, 1, 1,
1.370147, -1.309136, 1.865756, 1, 1, 1, 1, 1,
1.376398, 0.2262913, 1.303086, 1, 1, 1, 1, 1,
1.377689, -1.552155, 1.194223, 1, 1, 1, 1, 1,
1.380172, 2.355787, 0.9347163, 1, 1, 1, 1, 1,
1.38239, 0.1635837, 1.723388, 1, 1, 1, 1, 1,
1.391939, -0.4058513, 2.083761, 0, 0, 1, 1, 1,
1.397153, -1.236998, 2.724595, 1, 0, 0, 1, 1,
1.407801, -0.8401486, 3.224803, 1, 0, 0, 1, 1,
1.430152, 1.116505, 2.105293, 1, 0, 0, 1, 1,
1.450348, 2.526733, -0.7148839, 1, 0, 0, 1, 1,
1.463264, 0.4564026, 0.4271378, 1, 0, 0, 1, 1,
1.467576, 0.3287556, 0.9939356, 0, 0, 0, 1, 1,
1.468337, -0.002874337, 1.584904, 0, 0, 0, 1, 1,
1.502016, -0.144431, 1.144403, 0, 0, 0, 1, 1,
1.504916, -1.380112, 2.348299, 0, 0, 0, 1, 1,
1.509831, 0.7870911, 1.321757, 0, 0, 0, 1, 1,
1.519163, 0.6426501, 0.2020419, 0, 0, 0, 1, 1,
1.529084, -2.504713, 3.227512, 0, 0, 0, 1, 1,
1.546232, -0.1453339, 1.990864, 1, 1, 1, 1, 1,
1.547278, -0.4540138, 1.25748, 1, 1, 1, 1, 1,
1.54819, 0.1123077, -0.1306579, 1, 1, 1, 1, 1,
1.556272, 0.3112015, 2.497127, 1, 1, 1, 1, 1,
1.557914, 1.463233, 0.0804243, 1, 1, 1, 1, 1,
1.560935, -0.36611, -0.2834123, 1, 1, 1, 1, 1,
1.563158, 1.312956, 0.9621958, 1, 1, 1, 1, 1,
1.567772, 0.2279758, 1.39404, 1, 1, 1, 1, 1,
1.584831, 0.3341986, 0.6328312, 1, 1, 1, 1, 1,
1.586696, 1.937303, 2.114526, 1, 1, 1, 1, 1,
1.591511, -1.665779, 3.018586, 1, 1, 1, 1, 1,
1.601688, 0.3245997, 0.1846739, 1, 1, 1, 1, 1,
1.602993, -0.3258629, 1.226292, 1, 1, 1, 1, 1,
1.607272, 0.02917024, 1.135777, 1, 1, 1, 1, 1,
1.62393, -0.2560916, 1.639674, 1, 1, 1, 1, 1,
1.630052, 0.4460433, 1.74897, 0, 0, 1, 1, 1,
1.638409, -0.6685041, 1.316112, 1, 0, 0, 1, 1,
1.649518, 0.3069409, 1.791985, 1, 0, 0, 1, 1,
1.683762, 1.398114, 0.8061986, 1, 0, 0, 1, 1,
1.711431, 0.6919664, 0.6234125, 1, 0, 0, 1, 1,
1.718989, -1.121732, 2.576057, 1, 0, 0, 1, 1,
1.736166, -1.308825, 2.162502, 0, 0, 0, 1, 1,
1.747806, 0.0822103, 0.02601533, 0, 0, 0, 1, 1,
1.783997, -0.7293995, 2.863855, 0, 0, 0, 1, 1,
1.784137, 0.3036849, 2.308101, 0, 0, 0, 1, 1,
1.790176, 0.4892226, 1.017874, 0, 0, 0, 1, 1,
1.826445, 1.843455, 0.7832305, 0, 0, 0, 1, 1,
1.839171, 0.3140682, 1.645038, 0, 0, 0, 1, 1,
1.844369, -0.8701785, 2.488457, 1, 1, 1, 1, 1,
1.848401, 0.3017701, 1.79926, 1, 1, 1, 1, 1,
1.850453, -1.851967, 1.75427, 1, 1, 1, 1, 1,
1.851862, -0.1355194, 3.246277, 1, 1, 1, 1, 1,
1.856736, -1.597495, 2.452376, 1, 1, 1, 1, 1,
1.879514, -0.4918113, 1.557688, 1, 1, 1, 1, 1,
1.881167, -2.061552, 2.278982, 1, 1, 1, 1, 1,
1.900325, -0.786618, 3.164647, 1, 1, 1, 1, 1,
1.926035, 0.4891556, 0.6988958, 1, 1, 1, 1, 1,
1.945298, 2.540771, 0.2412408, 1, 1, 1, 1, 1,
1.975738, 2.296927, 0.9287175, 1, 1, 1, 1, 1,
1.996362, 0.5945276, 0.88312, 1, 1, 1, 1, 1,
2.00953, -0.213615, -0.722474, 1, 1, 1, 1, 1,
2.020749, -0.3973463, 1.443872, 1, 1, 1, 1, 1,
2.029213, -0.6131238, 2.970145, 1, 1, 1, 1, 1,
2.036372, 1.538039, 0.3199668, 0, 0, 1, 1, 1,
2.076899, -0.03604415, 0.1676934, 1, 0, 0, 1, 1,
2.116789, 0.8975091, 0.7243624, 1, 0, 0, 1, 1,
2.12631, 1.331029, 2.512078, 1, 0, 0, 1, 1,
2.18904, -1.066157, 2.549275, 1, 0, 0, 1, 1,
2.208679, 0.2681022, 3.115375, 1, 0, 0, 1, 1,
2.240632, -0.9342774, 2.734476, 0, 0, 0, 1, 1,
2.243164, -0.8469604, 2.571723, 0, 0, 0, 1, 1,
2.309984, 0.05117841, -0.005953519, 0, 0, 0, 1, 1,
2.326184, -2.037915, 1.892652, 0, 0, 0, 1, 1,
2.370998, 1.001469, 2.055203, 0, 0, 0, 1, 1,
2.374067, 0.08158917, 0.07123584, 0, 0, 0, 1, 1,
2.412606, -0.03562161, 1.852846, 0, 0, 0, 1, 1,
2.422085, -0.942412, 1.221037, 1, 1, 1, 1, 1,
2.482972, -0.8466117, 1.20648, 1, 1, 1, 1, 1,
2.510372, 0.4497072, 1.343683, 1, 1, 1, 1, 1,
2.515024, 2.068379, 0.9289787, 1, 1, 1, 1, 1,
2.852682, 0.1148758, 0.2724224, 1, 1, 1, 1, 1,
2.919337, -0.2930255, 0.6314237, 1, 1, 1, 1, 1,
3.25198, -1.887785, 2.587635, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 10.08167;
var distance = 35.41145;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.4238827, 0.2445433, 0.161926 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.41145);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
