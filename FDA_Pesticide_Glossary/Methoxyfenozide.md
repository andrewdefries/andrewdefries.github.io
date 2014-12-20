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
-3.38571, 0.8758159, 0.5137572, 1, 0, 0, 1,
-3.217155, 0.1268636, -2.835397, 1, 0.007843138, 0, 1,
-3.035051, 0.8646332, -2.633245, 1, 0.01176471, 0, 1,
-3.029161, -2.044523, -3.09956, 1, 0.01960784, 0, 1,
-2.75555, 1.410656, -1.27928, 1, 0.02352941, 0, 1,
-2.691731, -2.528346, -1.760034, 1, 0.03137255, 0, 1,
-2.636899, -0.08709603, -1.839112, 1, 0.03529412, 0, 1,
-2.514846, -0.4818137, -0.7499871, 1, 0.04313726, 0, 1,
-2.458962, -1.558634, -3.411182, 1, 0.04705882, 0, 1,
-2.417119, -0.723327, -1.713376, 1, 0.05490196, 0, 1,
-2.396402, 1.139681, -1.369553, 1, 0.05882353, 0, 1,
-2.337354, -1.844212, -1.543189, 1, 0.06666667, 0, 1,
-2.265427, 0.6238896, -1.870637, 1, 0.07058824, 0, 1,
-2.219188, 0.803422, 0.8861333, 1, 0.07843138, 0, 1,
-2.153504, 0.3362782, -1.576292, 1, 0.08235294, 0, 1,
-2.150755, 0.01211743, -0.8305573, 1, 0.09019608, 0, 1,
-2.137634, 0.2653974, -2.587728, 1, 0.09411765, 0, 1,
-2.129011, 0.7902294, -2.509919, 1, 0.1019608, 0, 1,
-2.079943, -0.5020372, -2.220387, 1, 0.1098039, 0, 1,
-2.071648, -2.239941, -2.090695, 1, 0.1137255, 0, 1,
-2.070676, 0.1380093, -1.32936, 1, 0.1215686, 0, 1,
-2.047302, 0.06717648, -2.561949, 1, 0.1254902, 0, 1,
-2.04602, 0.738282, -0.8980611, 1, 0.1333333, 0, 1,
-2.029514, 0.5942002, -2.03809, 1, 0.1372549, 0, 1,
-2.002616, 0.6520011, -1.31938, 1, 0.145098, 0, 1,
-1.933005, 1.230255, 0.1169413, 1, 0.1490196, 0, 1,
-1.908576, -2.043576, -3.482599, 1, 0.1568628, 0, 1,
-1.878138, 1.071581, -0.6109242, 1, 0.1607843, 0, 1,
-1.876876, 0.4310707, -0.6294804, 1, 0.1686275, 0, 1,
-1.844115, 0.3715035, -1.914076, 1, 0.172549, 0, 1,
-1.836114, 0.5158436, -2.334978, 1, 0.1803922, 0, 1,
-1.833252, 1.745201, -0.8470501, 1, 0.1843137, 0, 1,
-1.826603, -0.1677831, -1.51482, 1, 0.1921569, 0, 1,
-1.804215, -0.8452467, -2.305061, 1, 0.1960784, 0, 1,
-1.774849, 0.8237244, -1.732266, 1, 0.2039216, 0, 1,
-1.763579, -0.3831924, -1.183258, 1, 0.2117647, 0, 1,
-1.759155, 1.28481, 2.827933, 1, 0.2156863, 0, 1,
-1.750554, 0.9315819, -1.723448, 1, 0.2235294, 0, 1,
-1.747035, -1.014039, -1.822277, 1, 0.227451, 0, 1,
-1.726815, -0.006622944, -1.562079, 1, 0.2352941, 0, 1,
-1.726741, -0.5017684, -2.379603, 1, 0.2392157, 0, 1,
-1.696186, -0.3202172, -2.39639, 1, 0.2470588, 0, 1,
-1.668221, -1.745561, -1.690401, 1, 0.2509804, 0, 1,
-1.666025, -0.03514204, -1.502815, 1, 0.2588235, 0, 1,
-1.659282, -0.4333994, -1.079013, 1, 0.2627451, 0, 1,
-1.654397, 0.8861521, -1.970277, 1, 0.2705882, 0, 1,
-1.650544, -0.9630706, -3.952058, 1, 0.2745098, 0, 1,
-1.645577, -1.425313, -0.9033379, 1, 0.282353, 0, 1,
-1.634603, -1.596837, -2.384406, 1, 0.2862745, 0, 1,
-1.627146, 1.14918, -1.280304, 1, 0.2941177, 0, 1,
-1.624417, 0.2365209, -2.722549, 1, 0.3019608, 0, 1,
-1.609741, 1.867206, -0.9671826, 1, 0.3058824, 0, 1,
-1.599817, 1.158049, -0.8224531, 1, 0.3137255, 0, 1,
-1.592011, 0.2462336, -2.113422, 1, 0.3176471, 0, 1,
-1.579114, -0.9712633, 0.1215016, 1, 0.3254902, 0, 1,
-1.578826, -0.3726156, -1.423523, 1, 0.3294118, 0, 1,
-1.568594, 0.4498694, -1.595971, 1, 0.3372549, 0, 1,
-1.567479, -0.8762596, -0.9487003, 1, 0.3411765, 0, 1,
-1.556996, 1.236707, -0.9855589, 1, 0.3490196, 0, 1,
-1.543755, -1.845549, -1.801384, 1, 0.3529412, 0, 1,
-1.540141, -0.07724673, -2.243105, 1, 0.3607843, 0, 1,
-1.537493, -1.47585, -3.007967, 1, 0.3647059, 0, 1,
-1.525293, -0.07954787, -0.198653, 1, 0.372549, 0, 1,
-1.516964, 1.445874, -0.7157114, 1, 0.3764706, 0, 1,
-1.50735, -1.049406, -1.860769, 1, 0.3843137, 0, 1,
-1.504564, 0.3608495, -1.154635, 1, 0.3882353, 0, 1,
-1.503662, -0.002506678, -1.508153, 1, 0.3960784, 0, 1,
-1.501961, 0.06183471, -1.688909, 1, 0.4039216, 0, 1,
-1.498942, -0.3282731, -3.374747, 1, 0.4078431, 0, 1,
-1.496524, -0.176412, -2.995186, 1, 0.4156863, 0, 1,
-1.48826, -0.3398676, -1.191359, 1, 0.4196078, 0, 1,
-1.485587, -0.5786244, -1.942549, 1, 0.427451, 0, 1,
-1.484788, -0.2327354, -2.153609, 1, 0.4313726, 0, 1,
-1.471908, -1.28299, -1.224146, 1, 0.4392157, 0, 1,
-1.466863, -0.67573, -1.6188, 1, 0.4431373, 0, 1,
-1.465262, 0.3959423, -1.325436, 1, 0.4509804, 0, 1,
-1.459929, -0.09889949, -2.548966, 1, 0.454902, 0, 1,
-1.448397, 0.152802, -0.8292576, 1, 0.4627451, 0, 1,
-1.43807, 1.4689, -0.9572256, 1, 0.4666667, 0, 1,
-1.437523, 1.357074, -0.1645073, 1, 0.4745098, 0, 1,
-1.430832, 0.08192492, -3.771184, 1, 0.4784314, 0, 1,
-1.419834, 1.392146, -0.6055499, 1, 0.4862745, 0, 1,
-1.419154, 1.319243, 0.6266729, 1, 0.4901961, 0, 1,
-1.417835, -0.3404299, -2.782307, 1, 0.4980392, 0, 1,
-1.413589, -0.3031653, -2.026799, 1, 0.5058824, 0, 1,
-1.409452, -0.928664, -1.300742, 1, 0.509804, 0, 1,
-1.408414, 0.7122015, -0.6241805, 1, 0.5176471, 0, 1,
-1.405158, -0.1593732, -1.025785, 1, 0.5215687, 0, 1,
-1.400285, -0.4480778, -0.7510343, 1, 0.5294118, 0, 1,
-1.389786, 0.4290309, -0.6744879, 1, 0.5333334, 0, 1,
-1.385718, 0.5612551, -1.317321, 1, 0.5411765, 0, 1,
-1.37299, -2.060941, -2.789992, 1, 0.5450981, 0, 1,
-1.366964, -0.9678028, -1.953498, 1, 0.5529412, 0, 1,
-1.351094, -0.5560365, 0.5942462, 1, 0.5568628, 0, 1,
-1.345714, -1.013802, -0.525786, 1, 0.5647059, 0, 1,
-1.344304, 0.400026, -1.950525, 1, 0.5686275, 0, 1,
-1.34273, -0.8219483, -1.931562, 1, 0.5764706, 0, 1,
-1.322605, -2.436923, -4.254851, 1, 0.5803922, 0, 1,
-1.319203, 0.3473381, -0.1547202, 1, 0.5882353, 0, 1,
-1.310107, -1.860015, -3.048895, 1, 0.5921569, 0, 1,
-1.305834, 2.150134, -0.8082573, 1, 0.6, 0, 1,
-1.298007, -0.1827731, -0.6081911, 1, 0.6078432, 0, 1,
-1.292953, -0.5851677, -1.432573, 1, 0.6117647, 0, 1,
-1.278262, -0.5194757, -3.175396, 1, 0.6196079, 0, 1,
-1.269805, 1.226581, 0.006859289, 1, 0.6235294, 0, 1,
-1.267882, 0.2428104, -1.337952, 1, 0.6313726, 0, 1,
-1.261514, 0.8203179, -1.352221, 1, 0.6352941, 0, 1,
-1.255946, 1.501945, -1.027578, 1, 0.6431373, 0, 1,
-1.239431, -1.300581, -0.2071245, 1, 0.6470588, 0, 1,
-1.237866, -0.5375715, -1.876867, 1, 0.654902, 0, 1,
-1.231214, 0.185737, -1.425588, 1, 0.6588235, 0, 1,
-1.227038, 0.2125855, -2.304693, 1, 0.6666667, 0, 1,
-1.226913, 0.5496585, 0.3045278, 1, 0.6705883, 0, 1,
-1.224521, 0.4393025, -0.6096933, 1, 0.6784314, 0, 1,
-1.220672, -0.03846297, -2.742883, 1, 0.682353, 0, 1,
-1.218689, -1.049555, -1.200229, 1, 0.6901961, 0, 1,
-1.208552, 0.01218339, -1.105411, 1, 0.6941177, 0, 1,
-1.206471, 1.283521, -0.4836397, 1, 0.7019608, 0, 1,
-1.190548, -0.4173669, -2.309113, 1, 0.7098039, 0, 1,
-1.188779, 1.833763, -1.598819, 1, 0.7137255, 0, 1,
-1.188265, 0.4209443, -2.644123, 1, 0.7215686, 0, 1,
-1.184114, 0.9768274, 0.5785579, 1, 0.7254902, 0, 1,
-1.177191, 0.9731175, 0.8472853, 1, 0.7333333, 0, 1,
-1.177107, -0.1821273, -3.556579, 1, 0.7372549, 0, 1,
-1.176611, -0.326809, -3.266558, 1, 0.7450981, 0, 1,
-1.173108, 0.3924201, -2.262698, 1, 0.7490196, 0, 1,
-1.168911, 1.261504, 0.6268452, 1, 0.7568628, 0, 1,
-1.144519, -0.1418219, -2.560387, 1, 0.7607843, 0, 1,
-1.13008, 0.002823691, -0.1540463, 1, 0.7686275, 0, 1,
-1.128562, -0.2587082, -3.430551, 1, 0.772549, 0, 1,
-1.126001, 0.2868022, -0.9422969, 1, 0.7803922, 0, 1,
-1.120867, 0.8549534, -2.791006, 1, 0.7843137, 0, 1,
-1.11027, 0.1655206, -0.2380784, 1, 0.7921569, 0, 1,
-1.081904, 0.715139, 0.3309467, 1, 0.7960784, 0, 1,
-1.072511, -0.2416126, 0.2287472, 1, 0.8039216, 0, 1,
-1.068122, -0.2036147, -1.577546, 1, 0.8117647, 0, 1,
-1.060981, 0.2130982, -1.553095, 1, 0.8156863, 0, 1,
-1.046629, -2.108292, -1.650349, 1, 0.8235294, 0, 1,
-1.029929, -0.5259884, -1.222266, 1, 0.827451, 0, 1,
-1.021214, 1.758349, -0.6142929, 1, 0.8352941, 0, 1,
-1.019096, 0.13309, -1.281792, 1, 0.8392157, 0, 1,
-1.018028, -0.4048072, -1.800876, 1, 0.8470588, 0, 1,
-1.013974, -0.7624454, -2.426322, 1, 0.8509804, 0, 1,
-1.01002, -0.4402425, -1.418107, 1, 0.8588235, 0, 1,
-1.004976, 2.165924, 0.02494707, 1, 0.8627451, 0, 1,
-1.00121, -0.4870693, -2.582112, 1, 0.8705882, 0, 1,
-1.000844, -0.6778019, -1.834807, 1, 0.8745098, 0, 1,
-0.999703, 1.174782, -2.359426, 1, 0.8823529, 0, 1,
-0.9982099, -1.411951, -3.929036, 1, 0.8862745, 0, 1,
-0.9974409, -0.02002822, -0.7433829, 1, 0.8941177, 0, 1,
-0.9961392, 0.4205382, -1.363683, 1, 0.8980392, 0, 1,
-0.9884958, 0.3547574, -2.714894, 1, 0.9058824, 0, 1,
-0.9857868, 0.0158714, -1.848639, 1, 0.9137255, 0, 1,
-0.9838421, 1.381155, -2.524753, 1, 0.9176471, 0, 1,
-0.9832665, -0.1596429, -1.37098, 1, 0.9254902, 0, 1,
-0.9783542, -2.384336, -4.568439, 1, 0.9294118, 0, 1,
-0.9751734, -0.4050571, -3.975212, 1, 0.9372549, 0, 1,
-0.9709267, -0.5695131, -2.485247, 1, 0.9411765, 0, 1,
-0.9698887, 1.814044, -0.8560606, 1, 0.9490196, 0, 1,
-0.9671192, 0.1501675, -1.401995, 1, 0.9529412, 0, 1,
-0.9666892, 0.264972, -1.261406, 1, 0.9607843, 0, 1,
-0.9662484, 0.418369, -2.382049, 1, 0.9647059, 0, 1,
-0.9592819, 1.300775, -1.636355, 1, 0.972549, 0, 1,
-0.9576362, 0.3024644, -0.6965924, 1, 0.9764706, 0, 1,
-0.9529726, 1.295205, -0.16645, 1, 0.9843137, 0, 1,
-0.9520333, -0.05922877, -1.023517, 1, 0.9882353, 0, 1,
-0.9518727, 0.4856847, -1.396374, 1, 0.9960784, 0, 1,
-0.942023, 0.3314652, -2.668127, 0.9960784, 1, 0, 1,
-0.9409686, -0.07342409, -2.606072, 0.9921569, 1, 0, 1,
-0.940367, 0.6254888, -1.012086, 0.9843137, 1, 0, 1,
-0.9396328, 1.536897, -0.5808181, 0.9803922, 1, 0, 1,
-0.9390181, 0.7175808, -1.921959, 0.972549, 1, 0, 1,
-0.9365904, 0.850763, -0.4084216, 0.9686275, 1, 0, 1,
-0.9321214, 0.7975698, -2.188281, 0.9607843, 1, 0, 1,
-0.9283208, 0.6085057, -1.45935, 0.9568627, 1, 0, 1,
-0.9276871, 0.3546676, -2.089872, 0.9490196, 1, 0, 1,
-0.9268913, -2.177882, -2.870832, 0.945098, 1, 0, 1,
-0.9196249, 0.8072069, 0.4727349, 0.9372549, 1, 0, 1,
-0.9171448, 0.6205047, -2.676438, 0.9333333, 1, 0, 1,
-0.9161067, -0.1106082, -2.273739, 0.9254902, 1, 0, 1,
-0.9140524, -0.6484817, -2.230424, 0.9215686, 1, 0, 1,
-0.9131457, 0.09604144, -2.54871, 0.9137255, 1, 0, 1,
-0.9072, 0.2058029, -0.3578584, 0.9098039, 1, 0, 1,
-0.9035048, -0.3215304, -2.556094, 0.9019608, 1, 0, 1,
-0.9018297, 0.4536476, -0.1935754, 0.8941177, 1, 0, 1,
-0.9003852, -0.3476272, -2.618053, 0.8901961, 1, 0, 1,
-0.8979943, -0.2839045, -2.674637, 0.8823529, 1, 0, 1,
-0.8968764, -2.865042, -3.719395, 0.8784314, 1, 0, 1,
-0.8939283, -0.6554995, -2.052111, 0.8705882, 1, 0, 1,
-0.8938151, 0.03823136, -0.7044083, 0.8666667, 1, 0, 1,
-0.8893687, 0.8467432, -1.15098, 0.8588235, 1, 0, 1,
-0.8875369, 1.537889, 0.6873668, 0.854902, 1, 0, 1,
-0.8871359, 0.005269542, -2.15545, 0.8470588, 1, 0, 1,
-0.8864067, 0.131253, 0.6381094, 0.8431373, 1, 0, 1,
-0.886092, -0.3428507, -2.737873, 0.8352941, 1, 0, 1,
-0.8817161, -0.4223404, -0.751107, 0.8313726, 1, 0, 1,
-0.874968, 1.142358, -0.6250417, 0.8235294, 1, 0, 1,
-0.8729113, -0.6495539, -2.21642, 0.8196079, 1, 0, 1,
-0.8619558, -0.04168113, -2.051044, 0.8117647, 1, 0, 1,
-0.8579344, 1.625249, -1.443219, 0.8078431, 1, 0, 1,
-0.8574007, 0.1018426, 0.0171556, 0.8, 1, 0, 1,
-0.8555603, 0.2475706, -1.085919, 0.7921569, 1, 0, 1,
-0.8552784, -1.340099, -3.175153, 0.7882353, 1, 0, 1,
-0.8549251, 0.002989695, -1.991326, 0.7803922, 1, 0, 1,
-0.8546595, -1.005651, -4.660717, 0.7764706, 1, 0, 1,
-0.8538364, 0.2462554, -2.225115, 0.7686275, 1, 0, 1,
-0.8446945, 0.3879966, -2.076078, 0.7647059, 1, 0, 1,
-0.8417444, 0.9682637, -1.474532, 0.7568628, 1, 0, 1,
-0.8245308, -2.508995, -1.955057, 0.7529412, 1, 0, 1,
-0.8234068, -0.7880692, -2.399236, 0.7450981, 1, 0, 1,
-0.8168836, -0.8536475, -1.374887, 0.7411765, 1, 0, 1,
-0.8125902, 0.3925124, -0.7125931, 0.7333333, 1, 0, 1,
-0.8108963, 0.4740324, -2.079519, 0.7294118, 1, 0, 1,
-0.8048926, -1.445836, -1.754522, 0.7215686, 1, 0, 1,
-0.8024032, 1.117225, -0.4144547, 0.7176471, 1, 0, 1,
-0.802071, -0.1519362, -0.1439968, 0.7098039, 1, 0, 1,
-0.7985055, 1.482301, -0.2889422, 0.7058824, 1, 0, 1,
-0.7971003, -0.9950975, -0.8242729, 0.6980392, 1, 0, 1,
-0.7923824, 0.6298821, -0.007697898, 0.6901961, 1, 0, 1,
-0.7897881, -1.745445, -3.045115, 0.6862745, 1, 0, 1,
-0.785194, 0.1763095, -0.6574761, 0.6784314, 1, 0, 1,
-0.7811563, -0.9205077, -3.880069, 0.6745098, 1, 0, 1,
-0.7775704, 0.3117033, -0.8376392, 0.6666667, 1, 0, 1,
-0.7749553, 0.9549846, 0.8630842, 0.6627451, 1, 0, 1,
-0.7732351, -2.443781, -1.852277, 0.654902, 1, 0, 1,
-0.7686168, -0.3573974, -1.373894, 0.6509804, 1, 0, 1,
-0.7638398, -1.46895, -1.941774, 0.6431373, 1, 0, 1,
-0.7634547, -0.06631663, -1.26418, 0.6392157, 1, 0, 1,
-0.762714, -0.9119827, -2.226484, 0.6313726, 1, 0, 1,
-0.7626023, -1.033182, -3.535977, 0.627451, 1, 0, 1,
-0.7555632, 0.005861551, -1.811484, 0.6196079, 1, 0, 1,
-0.7534397, -1.372582, -3.132613, 0.6156863, 1, 0, 1,
-0.7401553, 2.469223, -0.6107253, 0.6078432, 1, 0, 1,
-0.7390682, 2.190745, 0.8718238, 0.6039216, 1, 0, 1,
-0.7343935, -2.63661, -0.3599505, 0.5960785, 1, 0, 1,
-0.7303714, 1.910722, -0.03829532, 0.5882353, 1, 0, 1,
-0.7285626, -1.449489, -3.417703, 0.5843138, 1, 0, 1,
-0.7274449, 1.350827, -1.927811, 0.5764706, 1, 0, 1,
-0.7231804, -0.06536954, -0.1250295, 0.572549, 1, 0, 1,
-0.7224421, 1.607961, -0.9865869, 0.5647059, 1, 0, 1,
-0.7200651, 0.008068118, -2.1585, 0.5607843, 1, 0, 1,
-0.7189913, -0.6357138, -1.702657, 0.5529412, 1, 0, 1,
-0.7181439, 0.9091074, -0.2425637, 0.5490196, 1, 0, 1,
-0.714269, 0.2217442, -1.640124, 0.5411765, 1, 0, 1,
-0.7117352, -0.1281668, -2.889465, 0.5372549, 1, 0, 1,
-0.7113103, 0.4380639, -0.6546991, 0.5294118, 1, 0, 1,
-0.7092716, 0.2021285, -0.7761148, 0.5254902, 1, 0, 1,
-0.7004329, -1.348889, -3.665376, 0.5176471, 1, 0, 1,
-0.6963112, -1.552833, -1.659941, 0.5137255, 1, 0, 1,
-0.6948819, 0.2929282, 0.2602507, 0.5058824, 1, 0, 1,
-0.6932389, -1.433735, -3.928717, 0.5019608, 1, 0, 1,
-0.6905589, -0.4091261, -3.549637, 0.4941176, 1, 0, 1,
-0.6850536, -0.4239514, -1.643787, 0.4862745, 1, 0, 1,
-0.6845829, 1.517834, 0.5919588, 0.4823529, 1, 0, 1,
-0.680229, -0.007951301, -0.7476599, 0.4745098, 1, 0, 1,
-0.6748726, 0.5524955, -1.800917, 0.4705882, 1, 0, 1,
-0.674848, 1.503588, 0.7556604, 0.4627451, 1, 0, 1,
-0.6739376, 0.294574, -1.602264, 0.4588235, 1, 0, 1,
-0.6505975, -1.54277, -2.706318, 0.4509804, 1, 0, 1,
-0.6472561, 1.024363, -0.5740012, 0.4470588, 1, 0, 1,
-0.6468396, 2.049619, -0.689177, 0.4392157, 1, 0, 1,
-0.6413625, 0.7982539, -2.849712, 0.4352941, 1, 0, 1,
-0.6377831, 0.7136832, -1.928567, 0.427451, 1, 0, 1,
-0.6370546, 0.2304454, 0.3407839, 0.4235294, 1, 0, 1,
-0.6321289, -0.4368521, -0.6376303, 0.4156863, 1, 0, 1,
-0.627921, -2.251628, -1.878017, 0.4117647, 1, 0, 1,
-0.6272473, -1.616568, -1.560098, 0.4039216, 1, 0, 1,
-0.6259248, 0.3283433, -0.846135, 0.3960784, 1, 0, 1,
-0.6228378, -1.551604, -2.856544, 0.3921569, 1, 0, 1,
-0.6104038, 0.07862297, -1.328023, 0.3843137, 1, 0, 1,
-0.6090624, -0.7108418, -1.592749, 0.3803922, 1, 0, 1,
-0.6071479, -2.075669, -3.502628, 0.372549, 1, 0, 1,
-0.6038207, -0.719975, -1.675065, 0.3686275, 1, 0, 1,
-0.6022229, 0.7336452, 0.484868, 0.3607843, 1, 0, 1,
-0.6000763, -0.7717659, -1.827515, 0.3568628, 1, 0, 1,
-0.599847, 0.03416601, -0.4951905, 0.3490196, 1, 0, 1,
-0.5965683, 0.337759, -0.5601372, 0.345098, 1, 0, 1,
-0.5962682, -0.746417, -2.714984, 0.3372549, 1, 0, 1,
-0.5888748, 0.117333, -0.02565881, 0.3333333, 1, 0, 1,
-0.5886541, -0.3388646, -2.676111, 0.3254902, 1, 0, 1,
-0.5877327, 0.2766603, 0.5013974, 0.3215686, 1, 0, 1,
-0.5831802, 0.1649504, -0.9683661, 0.3137255, 1, 0, 1,
-0.5815393, -0.2705306, -4.695696, 0.3098039, 1, 0, 1,
-0.5792211, 2.839031, -0.4175007, 0.3019608, 1, 0, 1,
-0.5785413, -0.4843896, -4.276305, 0.2941177, 1, 0, 1,
-0.5782629, -0.4395004, -1.797337, 0.2901961, 1, 0, 1,
-0.5749003, -0.9821988, -3.318833, 0.282353, 1, 0, 1,
-0.5741092, 0.3806358, -0.8288183, 0.2784314, 1, 0, 1,
-0.5711712, 0.5087467, -0.4387483, 0.2705882, 1, 0, 1,
-0.5711531, 0.2295444, -0.7792305, 0.2666667, 1, 0, 1,
-0.5660273, -0.02399968, -0.5143148, 0.2588235, 1, 0, 1,
-0.5612307, 1.169983, -0.6443313, 0.254902, 1, 0, 1,
-0.5572704, -0.3517519, -0.8841534, 0.2470588, 1, 0, 1,
-0.5544454, -0.9160241, -2.508765, 0.2431373, 1, 0, 1,
-0.5533293, -0.9407181, -2.095376, 0.2352941, 1, 0, 1,
-0.5496356, 0.5515541, -0.1150083, 0.2313726, 1, 0, 1,
-0.5456474, -0.4415832, -0.4506778, 0.2235294, 1, 0, 1,
-0.5388898, 1.531254, 0.485128, 0.2196078, 1, 0, 1,
-0.5356263, 0.04704082, -2.400244, 0.2117647, 1, 0, 1,
-0.5282339, -0.4394149, -5.816286, 0.2078431, 1, 0, 1,
-0.5234392, -0.1394024, -1.498361, 0.2, 1, 0, 1,
-0.5201555, -1.722188, -3.441965, 0.1921569, 1, 0, 1,
-0.5188499, -1.091072, -3.718511, 0.1882353, 1, 0, 1,
-0.5111691, 0.7936428, -1.411996, 0.1803922, 1, 0, 1,
-0.51039, -0.5373424, -1.914534, 0.1764706, 1, 0, 1,
-0.5102745, -0.09482371, -3.213526, 0.1686275, 1, 0, 1,
-0.508661, -1.181723, -4.010143, 0.1647059, 1, 0, 1,
-0.5062962, -0.7401972, -1.58309, 0.1568628, 1, 0, 1,
-0.5056413, 2.508707, 0.3631162, 0.1529412, 1, 0, 1,
-0.503997, 0.2874117, -2.987631, 0.145098, 1, 0, 1,
-0.4926367, -0.3220831, -1.952703, 0.1411765, 1, 0, 1,
-0.489886, -0.4172663, -1.153831, 0.1333333, 1, 0, 1,
-0.4873247, -0.2238234, -1.654568, 0.1294118, 1, 0, 1,
-0.4867698, 0.5971562, -1.447362, 0.1215686, 1, 0, 1,
-0.4857799, 1.342729, 0.5891005, 0.1176471, 1, 0, 1,
-0.4822251, -0.1862219, -1.629093, 0.1098039, 1, 0, 1,
-0.4806535, 0.6932586, 0.8118719, 0.1058824, 1, 0, 1,
-0.4804827, 0.7222985, 0.4454821, 0.09803922, 1, 0, 1,
-0.4762013, 2.423852, 1.377352, 0.09019608, 1, 0, 1,
-0.4744478, -1.582699, -3.673902, 0.08627451, 1, 0, 1,
-0.473918, 1.716957, -0.9760006, 0.07843138, 1, 0, 1,
-0.4702373, -3.01559, -1.998263, 0.07450981, 1, 0, 1,
-0.4676484, 0.3166434, -1.635285, 0.06666667, 1, 0, 1,
-0.4674458, -2.449605, -2.640354, 0.0627451, 1, 0, 1,
-0.4649728, 1.95113, 1.479645, 0.05490196, 1, 0, 1,
-0.4635484, 0.02705856, -2.555677, 0.05098039, 1, 0, 1,
-0.4557149, -0.7413179, -1.19475, 0.04313726, 1, 0, 1,
-0.455285, -0.1333327, -0.07267365, 0.03921569, 1, 0, 1,
-0.4552124, -1.145531, -3.011198, 0.03137255, 1, 0, 1,
-0.4526674, -0.4630899, -4.278695, 0.02745098, 1, 0, 1,
-0.4506309, -0.3266207, -4.114273, 0.01960784, 1, 0, 1,
-0.44449, -0.5856936, -1.843626, 0.01568628, 1, 0, 1,
-0.443703, 0.4301833, -1.502053, 0.007843138, 1, 0, 1,
-0.4401946, 2.100031, 1.271335, 0.003921569, 1, 0, 1,
-0.4371854, -0.2738624, -3.126454, 0, 1, 0.003921569, 1,
-0.4361167, -1.644465, -2.290837, 0, 1, 0.01176471, 1,
-0.4334852, -2.117985, -1.917093, 0, 1, 0.01568628, 1,
-0.4287581, -0.8376131, -2.428691, 0, 1, 0.02352941, 1,
-0.4265308, 0.4299071, -0.9971893, 0, 1, 0.02745098, 1,
-0.4228896, 0.2757707, -1.937036, 0, 1, 0.03529412, 1,
-0.4228117, -0.1656707, -0.464376, 0, 1, 0.03921569, 1,
-0.4214569, -0.5498039, -3.725273, 0, 1, 0.04705882, 1,
-0.4093308, 1.359724, 2.191466, 0, 1, 0.05098039, 1,
-0.4089394, -1.640889, -2.222398, 0, 1, 0.05882353, 1,
-0.4079354, -0.3381307, -3.836998, 0, 1, 0.0627451, 1,
-0.4038774, 0.8412444, 0.7405879, 0, 1, 0.07058824, 1,
-0.4002307, -0.4876054, -2.410904, 0, 1, 0.07450981, 1,
-0.3986799, -1.128737, -3.267115, 0, 1, 0.08235294, 1,
-0.3922835, -1.546452, -2.224842, 0, 1, 0.08627451, 1,
-0.3882704, 0.1985003, 0.3066604, 0, 1, 0.09411765, 1,
-0.3826023, -0.1536218, -2.954416, 0, 1, 0.1019608, 1,
-0.3820915, 0.4822563, 0.117157, 0, 1, 0.1058824, 1,
-0.3798321, -0.4961306, -2.294659, 0, 1, 0.1137255, 1,
-0.3716675, -0.151332, -2.267203, 0, 1, 0.1176471, 1,
-0.3704197, 0.009739613, -1.653031, 0, 1, 0.1254902, 1,
-0.3664865, 0.2158517, -1.018103, 0, 1, 0.1294118, 1,
-0.3638163, 0.5172339, -1.336014, 0, 1, 0.1372549, 1,
-0.3631796, 0.219154, 0.5362552, 0, 1, 0.1411765, 1,
-0.3624215, 0.1152461, -0.5051205, 0, 1, 0.1490196, 1,
-0.3606663, -0.7767804, -4.535476, 0, 1, 0.1529412, 1,
-0.3594345, -0.1491124, -0.8009676, 0, 1, 0.1607843, 1,
-0.3592626, -0.6474802, -3.156303, 0, 1, 0.1647059, 1,
-0.3583818, -1.590997, -3.259344, 0, 1, 0.172549, 1,
-0.3573563, 1.312685, 1.623267, 0, 1, 0.1764706, 1,
-0.357282, 1.41003, 1.636475, 0, 1, 0.1843137, 1,
-0.3547734, -1.995159, -2.949476, 0, 1, 0.1882353, 1,
-0.3446376, -1.826946, -1.923967, 0, 1, 0.1960784, 1,
-0.3433946, -0.9204194, -1.595311, 0, 1, 0.2039216, 1,
-0.3393135, 1.448671, 1.403596, 0, 1, 0.2078431, 1,
-0.3358991, 0.1431194, -1.446149, 0, 1, 0.2156863, 1,
-0.3351268, -0.6675372, -3.407529, 0, 1, 0.2196078, 1,
-0.3350309, -1.537216, -1.025662, 0, 1, 0.227451, 1,
-0.3350006, 0.8178137, 0.4695992, 0, 1, 0.2313726, 1,
-0.3286086, -1.286566, -3.622626, 0, 1, 0.2392157, 1,
-0.3245924, -0.3849215, -3.028732, 0, 1, 0.2431373, 1,
-0.3236174, -0.1158873, -2.134499, 0, 1, 0.2509804, 1,
-0.3212775, -0.8666522, -2.868933, 0, 1, 0.254902, 1,
-0.3175688, 0.8561718, -2.430323, 0, 1, 0.2627451, 1,
-0.3165127, 0.1963642, -0.1177548, 0, 1, 0.2666667, 1,
-0.3150484, -1.10145, -2.796141, 0, 1, 0.2745098, 1,
-0.3064685, 0.6380439, 0.03181964, 0, 1, 0.2784314, 1,
-0.3051914, 0.1474653, -2.938411, 0, 1, 0.2862745, 1,
-0.3007861, -0.4280358, -1.093635, 0, 1, 0.2901961, 1,
-0.2979836, -0.1077118, -3.371869, 0, 1, 0.2980392, 1,
-0.2942754, -1.085495, -3.813071, 0, 1, 0.3058824, 1,
-0.2920208, -0.1930085, -1.665715, 0, 1, 0.3098039, 1,
-0.2836229, -0.6322506, -1.500965, 0, 1, 0.3176471, 1,
-0.2822749, -0.1362206, -3.554843, 0, 1, 0.3215686, 1,
-0.2808786, 0.7131083, 0.2329024, 0, 1, 0.3294118, 1,
-0.2748823, -1.108299, -3.109385, 0, 1, 0.3333333, 1,
-0.2717302, 0.8993759, -0.7161903, 0, 1, 0.3411765, 1,
-0.2679725, -1.538684, -2.105944, 0, 1, 0.345098, 1,
-0.2626833, 1.4012, -0.7252399, 0, 1, 0.3529412, 1,
-0.2621595, 0.4905655, 0.2964301, 0, 1, 0.3568628, 1,
-0.261167, 1.168631, 0.4289939, 0, 1, 0.3647059, 1,
-0.2608596, -1.681377, -0.4118165, 0, 1, 0.3686275, 1,
-0.2597894, -0.03456508, -0.6176448, 0, 1, 0.3764706, 1,
-0.2569081, 2.356623, -1.627287, 0, 1, 0.3803922, 1,
-0.2545995, 0.5862929, -0.3144293, 0, 1, 0.3882353, 1,
-0.2527921, 2.215602, -1.935108, 0, 1, 0.3921569, 1,
-0.250749, -1.450712, -3.370502, 0, 1, 0.4, 1,
-0.2410312, 0.4439175, 1.174136, 0, 1, 0.4078431, 1,
-0.2351232, -1.211948, -4.4161, 0, 1, 0.4117647, 1,
-0.2348475, -2.549248, -4.438426, 0, 1, 0.4196078, 1,
-0.2291548, 0.7128211, 0.5077383, 0, 1, 0.4235294, 1,
-0.2263967, -0.4606923, -3.806616, 0, 1, 0.4313726, 1,
-0.2263018, -1.114446, -3.812326, 0, 1, 0.4352941, 1,
-0.2218256, 0.98657, 0.5602804, 0, 1, 0.4431373, 1,
-0.2153997, -0.634398, -2.398824, 0, 1, 0.4470588, 1,
-0.2152901, 0.4121352, 1.612319, 0, 1, 0.454902, 1,
-0.2142471, -1.341687, -2.735124, 0, 1, 0.4588235, 1,
-0.2116982, -1.165856, -4.325026, 0, 1, 0.4666667, 1,
-0.2109918, -0.2934907, -3.974634, 0, 1, 0.4705882, 1,
-0.2103098, -1.59642, -3.244184, 0, 1, 0.4784314, 1,
-0.2102031, -0.1670959, -2.331136, 0, 1, 0.4823529, 1,
-0.2049631, 1.265881, 0.2934479, 0, 1, 0.4901961, 1,
-0.2020948, -0.9212292, -1.869526, 0, 1, 0.4941176, 1,
-0.1989594, -0.01787507, -1.850117, 0, 1, 0.5019608, 1,
-0.1951637, 1.650131, 1.487152, 0, 1, 0.509804, 1,
-0.191257, 0.2894472, -0.199486, 0, 1, 0.5137255, 1,
-0.1901207, -0.3044689, -3.391972, 0, 1, 0.5215687, 1,
-0.1899171, -0.1724866, -4.237147, 0, 1, 0.5254902, 1,
-0.187636, -1.410619, -5.161886, 0, 1, 0.5333334, 1,
-0.1852955, 0.6238045, 1.557345, 0, 1, 0.5372549, 1,
-0.1834868, 1.055308, 0.4115384, 0, 1, 0.5450981, 1,
-0.1818213, -0.5879168, -4.254772, 0, 1, 0.5490196, 1,
-0.1709646, 0.4396299, -0.077314, 0, 1, 0.5568628, 1,
-0.170591, -0.6432396, -3.747025, 0, 1, 0.5607843, 1,
-0.1687665, -0.5708368, -2.261592, 0, 1, 0.5686275, 1,
-0.1664095, 1.764751, -1.488895, 0, 1, 0.572549, 1,
-0.1663866, -2.098717, -2.967093, 0, 1, 0.5803922, 1,
-0.1647782, 0.7396297, 0.6206522, 0, 1, 0.5843138, 1,
-0.161757, 0.2451138, 0.3336757, 0, 1, 0.5921569, 1,
-0.160355, 1.853367, -0.1081521, 0, 1, 0.5960785, 1,
-0.1580658, -0.4439188, -3.018899, 0, 1, 0.6039216, 1,
-0.1570499, -0.8513837, -3.858983, 0, 1, 0.6117647, 1,
-0.1552558, 2.635658, -0.9142175, 0, 1, 0.6156863, 1,
-0.1535778, -1.063648, -1.623381, 0, 1, 0.6235294, 1,
-0.1532572, 0.1158692, -0.8545892, 0, 1, 0.627451, 1,
-0.1480261, 0.08620929, -1.116296, 0, 1, 0.6352941, 1,
-0.1433815, 0.8986108, -1.645104, 0, 1, 0.6392157, 1,
-0.1377862, -0.8965071, -2.72525, 0, 1, 0.6470588, 1,
-0.1366287, 0.7618887, -0.6310504, 0, 1, 0.6509804, 1,
-0.1322027, 1.284319, -0.1666962, 0, 1, 0.6588235, 1,
-0.1308255, -0.2439763, -2.941992, 0, 1, 0.6627451, 1,
-0.1298718, 0.221973, -1.653969, 0, 1, 0.6705883, 1,
-0.1255253, -0.9627531, -2.90594, 0, 1, 0.6745098, 1,
-0.1228737, 0.2191056, 0.5515046, 0, 1, 0.682353, 1,
-0.1204094, -0.806906, -3.582371, 0, 1, 0.6862745, 1,
-0.115451, -1.329358, -4.642335, 0, 1, 0.6941177, 1,
-0.113892, -0.5695167, -2.657496, 0, 1, 0.7019608, 1,
-0.1111375, 0.3255395, 0.1980136, 0, 1, 0.7058824, 1,
-0.1108604, 1.813429, 2.644136, 0, 1, 0.7137255, 1,
-0.09730161, -0.1153885, -2.308462, 0, 1, 0.7176471, 1,
-0.09640175, 0.656124, 0.4849142, 0, 1, 0.7254902, 1,
-0.0911579, 1.105794, 0.5227107, 0, 1, 0.7294118, 1,
-0.0893454, 1.944901, -1.472104, 0, 1, 0.7372549, 1,
-0.08730774, 1.969365, -0.6237434, 0, 1, 0.7411765, 1,
-0.08631799, 1.235132, 0.9478926, 0, 1, 0.7490196, 1,
-0.07671525, -1.572243, -2.986679, 0, 1, 0.7529412, 1,
-0.07633592, 1.379113, 0.2073031, 0, 1, 0.7607843, 1,
-0.07473392, 0.939504, -1.960112, 0, 1, 0.7647059, 1,
-0.07326376, 0.05143706, -3.355222, 0, 1, 0.772549, 1,
-0.06207918, 0.07233666, 0.2906143, 0, 1, 0.7764706, 1,
-0.05891605, 0.2911932, 2.15016, 0, 1, 0.7843137, 1,
-0.05845923, 0.1944374, 0.5760921, 0, 1, 0.7882353, 1,
-0.05661794, 0.5875388, 0.2346715, 0, 1, 0.7960784, 1,
-0.05641681, -0.5020689, -3.48636, 0, 1, 0.8039216, 1,
-0.05298472, 0.4694458, 0.7405078, 0, 1, 0.8078431, 1,
-0.04885155, -0.1228091, -2.236676, 0, 1, 0.8156863, 1,
-0.04514358, -0.3384084, -2.740976, 0, 1, 0.8196079, 1,
-0.04175434, -0.7807838, -3.075588, 0, 1, 0.827451, 1,
-0.04054613, 1.2544, -0.6099334, 0, 1, 0.8313726, 1,
-0.03892817, -0.1565882, -2.352576, 0, 1, 0.8392157, 1,
-0.03821265, 1.20209, 0.003572581, 0, 1, 0.8431373, 1,
-0.03232358, 1.360206, -0.07264089, 0, 1, 0.8509804, 1,
-0.02854717, 0.6633098, -0.9667359, 0, 1, 0.854902, 1,
-0.02730745, 0.4077099, -1.214077, 0, 1, 0.8627451, 1,
-0.02652826, -1.963906, -1.863615, 0, 1, 0.8666667, 1,
-0.02551585, 0.2402177, 0.5654661, 0, 1, 0.8745098, 1,
-0.02518824, 0.01904158, -1.437735, 0, 1, 0.8784314, 1,
-0.02499569, 0.2159369, 1.6816, 0, 1, 0.8862745, 1,
-0.02481556, -0.3017221, -3.672337, 0, 1, 0.8901961, 1,
-0.02255976, -0.9079734, -1.977861, 0, 1, 0.8980392, 1,
-0.0191076, -1.443603, -3.550177, 0, 1, 0.9058824, 1,
-0.01826061, -0.4822652, -2.552788, 0, 1, 0.9098039, 1,
-0.01616367, 1.166187, 0.6266363, 0, 1, 0.9176471, 1,
-0.01425643, 0.2564978, -0.5729731, 0, 1, 0.9215686, 1,
-0.01095034, -0.7580535, -3.682922, 0, 1, 0.9294118, 1,
-0.01073908, -0.3744394, -5.928512, 0, 1, 0.9333333, 1,
-0.0101389, -0.3695144, -1.310259, 0, 1, 0.9411765, 1,
-0.00235235, -0.2838945, -2.345824, 0, 1, 0.945098, 1,
-0.001799314, 0.3170701, 0.2918677, 0, 1, 0.9529412, 1,
-0.001068959, -0.316356, -2.942815, 0, 1, 0.9568627, 1,
0.0003140982, -0.5867801, 2.464834, 0, 1, 0.9647059, 1,
0.000459624, -1.393199, 2.995501, 0, 1, 0.9686275, 1,
0.003465873, 0.659964, -1.413804, 0, 1, 0.9764706, 1,
0.00893522, 0.5559559, -0.2159348, 0, 1, 0.9803922, 1,
0.01070276, 0.3437513, -2.010048, 0, 1, 0.9882353, 1,
0.0127045, -1.203272, 3.013923, 0, 1, 0.9921569, 1,
0.01281892, 1.619121, 0.4699316, 0, 1, 1, 1,
0.01324729, -0.6189661, 2.876554, 0, 0.9921569, 1, 1,
0.01522624, 0.2214448, -0.5009632, 0, 0.9882353, 1, 1,
0.01751495, -0.3744977, 3.544062, 0, 0.9803922, 1, 1,
0.01840576, 0.8512613, 0.8392658, 0, 0.9764706, 1, 1,
0.01873871, -0.5667079, 5.522849, 0, 0.9686275, 1, 1,
0.02181912, 0.776378, 0.7256577, 0, 0.9647059, 1, 1,
0.02187488, -0.3241467, 2.615711, 0, 0.9568627, 1, 1,
0.02233586, -1.558041, 4.694705, 0, 0.9529412, 1, 1,
0.0289819, -0.2567816, 3.562801, 0, 0.945098, 1, 1,
0.02942565, -1.234054, 2.452854, 0, 0.9411765, 1, 1,
0.03243391, -0.5363889, 3.549222, 0, 0.9333333, 1, 1,
0.03725084, -1.42733, 2.889892, 0, 0.9294118, 1, 1,
0.0375228, -2.233556, 4.571483, 0, 0.9215686, 1, 1,
0.03874676, 1.07932, -1.75123, 0, 0.9176471, 1, 1,
0.04475366, 0.02951463, 0.9462218, 0, 0.9098039, 1, 1,
0.04570208, -0.05386087, 3.242881, 0, 0.9058824, 1, 1,
0.05288522, 0.7940845, 0.6223788, 0, 0.8980392, 1, 1,
0.05330393, -0.7623423, 3.945848, 0, 0.8901961, 1, 1,
0.05347227, -0.5422677, 3.771878, 0, 0.8862745, 1, 1,
0.05379899, -0.6099162, 4.097277, 0, 0.8784314, 1, 1,
0.05477852, 1.57698, -0.3978898, 0, 0.8745098, 1, 1,
0.0548305, 0.7300733, 1.061469, 0, 0.8666667, 1, 1,
0.05775734, -0.7449671, 4.339024, 0, 0.8627451, 1, 1,
0.06015451, 0.09692649, 0.8874692, 0, 0.854902, 1, 1,
0.06291444, 1.133358, 0.2537372, 0, 0.8509804, 1, 1,
0.06356759, -0.7520217, 1.628206, 0, 0.8431373, 1, 1,
0.06420931, 1.124889, 2.883452, 0, 0.8392157, 1, 1,
0.06493859, -0.3880977, 1.685466, 0, 0.8313726, 1, 1,
0.06692757, 0.1256137, -2.031811, 0, 0.827451, 1, 1,
0.07001428, 0.3630022, 2.062973, 0, 0.8196079, 1, 1,
0.07012532, 1.243827, 1.539719, 0, 0.8156863, 1, 1,
0.07025207, 0.5957599, 1.078502, 0, 0.8078431, 1, 1,
0.07160858, -1.177253, 3.471301, 0, 0.8039216, 1, 1,
0.07771056, -1.024782, 4.158067, 0, 0.7960784, 1, 1,
0.07864377, -2.061365, 2.552229, 0, 0.7882353, 1, 1,
0.07991077, 0.1930902, 0.9219233, 0, 0.7843137, 1, 1,
0.08156912, 0.3899544, 0.9699526, 0, 0.7764706, 1, 1,
0.08566599, -1.615733, 2.180725, 0, 0.772549, 1, 1,
0.08804446, 0.4317921, 1.522221, 0, 0.7647059, 1, 1,
0.09266032, -0.7876751, 3.753555, 0, 0.7607843, 1, 1,
0.09489746, 1.113671, -0.9928846, 0, 0.7529412, 1, 1,
0.09967837, -1.106491, 5.026062, 0, 0.7490196, 1, 1,
0.1039785, 0.3520178, 0.6035758, 0, 0.7411765, 1, 1,
0.1067593, 1.871074, 0.4360087, 0, 0.7372549, 1, 1,
0.1098918, -1.110398, 2.261317, 0, 0.7294118, 1, 1,
0.1104296, 0.9308113, -1.291306, 0, 0.7254902, 1, 1,
0.1125928, -0.3195894, 3.303746, 0, 0.7176471, 1, 1,
0.1225649, 0.890793, -0.6653244, 0, 0.7137255, 1, 1,
0.1233222, 0.7178562, 1.191622, 0, 0.7058824, 1, 1,
0.1245438, 0.8897629, 1.401445, 0, 0.6980392, 1, 1,
0.1267567, 0.6121494, -0.3650597, 0, 0.6941177, 1, 1,
0.1294076, -0.07872334, 1.851992, 0, 0.6862745, 1, 1,
0.1322984, 0.1160173, 1.112745, 0, 0.682353, 1, 1,
0.1354867, -0.3314995, 2.874105, 0, 0.6745098, 1, 1,
0.1376732, -0.5705763, 1.936679, 0, 0.6705883, 1, 1,
0.1407416, -0.4853977, 1.282184, 0, 0.6627451, 1, 1,
0.1409111, -0.3627822, 4.055907, 0, 0.6588235, 1, 1,
0.1443759, -1.8932, 2.966369, 0, 0.6509804, 1, 1,
0.1447114, -2.132951, 2.758141, 0, 0.6470588, 1, 1,
0.1491214, 1.183672, 1.377621, 0, 0.6392157, 1, 1,
0.1526363, 0.6697649, -1.025183, 0, 0.6352941, 1, 1,
0.1527258, 1.310249, 1.952435, 0, 0.627451, 1, 1,
0.1561648, -1.421426, 3.856259, 0, 0.6235294, 1, 1,
0.1574269, -0.6174312, 4.704669, 0, 0.6156863, 1, 1,
0.1619312, -0.3745022, 2.314988, 0, 0.6117647, 1, 1,
0.1673428, 2.416522, -0.4134317, 0, 0.6039216, 1, 1,
0.1675701, 0.762872, 0.2936542, 0, 0.5960785, 1, 1,
0.1738381, -0.2307258, 3.548643, 0, 0.5921569, 1, 1,
0.1763697, 0.09646947, 0.7853183, 0, 0.5843138, 1, 1,
0.1766516, -0.4808365, 1.794638, 0, 0.5803922, 1, 1,
0.1780436, -0.9080136, 2.631871, 0, 0.572549, 1, 1,
0.1802016, 0.4531897, -1.097134, 0, 0.5686275, 1, 1,
0.1840624, 1.626985, 1.297467, 0, 0.5607843, 1, 1,
0.1863944, -0.3363762, 4.434737, 0, 0.5568628, 1, 1,
0.1869105, 1.19681, 1.125244, 0, 0.5490196, 1, 1,
0.1888014, -0.7700993, 2.213992, 0, 0.5450981, 1, 1,
0.1905293, 0.7717099, 0.7248583, 0, 0.5372549, 1, 1,
0.1927756, 1.975771, -0.5616627, 0, 0.5333334, 1, 1,
0.1940945, 0.949662, -0.8447213, 0, 0.5254902, 1, 1,
0.1947142, -0.8885112, 4.075476, 0, 0.5215687, 1, 1,
0.1951701, 1.413826, 0.08248616, 0, 0.5137255, 1, 1,
0.1971005, -1.338959, 3.815478, 0, 0.509804, 1, 1,
0.1977286, -1.295365, 4.689968, 0, 0.5019608, 1, 1,
0.1988218, -0.5130574, 3.449912, 0, 0.4941176, 1, 1,
0.1990758, 1.646127, 0.3476462, 0, 0.4901961, 1, 1,
0.2014776, -0.7667035, 4.222563, 0, 0.4823529, 1, 1,
0.2051601, -0.2952855, 1.654642, 0, 0.4784314, 1, 1,
0.210166, 0.8059729, 0.8138184, 0, 0.4705882, 1, 1,
0.2124098, -0.3496256, 3.538093, 0, 0.4666667, 1, 1,
0.2149439, 0.8727589, -1.130614, 0, 0.4588235, 1, 1,
0.217763, -0.2975922, 3.477074, 0, 0.454902, 1, 1,
0.2202642, -1.471776, 4.125027, 0, 0.4470588, 1, 1,
0.2218062, 1.246081, 0.8918321, 0, 0.4431373, 1, 1,
0.2222499, -0.7946818, 2.541295, 0, 0.4352941, 1, 1,
0.2237125, -1.959597, 3.859789, 0, 0.4313726, 1, 1,
0.2283299, 0.7521952, 0.733362, 0, 0.4235294, 1, 1,
0.2292923, -0.4380123, 2.726676, 0, 0.4196078, 1, 1,
0.2300621, 0.8511303, 1.159078, 0, 0.4117647, 1, 1,
0.2403241, 0.07556617, 2.548118, 0, 0.4078431, 1, 1,
0.2431599, 1.54013, 0.3182103, 0, 0.4, 1, 1,
0.2465721, -1.08605, 2.46356, 0, 0.3921569, 1, 1,
0.2474164, -0.08063612, 0.8146595, 0, 0.3882353, 1, 1,
0.2529745, 0.8554797, -0.04126124, 0, 0.3803922, 1, 1,
0.2534008, 0.1811285, 0.933279, 0, 0.3764706, 1, 1,
0.2616799, -1.21722, 4.935426, 0, 0.3686275, 1, 1,
0.2665592, -0.0141003, 2.363897, 0, 0.3647059, 1, 1,
0.2741893, -0.8330792, 4.141008, 0, 0.3568628, 1, 1,
0.2758565, 0.511861, 1.314913, 0, 0.3529412, 1, 1,
0.2818176, 0.5583922, -1.247528, 0, 0.345098, 1, 1,
0.2821588, -2.057757, 4.21822, 0, 0.3411765, 1, 1,
0.283808, -1.049113, 2.040149, 0, 0.3333333, 1, 1,
0.2852798, -0.1945336, 2.550877, 0, 0.3294118, 1, 1,
0.285684, 0.574654, 0.3922751, 0, 0.3215686, 1, 1,
0.2878173, -0.9407052, 1.457679, 0, 0.3176471, 1, 1,
0.2884552, 0.4702243, 2.069406, 0, 0.3098039, 1, 1,
0.3004416, -1.742131, 2.811011, 0, 0.3058824, 1, 1,
0.3050631, -0.7443677, 2.993625, 0, 0.2980392, 1, 1,
0.3055274, -2.699131, 3.153769, 0, 0.2901961, 1, 1,
0.306218, 0.06057838, 1.129505, 0, 0.2862745, 1, 1,
0.3067917, -0.7878475, 2.838793, 0, 0.2784314, 1, 1,
0.3073162, 0.4346517, 0.6841938, 0, 0.2745098, 1, 1,
0.3082147, 0.2445678, 1.81593, 0, 0.2666667, 1, 1,
0.3127283, -0.04590772, 3.294258, 0, 0.2627451, 1, 1,
0.313927, -0.5894796, 1.998945, 0, 0.254902, 1, 1,
0.3142163, 0.2147888, -0.9708275, 0, 0.2509804, 1, 1,
0.3157411, -0.9209274, 1.636825, 0, 0.2431373, 1, 1,
0.3288862, -0.9291135, 2.687167, 0, 0.2392157, 1, 1,
0.3295665, -0.06936628, 1.964067, 0, 0.2313726, 1, 1,
0.33331, 0.9596863, -0.1222001, 0, 0.227451, 1, 1,
0.3349719, 0.833831, 1.375547, 0, 0.2196078, 1, 1,
0.3368171, 0.02050405, 0.9640241, 0, 0.2156863, 1, 1,
0.3371468, 0.5347528, -0.8479251, 0, 0.2078431, 1, 1,
0.347397, -0.4244057, 3.459856, 0, 0.2039216, 1, 1,
0.3480815, 0.1175872, 2.152036, 0, 0.1960784, 1, 1,
0.3500217, 0.5542585, 0.07005416, 0, 0.1882353, 1, 1,
0.3529311, -1.612845, 5.24382, 0, 0.1843137, 1, 1,
0.357326, -0.3349888, 2.735933, 0, 0.1764706, 1, 1,
0.357947, 0.4789155, 0.6791263, 0, 0.172549, 1, 1,
0.3593891, -0.8329591, 1.846535, 0, 0.1647059, 1, 1,
0.3596856, -1.909834, 3.077764, 0, 0.1607843, 1, 1,
0.3601191, 0.711395, 0.5866114, 0, 0.1529412, 1, 1,
0.365413, 0.08737858, 0.643818, 0, 0.1490196, 1, 1,
0.3775408, 0.5727299, 1.107473, 0, 0.1411765, 1, 1,
0.3795044, 0.04108418, 2.470839, 0, 0.1372549, 1, 1,
0.3861705, -0.4249965, 1.73934, 0, 0.1294118, 1, 1,
0.3887652, -0.01008349, 3.249317, 0, 0.1254902, 1, 1,
0.3907376, -0.4798143, 0.8185221, 0, 0.1176471, 1, 1,
0.3950029, -0.06601078, 1.125367, 0, 0.1137255, 1, 1,
0.3954049, 0.9116712, 1.351541, 0, 0.1058824, 1, 1,
0.3966888, 1.441957, 1.610095, 0, 0.09803922, 1, 1,
0.3980145, -0.1716396, 2.783068, 0, 0.09411765, 1, 1,
0.4000919, 1.115142, 0.9569136, 0, 0.08627451, 1, 1,
0.4007061, 0.6629431, -0.7716273, 0, 0.08235294, 1, 1,
0.4029034, -0.7267274, 1.646653, 0, 0.07450981, 1, 1,
0.4059474, 0.5341936, -0.1499746, 0, 0.07058824, 1, 1,
0.4099017, -0.06743278, 1.464022, 0, 0.0627451, 1, 1,
0.4204727, -0.6383796, 2.841443, 0, 0.05882353, 1, 1,
0.4237108, -2.486789, 2.579555, 0, 0.05098039, 1, 1,
0.4250724, 0.9727902, 2.138772, 0, 0.04705882, 1, 1,
0.429027, -0.398176, 2.153095, 0, 0.03921569, 1, 1,
0.4297422, 1.011153, 0.6238974, 0, 0.03529412, 1, 1,
0.433311, -0.8624745, 1.454627, 0, 0.02745098, 1, 1,
0.4348859, 0.3286417, 2.293549, 0, 0.02352941, 1, 1,
0.4438114, -1.468995, 1.555313, 0, 0.01568628, 1, 1,
0.4476201, 0.7086471, 1.171364, 0, 0.01176471, 1, 1,
0.4491203, -0.1226022, 2.10712, 0, 0.003921569, 1, 1,
0.456385, -0.716632, 2.679773, 0.003921569, 0, 1, 1,
0.4588167, -1.066457, 2.455117, 0.007843138, 0, 1, 1,
0.4620792, -0.4952861, 2.84451, 0.01568628, 0, 1, 1,
0.4646289, -1.2512, 0.8532832, 0.01960784, 0, 1, 1,
0.4658833, -1.526752, 3.156554, 0.02745098, 0, 1, 1,
0.4686813, 0.4135423, 2.760839, 0.03137255, 0, 1, 1,
0.475731, 0.9828333, -0.3040116, 0.03921569, 0, 1, 1,
0.476354, -0.9701002, 1.572392, 0.04313726, 0, 1, 1,
0.4785615, 0.08201441, 0.4635988, 0.05098039, 0, 1, 1,
0.4830239, -0.6543081, 1.412868, 0.05490196, 0, 1, 1,
0.4872051, 2.063811, 0.7896891, 0.0627451, 0, 1, 1,
0.4908462, -2.573116, 3.420534, 0.06666667, 0, 1, 1,
0.4942879, 0.5180296, -1.08124, 0.07450981, 0, 1, 1,
0.4964017, -1.662358, 1.781433, 0.07843138, 0, 1, 1,
0.5012042, 1.389482, -0.136736, 0.08627451, 0, 1, 1,
0.5020326, 1.004439, 1.521783, 0.09019608, 0, 1, 1,
0.505834, -0.2704267, 1.522851, 0.09803922, 0, 1, 1,
0.5131282, -0.1225024, 3.383503, 0.1058824, 0, 1, 1,
0.5283929, -1.17395, 1.949027, 0.1098039, 0, 1, 1,
0.5296724, 0.2729419, 2.294736, 0.1176471, 0, 1, 1,
0.5320426, 0.4652127, 1.111178, 0.1215686, 0, 1, 1,
0.5330303, -0.01690459, 2.551277, 0.1294118, 0, 1, 1,
0.5336162, -0.1695476, 1.410149, 0.1333333, 0, 1, 1,
0.5367392, 1.725253, 1.615229, 0.1411765, 0, 1, 1,
0.5374863, 0.4222231, 0.755114, 0.145098, 0, 1, 1,
0.540813, -0.6530364, 3.014604, 0.1529412, 0, 1, 1,
0.543461, -0.4746004, 3.270356, 0.1568628, 0, 1, 1,
0.5441885, 1.21598, 0.2659346, 0.1647059, 0, 1, 1,
0.5477987, 0.1489268, 1.155537, 0.1686275, 0, 1, 1,
0.5492066, -0.1815848, 2.236588, 0.1764706, 0, 1, 1,
0.5496285, -1.208243, 3.973993, 0.1803922, 0, 1, 1,
0.5500079, -0.7854638, 2.211311, 0.1882353, 0, 1, 1,
0.552651, 0.3038645, 0.9580261, 0.1921569, 0, 1, 1,
0.5564112, 2.111642, 0.6911514, 0.2, 0, 1, 1,
0.5566918, 0.195557, 1.325892, 0.2078431, 0, 1, 1,
0.5567347, 1.666469, -0.5628902, 0.2117647, 0, 1, 1,
0.5657594, -1.01338, 1.547956, 0.2196078, 0, 1, 1,
0.5663527, 1.023401, 1.922529, 0.2235294, 0, 1, 1,
0.5667169, -0.5167648, 2.699693, 0.2313726, 0, 1, 1,
0.5672204, 1.595617, 0.8312998, 0.2352941, 0, 1, 1,
0.5728089, 0.2993125, 2.072764, 0.2431373, 0, 1, 1,
0.5740814, 1.228904, 1.064967, 0.2470588, 0, 1, 1,
0.5807044, 1.191784, -0.2338889, 0.254902, 0, 1, 1,
0.5857745, 0.5402046, 0.3429221, 0.2588235, 0, 1, 1,
0.5888208, 0.664663, 2.575454, 0.2666667, 0, 1, 1,
0.5915917, -0.5055777, 1.314726, 0.2705882, 0, 1, 1,
0.5916328, 2.65065, 1.756286, 0.2784314, 0, 1, 1,
0.5967683, 0.3165181, 0.963087, 0.282353, 0, 1, 1,
0.6005327, 0.6435621, -1.172934, 0.2901961, 0, 1, 1,
0.604095, -0.6892369, 1.482309, 0.2941177, 0, 1, 1,
0.6091968, -0.65835, 2.613282, 0.3019608, 0, 1, 1,
0.6189829, -1.029367, 3.553082, 0.3098039, 0, 1, 1,
0.6193582, 1.048259, -0.8044872, 0.3137255, 0, 1, 1,
0.6203947, 0.09717797, -0.2486142, 0.3215686, 0, 1, 1,
0.6220932, -0.08172291, 2.005123, 0.3254902, 0, 1, 1,
0.6240906, 1.20439, 1.49621, 0.3333333, 0, 1, 1,
0.6281205, -0.5290406, 4.687231, 0.3372549, 0, 1, 1,
0.633352, -1.769811, 1.403041, 0.345098, 0, 1, 1,
0.6341469, -0.8509405, 3.740245, 0.3490196, 0, 1, 1,
0.6350764, 1.131655, 0.3886881, 0.3568628, 0, 1, 1,
0.6364815, 1.208823, -0.4825205, 0.3607843, 0, 1, 1,
0.6392359, -1.218514, 1.94575, 0.3686275, 0, 1, 1,
0.6406184, 0.5620363, 0.958476, 0.372549, 0, 1, 1,
0.6420736, 1.289681, 0.4825701, 0.3803922, 0, 1, 1,
0.6420909, 0.7863867, 0.4209037, 0.3843137, 0, 1, 1,
0.6504628, 1.960298, 2.469071, 0.3921569, 0, 1, 1,
0.6547685, 0.05955838, 0.0392269, 0.3960784, 0, 1, 1,
0.6555783, -0.5973423, 1.524545, 0.4039216, 0, 1, 1,
0.6656955, -1.367997, 3.949625, 0.4117647, 0, 1, 1,
0.6682817, 1.250821, 1.015345, 0.4156863, 0, 1, 1,
0.6696607, -0.9373886, 1.598054, 0.4235294, 0, 1, 1,
0.6706951, -1.526753, 2.886796, 0.427451, 0, 1, 1,
0.6734119, 0.1152333, 0.04827874, 0.4352941, 0, 1, 1,
0.6756209, 2.058092, -1.622431, 0.4392157, 0, 1, 1,
0.6770526, -0.3184792, 2.11541, 0.4470588, 0, 1, 1,
0.6802205, 2.342401, -0.0265465, 0.4509804, 0, 1, 1,
0.6856413, 1.406431, -0.3950006, 0.4588235, 0, 1, 1,
0.6860248, 0.1507502, 0.8985682, 0.4627451, 0, 1, 1,
0.6873638, -1.350794, 1.556754, 0.4705882, 0, 1, 1,
0.6883879, -0.4143429, 0.2925165, 0.4745098, 0, 1, 1,
0.6892872, -0.4051841, 0.268634, 0.4823529, 0, 1, 1,
0.6905565, -0.008015315, 0.9896544, 0.4862745, 0, 1, 1,
0.6960831, -0.07169783, 1.296321, 0.4941176, 0, 1, 1,
0.6965249, -0.2459446, 3.271822, 0.5019608, 0, 1, 1,
0.7020839, 1.263686, 2.522756, 0.5058824, 0, 1, 1,
0.7062044, -0.1683445, 0.3921986, 0.5137255, 0, 1, 1,
0.720943, -0.1446277, 2.741454, 0.5176471, 0, 1, 1,
0.722997, -0.7762249, 1.810683, 0.5254902, 0, 1, 1,
0.7243893, -1.24667, 3.876426, 0.5294118, 0, 1, 1,
0.7251132, 0.3414786, 0.4579003, 0.5372549, 0, 1, 1,
0.7327355, -0.2415105, 1.01159, 0.5411765, 0, 1, 1,
0.7347537, -1.286437, 1.41245, 0.5490196, 0, 1, 1,
0.7379081, -0.4371581, 2.373712, 0.5529412, 0, 1, 1,
0.742113, -1.286994, 2.931417, 0.5607843, 0, 1, 1,
0.7439919, 0.05741386, 1.884411, 0.5647059, 0, 1, 1,
0.7533805, 1.915322, -0.50692, 0.572549, 0, 1, 1,
0.7536244, -0.3109682, 0.7987457, 0.5764706, 0, 1, 1,
0.7542894, 1.08866, 0.1798745, 0.5843138, 0, 1, 1,
0.7582907, 1.051747, -0.1837165, 0.5882353, 0, 1, 1,
0.7603466, 0.3257524, 0.2529266, 0.5960785, 0, 1, 1,
0.7629262, 2.30642, -1.042202, 0.6039216, 0, 1, 1,
0.7631049, 0.8883946, 1.982127, 0.6078432, 0, 1, 1,
0.7669975, 0.4216042, 2.335544, 0.6156863, 0, 1, 1,
0.7715037, 0.6762092, 1.308881, 0.6196079, 0, 1, 1,
0.7779504, -1.679572, 3.404525, 0.627451, 0, 1, 1,
0.7781101, -0.02639577, 0.4042135, 0.6313726, 0, 1, 1,
0.7827933, 0.0845378, 2.313805, 0.6392157, 0, 1, 1,
0.785231, -0.7059427, 1.734549, 0.6431373, 0, 1, 1,
0.7861525, 0.3828758, -0.01548594, 0.6509804, 0, 1, 1,
0.78946, -1.483771, 4.427572, 0.654902, 0, 1, 1,
0.7902696, -0.9033455, 2.269249, 0.6627451, 0, 1, 1,
0.7905919, 1.634747, 1.059609, 0.6666667, 0, 1, 1,
0.7906596, 0.5457873, 0.9919037, 0.6745098, 0, 1, 1,
0.7924339, -0.5296725, 1.787962, 0.6784314, 0, 1, 1,
0.7990691, -1.103662, 5.626533, 0.6862745, 0, 1, 1,
0.8083611, 1.194893, -0.05780678, 0.6901961, 0, 1, 1,
0.8086194, -0.0531713, 1.502686, 0.6980392, 0, 1, 1,
0.8180383, -1.898633, 3.949966, 0.7058824, 0, 1, 1,
0.8246989, -0.6998693, 1.508075, 0.7098039, 0, 1, 1,
0.8265355, 0.8497361, 2.027748, 0.7176471, 0, 1, 1,
0.8316702, 0.148175, 2.356002, 0.7215686, 0, 1, 1,
0.8318222, 0.1708014, 1.252402, 0.7294118, 0, 1, 1,
0.8378735, -0.4956296, 0.703476, 0.7333333, 0, 1, 1,
0.8430638, 1.150013, 0.6195817, 0.7411765, 0, 1, 1,
0.8496372, -0.04791068, 1.505357, 0.7450981, 0, 1, 1,
0.8538644, 0.4338359, 1.589143, 0.7529412, 0, 1, 1,
0.8547778, -0.6432969, 2.304035, 0.7568628, 0, 1, 1,
0.8606586, -1.641666, 1.642559, 0.7647059, 0, 1, 1,
0.8611727, -1.515475, 4.419408, 0.7686275, 0, 1, 1,
0.8631325, -0.195888, 1.783731, 0.7764706, 0, 1, 1,
0.8758914, 1.430619, -2.047207, 0.7803922, 0, 1, 1,
0.8792984, 0.6772283, -0.2749437, 0.7882353, 0, 1, 1,
0.8794787, -0.03684815, 2.240929, 0.7921569, 0, 1, 1,
0.8824842, -0.01453218, 1.523628, 0.8, 0, 1, 1,
0.8837815, 0.2360003, -0.04910899, 0.8078431, 0, 1, 1,
0.8840398, 1.760609, -0.4017028, 0.8117647, 0, 1, 1,
0.9047318, -0.5724954, 2.739544, 0.8196079, 0, 1, 1,
0.90576, 0.6344581, 1.94268, 0.8235294, 0, 1, 1,
0.9093326, 0.008856114, 1.017122, 0.8313726, 0, 1, 1,
0.9113353, -1.445871, 2.260962, 0.8352941, 0, 1, 1,
0.9114152, 2.791866, 0.2116484, 0.8431373, 0, 1, 1,
0.911702, -0.6137105, 0.5916826, 0.8470588, 0, 1, 1,
0.93585, 2.946854, 1.650495, 0.854902, 0, 1, 1,
0.9374722, 1.490455, 0.1668896, 0.8588235, 0, 1, 1,
0.9416826, -0.2037208, 1.149185, 0.8666667, 0, 1, 1,
0.9475984, -0.6803528, 1.062735, 0.8705882, 0, 1, 1,
0.9499753, 0.6424307, 2.431331, 0.8784314, 0, 1, 1,
0.9567159, -0.2413666, 1.836269, 0.8823529, 0, 1, 1,
0.9572386, -0.1236181, 1.118017, 0.8901961, 0, 1, 1,
0.9611881, 0.3244396, 1.133907, 0.8941177, 0, 1, 1,
0.9621011, -2.56044, 1.284853, 0.9019608, 0, 1, 1,
0.964569, -0.8655307, 1.109607, 0.9098039, 0, 1, 1,
0.9651678, 0.8989121, 0.9020593, 0.9137255, 0, 1, 1,
0.9708532, -0.4680943, 0.8529624, 0.9215686, 0, 1, 1,
0.973923, 0.4564584, 0.1073595, 0.9254902, 0, 1, 1,
0.9811041, -0.4282363, 2.21676, 0.9333333, 0, 1, 1,
0.9823064, -0.617098, 2.57936, 0.9372549, 0, 1, 1,
0.9831897, 0.01592135, 1.772702, 0.945098, 0, 1, 1,
0.9854679, -1.094979, 3.462049, 0.9490196, 0, 1, 1,
0.9859931, -0.4359207, 2.463147, 0.9568627, 0, 1, 1,
0.9867719, 0.9395884, 0.2958204, 0.9607843, 0, 1, 1,
0.9871955, 1.381756, 0.8962239, 0.9686275, 0, 1, 1,
0.9915783, 0.09328437, -0.5722559, 0.972549, 0, 1, 1,
0.9944395, -2.324765, 3.168544, 0.9803922, 0, 1, 1,
0.9993594, 2.191821, 0.1002853, 0.9843137, 0, 1, 1,
1.001594, 0.02148163, 2.668975, 0.9921569, 0, 1, 1,
1.002325, 0.3791164, -1.152736, 0.9960784, 0, 1, 1,
1.004135, 0.5537559, 1.801392, 1, 0, 0.9960784, 1,
1.006705, -0.6260725, 2.815939, 1, 0, 0.9882353, 1,
1.015708, 0.6577338, 2.020637, 1, 0, 0.9843137, 1,
1.023894, 0.4429968, 0.6188889, 1, 0, 0.9764706, 1,
1.025645, -0.5957982, 1.853542, 1, 0, 0.972549, 1,
1.031445, 1.270995, 0.3367989, 1, 0, 0.9647059, 1,
1.035516, 0.241932, 1.690406, 1, 0, 0.9607843, 1,
1.037251, -0.4194663, 1.563335, 1, 0, 0.9529412, 1,
1.042514, -0.6930425, -0.2417892, 1, 0, 0.9490196, 1,
1.043847, 0.4133004, 2.251382, 1, 0, 0.9411765, 1,
1.044717, 0.781699, -0.2286714, 1, 0, 0.9372549, 1,
1.045335, 0.04062607, 1.569387, 1, 0, 0.9294118, 1,
1.055664, 0.4503644, 3.084108, 1, 0, 0.9254902, 1,
1.062763, -1.381446, 1.613103, 1, 0, 0.9176471, 1,
1.067909, 1.125697, 1.135706, 1, 0, 0.9137255, 1,
1.070531, -0.04213685, 1.746849, 1, 0, 0.9058824, 1,
1.071833, -0.5500025, 2.405056, 1, 0, 0.9019608, 1,
1.076802, -0.1361576, 2.918047, 1, 0, 0.8941177, 1,
1.080692, 0.4742189, 2.838011, 1, 0, 0.8862745, 1,
1.083718, 0.03221038, 1.889313, 1, 0, 0.8823529, 1,
1.088763, -0.1276378, 1.800822, 1, 0, 0.8745098, 1,
1.092003, 0.4085464, -0.1793425, 1, 0, 0.8705882, 1,
1.099114, -0.1586366, 0.7647325, 1, 0, 0.8627451, 1,
1.099152, -1.160991, 3.83406, 1, 0, 0.8588235, 1,
1.107313, 0.9823948, 0.008036328, 1, 0, 0.8509804, 1,
1.112666, 0.8569455, 2.078348, 1, 0, 0.8470588, 1,
1.117237, -1.035416, 0.8304555, 1, 0, 0.8392157, 1,
1.11726, -0.3509124, 1.212994, 1, 0, 0.8352941, 1,
1.11923, -1.01562, 2.101757, 1, 0, 0.827451, 1,
1.120914, 0.3491383, 1.356174, 1, 0, 0.8235294, 1,
1.124136, -0.390215, 0.7022092, 1, 0, 0.8156863, 1,
1.12432, -1.315423, 2.40544, 1, 0, 0.8117647, 1,
1.128202, -0.8920389, 2.724355, 1, 0, 0.8039216, 1,
1.133534, 0.7491491, 1.966613, 1, 0, 0.7960784, 1,
1.134719, -0.8909631, 0.1338008, 1, 0, 0.7921569, 1,
1.151171, -0.8255211, 1.541216, 1, 0, 0.7843137, 1,
1.155757, -0.5759676, 2.187456, 1, 0, 0.7803922, 1,
1.163932, 0.5789289, 0.8017618, 1, 0, 0.772549, 1,
1.164657, 0.9617905, -0.5186697, 1, 0, 0.7686275, 1,
1.166259, -0.4921687, -0.004511735, 1, 0, 0.7607843, 1,
1.169224, 1.570846, 1.8735, 1, 0, 0.7568628, 1,
1.171778, -0.0191969, 1.665859, 1, 0, 0.7490196, 1,
1.173223, 0.4573846, 0.6140431, 1, 0, 0.7450981, 1,
1.178111, 0.6271832, 1.300413, 1, 0, 0.7372549, 1,
1.185102, 1.08375, 0.332927, 1, 0, 0.7333333, 1,
1.191908, -0.05496892, 2.228801, 1, 0, 0.7254902, 1,
1.200616, 0.7849487, 0.304476, 1, 0, 0.7215686, 1,
1.201754, -0.8477255, 2.325991, 1, 0, 0.7137255, 1,
1.202083, 1.50776, 0.2540418, 1, 0, 0.7098039, 1,
1.202223, 2.37695, 1.01326, 1, 0, 0.7019608, 1,
1.20415, 1.622429, 1.260902, 1, 0, 0.6941177, 1,
1.205308, 1.051356, 0.6234865, 1, 0, 0.6901961, 1,
1.210386, -2.165542, 2.254341, 1, 0, 0.682353, 1,
1.216404, -0.4753332, 2.832455, 1, 0, 0.6784314, 1,
1.218149, 1.353339, -0.2507746, 1, 0, 0.6705883, 1,
1.223918, 0.3365611, -0.5780438, 1, 0, 0.6666667, 1,
1.22421, -1.71278, 3.011994, 1, 0, 0.6588235, 1,
1.231561, -0.1188913, 1.180769, 1, 0, 0.654902, 1,
1.233175, 0.4172465, 0.3831248, 1, 0, 0.6470588, 1,
1.24778, 0.775785, 2.242368, 1, 0, 0.6431373, 1,
1.267133, 0.3853618, 0.3266637, 1, 0, 0.6352941, 1,
1.275536, 1.425273, 1.203086, 1, 0, 0.6313726, 1,
1.277726, 1.080443, 0.4872216, 1, 0, 0.6235294, 1,
1.291842, 0.1819092, -0.6292179, 1, 0, 0.6196079, 1,
1.296883, 0.5907769, 1.63327, 1, 0, 0.6117647, 1,
1.298962, -0.06165865, 2.223721, 1, 0, 0.6078432, 1,
1.301488, 1.58345, 0.6532021, 1, 0, 0.6, 1,
1.304831, -1.571869, 1.033933, 1, 0, 0.5921569, 1,
1.305816, 1.38677, 0.1402922, 1, 0, 0.5882353, 1,
1.315824, 2.051779, 1.304002, 1, 0, 0.5803922, 1,
1.315891, 0.02069345, 1.145648, 1, 0, 0.5764706, 1,
1.31601, 1.330904, 0.9251859, 1, 0, 0.5686275, 1,
1.326097, 0.3072499, 1.665331, 1, 0, 0.5647059, 1,
1.349567, -0.4327306, 4.667745, 1, 0, 0.5568628, 1,
1.349965, 0.6670632, 1.375909, 1, 0, 0.5529412, 1,
1.350626, -0.5461206, 2.345493, 1, 0, 0.5450981, 1,
1.364246, -0.984794, 2.397769, 1, 0, 0.5411765, 1,
1.365429, -0.3375433, 3.588931, 1, 0, 0.5333334, 1,
1.366207, 1.431602, -1.692848, 1, 0, 0.5294118, 1,
1.368901, 0.15079, 2.601816, 1, 0, 0.5215687, 1,
1.37062, 0.05953092, 0.4781125, 1, 0, 0.5176471, 1,
1.394818, -1.071504, 2.260786, 1, 0, 0.509804, 1,
1.397729, -1.514263, 2.181872, 1, 0, 0.5058824, 1,
1.42159, 1.299686, -0.263367, 1, 0, 0.4980392, 1,
1.426518, -0.2254047, 3.110127, 1, 0, 0.4901961, 1,
1.435991, 0.813197, 1.829303, 1, 0, 0.4862745, 1,
1.438067, -1.455983, 2.254268, 1, 0, 0.4784314, 1,
1.449762, -1.280208, 1.255728, 1, 0, 0.4745098, 1,
1.455358, 2.123547, -0.00149532, 1, 0, 0.4666667, 1,
1.456006, -1.061918, 2.063767, 1, 0, 0.4627451, 1,
1.461777, 0.08510487, 2.179039, 1, 0, 0.454902, 1,
1.463255, 0.4274532, 1.746507, 1, 0, 0.4509804, 1,
1.470296, 0.4426531, 0.5120068, 1, 0, 0.4431373, 1,
1.476671, -0.6910292, 2.20435, 1, 0, 0.4392157, 1,
1.478132, -0.5964773, 1.84038, 1, 0, 0.4313726, 1,
1.48885, -1.812097, 3.051642, 1, 0, 0.427451, 1,
1.491191, 2.28831, 2.757772, 1, 0, 0.4196078, 1,
1.501388, -2.222776, 2.529344, 1, 0, 0.4156863, 1,
1.512081, 1.942622, 0.3307659, 1, 0, 0.4078431, 1,
1.515812, 0.7768565, 0.07006514, 1, 0, 0.4039216, 1,
1.520874, 1.285159, 1.423413, 1, 0, 0.3960784, 1,
1.533567, 1.256885, 2.508068, 1, 0, 0.3882353, 1,
1.543895, -0.5982772, 1.229216, 1, 0, 0.3843137, 1,
1.547904, 1.818714, -2.239855, 1, 0, 0.3764706, 1,
1.555445, -0.6090635, 2.386286, 1, 0, 0.372549, 1,
1.569469, -1.441329, 1.653639, 1, 0, 0.3647059, 1,
1.581565, -1.825469, 3.458548, 1, 0, 0.3607843, 1,
1.585615, -1.083526, 3.255314, 1, 0, 0.3529412, 1,
1.591683, -1.211993, 3.290221, 1, 0, 0.3490196, 1,
1.5936, -0.6360313, 1.80652, 1, 0, 0.3411765, 1,
1.598089, -1.261242, 2.569175, 1, 0, 0.3372549, 1,
1.604153, -0.6959893, 0.9526461, 1, 0, 0.3294118, 1,
1.613158, -0.4023235, 1.882608, 1, 0, 0.3254902, 1,
1.614222, -1.068344, 2.10249, 1, 0, 0.3176471, 1,
1.616478, -0.4245079, -0.1065918, 1, 0, 0.3137255, 1,
1.621612, 2.661482, 1.461178, 1, 0, 0.3058824, 1,
1.654889, 0.1099648, -0.4772686, 1, 0, 0.2980392, 1,
1.671827, -0.3784473, 3.031731, 1, 0, 0.2941177, 1,
1.689274, -1.246733, 2.106681, 1, 0, 0.2862745, 1,
1.690658, 0.4573403, 3.077767, 1, 0, 0.282353, 1,
1.691178, 0.5063809, 0.8835836, 1, 0, 0.2745098, 1,
1.704814, 0.6695024, 1.832667, 1, 0, 0.2705882, 1,
1.719924, 0.8072315, 2.533569, 1, 0, 0.2627451, 1,
1.72079, 1.355336, 1.139802, 1, 0, 0.2588235, 1,
1.73454, 0.8915042, 1.285682, 1, 0, 0.2509804, 1,
1.758051, -0.7842817, 3.740818, 1, 0, 0.2470588, 1,
1.758903, 0.4325397, 2.832769, 1, 0, 0.2392157, 1,
1.764081, 0.08457658, 1.100691, 1, 0, 0.2352941, 1,
1.773769, -0.1396765, 2.737659, 1, 0, 0.227451, 1,
1.810095, 2.297435, -0.1458658, 1, 0, 0.2235294, 1,
1.828954, 0.0641027, 1.315441, 1, 0, 0.2156863, 1,
1.83416, -1.101847, 2.316229, 1, 0, 0.2117647, 1,
1.860806, 0.8349206, 0.5983564, 1, 0, 0.2039216, 1,
1.868193, -1.213433, 0.8907925, 1, 0, 0.1960784, 1,
1.877816, -0.6362504, 2.208469, 1, 0, 0.1921569, 1,
1.904234, -0.3083822, 2.626352, 1, 0, 0.1843137, 1,
1.907928, 1.260551, 1.262316, 1, 0, 0.1803922, 1,
1.91442, 0.6259396, 1.897808, 1, 0, 0.172549, 1,
1.924072, 0.07602572, 2.731477, 1, 0, 0.1686275, 1,
1.963108, -0.4931729, 1.543565, 1, 0, 0.1607843, 1,
1.969255, 0.4804088, 1.274088, 1, 0, 0.1568628, 1,
2.022479, 1.722507, 2.666394, 1, 0, 0.1490196, 1,
2.043238, 0.2710949, 2.594316, 1, 0, 0.145098, 1,
2.053326, -1.514053, 4.019988, 1, 0, 0.1372549, 1,
2.059633, -0.8710144, 2.522305, 1, 0, 0.1333333, 1,
2.071532, -0.1884909, 0.8788975, 1, 0, 0.1254902, 1,
2.086458, 0.6793564, 0.1760443, 1, 0, 0.1215686, 1,
2.161297, 0.2600532, -0.4550855, 1, 0, 0.1137255, 1,
2.178388, -1.408295, 0.9431648, 1, 0, 0.1098039, 1,
2.267952, -1.417045, 1.28958, 1, 0, 0.1019608, 1,
2.324784, -2.50004, 2.641839, 1, 0, 0.09411765, 1,
2.327278, 0.419604, 0.8319709, 1, 0, 0.09019608, 1,
2.368424, -1.978656, 2.182376, 1, 0, 0.08235294, 1,
2.389365, 0.7067158, 1.618087, 1, 0, 0.07843138, 1,
2.391334, -1.330754, 2.026651, 1, 0, 0.07058824, 1,
2.433571, 0.9995724, 0.8704881, 1, 0, 0.06666667, 1,
2.480728, 0.4204138, 1.177389, 1, 0, 0.05882353, 1,
2.563066, -1.968385, 2.269258, 1, 0, 0.05490196, 1,
2.588616, -0.8818532, 1.923994, 1, 0, 0.04705882, 1,
2.608191, -2.917234, 1.664119, 1, 0, 0.04313726, 1,
2.634762, 0.946755, -0.001199806, 1, 0, 0.03529412, 1,
2.782921, 0.2910394, 0.05135112, 1, 0, 0.03137255, 1,
2.785922, -0.2636166, 2.096917, 1, 0, 0.02352941, 1,
2.827656, -0.5589875, 2.798762, 1, 0, 0.01960784, 1,
2.920959, 0.5097368, 1.879228, 1, 0, 0.01176471, 1,
3.042208, 0.645383, 1.206049, 1, 0, 0.007843138, 1
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
-0.1717507, -4.026224, -7.887092, 0, -0.5, 0.5, 0.5,
-0.1717507, -4.026224, -7.887092, 1, -0.5, 0.5, 0.5,
-0.1717507, -4.026224, -7.887092, 1, 1.5, 0.5, 0.5,
-0.1717507, -4.026224, -7.887092, 0, 1.5, 0.5, 0.5
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
-4.475242, -0.03436804, -7.887092, 0, -0.5, 0.5, 0.5,
-4.475242, -0.03436804, -7.887092, 1, -0.5, 0.5, 0.5,
-4.475242, -0.03436804, -7.887092, 1, 1.5, 0.5, 0.5,
-4.475242, -0.03436804, -7.887092, 0, 1.5, 0.5, 0.5
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
-4.475242, -4.026224, -0.1509898, 0, -0.5, 0.5, 0.5,
-4.475242, -4.026224, -0.1509898, 1, -0.5, 0.5, 0.5,
-4.475242, -4.026224, -0.1509898, 1, 1.5, 0.5, 0.5,
-4.475242, -4.026224, -0.1509898, 0, 1.5, 0.5, 0.5
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
-3, -3.105026, -6.101838,
3, -3.105026, -6.101838,
-3, -3.105026, -6.101838,
-3, -3.258559, -6.39938,
-2, -3.105026, -6.101838,
-2, -3.258559, -6.39938,
-1, -3.105026, -6.101838,
-1, -3.258559, -6.39938,
0, -3.105026, -6.101838,
0, -3.258559, -6.39938,
1, -3.105026, -6.101838,
1, -3.258559, -6.39938,
2, -3.105026, -6.101838,
2, -3.258559, -6.39938,
3, -3.105026, -6.101838,
3, -3.258559, -6.39938
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
-3, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
-3, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
-3, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
-2, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
-2, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
-2, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
-2, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
-1, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
-1, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
-1, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
-1, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
0, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
0, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
0, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
0, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
1, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
1, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
1, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
1, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
2, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
2, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
2, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
2, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5,
3, -3.565625, -6.994465, 0, -0.5, 0.5, 0.5,
3, -3.565625, -6.994465, 1, -0.5, 0.5, 0.5,
3, -3.565625, -6.994465, 1, 1.5, 0.5, 0.5,
3, -3.565625, -6.994465, 0, 1.5, 0.5, 0.5
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
-3.482128, -3, -6.101838,
-3.482128, 2, -6.101838,
-3.482128, -3, -6.101838,
-3.647647, -3, -6.39938,
-3.482128, -2, -6.101838,
-3.647647, -2, -6.39938,
-3.482128, -1, -6.101838,
-3.647647, -1, -6.39938,
-3.482128, 0, -6.101838,
-3.647647, 0, -6.39938,
-3.482128, 1, -6.101838,
-3.647647, 1, -6.39938,
-3.482128, 2, -6.101838,
-3.647647, 2, -6.39938
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
"2"
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
-3.978685, -3, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, -3, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, -3, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, -3, -6.994465, 0, 1.5, 0.5, 0.5,
-3.978685, -2, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, -2, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, -2, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, -2, -6.994465, 0, 1.5, 0.5, 0.5,
-3.978685, -1, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, -1, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, -1, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, -1, -6.994465, 0, 1.5, 0.5, 0.5,
-3.978685, 0, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, 0, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, 0, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, 0, -6.994465, 0, 1.5, 0.5, 0.5,
-3.978685, 1, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, 1, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, 1, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, 1, -6.994465, 0, 1.5, 0.5, 0.5,
-3.978685, 2, -6.994465, 0, -0.5, 0.5, 0.5,
-3.978685, 2, -6.994465, 1, -0.5, 0.5, 0.5,
-3.978685, 2, -6.994465, 1, 1.5, 0.5, 0.5,
-3.978685, 2, -6.994465, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.482128, -3.105026, -4,
-3.482128, -3.105026, 4,
-3.482128, -3.105026, -4,
-3.647647, -3.258559, -4,
-3.482128, -3.105026, -2,
-3.647647, -3.258559, -2,
-3.482128, -3.105026, 0,
-3.647647, -3.258559, 0,
-3.482128, -3.105026, 2,
-3.647647, -3.258559, 2,
-3.482128, -3.105026, 4,
-3.647647, -3.258559, 4
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
-3.978685, -3.565625, -4, 0, -0.5, 0.5, 0.5,
-3.978685, -3.565625, -4, 1, -0.5, 0.5, 0.5,
-3.978685, -3.565625, -4, 1, 1.5, 0.5, 0.5,
-3.978685, -3.565625, -4, 0, 1.5, 0.5, 0.5,
-3.978685, -3.565625, -2, 0, -0.5, 0.5, 0.5,
-3.978685, -3.565625, -2, 1, -0.5, 0.5, 0.5,
-3.978685, -3.565625, -2, 1, 1.5, 0.5, 0.5,
-3.978685, -3.565625, -2, 0, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 0, 0, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 0, 1, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 0, 1, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 0, 0, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 2, 0, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 2, 1, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 2, 1, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 2, 0, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 4, 0, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 4, 1, -0.5, 0.5, 0.5,
-3.978685, -3.565625, 4, 1, 1.5, 0.5, 0.5,
-3.978685, -3.565625, 4, 0, 1.5, 0.5, 0.5
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
-3.482128, -3.105026, -6.101838,
-3.482128, 3.03629, -6.101838,
-3.482128, -3.105026, 5.799858,
-3.482128, 3.03629, 5.799858,
-3.482128, -3.105026, -6.101838,
-3.482128, -3.105026, 5.799858,
-3.482128, 3.03629, -6.101838,
-3.482128, 3.03629, 5.799858,
-3.482128, -3.105026, -6.101838,
3.138627, -3.105026, -6.101838,
-3.482128, -3.105026, 5.799858,
3.138627, -3.105026, 5.799858,
-3.482128, 3.03629, -6.101838,
3.138627, 3.03629, -6.101838,
-3.482128, 3.03629, 5.799858,
3.138627, 3.03629, 5.799858,
3.138627, -3.105026, -6.101838,
3.138627, 3.03629, -6.101838,
3.138627, -3.105026, 5.799858,
3.138627, 3.03629, 5.799858,
3.138627, -3.105026, -6.101838,
3.138627, -3.105026, 5.799858,
3.138627, 3.03629, -6.101838,
3.138627, 3.03629, 5.799858
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
var radius = 7.977615;
var distance = 35.49331;
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
mvMatrix.translate( 0.1717507, 0.03436804, 0.1509898 );
mvMatrix.scale( 1.302805, 1.404512, 0.7247332 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.49331);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Methoxyfenozide<-read.table("Methoxyfenozide.xyz")
```

```
## Error in read.table("Methoxyfenozide.xyz"): no lines available in input
```

```r
x<-Methoxyfenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
```

```r
y<-Methoxyfenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
```

```r
z<-Methoxyfenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
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
-3.38571, 0.8758159, 0.5137572, 0, 0, 1, 1, 1,
-3.217155, 0.1268636, -2.835397, 1, 0, 0, 1, 1,
-3.035051, 0.8646332, -2.633245, 1, 0, 0, 1, 1,
-3.029161, -2.044523, -3.09956, 1, 0, 0, 1, 1,
-2.75555, 1.410656, -1.27928, 1, 0, 0, 1, 1,
-2.691731, -2.528346, -1.760034, 1, 0, 0, 1, 1,
-2.636899, -0.08709603, -1.839112, 0, 0, 0, 1, 1,
-2.514846, -0.4818137, -0.7499871, 0, 0, 0, 1, 1,
-2.458962, -1.558634, -3.411182, 0, 0, 0, 1, 1,
-2.417119, -0.723327, -1.713376, 0, 0, 0, 1, 1,
-2.396402, 1.139681, -1.369553, 0, 0, 0, 1, 1,
-2.337354, -1.844212, -1.543189, 0, 0, 0, 1, 1,
-2.265427, 0.6238896, -1.870637, 0, 0, 0, 1, 1,
-2.219188, 0.803422, 0.8861333, 1, 1, 1, 1, 1,
-2.153504, 0.3362782, -1.576292, 1, 1, 1, 1, 1,
-2.150755, 0.01211743, -0.8305573, 1, 1, 1, 1, 1,
-2.137634, 0.2653974, -2.587728, 1, 1, 1, 1, 1,
-2.129011, 0.7902294, -2.509919, 1, 1, 1, 1, 1,
-2.079943, -0.5020372, -2.220387, 1, 1, 1, 1, 1,
-2.071648, -2.239941, -2.090695, 1, 1, 1, 1, 1,
-2.070676, 0.1380093, -1.32936, 1, 1, 1, 1, 1,
-2.047302, 0.06717648, -2.561949, 1, 1, 1, 1, 1,
-2.04602, 0.738282, -0.8980611, 1, 1, 1, 1, 1,
-2.029514, 0.5942002, -2.03809, 1, 1, 1, 1, 1,
-2.002616, 0.6520011, -1.31938, 1, 1, 1, 1, 1,
-1.933005, 1.230255, 0.1169413, 1, 1, 1, 1, 1,
-1.908576, -2.043576, -3.482599, 1, 1, 1, 1, 1,
-1.878138, 1.071581, -0.6109242, 1, 1, 1, 1, 1,
-1.876876, 0.4310707, -0.6294804, 0, 0, 1, 1, 1,
-1.844115, 0.3715035, -1.914076, 1, 0, 0, 1, 1,
-1.836114, 0.5158436, -2.334978, 1, 0, 0, 1, 1,
-1.833252, 1.745201, -0.8470501, 1, 0, 0, 1, 1,
-1.826603, -0.1677831, -1.51482, 1, 0, 0, 1, 1,
-1.804215, -0.8452467, -2.305061, 1, 0, 0, 1, 1,
-1.774849, 0.8237244, -1.732266, 0, 0, 0, 1, 1,
-1.763579, -0.3831924, -1.183258, 0, 0, 0, 1, 1,
-1.759155, 1.28481, 2.827933, 0, 0, 0, 1, 1,
-1.750554, 0.9315819, -1.723448, 0, 0, 0, 1, 1,
-1.747035, -1.014039, -1.822277, 0, 0, 0, 1, 1,
-1.726815, -0.006622944, -1.562079, 0, 0, 0, 1, 1,
-1.726741, -0.5017684, -2.379603, 0, 0, 0, 1, 1,
-1.696186, -0.3202172, -2.39639, 1, 1, 1, 1, 1,
-1.668221, -1.745561, -1.690401, 1, 1, 1, 1, 1,
-1.666025, -0.03514204, -1.502815, 1, 1, 1, 1, 1,
-1.659282, -0.4333994, -1.079013, 1, 1, 1, 1, 1,
-1.654397, 0.8861521, -1.970277, 1, 1, 1, 1, 1,
-1.650544, -0.9630706, -3.952058, 1, 1, 1, 1, 1,
-1.645577, -1.425313, -0.9033379, 1, 1, 1, 1, 1,
-1.634603, -1.596837, -2.384406, 1, 1, 1, 1, 1,
-1.627146, 1.14918, -1.280304, 1, 1, 1, 1, 1,
-1.624417, 0.2365209, -2.722549, 1, 1, 1, 1, 1,
-1.609741, 1.867206, -0.9671826, 1, 1, 1, 1, 1,
-1.599817, 1.158049, -0.8224531, 1, 1, 1, 1, 1,
-1.592011, 0.2462336, -2.113422, 1, 1, 1, 1, 1,
-1.579114, -0.9712633, 0.1215016, 1, 1, 1, 1, 1,
-1.578826, -0.3726156, -1.423523, 1, 1, 1, 1, 1,
-1.568594, 0.4498694, -1.595971, 0, 0, 1, 1, 1,
-1.567479, -0.8762596, -0.9487003, 1, 0, 0, 1, 1,
-1.556996, 1.236707, -0.9855589, 1, 0, 0, 1, 1,
-1.543755, -1.845549, -1.801384, 1, 0, 0, 1, 1,
-1.540141, -0.07724673, -2.243105, 1, 0, 0, 1, 1,
-1.537493, -1.47585, -3.007967, 1, 0, 0, 1, 1,
-1.525293, -0.07954787, -0.198653, 0, 0, 0, 1, 1,
-1.516964, 1.445874, -0.7157114, 0, 0, 0, 1, 1,
-1.50735, -1.049406, -1.860769, 0, 0, 0, 1, 1,
-1.504564, 0.3608495, -1.154635, 0, 0, 0, 1, 1,
-1.503662, -0.002506678, -1.508153, 0, 0, 0, 1, 1,
-1.501961, 0.06183471, -1.688909, 0, 0, 0, 1, 1,
-1.498942, -0.3282731, -3.374747, 0, 0, 0, 1, 1,
-1.496524, -0.176412, -2.995186, 1, 1, 1, 1, 1,
-1.48826, -0.3398676, -1.191359, 1, 1, 1, 1, 1,
-1.485587, -0.5786244, -1.942549, 1, 1, 1, 1, 1,
-1.484788, -0.2327354, -2.153609, 1, 1, 1, 1, 1,
-1.471908, -1.28299, -1.224146, 1, 1, 1, 1, 1,
-1.466863, -0.67573, -1.6188, 1, 1, 1, 1, 1,
-1.465262, 0.3959423, -1.325436, 1, 1, 1, 1, 1,
-1.459929, -0.09889949, -2.548966, 1, 1, 1, 1, 1,
-1.448397, 0.152802, -0.8292576, 1, 1, 1, 1, 1,
-1.43807, 1.4689, -0.9572256, 1, 1, 1, 1, 1,
-1.437523, 1.357074, -0.1645073, 1, 1, 1, 1, 1,
-1.430832, 0.08192492, -3.771184, 1, 1, 1, 1, 1,
-1.419834, 1.392146, -0.6055499, 1, 1, 1, 1, 1,
-1.419154, 1.319243, 0.6266729, 1, 1, 1, 1, 1,
-1.417835, -0.3404299, -2.782307, 1, 1, 1, 1, 1,
-1.413589, -0.3031653, -2.026799, 0, 0, 1, 1, 1,
-1.409452, -0.928664, -1.300742, 1, 0, 0, 1, 1,
-1.408414, 0.7122015, -0.6241805, 1, 0, 0, 1, 1,
-1.405158, -0.1593732, -1.025785, 1, 0, 0, 1, 1,
-1.400285, -0.4480778, -0.7510343, 1, 0, 0, 1, 1,
-1.389786, 0.4290309, -0.6744879, 1, 0, 0, 1, 1,
-1.385718, 0.5612551, -1.317321, 0, 0, 0, 1, 1,
-1.37299, -2.060941, -2.789992, 0, 0, 0, 1, 1,
-1.366964, -0.9678028, -1.953498, 0, 0, 0, 1, 1,
-1.351094, -0.5560365, 0.5942462, 0, 0, 0, 1, 1,
-1.345714, -1.013802, -0.525786, 0, 0, 0, 1, 1,
-1.344304, 0.400026, -1.950525, 0, 0, 0, 1, 1,
-1.34273, -0.8219483, -1.931562, 0, 0, 0, 1, 1,
-1.322605, -2.436923, -4.254851, 1, 1, 1, 1, 1,
-1.319203, 0.3473381, -0.1547202, 1, 1, 1, 1, 1,
-1.310107, -1.860015, -3.048895, 1, 1, 1, 1, 1,
-1.305834, 2.150134, -0.8082573, 1, 1, 1, 1, 1,
-1.298007, -0.1827731, -0.6081911, 1, 1, 1, 1, 1,
-1.292953, -0.5851677, -1.432573, 1, 1, 1, 1, 1,
-1.278262, -0.5194757, -3.175396, 1, 1, 1, 1, 1,
-1.269805, 1.226581, 0.006859289, 1, 1, 1, 1, 1,
-1.267882, 0.2428104, -1.337952, 1, 1, 1, 1, 1,
-1.261514, 0.8203179, -1.352221, 1, 1, 1, 1, 1,
-1.255946, 1.501945, -1.027578, 1, 1, 1, 1, 1,
-1.239431, -1.300581, -0.2071245, 1, 1, 1, 1, 1,
-1.237866, -0.5375715, -1.876867, 1, 1, 1, 1, 1,
-1.231214, 0.185737, -1.425588, 1, 1, 1, 1, 1,
-1.227038, 0.2125855, -2.304693, 1, 1, 1, 1, 1,
-1.226913, 0.5496585, 0.3045278, 0, 0, 1, 1, 1,
-1.224521, 0.4393025, -0.6096933, 1, 0, 0, 1, 1,
-1.220672, -0.03846297, -2.742883, 1, 0, 0, 1, 1,
-1.218689, -1.049555, -1.200229, 1, 0, 0, 1, 1,
-1.208552, 0.01218339, -1.105411, 1, 0, 0, 1, 1,
-1.206471, 1.283521, -0.4836397, 1, 0, 0, 1, 1,
-1.190548, -0.4173669, -2.309113, 0, 0, 0, 1, 1,
-1.188779, 1.833763, -1.598819, 0, 0, 0, 1, 1,
-1.188265, 0.4209443, -2.644123, 0, 0, 0, 1, 1,
-1.184114, 0.9768274, 0.5785579, 0, 0, 0, 1, 1,
-1.177191, 0.9731175, 0.8472853, 0, 0, 0, 1, 1,
-1.177107, -0.1821273, -3.556579, 0, 0, 0, 1, 1,
-1.176611, -0.326809, -3.266558, 0, 0, 0, 1, 1,
-1.173108, 0.3924201, -2.262698, 1, 1, 1, 1, 1,
-1.168911, 1.261504, 0.6268452, 1, 1, 1, 1, 1,
-1.144519, -0.1418219, -2.560387, 1, 1, 1, 1, 1,
-1.13008, 0.002823691, -0.1540463, 1, 1, 1, 1, 1,
-1.128562, -0.2587082, -3.430551, 1, 1, 1, 1, 1,
-1.126001, 0.2868022, -0.9422969, 1, 1, 1, 1, 1,
-1.120867, 0.8549534, -2.791006, 1, 1, 1, 1, 1,
-1.11027, 0.1655206, -0.2380784, 1, 1, 1, 1, 1,
-1.081904, 0.715139, 0.3309467, 1, 1, 1, 1, 1,
-1.072511, -0.2416126, 0.2287472, 1, 1, 1, 1, 1,
-1.068122, -0.2036147, -1.577546, 1, 1, 1, 1, 1,
-1.060981, 0.2130982, -1.553095, 1, 1, 1, 1, 1,
-1.046629, -2.108292, -1.650349, 1, 1, 1, 1, 1,
-1.029929, -0.5259884, -1.222266, 1, 1, 1, 1, 1,
-1.021214, 1.758349, -0.6142929, 1, 1, 1, 1, 1,
-1.019096, 0.13309, -1.281792, 0, 0, 1, 1, 1,
-1.018028, -0.4048072, -1.800876, 1, 0, 0, 1, 1,
-1.013974, -0.7624454, -2.426322, 1, 0, 0, 1, 1,
-1.01002, -0.4402425, -1.418107, 1, 0, 0, 1, 1,
-1.004976, 2.165924, 0.02494707, 1, 0, 0, 1, 1,
-1.00121, -0.4870693, -2.582112, 1, 0, 0, 1, 1,
-1.000844, -0.6778019, -1.834807, 0, 0, 0, 1, 1,
-0.999703, 1.174782, -2.359426, 0, 0, 0, 1, 1,
-0.9982099, -1.411951, -3.929036, 0, 0, 0, 1, 1,
-0.9974409, -0.02002822, -0.7433829, 0, 0, 0, 1, 1,
-0.9961392, 0.4205382, -1.363683, 0, 0, 0, 1, 1,
-0.9884958, 0.3547574, -2.714894, 0, 0, 0, 1, 1,
-0.9857868, 0.0158714, -1.848639, 0, 0, 0, 1, 1,
-0.9838421, 1.381155, -2.524753, 1, 1, 1, 1, 1,
-0.9832665, -0.1596429, -1.37098, 1, 1, 1, 1, 1,
-0.9783542, -2.384336, -4.568439, 1, 1, 1, 1, 1,
-0.9751734, -0.4050571, -3.975212, 1, 1, 1, 1, 1,
-0.9709267, -0.5695131, -2.485247, 1, 1, 1, 1, 1,
-0.9698887, 1.814044, -0.8560606, 1, 1, 1, 1, 1,
-0.9671192, 0.1501675, -1.401995, 1, 1, 1, 1, 1,
-0.9666892, 0.264972, -1.261406, 1, 1, 1, 1, 1,
-0.9662484, 0.418369, -2.382049, 1, 1, 1, 1, 1,
-0.9592819, 1.300775, -1.636355, 1, 1, 1, 1, 1,
-0.9576362, 0.3024644, -0.6965924, 1, 1, 1, 1, 1,
-0.9529726, 1.295205, -0.16645, 1, 1, 1, 1, 1,
-0.9520333, -0.05922877, -1.023517, 1, 1, 1, 1, 1,
-0.9518727, 0.4856847, -1.396374, 1, 1, 1, 1, 1,
-0.942023, 0.3314652, -2.668127, 1, 1, 1, 1, 1,
-0.9409686, -0.07342409, -2.606072, 0, 0, 1, 1, 1,
-0.940367, 0.6254888, -1.012086, 1, 0, 0, 1, 1,
-0.9396328, 1.536897, -0.5808181, 1, 0, 0, 1, 1,
-0.9390181, 0.7175808, -1.921959, 1, 0, 0, 1, 1,
-0.9365904, 0.850763, -0.4084216, 1, 0, 0, 1, 1,
-0.9321214, 0.7975698, -2.188281, 1, 0, 0, 1, 1,
-0.9283208, 0.6085057, -1.45935, 0, 0, 0, 1, 1,
-0.9276871, 0.3546676, -2.089872, 0, 0, 0, 1, 1,
-0.9268913, -2.177882, -2.870832, 0, 0, 0, 1, 1,
-0.9196249, 0.8072069, 0.4727349, 0, 0, 0, 1, 1,
-0.9171448, 0.6205047, -2.676438, 0, 0, 0, 1, 1,
-0.9161067, -0.1106082, -2.273739, 0, 0, 0, 1, 1,
-0.9140524, -0.6484817, -2.230424, 0, 0, 0, 1, 1,
-0.9131457, 0.09604144, -2.54871, 1, 1, 1, 1, 1,
-0.9072, 0.2058029, -0.3578584, 1, 1, 1, 1, 1,
-0.9035048, -0.3215304, -2.556094, 1, 1, 1, 1, 1,
-0.9018297, 0.4536476, -0.1935754, 1, 1, 1, 1, 1,
-0.9003852, -0.3476272, -2.618053, 1, 1, 1, 1, 1,
-0.8979943, -0.2839045, -2.674637, 1, 1, 1, 1, 1,
-0.8968764, -2.865042, -3.719395, 1, 1, 1, 1, 1,
-0.8939283, -0.6554995, -2.052111, 1, 1, 1, 1, 1,
-0.8938151, 0.03823136, -0.7044083, 1, 1, 1, 1, 1,
-0.8893687, 0.8467432, -1.15098, 1, 1, 1, 1, 1,
-0.8875369, 1.537889, 0.6873668, 1, 1, 1, 1, 1,
-0.8871359, 0.005269542, -2.15545, 1, 1, 1, 1, 1,
-0.8864067, 0.131253, 0.6381094, 1, 1, 1, 1, 1,
-0.886092, -0.3428507, -2.737873, 1, 1, 1, 1, 1,
-0.8817161, -0.4223404, -0.751107, 1, 1, 1, 1, 1,
-0.874968, 1.142358, -0.6250417, 0, 0, 1, 1, 1,
-0.8729113, -0.6495539, -2.21642, 1, 0, 0, 1, 1,
-0.8619558, -0.04168113, -2.051044, 1, 0, 0, 1, 1,
-0.8579344, 1.625249, -1.443219, 1, 0, 0, 1, 1,
-0.8574007, 0.1018426, 0.0171556, 1, 0, 0, 1, 1,
-0.8555603, 0.2475706, -1.085919, 1, 0, 0, 1, 1,
-0.8552784, -1.340099, -3.175153, 0, 0, 0, 1, 1,
-0.8549251, 0.002989695, -1.991326, 0, 0, 0, 1, 1,
-0.8546595, -1.005651, -4.660717, 0, 0, 0, 1, 1,
-0.8538364, 0.2462554, -2.225115, 0, 0, 0, 1, 1,
-0.8446945, 0.3879966, -2.076078, 0, 0, 0, 1, 1,
-0.8417444, 0.9682637, -1.474532, 0, 0, 0, 1, 1,
-0.8245308, -2.508995, -1.955057, 0, 0, 0, 1, 1,
-0.8234068, -0.7880692, -2.399236, 1, 1, 1, 1, 1,
-0.8168836, -0.8536475, -1.374887, 1, 1, 1, 1, 1,
-0.8125902, 0.3925124, -0.7125931, 1, 1, 1, 1, 1,
-0.8108963, 0.4740324, -2.079519, 1, 1, 1, 1, 1,
-0.8048926, -1.445836, -1.754522, 1, 1, 1, 1, 1,
-0.8024032, 1.117225, -0.4144547, 1, 1, 1, 1, 1,
-0.802071, -0.1519362, -0.1439968, 1, 1, 1, 1, 1,
-0.7985055, 1.482301, -0.2889422, 1, 1, 1, 1, 1,
-0.7971003, -0.9950975, -0.8242729, 1, 1, 1, 1, 1,
-0.7923824, 0.6298821, -0.007697898, 1, 1, 1, 1, 1,
-0.7897881, -1.745445, -3.045115, 1, 1, 1, 1, 1,
-0.785194, 0.1763095, -0.6574761, 1, 1, 1, 1, 1,
-0.7811563, -0.9205077, -3.880069, 1, 1, 1, 1, 1,
-0.7775704, 0.3117033, -0.8376392, 1, 1, 1, 1, 1,
-0.7749553, 0.9549846, 0.8630842, 1, 1, 1, 1, 1,
-0.7732351, -2.443781, -1.852277, 0, 0, 1, 1, 1,
-0.7686168, -0.3573974, -1.373894, 1, 0, 0, 1, 1,
-0.7638398, -1.46895, -1.941774, 1, 0, 0, 1, 1,
-0.7634547, -0.06631663, -1.26418, 1, 0, 0, 1, 1,
-0.762714, -0.9119827, -2.226484, 1, 0, 0, 1, 1,
-0.7626023, -1.033182, -3.535977, 1, 0, 0, 1, 1,
-0.7555632, 0.005861551, -1.811484, 0, 0, 0, 1, 1,
-0.7534397, -1.372582, -3.132613, 0, 0, 0, 1, 1,
-0.7401553, 2.469223, -0.6107253, 0, 0, 0, 1, 1,
-0.7390682, 2.190745, 0.8718238, 0, 0, 0, 1, 1,
-0.7343935, -2.63661, -0.3599505, 0, 0, 0, 1, 1,
-0.7303714, 1.910722, -0.03829532, 0, 0, 0, 1, 1,
-0.7285626, -1.449489, -3.417703, 0, 0, 0, 1, 1,
-0.7274449, 1.350827, -1.927811, 1, 1, 1, 1, 1,
-0.7231804, -0.06536954, -0.1250295, 1, 1, 1, 1, 1,
-0.7224421, 1.607961, -0.9865869, 1, 1, 1, 1, 1,
-0.7200651, 0.008068118, -2.1585, 1, 1, 1, 1, 1,
-0.7189913, -0.6357138, -1.702657, 1, 1, 1, 1, 1,
-0.7181439, 0.9091074, -0.2425637, 1, 1, 1, 1, 1,
-0.714269, 0.2217442, -1.640124, 1, 1, 1, 1, 1,
-0.7117352, -0.1281668, -2.889465, 1, 1, 1, 1, 1,
-0.7113103, 0.4380639, -0.6546991, 1, 1, 1, 1, 1,
-0.7092716, 0.2021285, -0.7761148, 1, 1, 1, 1, 1,
-0.7004329, -1.348889, -3.665376, 1, 1, 1, 1, 1,
-0.6963112, -1.552833, -1.659941, 1, 1, 1, 1, 1,
-0.6948819, 0.2929282, 0.2602507, 1, 1, 1, 1, 1,
-0.6932389, -1.433735, -3.928717, 1, 1, 1, 1, 1,
-0.6905589, -0.4091261, -3.549637, 1, 1, 1, 1, 1,
-0.6850536, -0.4239514, -1.643787, 0, 0, 1, 1, 1,
-0.6845829, 1.517834, 0.5919588, 1, 0, 0, 1, 1,
-0.680229, -0.007951301, -0.7476599, 1, 0, 0, 1, 1,
-0.6748726, 0.5524955, -1.800917, 1, 0, 0, 1, 1,
-0.674848, 1.503588, 0.7556604, 1, 0, 0, 1, 1,
-0.6739376, 0.294574, -1.602264, 1, 0, 0, 1, 1,
-0.6505975, -1.54277, -2.706318, 0, 0, 0, 1, 1,
-0.6472561, 1.024363, -0.5740012, 0, 0, 0, 1, 1,
-0.6468396, 2.049619, -0.689177, 0, 0, 0, 1, 1,
-0.6413625, 0.7982539, -2.849712, 0, 0, 0, 1, 1,
-0.6377831, 0.7136832, -1.928567, 0, 0, 0, 1, 1,
-0.6370546, 0.2304454, 0.3407839, 0, 0, 0, 1, 1,
-0.6321289, -0.4368521, -0.6376303, 0, 0, 0, 1, 1,
-0.627921, -2.251628, -1.878017, 1, 1, 1, 1, 1,
-0.6272473, -1.616568, -1.560098, 1, 1, 1, 1, 1,
-0.6259248, 0.3283433, -0.846135, 1, 1, 1, 1, 1,
-0.6228378, -1.551604, -2.856544, 1, 1, 1, 1, 1,
-0.6104038, 0.07862297, -1.328023, 1, 1, 1, 1, 1,
-0.6090624, -0.7108418, -1.592749, 1, 1, 1, 1, 1,
-0.6071479, -2.075669, -3.502628, 1, 1, 1, 1, 1,
-0.6038207, -0.719975, -1.675065, 1, 1, 1, 1, 1,
-0.6022229, 0.7336452, 0.484868, 1, 1, 1, 1, 1,
-0.6000763, -0.7717659, -1.827515, 1, 1, 1, 1, 1,
-0.599847, 0.03416601, -0.4951905, 1, 1, 1, 1, 1,
-0.5965683, 0.337759, -0.5601372, 1, 1, 1, 1, 1,
-0.5962682, -0.746417, -2.714984, 1, 1, 1, 1, 1,
-0.5888748, 0.117333, -0.02565881, 1, 1, 1, 1, 1,
-0.5886541, -0.3388646, -2.676111, 1, 1, 1, 1, 1,
-0.5877327, 0.2766603, 0.5013974, 0, 0, 1, 1, 1,
-0.5831802, 0.1649504, -0.9683661, 1, 0, 0, 1, 1,
-0.5815393, -0.2705306, -4.695696, 1, 0, 0, 1, 1,
-0.5792211, 2.839031, -0.4175007, 1, 0, 0, 1, 1,
-0.5785413, -0.4843896, -4.276305, 1, 0, 0, 1, 1,
-0.5782629, -0.4395004, -1.797337, 1, 0, 0, 1, 1,
-0.5749003, -0.9821988, -3.318833, 0, 0, 0, 1, 1,
-0.5741092, 0.3806358, -0.8288183, 0, 0, 0, 1, 1,
-0.5711712, 0.5087467, -0.4387483, 0, 0, 0, 1, 1,
-0.5711531, 0.2295444, -0.7792305, 0, 0, 0, 1, 1,
-0.5660273, -0.02399968, -0.5143148, 0, 0, 0, 1, 1,
-0.5612307, 1.169983, -0.6443313, 0, 0, 0, 1, 1,
-0.5572704, -0.3517519, -0.8841534, 0, 0, 0, 1, 1,
-0.5544454, -0.9160241, -2.508765, 1, 1, 1, 1, 1,
-0.5533293, -0.9407181, -2.095376, 1, 1, 1, 1, 1,
-0.5496356, 0.5515541, -0.1150083, 1, 1, 1, 1, 1,
-0.5456474, -0.4415832, -0.4506778, 1, 1, 1, 1, 1,
-0.5388898, 1.531254, 0.485128, 1, 1, 1, 1, 1,
-0.5356263, 0.04704082, -2.400244, 1, 1, 1, 1, 1,
-0.5282339, -0.4394149, -5.816286, 1, 1, 1, 1, 1,
-0.5234392, -0.1394024, -1.498361, 1, 1, 1, 1, 1,
-0.5201555, -1.722188, -3.441965, 1, 1, 1, 1, 1,
-0.5188499, -1.091072, -3.718511, 1, 1, 1, 1, 1,
-0.5111691, 0.7936428, -1.411996, 1, 1, 1, 1, 1,
-0.51039, -0.5373424, -1.914534, 1, 1, 1, 1, 1,
-0.5102745, -0.09482371, -3.213526, 1, 1, 1, 1, 1,
-0.508661, -1.181723, -4.010143, 1, 1, 1, 1, 1,
-0.5062962, -0.7401972, -1.58309, 1, 1, 1, 1, 1,
-0.5056413, 2.508707, 0.3631162, 0, 0, 1, 1, 1,
-0.503997, 0.2874117, -2.987631, 1, 0, 0, 1, 1,
-0.4926367, -0.3220831, -1.952703, 1, 0, 0, 1, 1,
-0.489886, -0.4172663, -1.153831, 1, 0, 0, 1, 1,
-0.4873247, -0.2238234, -1.654568, 1, 0, 0, 1, 1,
-0.4867698, 0.5971562, -1.447362, 1, 0, 0, 1, 1,
-0.4857799, 1.342729, 0.5891005, 0, 0, 0, 1, 1,
-0.4822251, -0.1862219, -1.629093, 0, 0, 0, 1, 1,
-0.4806535, 0.6932586, 0.8118719, 0, 0, 0, 1, 1,
-0.4804827, 0.7222985, 0.4454821, 0, 0, 0, 1, 1,
-0.4762013, 2.423852, 1.377352, 0, 0, 0, 1, 1,
-0.4744478, -1.582699, -3.673902, 0, 0, 0, 1, 1,
-0.473918, 1.716957, -0.9760006, 0, 0, 0, 1, 1,
-0.4702373, -3.01559, -1.998263, 1, 1, 1, 1, 1,
-0.4676484, 0.3166434, -1.635285, 1, 1, 1, 1, 1,
-0.4674458, -2.449605, -2.640354, 1, 1, 1, 1, 1,
-0.4649728, 1.95113, 1.479645, 1, 1, 1, 1, 1,
-0.4635484, 0.02705856, -2.555677, 1, 1, 1, 1, 1,
-0.4557149, -0.7413179, -1.19475, 1, 1, 1, 1, 1,
-0.455285, -0.1333327, -0.07267365, 1, 1, 1, 1, 1,
-0.4552124, -1.145531, -3.011198, 1, 1, 1, 1, 1,
-0.4526674, -0.4630899, -4.278695, 1, 1, 1, 1, 1,
-0.4506309, -0.3266207, -4.114273, 1, 1, 1, 1, 1,
-0.44449, -0.5856936, -1.843626, 1, 1, 1, 1, 1,
-0.443703, 0.4301833, -1.502053, 1, 1, 1, 1, 1,
-0.4401946, 2.100031, 1.271335, 1, 1, 1, 1, 1,
-0.4371854, -0.2738624, -3.126454, 1, 1, 1, 1, 1,
-0.4361167, -1.644465, -2.290837, 1, 1, 1, 1, 1,
-0.4334852, -2.117985, -1.917093, 0, 0, 1, 1, 1,
-0.4287581, -0.8376131, -2.428691, 1, 0, 0, 1, 1,
-0.4265308, 0.4299071, -0.9971893, 1, 0, 0, 1, 1,
-0.4228896, 0.2757707, -1.937036, 1, 0, 0, 1, 1,
-0.4228117, -0.1656707, -0.464376, 1, 0, 0, 1, 1,
-0.4214569, -0.5498039, -3.725273, 1, 0, 0, 1, 1,
-0.4093308, 1.359724, 2.191466, 0, 0, 0, 1, 1,
-0.4089394, -1.640889, -2.222398, 0, 0, 0, 1, 1,
-0.4079354, -0.3381307, -3.836998, 0, 0, 0, 1, 1,
-0.4038774, 0.8412444, 0.7405879, 0, 0, 0, 1, 1,
-0.4002307, -0.4876054, -2.410904, 0, 0, 0, 1, 1,
-0.3986799, -1.128737, -3.267115, 0, 0, 0, 1, 1,
-0.3922835, -1.546452, -2.224842, 0, 0, 0, 1, 1,
-0.3882704, 0.1985003, 0.3066604, 1, 1, 1, 1, 1,
-0.3826023, -0.1536218, -2.954416, 1, 1, 1, 1, 1,
-0.3820915, 0.4822563, 0.117157, 1, 1, 1, 1, 1,
-0.3798321, -0.4961306, -2.294659, 1, 1, 1, 1, 1,
-0.3716675, -0.151332, -2.267203, 1, 1, 1, 1, 1,
-0.3704197, 0.009739613, -1.653031, 1, 1, 1, 1, 1,
-0.3664865, 0.2158517, -1.018103, 1, 1, 1, 1, 1,
-0.3638163, 0.5172339, -1.336014, 1, 1, 1, 1, 1,
-0.3631796, 0.219154, 0.5362552, 1, 1, 1, 1, 1,
-0.3624215, 0.1152461, -0.5051205, 1, 1, 1, 1, 1,
-0.3606663, -0.7767804, -4.535476, 1, 1, 1, 1, 1,
-0.3594345, -0.1491124, -0.8009676, 1, 1, 1, 1, 1,
-0.3592626, -0.6474802, -3.156303, 1, 1, 1, 1, 1,
-0.3583818, -1.590997, -3.259344, 1, 1, 1, 1, 1,
-0.3573563, 1.312685, 1.623267, 1, 1, 1, 1, 1,
-0.357282, 1.41003, 1.636475, 0, 0, 1, 1, 1,
-0.3547734, -1.995159, -2.949476, 1, 0, 0, 1, 1,
-0.3446376, -1.826946, -1.923967, 1, 0, 0, 1, 1,
-0.3433946, -0.9204194, -1.595311, 1, 0, 0, 1, 1,
-0.3393135, 1.448671, 1.403596, 1, 0, 0, 1, 1,
-0.3358991, 0.1431194, -1.446149, 1, 0, 0, 1, 1,
-0.3351268, -0.6675372, -3.407529, 0, 0, 0, 1, 1,
-0.3350309, -1.537216, -1.025662, 0, 0, 0, 1, 1,
-0.3350006, 0.8178137, 0.4695992, 0, 0, 0, 1, 1,
-0.3286086, -1.286566, -3.622626, 0, 0, 0, 1, 1,
-0.3245924, -0.3849215, -3.028732, 0, 0, 0, 1, 1,
-0.3236174, -0.1158873, -2.134499, 0, 0, 0, 1, 1,
-0.3212775, -0.8666522, -2.868933, 0, 0, 0, 1, 1,
-0.3175688, 0.8561718, -2.430323, 1, 1, 1, 1, 1,
-0.3165127, 0.1963642, -0.1177548, 1, 1, 1, 1, 1,
-0.3150484, -1.10145, -2.796141, 1, 1, 1, 1, 1,
-0.3064685, 0.6380439, 0.03181964, 1, 1, 1, 1, 1,
-0.3051914, 0.1474653, -2.938411, 1, 1, 1, 1, 1,
-0.3007861, -0.4280358, -1.093635, 1, 1, 1, 1, 1,
-0.2979836, -0.1077118, -3.371869, 1, 1, 1, 1, 1,
-0.2942754, -1.085495, -3.813071, 1, 1, 1, 1, 1,
-0.2920208, -0.1930085, -1.665715, 1, 1, 1, 1, 1,
-0.2836229, -0.6322506, -1.500965, 1, 1, 1, 1, 1,
-0.2822749, -0.1362206, -3.554843, 1, 1, 1, 1, 1,
-0.2808786, 0.7131083, 0.2329024, 1, 1, 1, 1, 1,
-0.2748823, -1.108299, -3.109385, 1, 1, 1, 1, 1,
-0.2717302, 0.8993759, -0.7161903, 1, 1, 1, 1, 1,
-0.2679725, -1.538684, -2.105944, 1, 1, 1, 1, 1,
-0.2626833, 1.4012, -0.7252399, 0, 0, 1, 1, 1,
-0.2621595, 0.4905655, 0.2964301, 1, 0, 0, 1, 1,
-0.261167, 1.168631, 0.4289939, 1, 0, 0, 1, 1,
-0.2608596, -1.681377, -0.4118165, 1, 0, 0, 1, 1,
-0.2597894, -0.03456508, -0.6176448, 1, 0, 0, 1, 1,
-0.2569081, 2.356623, -1.627287, 1, 0, 0, 1, 1,
-0.2545995, 0.5862929, -0.3144293, 0, 0, 0, 1, 1,
-0.2527921, 2.215602, -1.935108, 0, 0, 0, 1, 1,
-0.250749, -1.450712, -3.370502, 0, 0, 0, 1, 1,
-0.2410312, 0.4439175, 1.174136, 0, 0, 0, 1, 1,
-0.2351232, -1.211948, -4.4161, 0, 0, 0, 1, 1,
-0.2348475, -2.549248, -4.438426, 0, 0, 0, 1, 1,
-0.2291548, 0.7128211, 0.5077383, 0, 0, 0, 1, 1,
-0.2263967, -0.4606923, -3.806616, 1, 1, 1, 1, 1,
-0.2263018, -1.114446, -3.812326, 1, 1, 1, 1, 1,
-0.2218256, 0.98657, 0.5602804, 1, 1, 1, 1, 1,
-0.2153997, -0.634398, -2.398824, 1, 1, 1, 1, 1,
-0.2152901, 0.4121352, 1.612319, 1, 1, 1, 1, 1,
-0.2142471, -1.341687, -2.735124, 1, 1, 1, 1, 1,
-0.2116982, -1.165856, -4.325026, 1, 1, 1, 1, 1,
-0.2109918, -0.2934907, -3.974634, 1, 1, 1, 1, 1,
-0.2103098, -1.59642, -3.244184, 1, 1, 1, 1, 1,
-0.2102031, -0.1670959, -2.331136, 1, 1, 1, 1, 1,
-0.2049631, 1.265881, 0.2934479, 1, 1, 1, 1, 1,
-0.2020948, -0.9212292, -1.869526, 1, 1, 1, 1, 1,
-0.1989594, -0.01787507, -1.850117, 1, 1, 1, 1, 1,
-0.1951637, 1.650131, 1.487152, 1, 1, 1, 1, 1,
-0.191257, 0.2894472, -0.199486, 1, 1, 1, 1, 1,
-0.1901207, -0.3044689, -3.391972, 0, 0, 1, 1, 1,
-0.1899171, -0.1724866, -4.237147, 1, 0, 0, 1, 1,
-0.187636, -1.410619, -5.161886, 1, 0, 0, 1, 1,
-0.1852955, 0.6238045, 1.557345, 1, 0, 0, 1, 1,
-0.1834868, 1.055308, 0.4115384, 1, 0, 0, 1, 1,
-0.1818213, -0.5879168, -4.254772, 1, 0, 0, 1, 1,
-0.1709646, 0.4396299, -0.077314, 0, 0, 0, 1, 1,
-0.170591, -0.6432396, -3.747025, 0, 0, 0, 1, 1,
-0.1687665, -0.5708368, -2.261592, 0, 0, 0, 1, 1,
-0.1664095, 1.764751, -1.488895, 0, 0, 0, 1, 1,
-0.1663866, -2.098717, -2.967093, 0, 0, 0, 1, 1,
-0.1647782, 0.7396297, 0.6206522, 0, 0, 0, 1, 1,
-0.161757, 0.2451138, 0.3336757, 0, 0, 0, 1, 1,
-0.160355, 1.853367, -0.1081521, 1, 1, 1, 1, 1,
-0.1580658, -0.4439188, -3.018899, 1, 1, 1, 1, 1,
-0.1570499, -0.8513837, -3.858983, 1, 1, 1, 1, 1,
-0.1552558, 2.635658, -0.9142175, 1, 1, 1, 1, 1,
-0.1535778, -1.063648, -1.623381, 1, 1, 1, 1, 1,
-0.1532572, 0.1158692, -0.8545892, 1, 1, 1, 1, 1,
-0.1480261, 0.08620929, -1.116296, 1, 1, 1, 1, 1,
-0.1433815, 0.8986108, -1.645104, 1, 1, 1, 1, 1,
-0.1377862, -0.8965071, -2.72525, 1, 1, 1, 1, 1,
-0.1366287, 0.7618887, -0.6310504, 1, 1, 1, 1, 1,
-0.1322027, 1.284319, -0.1666962, 1, 1, 1, 1, 1,
-0.1308255, -0.2439763, -2.941992, 1, 1, 1, 1, 1,
-0.1298718, 0.221973, -1.653969, 1, 1, 1, 1, 1,
-0.1255253, -0.9627531, -2.90594, 1, 1, 1, 1, 1,
-0.1228737, 0.2191056, 0.5515046, 1, 1, 1, 1, 1,
-0.1204094, -0.806906, -3.582371, 0, 0, 1, 1, 1,
-0.115451, -1.329358, -4.642335, 1, 0, 0, 1, 1,
-0.113892, -0.5695167, -2.657496, 1, 0, 0, 1, 1,
-0.1111375, 0.3255395, 0.1980136, 1, 0, 0, 1, 1,
-0.1108604, 1.813429, 2.644136, 1, 0, 0, 1, 1,
-0.09730161, -0.1153885, -2.308462, 1, 0, 0, 1, 1,
-0.09640175, 0.656124, 0.4849142, 0, 0, 0, 1, 1,
-0.0911579, 1.105794, 0.5227107, 0, 0, 0, 1, 1,
-0.0893454, 1.944901, -1.472104, 0, 0, 0, 1, 1,
-0.08730774, 1.969365, -0.6237434, 0, 0, 0, 1, 1,
-0.08631799, 1.235132, 0.9478926, 0, 0, 0, 1, 1,
-0.07671525, -1.572243, -2.986679, 0, 0, 0, 1, 1,
-0.07633592, 1.379113, 0.2073031, 0, 0, 0, 1, 1,
-0.07473392, 0.939504, -1.960112, 1, 1, 1, 1, 1,
-0.07326376, 0.05143706, -3.355222, 1, 1, 1, 1, 1,
-0.06207918, 0.07233666, 0.2906143, 1, 1, 1, 1, 1,
-0.05891605, 0.2911932, 2.15016, 1, 1, 1, 1, 1,
-0.05845923, 0.1944374, 0.5760921, 1, 1, 1, 1, 1,
-0.05661794, 0.5875388, 0.2346715, 1, 1, 1, 1, 1,
-0.05641681, -0.5020689, -3.48636, 1, 1, 1, 1, 1,
-0.05298472, 0.4694458, 0.7405078, 1, 1, 1, 1, 1,
-0.04885155, -0.1228091, -2.236676, 1, 1, 1, 1, 1,
-0.04514358, -0.3384084, -2.740976, 1, 1, 1, 1, 1,
-0.04175434, -0.7807838, -3.075588, 1, 1, 1, 1, 1,
-0.04054613, 1.2544, -0.6099334, 1, 1, 1, 1, 1,
-0.03892817, -0.1565882, -2.352576, 1, 1, 1, 1, 1,
-0.03821265, 1.20209, 0.003572581, 1, 1, 1, 1, 1,
-0.03232358, 1.360206, -0.07264089, 1, 1, 1, 1, 1,
-0.02854717, 0.6633098, -0.9667359, 0, 0, 1, 1, 1,
-0.02730745, 0.4077099, -1.214077, 1, 0, 0, 1, 1,
-0.02652826, -1.963906, -1.863615, 1, 0, 0, 1, 1,
-0.02551585, 0.2402177, 0.5654661, 1, 0, 0, 1, 1,
-0.02518824, 0.01904158, -1.437735, 1, 0, 0, 1, 1,
-0.02499569, 0.2159369, 1.6816, 1, 0, 0, 1, 1,
-0.02481556, -0.3017221, -3.672337, 0, 0, 0, 1, 1,
-0.02255976, -0.9079734, -1.977861, 0, 0, 0, 1, 1,
-0.0191076, -1.443603, -3.550177, 0, 0, 0, 1, 1,
-0.01826061, -0.4822652, -2.552788, 0, 0, 0, 1, 1,
-0.01616367, 1.166187, 0.6266363, 0, 0, 0, 1, 1,
-0.01425643, 0.2564978, -0.5729731, 0, 0, 0, 1, 1,
-0.01095034, -0.7580535, -3.682922, 0, 0, 0, 1, 1,
-0.01073908, -0.3744394, -5.928512, 1, 1, 1, 1, 1,
-0.0101389, -0.3695144, -1.310259, 1, 1, 1, 1, 1,
-0.00235235, -0.2838945, -2.345824, 1, 1, 1, 1, 1,
-0.001799314, 0.3170701, 0.2918677, 1, 1, 1, 1, 1,
-0.001068959, -0.316356, -2.942815, 1, 1, 1, 1, 1,
0.0003140982, -0.5867801, 2.464834, 1, 1, 1, 1, 1,
0.000459624, -1.393199, 2.995501, 1, 1, 1, 1, 1,
0.003465873, 0.659964, -1.413804, 1, 1, 1, 1, 1,
0.00893522, 0.5559559, -0.2159348, 1, 1, 1, 1, 1,
0.01070276, 0.3437513, -2.010048, 1, 1, 1, 1, 1,
0.0127045, -1.203272, 3.013923, 1, 1, 1, 1, 1,
0.01281892, 1.619121, 0.4699316, 1, 1, 1, 1, 1,
0.01324729, -0.6189661, 2.876554, 1, 1, 1, 1, 1,
0.01522624, 0.2214448, -0.5009632, 1, 1, 1, 1, 1,
0.01751495, -0.3744977, 3.544062, 1, 1, 1, 1, 1,
0.01840576, 0.8512613, 0.8392658, 0, 0, 1, 1, 1,
0.01873871, -0.5667079, 5.522849, 1, 0, 0, 1, 1,
0.02181912, 0.776378, 0.7256577, 1, 0, 0, 1, 1,
0.02187488, -0.3241467, 2.615711, 1, 0, 0, 1, 1,
0.02233586, -1.558041, 4.694705, 1, 0, 0, 1, 1,
0.0289819, -0.2567816, 3.562801, 1, 0, 0, 1, 1,
0.02942565, -1.234054, 2.452854, 0, 0, 0, 1, 1,
0.03243391, -0.5363889, 3.549222, 0, 0, 0, 1, 1,
0.03725084, -1.42733, 2.889892, 0, 0, 0, 1, 1,
0.0375228, -2.233556, 4.571483, 0, 0, 0, 1, 1,
0.03874676, 1.07932, -1.75123, 0, 0, 0, 1, 1,
0.04475366, 0.02951463, 0.9462218, 0, 0, 0, 1, 1,
0.04570208, -0.05386087, 3.242881, 0, 0, 0, 1, 1,
0.05288522, 0.7940845, 0.6223788, 1, 1, 1, 1, 1,
0.05330393, -0.7623423, 3.945848, 1, 1, 1, 1, 1,
0.05347227, -0.5422677, 3.771878, 1, 1, 1, 1, 1,
0.05379899, -0.6099162, 4.097277, 1, 1, 1, 1, 1,
0.05477852, 1.57698, -0.3978898, 1, 1, 1, 1, 1,
0.0548305, 0.7300733, 1.061469, 1, 1, 1, 1, 1,
0.05775734, -0.7449671, 4.339024, 1, 1, 1, 1, 1,
0.06015451, 0.09692649, 0.8874692, 1, 1, 1, 1, 1,
0.06291444, 1.133358, 0.2537372, 1, 1, 1, 1, 1,
0.06356759, -0.7520217, 1.628206, 1, 1, 1, 1, 1,
0.06420931, 1.124889, 2.883452, 1, 1, 1, 1, 1,
0.06493859, -0.3880977, 1.685466, 1, 1, 1, 1, 1,
0.06692757, 0.1256137, -2.031811, 1, 1, 1, 1, 1,
0.07001428, 0.3630022, 2.062973, 1, 1, 1, 1, 1,
0.07012532, 1.243827, 1.539719, 1, 1, 1, 1, 1,
0.07025207, 0.5957599, 1.078502, 0, 0, 1, 1, 1,
0.07160858, -1.177253, 3.471301, 1, 0, 0, 1, 1,
0.07771056, -1.024782, 4.158067, 1, 0, 0, 1, 1,
0.07864377, -2.061365, 2.552229, 1, 0, 0, 1, 1,
0.07991077, 0.1930902, 0.9219233, 1, 0, 0, 1, 1,
0.08156912, 0.3899544, 0.9699526, 1, 0, 0, 1, 1,
0.08566599, -1.615733, 2.180725, 0, 0, 0, 1, 1,
0.08804446, 0.4317921, 1.522221, 0, 0, 0, 1, 1,
0.09266032, -0.7876751, 3.753555, 0, 0, 0, 1, 1,
0.09489746, 1.113671, -0.9928846, 0, 0, 0, 1, 1,
0.09967837, -1.106491, 5.026062, 0, 0, 0, 1, 1,
0.1039785, 0.3520178, 0.6035758, 0, 0, 0, 1, 1,
0.1067593, 1.871074, 0.4360087, 0, 0, 0, 1, 1,
0.1098918, -1.110398, 2.261317, 1, 1, 1, 1, 1,
0.1104296, 0.9308113, -1.291306, 1, 1, 1, 1, 1,
0.1125928, -0.3195894, 3.303746, 1, 1, 1, 1, 1,
0.1225649, 0.890793, -0.6653244, 1, 1, 1, 1, 1,
0.1233222, 0.7178562, 1.191622, 1, 1, 1, 1, 1,
0.1245438, 0.8897629, 1.401445, 1, 1, 1, 1, 1,
0.1267567, 0.6121494, -0.3650597, 1, 1, 1, 1, 1,
0.1294076, -0.07872334, 1.851992, 1, 1, 1, 1, 1,
0.1322984, 0.1160173, 1.112745, 1, 1, 1, 1, 1,
0.1354867, -0.3314995, 2.874105, 1, 1, 1, 1, 1,
0.1376732, -0.5705763, 1.936679, 1, 1, 1, 1, 1,
0.1407416, -0.4853977, 1.282184, 1, 1, 1, 1, 1,
0.1409111, -0.3627822, 4.055907, 1, 1, 1, 1, 1,
0.1443759, -1.8932, 2.966369, 1, 1, 1, 1, 1,
0.1447114, -2.132951, 2.758141, 1, 1, 1, 1, 1,
0.1491214, 1.183672, 1.377621, 0, 0, 1, 1, 1,
0.1526363, 0.6697649, -1.025183, 1, 0, 0, 1, 1,
0.1527258, 1.310249, 1.952435, 1, 0, 0, 1, 1,
0.1561648, -1.421426, 3.856259, 1, 0, 0, 1, 1,
0.1574269, -0.6174312, 4.704669, 1, 0, 0, 1, 1,
0.1619312, -0.3745022, 2.314988, 1, 0, 0, 1, 1,
0.1673428, 2.416522, -0.4134317, 0, 0, 0, 1, 1,
0.1675701, 0.762872, 0.2936542, 0, 0, 0, 1, 1,
0.1738381, -0.2307258, 3.548643, 0, 0, 0, 1, 1,
0.1763697, 0.09646947, 0.7853183, 0, 0, 0, 1, 1,
0.1766516, -0.4808365, 1.794638, 0, 0, 0, 1, 1,
0.1780436, -0.9080136, 2.631871, 0, 0, 0, 1, 1,
0.1802016, 0.4531897, -1.097134, 0, 0, 0, 1, 1,
0.1840624, 1.626985, 1.297467, 1, 1, 1, 1, 1,
0.1863944, -0.3363762, 4.434737, 1, 1, 1, 1, 1,
0.1869105, 1.19681, 1.125244, 1, 1, 1, 1, 1,
0.1888014, -0.7700993, 2.213992, 1, 1, 1, 1, 1,
0.1905293, 0.7717099, 0.7248583, 1, 1, 1, 1, 1,
0.1927756, 1.975771, -0.5616627, 1, 1, 1, 1, 1,
0.1940945, 0.949662, -0.8447213, 1, 1, 1, 1, 1,
0.1947142, -0.8885112, 4.075476, 1, 1, 1, 1, 1,
0.1951701, 1.413826, 0.08248616, 1, 1, 1, 1, 1,
0.1971005, -1.338959, 3.815478, 1, 1, 1, 1, 1,
0.1977286, -1.295365, 4.689968, 1, 1, 1, 1, 1,
0.1988218, -0.5130574, 3.449912, 1, 1, 1, 1, 1,
0.1990758, 1.646127, 0.3476462, 1, 1, 1, 1, 1,
0.2014776, -0.7667035, 4.222563, 1, 1, 1, 1, 1,
0.2051601, -0.2952855, 1.654642, 1, 1, 1, 1, 1,
0.210166, 0.8059729, 0.8138184, 0, 0, 1, 1, 1,
0.2124098, -0.3496256, 3.538093, 1, 0, 0, 1, 1,
0.2149439, 0.8727589, -1.130614, 1, 0, 0, 1, 1,
0.217763, -0.2975922, 3.477074, 1, 0, 0, 1, 1,
0.2202642, -1.471776, 4.125027, 1, 0, 0, 1, 1,
0.2218062, 1.246081, 0.8918321, 1, 0, 0, 1, 1,
0.2222499, -0.7946818, 2.541295, 0, 0, 0, 1, 1,
0.2237125, -1.959597, 3.859789, 0, 0, 0, 1, 1,
0.2283299, 0.7521952, 0.733362, 0, 0, 0, 1, 1,
0.2292923, -0.4380123, 2.726676, 0, 0, 0, 1, 1,
0.2300621, 0.8511303, 1.159078, 0, 0, 0, 1, 1,
0.2403241, 0.07556617, 2.548118, 0, 0, 0, 1, 1,
0.2431599, 1.54013, 0.3182103, 0, 0, 0, 1, 1,
0.2465721, -1.08605, 2.46356, 1, 1, 1, 1, 1,
0.2474164, -0.08063612, 0.8146595, 1, 1, 1, 1, 1,
0.2529745, 0.8554797, -0.04126124, 1, 1, 1, 1, 1,
0.2534008, 0.1811285, 0.933279, 1, 1, 1, 1, 1,
0.2616799, -1.21722, 4.935426, 1, 1, 1, 1, 1,
0.2665592, -0.0141003, 2.363897, 1, 1, 1, 1, 1,
0.2741893, -0.8330792, 4.141008, 1, 1, 1, 1, 1,
0.2758565, 0.511861, 1.314913, 1, 1, 1, 1, 1,
0.2818176, 0.5583922, -1.247528, 1, 1, 1, 1, 1,
0.2821588, -2.057757, 4.21822, 1, 1, 1, 1, 1,
0.283808, -1.049113, 2.040149, 1, 1, 1, 1, 1,
0.2852798, -0.1945336, 2.550877, 1, 1, 1, 1, 1,
0.285684, 0.574654, 0.3922751, 1, 1, 1, 1, 1,
0.2878173, -0.9407052, 1.457679, 1, 1, 1, 1, 1,
0.2884552, 0.4702243, 2.069406, 1, 1, 1, 1, 1,
0.3004416, -1.742131, 2.811011, 0, 0, 1, 1, 1,
0.3050631, -0.7443677, 2.993625, 1, 0, 0, 1, 1,
0.3055274, -2.699131, 3.153769, 1, 0, 0, 1, 1,
0.306218, 0.06057838, 1.129505, 1, 0, 0, 1, 1,
0.3067917, -0.7878475, 2.838793, 1, 0, 0, 1, 1,
0.3073162, 0.4346517, 0.6841938, 1, 0, 0, 1, 1,
0.3082147, 0.2445678, 1.81593, 0, 0, 0, 1, 1,
0.3127283, -0.04590772, 3.294258, 0, 0, 0, 1, 1,
0.313927, -0.5894796, 1.998945, 0, 0, 0, 1, 1,
0.3142163, 0.2147888, -0.9708275, 0, 0, 0, 1, 1,
0.3157411, -0.9209274, 1.636825, 0, 0, 0, 1, 1,
0.3288862, -0.9291135, 2.687167, 0, 0, 0, 1, 1,
0.3295665, -0.06936628, 1.964067, 0, 0, 0, 1, 1,
0.33331, 0.9596863, -0.1222001, 1, 1, 1, 1, 1,
0.3349719, 0.833831, 1.375547, 1, 1, 1, 1, 1,
0.3368171, 0.02050405, 0.9640241, 1, 1, 1, 1, 1,
0.3371468, 0.5347528, -0.8479251, 1, 1, 1, 1, 1,
0.347397, -0.4244057, 3.459856, 1, 1, 1, 1, 1,
0.3480815, 0.1175872, 2.152036, 1, 1, 1, 1, 1,
0.3500217, 0.5542585, 0.07005416, 1, 1, 1, 1, 1,
0.3529311, -1.612845, 5.24382, 1, 1, 1, 1, 1,
0.357326, -0.3349888, 2.735933, 1, 1, 1, 1, 1,
0.357947, 0.4789155, 0.6791263, 1, 1, 1, 1, 1,
0.3593891, -0.8329591, 1.846535, 1, 1, 1, 1, 1,
0.3596856, -1.909834, 3.077764, 1, 1, 1, 1, 1,
0.3601191, 0.711395, 0.5866114, 1, 1, 1, 1, 1,
0.365413, 0.08737858, 0.643818, 1, 1, 1, 1, 1,
0.3775408, 0.5727299, 1.107473, 1, 1, 1, 1, 1,
0.3795044, 0.04108418, 2.470839, 0, 0, 1, 1, 1,
0.3861705, -0.4249965, 1.73934, 1, 0, 0, 1, 1,
0.3887652, -0.01008349, 3.249317, 1, 0, 0, 1, 1,
0.3907376, -0.4798143, 0.8185221, 1, 0, 0, 1, 1,
0.3950029, -0.06601078, 1.125367, 1, 0, 0, 1, 1,
0.3954049, 0.9116712, 1.351541, 1, 0, 0, 1, 1,
0.3966888, 1.441957, 1.610095, 0, 0, 0, 1, 1,
0.3980145, -0.1716396, 2.783068, 0, 0, 0, 1, 1,
0.4000919, 1.115142, 0.9569136, 0, 0, 0, 1, 1,
0.4007061, 0.6629431, -0.7716273, 0, 0, 0, 1, 1,
0.4029034, -0.7267274, 1.646653, 0, 0, 0, 1, 1,
0.4059474, 0.5341936, -0.1499746, 0, 0, 0, 1, 1,
0.4099017, -0.06743278, 1.464022, 0, 0, 0, 1, 1,
0.4204727, -0.6383796, 2.841443, 1, 1, 1, 1, 1,
0.4237108, -2.486789, 2.579555, 1, 1, 1, 1, 1,
0.4250724, 0.9727902, 2.138772, 1, 1, 1, 1, 1,
0.429027, -0.398176, 2.153095, 1, 1, 1, 1, 1,
0.4297422, 1.011153, 0.6238974, 1, 1, 1, 1, 1,
0.433311, -0.8624745, 1.454627, 1, 1, 1, 1, 1,
0.4348859, 0.3286417, 2.293549, 1, 1, 1, 1, 1,
0.4438114, -1.468995, 1.555313, 1, 1, 1, 1, 1,
0.4476201, 0.7086471, 1.171364, 1, 1, 1, 1, 1,
0.4491203, -0.1226022, 2.10712, 1, 1, 1, 1, 1,
0.456385, -0.716632, 2.679773, 1, 1, 1, 1, 1,
0.4588167, -1.066457, 2.455117, 1, 1, 1, 1, 1,
0.4620792, -0.4952861, 2.84451, 1, 1, 1, 1, 1,
0.4646289, -1.2512, 0.8532832, 1, 1, 1, 1, 1,
0.4658833, -1.526752, 3.156554, 1, 1, 1, 1, 1,
0.4686813, 0.4135423, 2.760839, 0, 0, 1, 1, 1,
0.475731, 0.9828333, -0.3040116, 1, 0, 0, 1, 1,
0.476354, -0.9701002, 1.572392, 1, 0, 0, 1, 1,
0.4785615, 0.08201441, 0.4635988, 1, 0, 0, 1, 1,
0.4830239, -0.6543081, 1.412868, 1, 0, 0, 1, 1,
0.4872051, 2.063811, 0.7896891, 1, 0, 0, 1, 1,
0.4908462, -2.573116, 3.420534, 0, 0, 0, 1, 1,
0.4942879, 0.5180296, -1.08124, 0, 0, 0, 1, 1,
0.4964017, -1.662358, 1.781433, 0, 0, 0, 1, 1,
0.5012042, 1.389482, -0.136736, 0, 0, 0, 1, 1,
0.5020326, 1.004439, 1.521783, 0, 0, 0, 1, 1,
0.505834, -0.2704267, 1.522851, 0, 0, 0, 1, 1,
0.5131282, -0.1225024, 3.383503, 0, 0, 0, 1, 1,
0.5283929, -1.17395, 1.949027, 1, 1, 1, 1, 1,
0.5296724, 0.2729419, 2.294736, 1, 1, 1, 1, 1,
0.5320426, 0.4652127, 1.111178, 1, 1, 1, 1, 1,
0.5330303, -0.01690459, 2.551277, 1, 1, 1, 1, 1,
0.5336162, -0.1695476, 1.410149, 1, 1, 1, 1, 1,
0.5367392, 1.725253, 1.615229, 1, 1, 1, 1, 1,
0.5374863, 0.4222231, 0.755114, 1, 1, 1, 1, 1,
0.540813, -0.6530364, 3.014604, 1, 1, 1, 1, 1,
0.543461, -0.4746004, 3.270356, 1, 1, 1, 1, 1,
0.5441885, 1.21598, 0.2659346, 1, 1, 1, 1, 1,
0.5477987, 0.1489268, 1.155537, 1, 1, 1, 1, 1,
0.5492066, -0.1815848, 2.236588, 1, 1, 1, 1, 1,
0.5496285, -1.208243, 3.973993, 1, 1, 1, 1, 1,
0.5500079, -0.7854638, 2.211311, 1, 1, 1, 1, 1,
0.552651, 0.3038645, 0.9580261, 1, 1, 1, 1, 1,
0.5564112, 2.111642, 0.6911514, 0, 0, 1, 1, 1,
0.5566918, 0.195557, 1.325892, 1, 0, 0, 1, 1,
0.5567347, 1.666469, -0.5628902, 1, 0, 0, 1, 1,
0.5657594, -1.01338, 1.547956, 1, 0, 0, 1, 1,
0.5663527, 1.023401, 1.922529, 1, 0, 0, 1, 1,
0.5667169, -0.5167648, 2.699693, 1, 0, 0, 1, 1,
0.5672204, 1.595617, 0.8312998, 0, 0, 0, 1, 1,
0.5728089, 0.2993125, 2.072764, 0, 0, 0, 1, 1,
0.5740814, 1.228904, 1.064967, 0, 0, 0, 1, 1,
0.5807044, 1.191784, -0.2338889, 0, 0, 0, 1, 1,
0.5857745, 0.5402046, 0.3429221, 0, 0, 0, 1, 1,
0.5888208, 0.664663, 2.575454, 0, 0, 0, 1, 1,
0.5915917, -0.5055777, 1.314726, 0, 0, 0, 1, 1,
0.5916328, 2.65065, 1.756286, 1, 1, 1, 1, 1,
0.5967683, 0.3165181, 0.963087, 1, 1, 1, 1, 1,
0.6005327, 0.6435621, -1.172934, 1, 1, 1, 1, 1,
0.604095, -0.6892369, 1.482309, 1, 1, 1, 1, 1,
0.6091968, -0.65835, 2.613282, 1, 1, 1, 1, 1,
0.6189829, -1.029367, 3.553082, 1, 1, 1, 1, 1,
0.6193582, 1.048259, -0.8044872, 1, 1, 1, 1, 1,
0.6203947, 0.09717797, -0.2486142, 1, 1, 1, 1, 1,
0.6220932, -0.08172291, 2.005123, 1, 1, 1, 1, 1,
0.6240906, 1.20439, 1.49621, 1, 1, 1, 1, 1,
0.6281205, -0.5290406, 4.687231, 1, 1, 1, 1, 1,
0.633352, -1.769811, 1.403041, 1, 1, 1, 1, 1,
0.6341469, -0.8509405, 3.740245, 1, 1, 1, 1, 1,
0.6350764, 1.131655, 0.3886881, 1, 1, 1, 1, 1,
0.6364815, 1.208823, -0.4825205, 1, 1, 1, 1, 1,
0.6392359, -1.218514, 1.94575, 0, 0, 1, 1, 1,
0.6406184, 0.5620363, 0.958476, 1, 0, 0, 1, 1,
0.6420736, 1.289681, 0.4825701, 1, 0, 0, 1, 1,
0.6420909, 0.7863867, 0.4209037, 1, 0, 0, 1, 1,
0.6504628, 1.960298, 2.469071, 1, 0, 0, 1, 1,
0.6547685, 0.05955838, 0.0392269, 1, 0, 0, 1, 1,
0.6555783, -0.5973423, 1.524545, 0, 0, 0, 1, 1,
0.6656955, -1.367997, 3.949625, 0, 0, 0, 1, 1,
0.6682817, 1.250821, 1.015345, 0, 0, 0, 1, 1,
0.6696607, -0.9373886, 1.598054, 0, 0, 0, 1, 1,
0.6706951, -1.526753, 2.886796, 0, 0, 0, 1, 1,
0.6734119, 0.1152333, 0.04827874, 0, 0, 0, 1, 1,
0.6756209, 2.058092, -1.622431, 0, 0, 0, 1, 1,
0.6770526, -0.3184792, 2.11541, 1, 1, 1, 1, 1,
0.6802205, 2.342401, -0.0265465, 1, 1, 1, 1, 1,
0.6856413, 1.406431, -0.3950006, 1, 1, 1, 1, 1,
0.6860248, 0.1507502, 0.8985682, 1, 1, 1, 1, 1,
0.6873638, -1.350794, 1.556754, 1, 1, 1, 1, 1,
0.6883879, -0.4143429, 0.2925165, 1, 1, 1, 1, 1,
0.6892872, -0.4051841, 0.268634, 1, 1, 1, 1, 1,
0.6905565, -0.008015315, 0.9896544, 1, 1, 1, 1, 1,
0.6960831, -0.07169783, 1.296321, 1, 1, 1, 1, 1,
0.6965249, -0.2459446, 3.271822, 1, 1, 1, 1, 1,
0.7020839, 1.263686, 2.522756, 1, 1, 1, 1, 1,
0.7062044, -0.1683445, 0.3921986, 1, 1, 1, 1, 1,
0.720943, -0.1446277, 2.741454, 1, 1, 1, 1, 1,
0.722997, -0.7762249, 1.810683, 1, 1, 1, 1, 1,
0.7243893, -1.24667, 3.876426, 1, 1, 1, 1, 1,
0.7251132, 0.3414786, 0.4579003, 0, 0, 1, 1, 1,
0.7327355, -0.2415105, 1.01159, 1, 0, 0, 1, 1,
0.7347537, -1.286437, 1.41245, 1, 0, 0, 1, 1,
0.7379081, -0.4371581, 2.373712, 1, 0, 0, 1, 1,
0.742113, -1.286994, 2.931417, 1, 0, 0, 1, 1,
0.7439919, 0.05741386, 1.884411, 1, 0, 0, 1, 1,
0.7533805, 1.915322, -0.50692, 0, 0, 0, 1, 1,
0.7536244, -0.3109682, 0.7987457, 0, 0, 0, 1, 1,
0.7542894, 1.08866, 0.1798745, 0, 0, 0, 1, 1,
0.7582907, 1.051747, -0.1837165, 0, 0, 0, 1, 1,
0.7603466, 0.3257524, 0.2529266, 0, 0, 0, 1, 1,
0.7629262, 2.30642, -1.042202, 0, 0, 0, 1, 1,
0.7631049, 0.8883946, 1.982127, 0, 0, 0, 1, 1,
0.7669975, 0.4216042, 2.335544, 1, 1, 1, 1, 1,
0.7715037, 0.6762092, 1.308881, 1, 1, 1, 1, 1,
0.7779504, -1.679572, 3.404525, 1, 1, 1, 1, 1,
0.7781101, -0.02639577, 0.4042135, 1, 1, 1, 1, 1,
0.7827933, 0.0845378, 2.313805, 1, 1, 1, 1, 1,
0.785231, -0.7059427, 1.734549, 1, 1, 1, 1, 1,
0.7861525, 0.3828758, -0.01548594, 1, 1, 1, 1, 1,
0.78946, -1.483771, 4.427572, 1, 1, 1, 1, 1,
0.7902696, -0.9033455, 2.269249, 1, 1, 1, 1, 1,
0.7905919, 1.634747, 1.059609, 1, 1, 1, 1, 1,
0.7906596, 0.5457873, 0.9919037, 1, 1, 1, 1, 1,
0.7924339, -0.5296725, 1.787962, 1, 1, 1, 1, 1,
0.7990691, -1.103662, 5.626533, 1, 1, 1, 1, 1,
0.8083611, 1.194893, -0.05780678, 1, 1, 1, 1, 1,
0.8086194, -0.0531713, 1.502686, 1, 1, 1, 1, 1,
0.8180383, -1.898633, 3.949966, 0, 0, 1, 1, 1,
0.8246989, -0.6998693, 1.508075, 1, 0, 0, 1, 1,
0.8265355, 0.8497361, 2.027748, 1, 0, 0, 1, 1,
0.8316702, 0.148175, 2.356002, 1, 0, 0, 1, 1,
0.8318222, 0.1708014, 1.252402, 1, 0, 0, 1, 1,
0.8378735, -0.4956296, 0.703476, 1, 0, 0, 1, 1,
0.8430638, 1.150013, 0.6195817, 0, 0, 0, 1, 1,
0.8496372, -0.04791068, 1.505357, 0, 0, 0, 1, 1,
0.8538644, 0.4338359, 1.589143, 0, 0, 0, 1, 1,
0.8547778, -0.6432969, 2.304035, 0, 0, 0, 1, 1,
0.8606586, -1.641666, 1.642559, 0, 0, 0, 1, 1,
0.8611727, -1.515475, 4.419408, 0, 0, 0, 1, 1,
0.8631325, -0.195888, 1.783731, 0, 0, 0, 1, 1,
0.8758914, 1.430619, -2.047207, 1, 1, 1, 1, 1,
0.8792984, 0.6772283, -0.2749437, 1, 1, 1, 1, 1,
0.8794787, -0.03684815, 2.240929, 1, 1, 1, 1, 1,
0.8824842, -0.01453218, 1.523628, 1, 1, 1, 1, 1,
0.8837815, 0.2360003, -0.04910899, 1, 1, 1, 1, 1,
0.8840398, 1.760609, -0.4017028, 1, 1, 1, 1, 1,
0.9047318, -0.5724954, 2.739544, 1, 1, 1, 1, 1,
0.90576, 0.6344581, 1.94268, 1, 1, 1, 1, 1,
0.9093326, 0.008856114, 1.017122, 1, 1, 1, 1, 1,
0.9113353, -1.445871, 2.260962, 1, 1, 1, 1, 1,
0.9114152, 2.791866, 0.2116484, 1, 1, 1, 1, 1,
0.911702, -0.6137105, 0.5916826, 1, 1, 1, 1, 1,
0.93585, 2.946854, 1.650495, 1, 1, 1, 1, 1,
0.9374722, 1.490455, 0.1668896, 1, 1, 1, 1, 1,
0.9416826, -0.2037208, 1.149185, 1, 1, 1, 1, 1,
0.9475984, -0.6803528, 1.062735, 0, 0, 1, 1, 1,
0.9499753, 0.6424307, 2.431331, 1, 0, 0, 1, 1,
0.9567159, -0.2413666, 1.836269, 1, 0, 0, 1, 1,
0.9572386, -0.1236181, 1.118017, 1, 0, 0, 1, 1,
0.9611881, 0.3244396, 1.133907, 1, 0, 0, 1, 1,
0.9621011, -2.56044, 1.284853, 1, 0, 0, 1, 1,
0.964569, -0.8655307, 1.109607, 0, 0, 0, 1, 1,
0.9651678, 0.8989121, 0.9020593, 0, 0, 0, 1, 1,
0.9708532, -0.4680943, 0.8529624, 0, 0, 0, 1, 1,
0.973923, 0.4564584, 0.1073595, 0, 0, 0, 1, 1,
0.9811041, -0.4282363, 2.21676, 0, 0, 0, 1, 1,
0.9823064, -0.617098, 2.57936, 0, 0, 0, 1, 1,
0.9831897, 0.01592135, 1.772702, 0, 0, 0, 1, 1,
0.9854679, -1.094979, 3.462049, 1, 1, 1, 1, 1,
0.9859931, -0.4359207, 2.463147, 1, 1, 1, 1, 1,
0.9867719, 0.9395884, 0.2958204, 1, 1, 1, 1, 1,
0.9871955, 1.381756, 0.8962239, 1, 1, 1, 1, 1,
0.9915783, 0.09328437, -0.5722559, 1, 1, 1, 1, 1,
0.9944395, -2.324765, 3.168544, 1, 1, 1, 1, 1,
0.9993594, 2.191821, 0.1002853, 1, 1, 1, 1, 1,
1.001594, 0.02148163, 2.668975, 1, 1, 1, 1, 1,
1.002325, 0.3791164, -1.152736, 1, 1, 1, 1, 1,
1.004135, 0.5537559, 1.801392, 1, 1, 1, 1, 1,
1.006705, -0.6260725, 2.815939, 1, 1, 1, 1, 1,
1.015708, 0.6577338, 2.020637, 1, 1, 1, 1, 1,
1.023894, 0.4429968, 0.6188889, 1, 1, 1, 1, 1,
1.025645, -0.5957982, 1.853542, 1, 1, 1, 1, 1,
1.031445, 1.270995, 0.3367989, 1, 1, 1, 1, 1,
1.035516, 0.241932, 1.690406, 0, 0, 1, 1, 1,
1.037251, -0.4194663, 1.563335, 1, 0, 0, 1, 1,
1.042514, -0.6930425, -0.2417892, 1, 0, 0, 1, 1,
1.043847, 0.4133004, 2.251382, 1, 0, 0, 1, 1,
1.044717, 0.781699, -0.2286714, 1, 0, 0, 1, 1,
1.045335, 0.04062607, 1.569387, 1, 0, 0, 1, 1,
1.055664, 0.4503644, 3.084108, 0, 0, 0, 1, 1,
1.062763, -1.381446, 1.613103, 0, 0, 0, 1, 1,
1.067909, 1.125697, 1.135706, 0, 0, 0, 1, 1,
1.070531, -0.04213685, 1.746849, 0, 0, 0, 1, 1,
1.071833, -0.5500025, 2.405056, 0, 0, 0, 1, 1,
1.076802, -0.1361576, 2.918047, 0, 0, 0, 1, 1,
1.080692, 0.4742189, 2.838011, 0, 0, 0, 1, 1,
1.083718, 0.03221038, 1.889313, 1, 1, 1, 1, 1,
1.088763, -0.1276378, 1.800822, 1, 1, 1, 1, 1,
1.092003, 0.4085464, -0.1793425, 1, 1, 1, 1, 1,
1.099114, -0.1586366, 0.7647325, 1, 1, 1, 1, 1,
1.099152, -1.160991, 3.83406, 1, 1, 1, 1, 1,
1.107313, 0.9823948, 0.008036328, 1, 1, 1, 1, 1,
1.112666, 0.8569455, 2.078348, 1, 1, 1, 1, 1,
1.117237, -1.035416, 0.8304555, 1, 1, 1, 1, 1,
1.11726, -0.3509124, 1.212994, 1, 1, 1, 1, 1,
1.11923, -1.01562, 2.101757, 1, 1, 1, 1, 1,
1.120914, 0.3491383, 1.356174, 1, 1, 1, 1, 1,
1.124136, -0.390215, 0.7022092, 1, 1, 1, 1, 1,
1.12432, -1.315423, 2.40544, 1, 1, 1, 1, 1,
1.128202, -0.8920389, 2.724355, 1, 1, 1, 1, 1,
1.133534, 0.7491491, 1.966613, 1, 1, 1, 1, 1,
1.134719, -0.8909631, 0.1338008, 0, 0, 1, 1, 1,
1.151171, -0.8255211, 1.541216, 1, 0, 0, 1, 1,
1.155757, -0.5759676, 2.187456, 1, 0, 0, 1, 1,
1.163932, 0.5789289, 0.8017618, 1, 0, 0, 1, 1,
1.164657, 0.9617905, -0.5186697, 1, 0, 0, 1, 1,
1.166259, -0.4921687, -0.004511735, 1, 0, 0, 1, 1,
1.169224, 1.570846, 1.8735, 0, 0, 0, 1, 1,
1.171778, -0.0191969, 1.665859, 0, 0, 0, 1, 1,
1.173223, 0.4573846, 0.6140431, 0, 0, 0, 1, 1,
1.178111, 0.6271832, 1.300413, 0, 0, 0, 1, 1,
1.185102, 1.08375, 0.332927, 0, 0, 0, 1, 1,
1.191908, -0.05496892, 2.228801, 0, 0, 0, 1, 1,
1.200616, 0.7849487, 0.304476, 0, 0, 0, 1, 1,
1.201754, -0.8477255, 2.325991, 1, 1, 1, 1, 1,
1.202083, 1.50776, 0.2540418, 1, 1, 1, 1, 1,
1.202223, 2.37695, 1.01326, 1, 1, 1, 1, 1,
1.20415, 1.622429, 1.260902, 1, 1, 1, 1, 1,
1.205308, 1.051356, 0.6234865, 1, 1, 1, 1, 1,
1.210386, -2.165542, 2.254341, 1, 1, 1, 1, 1,
1.216404, -0.4753332, 2.832455, 1, 1, 1, 1, 1,
1.218149, 1.353339, -0.2507746, 1, 1, 1, 1, 1,
1.223918, 0.3365611, -0.5780438, 1, 1, 1, 1, 1,
1.22421, -1.71278, 3.011994, 1, 1, 1, 1, 1,
1.231561, -0.1188913, 1.180769, 1, 1, 1, 1, 1,
1.233175, 0.4172465, 0.3831248, 1, 1, 1, 1, 1,
1.24778, 0.775785, 2.242368, 1, 1, 1, 1, 1,
1.267133, 0.3853618, 0.3266637, 1, 1, 1, 1, 1,
1.275536, 1.425273, 1.203086, 1, 1, 1, 1, 1,
1.277726, 1.080443, 0.4872216, 0, 0, 1, 1, 1,
1.291842, 0.1819092, -0.6292179, 1, 0, 0, 1, 1,
1.296883, 0.5907769, 1.63327, 1, 0, 0, 1, 1,
1.298962, -0.06165865, 2.223721, 1, 0, 0, 1, 1,
1.301488, 1.58345, 0.6532021, 1, 0, 0, 1, 1,
1.304831, -1.571869, 1.033933, 1, 0, 0, 1, 1,
1.305816, 1.38677, 0.1402922, 0, 0, 0, 1, 1,
1.315824, 2.051779, 1.304002, 0, 0, 0, 1, 1,
1.315891, 0.02069345, 1.145648, 0, 0, 0, 1, 1,
1.31601, 1.330904, 0.9251859, 0, 0, 0, 1, 1,
1.326097, 0.3072499, 1.665331, 0, 0, 0, 1, 1,
1.349567, -0.4327306, 4.667745, 0, 0, 0, 1, 1,
1.349965, 0.6670632, 1.375909, 0, 0, 0, 1, 1,
1.350626, -0.5461206, 2.345493, 1, 1, 1, 1, 1,
1.364246, -0.984794, 2.397769, 1, 1, 1, 1, 1,
1.365429, -0.3375433, 3.588931, 1, 1, 1, 1, 1,
1.366207, 1.431602, -1.692848, 1, 1, 1, 1, 1,
1.368901, 0.15079, 2.601816, 1, 1, 1, 1, 1,
1.37062, 0.05953092, 0.4781125, 1, 1, 1, 1, 1,
1.394818, -1.071504, 2.260786, 1, 1, 1, 1, 1,
1.397729, -1.514263, 2.181872, 1, 1, 1, 1, 1,
1.42159, 1.299686, -0.263367, 1, 1, 1, 1, 1,
1.426518, -0.2254047, 3.110127, 1, 1, 1, 1, 1,
1.435991, 0.813197, 1.829303, 1, 1, 1, 1, 1,
1.438067, -1.455983, 2.254268, 1, 1, 1, 1, 1,
1.449762, -1.280208, 1.255728, 1, 1, 1, 1, 1,
1.455358, 2.123547, -0.00149532, 1, 1, 1, 1, 1,
1.456006, -1.061918, 2.063767, 1, 1, 1, 1, 1,
1.461777, 0.08510487, 2.179039, 0, 0, 1, 1, 1,
1.463255, 0.4274532, 1.746507, 1, 0, 0, 1, 1,
1.470296, 0.4426531, 0.5120068, 1, 0, 0, 1, 1,
1.476671, -0.6910292, 2.20435, 1, 0, 0, 1, 1,
1.478132, -0.5964773, 1.84038, 1, 0, 0, 1, 1,
1.48885, -1.812097, 3.051642, 1, 0, 0, 1, 1,
1.491191, 2.28831, 2.757772, 0, 0, 0, 1, 1,
1.501388, -2.222776, 2.529344, 0, 0, 0, 1, 1,
1.512081, 1.942622, 0.3307659, 0, 0, 0, 1, 1,
1.515812, 0.7768565, 0.07006514, 0, 0, 0, 1, 1,
1.520874, 1.285159, 1.423413, 0, 0, 0, 1, 1,
1.533567, 1.256885, 2.508068, 0, 0, 0, 1, 1,
1.543895, -0.5982772, 1.229216, 0, 0, 0, 1, 1,
1.547904, 1.818714, -2.239855, 1, 1, 1, 1, 1,
1.555445, -0.6090635, 2.386286, 1, 1, 1, 1, 1,
1.569469, -1.441329, 1.653639, 1, 1, 1, 1, 1,
1.581565, -1.825469, 3.458548, 1, 1, 1, 1, 1,
1.585615, -1.083526, 3.255314, 1, 1, 1, 1, 1,
1.591683, -1.211993, 3.290221, 1, 1, 1, 1, 1,
1.5936, -0.6360313, 1.80652, 1, 1, 1, 1, 1,
1.598089, -1.261242, 2.569175, 1, 1, 1, 1, 1,
1.604153, -0.6959893, 0.9526461, 1, 1, 1, 1, 1,
1.613158, -0.4023235, 1.882608, 1, 1, 1, 1, 1,
1.614222, -1.068344, 2.10249, 1, 1, 1, 1, 1,
1.616478, -0.4245079, -0.1065918, 1, 1, 1, 1, 1,
1.621612, 2.661482, 1.461178, 1, 1, 1, 1, 1,
1.654889, 0.1099648, -0.4772686, 1, 1, 1, 1, 1,
1.671827, -0.3784473, 3.031731, 1, 1, 1, 1, 1,
1.689274, -1.246733, 2.106681, 0, 0, 1, 1, 1,
1.690658, 0.4573403, 3.077767, 1, 0, 0, 1, 1,
1.691178, 0.5063809, 0.8835836, 1, 0, 0, 1, 1,
1.704814, 0.6695024, 1.832667, 1, 0, 0, 1, 1,
1.719924, 0.8072315, 2.533569, 1, 0, 0, 1, 1,
1.72079, 1.355336, 1.139802, 1, 0, 0, 1, 1,
1.73454, 0.8915042, 1.285682, 0, 0, 0, 1, 1,
1.758051, -0.7842817, 3.740818, 0, 0, 0, 1, 1,
1.758903, 0.4325397, 2.832769, 0, 0, 0, 1, 1,
1.764081, 0.08457658, 1.100691, 0, 0, 0, 1, 1,
1.773769, -0.1396765, 2.737659, 0, 0, 0, 1, 1,
1.810095, 2.297435, -0.1458658, 0, 0, 0, 1, 1,
1.828954, 0.0641027, 1.315441, 0, 0, 0, 1, 1,
1.83416, -1.101847, 2.316229, 1, 1, 1, 1, 1,
1.860806, 0.8349206, 0.5983564, 1, 1, 1, 1, 1,
1.868193, -1.213433, 0.8907925, 1, 1, 1, 1, 1,
1.877816, -0.6362504, 2.208469, 1, 1, 1, 1, 1,
1.904234, -0.3083822, 2.626352, 1, 1, 1, 1, 1,
1.907928, 1.260551, 1.262316, 1, 1, 1, 1, 1,
1.91442, 0.6259396, 1.897808, 1, 1, 1, 1, 1,
1.924072, 0.07602572, 2.731477, 1, 1, 1, 1, 1,
1.963108, -0.4931729, 1.543565, 1, 1, 1, 1, 1,
1.969255, 0.4804088, 1.274088, 1, 1, 1, 1, 1,
2.022479, 1.722507, 2.666394, 1, 1, 1, 1, 1,
2.043238, 0.2710949, 2.594316, 1, 1, 1, 1, 1,
2.053326, -1.514053, 4.019988, 1, 1, 1, 1, 1,
2.059633, -0.8710144, 2.522305, 1, 1, 1, 1, 1,
2.071532, -0.1884909, 0.8788975, 1, 1, 1, 1, 1,
2.086458, 0.6793564, 0.1760443, 0, 0, 1, 1, 1,
2.161297, 0.2600532, -0.4550855, 1, 0, 0, 1, 1,
2.178388, -1.408295, 0.9431648, 1, 0, 0, 1, 1,
2.267952, -1.417045, 1.28958, 1, 0, 0, 1, 1,
2.324784, -2.50004, 2.641839, 1, 0, 0, 1, 1,
2.327278, 0.419604, 0.8319709, 1, 0, 0, 1, 1,
2.368424, -1.978656, 2.182376, 0, 0, 0, 1, 1,
2.389365, 0.7067158, 1.618087, 0, 0, 0, 1, 1,
2.391334, -1.330754, 2.026651, 0, 0, 0, 1, 1,
2.433571, 0.9995724, 0.8704881, 0, 0, 0, 1, 1,
2.480728, 0.4204138, 1.177389, 0, 0, 0, 1, 1,
2.563066, -1.968385, 2.269258, 0, 0, 0, 1, 1,
2.588616, -0.8818532, 1.923994, 0, 0, 0, 1, 1,
2.608191, -2.917234, 1.664119, 1, 1, 1, 1, 1,
2.634762, 0.946755, -0.001199806, 1, 1, 1, 1, 1,
2.782921, 0.2910394, 0.05135112, 1, 1, 1, 1, 1,
2.785922, -0.2636166, 2.096917, 1, 1, 1, 1, 1,
2.827656, -0.5589875, 2.798762, 1, 1, 1, 1, 1,
2.920959, 0.5097368, 1.879228, 1, 1, 1, 1, 1,
3.042208, 0.645383, 1.206049, 1, 1, 1, 1, 1
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
var radius = 9.810519;
var distance = 34.45903;
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
mvMatrix.translate( 0.1717508, 0.03436804, 0.1509898 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45903);
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
